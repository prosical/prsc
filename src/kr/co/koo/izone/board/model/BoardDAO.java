package kr.co.koo.izone.board.model;

import java.util.*;
import java.sql.*;
import javax.naming.*;
import javax.sql.DataSource;

import kr.co.koo.izone.util.JdbcUtil;

public class BoardDAO {

	//싱글톤패턴을 사용하여 DAO클래스 설계.
	//커넥션풀 연동을 생성자에서 처리.
	private static BoardDAO dao = new BoardDAO();

	private DataSource ds;

	private BoardDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static BoardDAO getInstance() {
		if(dao == null) {
			dao = new BoardDAO();
		}
		return dao;
	}

	//게시글 내용을 DB에 저장하는 메서드.
	public void write(String bName, String bTitle, String bContent) {

		String sql = "INSERT INTO izone_board "
				+ "(board_name, board_title, board_content)"
				+ " VALUES (?,?,?)";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bName);
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);

			int i = pstmt.executeUpdate();
			if(i == 1) {
				System.out.println("게시글 등록 성공!");
			} else {
				System.out.println("게시글 등록 실패!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}

	}
	
	//총 게시물의 개수를 조회하는 메서드 선언.
	public int selectCount() {
		int num = 0;
		
		String sql = "SELECT COUNT(*) FROM izone_board";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			num = rs.getInt(1);
			System.out.println("총 게시물의 수: " + num + "개");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		
		return num;
	}

	//게시글 목록을 DB로부터 받아올 메서드 선언.
	public List<BoardVO> getBoardArticles(int firstRow, int endRow) {

		List<BoardVO> articleList = new ArrayList<>();
		
//		String sql = "SELECT * FROM izone_board "
//				+ "ORDER BY board_id DESC";
		String sql = "SELECT * FROM izone_board "
				+ "ORDER BY board_id DESC LIMIT ?, ?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, firstRow - 1);
			pstmt.setInt(2, endRow - firstRow + 1);
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				BoardVO article = new BoardVO(
						rs.getInt("board_id"), 
						rs.getString("board_name"), 
						rs.getString("board_title"), 
						rs.getString("board_content"), 
						rs.getTimestamp("board_date"), 
						rs.getInt("board_hit"));
				articleList.add(article);
			}
			System.out.println("게시글 목록 정보 조회 완료!");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}

		return articleList;
	}

	//선택된 게시물의 정보를 DB로부터 조회하는 메서드
	public BoardVO getBoardContent(String strBId) {			

		upHit(strBId);
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		BoardVO board = null;

		String sql = "SELECT * FROM izone_board WHERE board_id=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(strBId));
			rs = pstmt.executeQuery();

			if(rs.next()) {
				board = new BoardVO(
						rs.getInt("board_id"), 
						rs.getString("board_name"), 
						rs.getString("board_title"), 
						rs.getString("board_content"), 
						rs.getTimestamp("board_date"), 
						rs.getInt("board_hit"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return board;
	}
	
	//글 제목을 클릭할 때마다 조회수를 1 상승시키는 메서드
	private void upHit(String strBId) {
		
		String sql = "UPDATE izone_board "
				+ "SET board_hit=board_hit+1"
				+ " WHERE board_id=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(strBId));
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		
	}
	
	//게시글을 DB에 수정처리하는 메서드
	public void updateArticle(String bNum, String bTitle, String bContent) {
		String sql = "UPDATE izone_board SET board_title=?, "
				+ "board_content=? WHERE board_id=?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bTitle);
			pstmt.setString(2, bContent);
			pstmt.setInt(3, Integer.parseInt(bNum));

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		
	}
	
	//게시판 글을 삭제처리하는 메서드
	public void deleteArticle(String bNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "DELETE FROM izone_board WHERE board_id=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(bNum));

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public List<BoardVO> getSearch(String title) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardVO> articleList = new ArrayList<>();
		
		String sql="SELECT * FROM izone_board WHERE board_title=?";
		System.out.println("검색완료");
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO article = new BoardVO(
						rs.getInt("board_id"), 
						rs.getString("board_name"), 
						rs.getString("board_title"), 
						rs.getString("board_content"), 
						rs.getTimestamp("board_date"), 
						rs.getInt("board_hit"));
				articleList.add(article);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return articleList;
	}

}








