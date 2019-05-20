package kr.co.koo.izone.member.model;

import java.sql.*;
import java.util.*;
import javax.sql.DataSource;

import kr.co.koo.izone.util.JdbcUtil;

import javax.naming.*;

public class MemberDAO {

	public static final int LOGIN_SUCCESS = 1;
	public static final int LOGIN_FAIL_ID = -1;
	public static final int LOGIN_FAIL_PW = 0;

	private static MemberDAO dao = new MemberDAO();
	private DataSource ds;

	private MemberDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static MemberDAO getInstance() {
		if(dao == null) {
			dao = new MemberDAO();
		}
		return dao;
	}

	//ID 중복확인을 하는 메서드 선언.
	public boolean confirmId(String id) {

		boolean flag = false;

		String sql = "SELECT user_id FROM izone_member"
				+ " WHERE user_id=?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				flag = true;
			} else {
				flag = false;
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return flag;
	}

	//회원가입을 수행하는 메서드 선언.
	public boolean insertMember(MemberVO members) {
		boolean flag = false;

		String sql = "INSERT INTO izone_member "
				+ "(user_id, user_pw, user_name, user_email) "
				+ "VALUES (?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, members.getUserId());
			pstmt.setString(2, members.getUserPw());
			pstmt.setString(3, members.getUserName());
			pstmt.setString(4, members.getUserEmail());

			int i = pstmt.executeUpdate();

			if(i == 1) {
				flag = true;				
			} else {
				flag = false;	
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}		
		return flag;
	}

	//로그인의 유효성을 검증하는 메서드 선언.
	public int userCheck(String id, String pw) {

		int resultNum = 0;

		String sql = "SELECT user_pw FROM izone_member WHERE user_id=?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				String dbPw = rs.getString("user_pw");
				if(dbPw.equals(pw)) { //로그인에 성공한 경우
					resultNum = LOGIN_SUCCESS;
				} else { //비밀번호가 틀렸을 경우
					resultNum = LOGIN_FAIL_PW;
				}				
			} else { //아이디가 존재하지 않는 경우
				resultNum = LOGIN_FAIL_ID;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}

		return resultNum;

	}

	//로그인한 회원의 회원정보를 모두 가져오는 메서드 선언.
	public MemberVO getMemberInfo(String id) {

		MemberVO user = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "SELECT * FROM izone_member WHERE user_id=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				user = new MemberVO();
				user.setUserId(rs.getString("user_id"));
				user.setUserPw(rs.getString("user_pw"));
				user.setUserName(rs.getString("user_name"));
				user.setUserEmail(rs.getString("user_email"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}

		return user;
	}

	//비밀번호 수정을 위한 메서드 선언.
	public boolean changePassword(String id, String newPw) {

		boolean flag = false;
		String sql = "UPDATE izone_member "
				+ "SET user_pw=? WHERE user_id=?"; 

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPw);
			pstmt.setString(2, id);

			int i = pstmt.executeUpdate();

			if(i == 1) {
				flag = true;
			} else {
				flag = false;
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}

		return flag;
	}

	//회원정보 수정을 처리하는 메서드
	public boolean updateMember(MemberVO member) {
		boolean flag = false;

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "UPDATE izone_member SET user_name=?, "
				+ "user_email=? "
				+ "WHERE user_id=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUserName());
			pstmt.setString(2, member.getUserEmail());
			pstmt.setString(3, member.getUserId());

			int i = pstmt.executeUpdate();

			if(i == 1) {
				flag = true;
			}else {
				flag = false;
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}

		return flag;
	}

	//회원탈퇴를 처리하는 메서드 선언.
	public boolean deleteMember(String id) {

		boolean flag = false;

		String sql = "DELETE FROM izone_member WHERE user_id=?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			int i = pstmt.executeUpdate();

			if(i == 1) {
				flag = true;
			} else {
				flag = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		return flag;
	}
	
	

}









