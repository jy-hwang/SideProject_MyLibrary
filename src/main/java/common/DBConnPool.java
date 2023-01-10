package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool {

	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;

	public DBConnPool() {
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			DataSource source = (DataSource) ctx.lookup("dbcp_mylibrary");
			con = source.getConnection();
			System.out.println("DB 커넥션 풀 연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (con != null) {
				con.close();
			}
			System.out.println("DB 커넥션 풀 자원 반납");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		Connection con = null;
		
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context) initCtx.lookup("java:comp/env");
			DataSource source = (DataSource) ctx.lookup("dbcp_mylibrary");
			con = source.getConnection();
			con.setAutoCommit(false);
			System.out.println("getConnection _ DB 커넥션 풀 연결 성공");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public static void commit(Connection con) {
		try {
			con.commit();
			System.out.println("commit success");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection con) {
		try {
			con.rollback();
			System.out.println("rollback success");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
		
}
