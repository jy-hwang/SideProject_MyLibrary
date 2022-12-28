package model1.mylibrary.student;

import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnPool;

public class StudentDAO extends DBConnPool {

	public StudentDAO() {
		super();
	}

	public boolean dupChkStuNo2(String stuNo) {

		boolean isDup = false;

		String query = "select stu_no from student where stu_no = ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, stuNo);
			rs = psmt.executeQuery();
			System.out.println("쿼리 , 학번 : " + query + stuNo);
			if (rs.next()) {
				System.out.println("중복된 학번 : " + rs.getString("stu_no"));
				isDup = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isDup;
	}

	public ArrayList<StudentDTO> selectListOne(String stuNo) {
		ArrayList<StudentDTO> listOne = new ArrayList<StudentDTO>();
		StudentDTO dto = new StudentDTO();

		String query = "select stu_no from student where stu_no = ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, stuNo);
			rs = psmt.executeQuery();
			System.out.println("쿼리 , 학번 : " + query + stuNo);
			if (rs.next()) {

				// dto.set

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listOne;

	}

}
