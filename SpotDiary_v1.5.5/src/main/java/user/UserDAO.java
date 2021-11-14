package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		
		try {
			String dbURL = "jdbc:mysql://localhost:3306/SpotDiary?serverTimezone=UTC";
			String dbID = "root";
			String dbPW = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int registerCheck(String userID) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM USER WHERE userID = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next() || userID.equals("")) {
				return 0;	// 이미 존재하는 회원
			}
			else {
				return 1;	// 가입 가능한 아이디
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;	// 데이터베이스 오류 발생
	}
	
	public int login(String userID, String userPW) {
		String SQL = "SELECT userPW FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPW)) {
					return 1;	//	로그인 성공
				}
				else {
					return 0;	//	비밀번호 불일치
				}
			}
			else {
				return -1;	//	아이디가 없음
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;	
	}
	
	public int register(String userID, String userPW, String userName, String userAge, String userGender, String userEmail) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPW);
			pstmt.setString(3, userName);
			pstmt.setInt(4, Integer.parseInt(userAge));
			pstmt.setString(5, userGender);
			pstmt.setString(6, userEmail);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;	// 데이터베이스 오류 발생
	}
	
	
	public int userDelete(String userID, String userPW) {
		String SQL1 = "SELECT userPW FROM USER WHERE userID = ?";
		String SQL2 = "DELETE FROM USER WHERE userID = ?";

		try {
			pstmt = conn.prepareStatement(SQL1);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			conn.setAutoCommit(false);	//	자동커밋 false로 설정
			if(rs.next()) {
				if(rs.getString(1).equals(userPW)) {
					pstmt = conn.prepareStatement(SQL2);
					pstmt.setString(1, userID);
					pstmt.executeUpdate();
	                conn.commit(); 
	                return 1;	// 탈퇴 성공
				}
				else {
					return 0;	//	비밀번호 불일치
				}
			}
			else {
				return -1;	//	아이디가 없음
			}
		
		} catch (Exception slqe) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				try{
					if ( pstmt != null ){ pstmt.close(); pstmt=null; }
					if ( conn != null ){ conn.close(); conn=null;    }
				}catch(Exception e){
					throw new RuntimeException(e.getMessage());
				}
			}
		}
		return -2;	
	}
	
	public int userUpdate(User user) {
		
		String SQL = "UPDATE USER SET userPW = ?, userName = ?, userPW2 = ?, userEmail = ? WHERE userID = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserPW());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserID());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
}


