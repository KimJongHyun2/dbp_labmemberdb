package lab;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;

	final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://localhost/~/labmemberdb";

	public void open() {
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, "labjang", "1234");
			System.out.println("H2 DB 연결 성공");
		} catch (Exception e) {
			System.out.println("H2 DB 연결 실패");
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void insert(Member m) {
		open();

		String sql = "INSERT INTO member(studentid, name, grade, major, status, email, profileimg) VALUES(?,?,?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getStudentId());
			pstmt.setString(2, m.getName());
			pstmt.setInt(3, m.getGrade());
			pstmt.setString(4, m.getMajor());
			pstmt.setString(5, m.getStatus());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getProfileImg());

			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("DB INSERT 실패");
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public List<Member> findAll() {
		open();

		List<Member> members = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement("SELECT * FROM member");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Member m = new Member();

				m.setStudentId(rs.getString("studentid"));
				m.setName(rs.getString("name"));
				m.setGrade(rs.getInt("grade"));
				m.setMajor(rs.getString("major"));
				m.setStatus(rs.getString("status"));
				m.setEmail(rs.getString("email"));
				m.setProfileImg(rs.getString("profileimg"));

				members.add(m);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return members;
	}

	public Member find(String id) {
		open();

		Member m = new Member();

		try {
			pstmt = conn.prepareStatement("SELECT * FROM member WHERE studentid = ?");
			pstmt.setString(1, id);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				m.setStudentId(rs.getString("studentid"));
				m.setName(rs.getString("name"));
				m.setGrade(rs.getInt("grade"));
				m.setMajor(rs.getString("major"));
				m.setStatus(rs.getString("status"));
				m.setEmail(rs.getString("email"));
				m.setProfileImg(rs.getString("profileimg"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return m;
	}

	public void update(Member m) {
		open();

		String sql = "UPDATE member SET name=?, grade=?, major=?, status=?, email=?, profileimg=? WHERE studentid=?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getName());
			pstmt.setInt(2, m.getGrade());
			pstmt.setString(3, m.getMajor());
			pstmt.setString(4, m.getStatus());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getProfileImg());
			pstmt.setString(7, m.getStudentId());

			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("DB UPDATE 실패");
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public void deleteMember(String studentId) {
		open();

		String sql = "DELETE FROM member WHERE studentid=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studentId);
			pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("DB DELETE 실패");
			e.printStackTrace();
		} finally {
			close();
		}
	}
}