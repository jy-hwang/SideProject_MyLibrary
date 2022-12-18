package model1.mylibrary.login;

import java.sql.SQLException;

import common.DBConnPool;

public class LoginDAO extends DBConnPool {

	public LoginDAO() {
		super();
	}

	public int insertMember(LoginDTO dto) {
		int result = 0;

		try {
			String query = " insert into stu_login(stu_no,password,email) " + " values (?,?,? ) ";
			psmt = con.prepareStatement(query);

			psmt.setString(1, dto.getStu_no());
			psmt.setString(2, dto.getPassword());
			psmt.setString(3, dto.getEmail());

			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public boolean dupChkStuNo1(String stuno) {

		boolean isDup = false;

		String query = "select stu_no from stu_login where stu_no = ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, stuno);
			rs = psmt.executeQuery();
			System.out.println("쿼리 , 학번 : " + query + stuno);
			if (rs.next()) {
				System.out.println("중복된 학번 : " + rs.getString("stu_no"));
				isDup = true;

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isDup;
	}

}
