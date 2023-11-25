package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.UserDto;

public class UserDao {

	private Connection getConnection()  throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds =(DataSource) envCtx.lookup("jdbc/chatdb");
		Connection con = ds.getConnection();
		return con;
	}
	public void insert(UserDto dto) {
		String sql = "INSERT INTO users (id, pw, name) VALUES(?, ?, ?);";
		try (
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		){
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public boolean idCheack(String id) {
		String sql = "select id from users where id='"+id+"';";
		try (
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
		){
			if(rs.next()) return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public String selectName(String id, String pw) {
		String sql = "SELECT * FROM users WHERE id = '"+id+"' AND pw='"+pw+"';";
		try (
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
		){
			if(rs.next()) return rs.getString("name"); 
			else return "";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
}
