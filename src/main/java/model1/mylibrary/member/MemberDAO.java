package model1.mylibrary.member;

import java.sql.SQLException;

import common.DBConnPool;

public class MemberDAO extends DBConnPool {

	public MemberDAO() {
		super();
	}

	public int insertMember(MemberDTO dto) {
		int result = 0;

		try {
			String query = " insert into member (member_no,password,email,member_type) " + " values (?,?,? ) ";
			psmt = con.prepareStatement(query);

			psmt.setString(1, dto.getMemberNo());
			psmt.setString(2, dto.getPassword());
			psmt.setString(3, dto.getEmail());
			psmt.setString(4, dto.getMemberType());

			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	/*
	 * 학생 회원가입의 경우 기존 student에 등록되어있는지 확인
	 */
	public boolean dupChkNo1(String memberNo) {

		boolean isDup = false;

		String query = "select stu_no from student where stu_no = ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, memberNo);
			rs = psmt.executeQuery();
			System.out.println("쿼리 , 학번 : " + query + memberNo);
			if (rs.next()) {
				System.out.println("중복된 학번 : " + rs.getString("stu_no"));
				isDup = true;

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isDup;
	}

	public boolean dupChkNo2(String memberNo, String memberType) {
		boolean isDup = false;

		String query = "select staff_no from staff where staff_no = ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, memberNo);
			rs = psmt.executeQuery();
			System.out.println("쿼리 , 직원번호 : " + query + memberNo);
			if (rs.next()) {
				System.out.println("기존에 등록된 직원번호 : " + rs.getString("staff_no"));
				isDup = true;

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isDup;

	}

	/*
	 * 일반 회원가입의 경우 일련번호 형식으로 연도 + 7 + 1001 형식만들기 max+1
	 */

	/*
	 * 로그인처리
	 * 
	 */

	public MemberDTO getStuMemberDTO(String memberNo, String password) {

		MemberDTO dto = new MemberDTO();

		String query = " select m.member_no, stu.stu_nm, m.member_type from member m inner join student stu on stu.stu_no = m.member_no where m.member_no = ? and m.password = ? ";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, memberNo);
			psmt.setString(2, password);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setMemberNo(rs.getString(1));
				dto.setMemberNm(rs.getString(2));
				dto.setMemberType(rs.getString(3));
			}
		} catch (SQLException e) {
			System.out.println("쿼리오류임 : " + query);
			e.printStackTrace();
		}

		return dto;

	}
	
	public MemberDTO getStfMemberDTO(String memberNo, String password) {
		
		MemberDTO dto = new MemberDTO();
		
		String query = " select m.member_no, stf.staff_nm, m.member_type from member m inner join staff stf on stf.staff_no = m.member_no where m.member_no = ? and m.password = ? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, memberNo);
			psmt.setString(2, password);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setMemberNo(rs.getString(1));
				dto.setMemberNm(rs.getString(2));
				dto.setMemberType(rs.getString(3));
			}
		} catch (SQLException e) {
			System.out.println("쿼리오류임 : " + query);
			e.printStackTrace();
		}
		
		return dto;
		
	}
	
	public MemberDTO getPubMemberDTO(String memberNo, String password) {
		
		MemberDTO dto = new MemberDTO();
		
		String query = " select m.member_no, pub.pub_nm, m.member_type from member m inner join public pub on pub.PUB_NO = m.member_no where m.member_no = ? and m.password = ? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, memberNo);
			psmt.setString(2, password);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setMemberNo(rs.getString(1));
				dto.setMemberNm(rs.getString(2));
				dto.setMemberType(rs.getString(3));
			}
			
		} catch (SQLException e) {
			System.out.println("쿼리오류임 : " + query);
			e.printStackTrace();
		}
		return dto;
	}

}
