package lab;

import java.io.IOException;
import java.util.List; // 💡 List 사용을 위해 추가
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/labcontrol")
@MultipartConfig(maxFileSize = 1024 * 1024 * 10, location = "c:/Temp/img")
public class LabController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String ADMIN_ID = "admin";
	private static final String ADMIN_PASSWORD = "1234";

	private MemberDAO dao;
	private ServletContext ctx;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new MemberDAO();
		ctx = getServletContext();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String action = request.getParameter("action");
		String view = "";

		if (action == null) {
			getServletContext().getRequestDispatcher("/labcontrol?action=welcome").forward(request, response);
			return;
		}

		if (isLoginRequired(action) && !isLoggedIn(request)) {
			response.sendRedirect(request.getContextPath() + "/labcontrol?action=login");
			return;
		}

		switch (action) {
		// 💡 [내가 만든 파트] 랩실 소개 페이지 요청 처리 로직 추가
		case "labInfo": {
			List<Member> allMembers = dao.findAll(); // DB에서 전체 랩원 목록 조회 
			
			int activeCount = 0;
			int leaveCount = 0;
			int gradCount = 0;
			
			// 랩원들의 상태를 확인하여 재학/휴학/졸업 인원수 카운트
			for (Member m : allMembers) {
				if ("재학".equals(m.getStatus())) {
					activeCount++;
				} else if ("휴학".equals(m.getStatus())) {
					leaveCount++;
				} else if ("졸업".equals(m.getStatus())) {
					gradCount++;
				}
			}
			
			// labInfo.jsp에서 사용할 수 있도록 request 영역에 바인딩 
			request.setAttribute("countActive", activeCount);
			request.setAttribute("countLeave", leaveCount);
			request.setAttribute("countGrad", gradCount);
			
			view = "labInfo.jsp";
			break;
		}

		case "welcome":
			view = "welcome.jsp";
			break;

		case "login":
			view = "login.jsp";
			break;

		case "welcomeUser":
			response.sendRedirect(request.getContextPath() + "/labcontrol?action=memberList");
			return;

		case "memberList":
		case "listMembers": {
			List<Member> allMembers = dao.findAll();
			String statusFilter = request.getParameter("status");

			List<Member> filteredMembers = new ArrayList<>();
			if (statusFilter == null || statusFilter.equals("") || statusFilter.equals("전체")) {
				filteredMembers = allMembers;
			} else {
				for (Member m : allMembers) {
					if (statusFilter.equals(m.getStatus())) {
						filteredMembers.add(m);
					}
				}
			}

			request.setAttribute("members", filteredMembers);
			view = "memberList.jsp";
			break;
		}

		case "memberInfo":
			request.setAttribute("m", dao.find(request.getParameter("id")));
			request.setAttribute("member", request.getAttribute("m"));
			view = "memberInfo.jsp";
			break;

		case "addMember":
			view = "addMember.jsp";
			break;

		case "editMember":
			request.setAttribute("m", dao.find(request.getParameter("id")));
			view = "updateMember.jsp";
			break;

		case "processLogin":
			String id = request.getParameter("id");
			String password = request.getParameter("password");

			if (ADMIN_ID.equals(id) && ADMIN_PASSWORD.equals(password)) {
				HttpSession session = request.getSession();
				session.setAttribute("loginId", ADMIN_ID);
				session.setAttribute("sessionId", ADMIN_ID);
				session.setAttribute("adminId", ADMIN_ID);
				response.sendRedirect(request.getContextPath() + "/labcontrol?action=memberList");
				return;
			}

			request.setAttribute("loginError", "아이디 또는 비밀번호가 올바르지 않습니다.");
			view = "login.jsp";
			break;

		case "processLogout":
			request.getSession().invalidate();
			response.sendRedirect(request.getContextPath() + "/labcontrol?action=welcome");
			return;

		case "processAddMember":
			view = processAddMember(request, response);
			break;

		case "processUpdateMember":
			view = processUpdateMember(request, response);
			break;

		case "delete":
			dao.deleteMember(request.getParameter("id"));
			response.sendRedirect(request.getContextPath() + "/labcontrol?action=memberList");
			return;

		default:
			view = "welcome.jsp";
			break;
		}

		getServletContext().getRequestDispatcher("/lab/" + view).forward(request, response);
	}

	private boolean isLoggedIn(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		return session != null && session.getAttribute("loginId") != null;
	}

	private boolean isLoginRequired(String action) {
		return "memberList".equals(action)
				|| "listMembers".equals(action)
				|| "memberInfo".equals(action)
				|| "addMember".equals(action)
				|| "editMember".equals(action)
				|| "updateMember".equals(action)
				|| "processAddMember".equals(action)
				|| "processUpdateMember".equals(action)
				|| "delete".equals(action)
				|| "deleteMember".equals(action)
				|| "welcomeUser".equals(action);
	}

	public String processAddMember(HttpServletRequest request, HttpServletResponse response) {
		Member m = new Member();
		try {
			String fileName = "";
			try {
				Part part = request.getPart("file");
				fileName = part.getSubmittedFileName();
				if (fileName != null && !fileName.equals("")) {
					part.write(fileName);
				}
			} catch (Exception fileError) {
				fileError.printStackTrace();
			}

			m.setStudentId(request.getParameter("studentId"));
			m.setName(request.getParameter("name"));
			m.setGrade(Integer.parseInt(request.getParameter("grade")));
			m.setMajor(request.getParameter("major"));
			m.setRole(request.getParameter("role"));
			m.setStatus(request.getParameter("status"));
			m.setEmail(request.getParameter("email"));

			if (fileName != null && !fileName.equals("")) {
				m.setProfileImg("/img/" + fileName);
			} else {
				m.setProfileImg("");
			}

			dao.insert(m);
		} catch (Exception e) {
			e.printStackTrace();
			ctx.log("랩원 추가 과정에서 문제 발생!!");
		}
		request.setAttribute("members", dao.findAll());
		return "memberList.jsp";
	}

	public String processUpdateMember(HttpServletRequest request, HttpServletResponse response) {
		Member m = new Member();
		try {
			String studentId = request.getParameter("studentId");
			Member oldMember = dao.find(studentId);

			String fileName = "";
			try {
				Part part = request.getPart("file");
				fileName = part.getSubmittedFileName();
				if (fileName != null && !fileName.equals("")) {
					part.write(fileName);
				}
			} catch (Exception fileError) {
				fileError.printStackTrace();
			}

			m.setStudentId(studentId);
			m.setName(request.getParameter("name"));
			m.setGrade(Integer.parseInt(request.getParameter("grade")));
			m.setMajor(request.getParameter("major"));
			m.setRole(request.getParameter("role"));
			m.setStatus(request.getParameter("status"));
			m.setEmail(request.getParameter("email"));

			if (fileName != null && !fileName.equals("")) {
				m.setProfileImg("/img/" + fileName);
			} else {
				m.setProfileImg(oldMember.getProfileImg());
			}

			dao.update(m);
		} catch (Exception e) {
			e.printStackTrace();
			ctx.log("랩원 수정 과정에서 문제 발생!!");
		}
		request.setAttribute("members", dao.findAll());
		return "memberList.jsp";
	}
}
