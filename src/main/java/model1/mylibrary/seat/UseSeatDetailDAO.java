package model1.mylibrary.seat;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import common.DBConnPool;
import model1.mylibrary.book.BookDTO;

public class UseSeatDetailDAO extends DBConnPool{

	public UseSeatDetailDAO() {
		super();
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = " select count(*) from seat_use_detail where member_no = ? ";
		if (map.get("searchWord") != null) {
			query += " and " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
		}

		query += " order by use_start_time desc ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("memberNo").toString());
			rs = psmt.executeQuery();

			rs.next();

			totalCount = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}

		return totalCount;
	}
	
	public ArrayList<UseSeatDetailDTO> selectListUseSeatDTO(Map<String, Object> map) {

		System.out.println("===================");
		ArrayList<UseSeatDetailDTO> list = new ArrayList<UseSeatDetailDTO>();

		String query = " SELECT  DATE_FORMAT(sud.use_start_time, '%Y-%m-%d %T') as 'use_start_time'"
				+ ",  DATE_FORMAT(sud.use_end_schedule, '%Y-%m-%d %T') as 'use_end_schedule'"
				+ ", DATE_FORMAT( sud.use_end_time, '%Y-%m-%d %T') as 'use_end_time'"
				+ ", sud.use_status,c.CMMN_NAME AS 'use_status_nm',s.seat_id, s.seat_nm,s.SEAT_LOCATION    FROM seat_use_detail sud    INNER JOIN seat s   ON sud.seat_id= s.seat_id    inner join cmmn c   on sud.use_status = c.cmmn_code AND c.PARENT_CODE = '1' AND c.USE_YN = 'Y'";
				query += " WHERE member_no = ? ";

		try {
			System.out.println("실행하는 쿼리 : "+query);
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("memberNo").toString());
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				UseSeatDetailDTO dto = new UseSeatDetailDTO();

				dto.setSeatId(rs.getString("seat_id"));
				dto.setSeatNm(rs.getString("seat_nm"));
				dto.setSeatLocation(rs.getString("seat_location"));
				dto.setUseStatus(rs.getString("use_status"));
				dto.setUseStatusNm(rs.getString("use_status_nm"));
				dto.setUseStartTime(rs.getDate("use_start_time"));
				System.out.println("이용시작시각"+rs.getDate("use_start_time"));
				dto.setUseEndTime(rs.getDate("use_end_time"));		
				dto.setUseEndSchedule(rs.getDate("use_end_schedule"));		
				System.out.println("반납예정시각"+rs.getDate("use_end_schedule"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("쿼리오류임 : " + query);
			e.printStackTrace();
		}
		

		return list;

	}
	
	
}
