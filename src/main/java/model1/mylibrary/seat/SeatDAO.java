package model1.mylibrary.seat;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;
import model1.mylibrary.member.MemberDTO;

public class SeatDAO extends DBConnPool{

	public SeatDAO() {
		super();
	}
	
	public ArrayList<SeatDTO> selectListSeatDTO() {

		System.out.println("===================");
		ArrayList<SeatDTO> list = new ArrayList<SeatDTO>();

		String query = " select seat_id, seat_nm,seat_location,seat_status,c.cmmn_name as 'seat_status_nm' from seat s inner join cmmn c on s.seat_status = c.cmmn_code ";

		try {
			System.out.println("실행하는 쿼리 : "+query);
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				SeatDTO dto = new SeatDTO();
				
				dto.setSeatId(rs.getString("seat_id"));
				dto.setSeatNm(rs.getString("seat_nm"));
				dto.setSeatLocation(rs.getString("seat_location"));
				dto.setSeatStatus(rs.getString("seat_status"));
				dto.setSeatStatusNM(rs.getString("seat_status_nm"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("쿼리오류임 : " + query);
			e.printStackTrace();
		}
		

		return list;

	}
	
	
}
