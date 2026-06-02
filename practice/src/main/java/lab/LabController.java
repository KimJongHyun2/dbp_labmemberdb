package lab;

import java.io.IOException;

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

		switch (action) {
		case "welcome":
			view = "welcome.jsp";
			break;

		case "login":
			view = "login.jsp";
			break;

		case "welcomeUser":
			view = "welcomeUser.jsp";
			break;

		case "memberList":
			request.setAttribute("members", dao.findAll());
			view = "memberList.jsp";
			break;

		case "memberInfo":
			request.setAttribute("m", dao.find(request.getParameter("id")));
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
			HttpSession session = request.getSession();
			session.setAttribute("sessionId", request.getParameter("id"));
			view = "welcomeUser.jsp";
			break;

		case "processLogout":
			request.getSession().invalidate();
			view = "welcome.jsp";
			break;

		case "processAddMember":
			view = processAddMember(request, response);
			break;

		case "processUpdateMember":
			view = processUpdateMember(request, response);
			break;

		default:
			view = "welcome.jsp";
			break;
		}

		getServletContext().getRequestDispatcher("/lab/" + view).forward(request, response);
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