package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDao {

	private Connection getConnection()  throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds =(DataSource) envCtx.lookup("jdbc/chatdb");
		Connection con = ds.getConnection();
		return con;
	}
	public String inserUser(String id, String pw, String name) {
		String sql = "";
		try (
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
		){
			if(rs.next()) return rs.getString("Message"); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
}
