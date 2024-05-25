package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class userDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public userDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/project";
			String dbID = "root";
			String dbPasswd = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPasswd);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String ID, String Password) {
		String SQL = "Select Passwd from user where Id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(Password)) {
					return 0;
				}
				else {
					return 1;
				}
			}else {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int SignUP(userDTO user) {
		String SQL = "Select Id from user where Id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return -1;
			}else {
				SQL = "Insert INTO user Value(?,?,?,?)";
				
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, user.getUserID());
				pstmt.setString(2, user.getUserPW());
				pstmt.setString(3, user.getNickName());
				pstmt.setString(4, user.getGender());
				
				return pstmt.executeUpdate(); 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	public ArrayList<String> companyList(String userID) {
		String SQL = "Select * from company where Id = ?";
		ArrayList<String> company = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String value = rs.getString("company");
				company.add(value);
			}
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return company;
	}
}