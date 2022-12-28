package model1.mylibrary.seat;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import common.DBConnPool;
import model1.mylibrary.book.BookDTO;

public class UseSeatDetailDAO extends DBConnPool {

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

			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("개인별 좌석이용내역  구하는 중 예외 발생");
			e.printStackTrace();
		}

		return totalCount;
	}

	public UseSeatDetailDTO selectUseSeat(String memberNo) {

		UseSeatDetailDTO usdDTO = new UseSeatDetailDTO();

		String query = " select member_no ,use_end_schedule, seat_id, use_status from seat_use_detail where member_no = ? and use_status ='SE102' ";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, memberNo);

			rs = psmt.executeQuery();

			if (rs.next()) {
				usdDTO.setMemberNo(rs.getString("member_no"));
				usdDTO.setUseEndSchedule(rs.getString("use_end_schedule"));
				usdDTO.setSeatId(rs.getString("seat_id"));
				usdDTO.setUseStatus(rs.getString("use_status"));

			}

		} catch (SQLException e) {
			System.out.println("개인별 좌석이용내역  구하는 중 예외 발생");
			e.printStackTrace();
		}

		return usdDTO;
	}

	public ArrayList<UseSeatDetailDTO> selectListUseSeatDTO(Map<String, Object> map) {

		ArrayList<UseSeatDetailDTO> list = new ArrayList<UseSeatDetailDTO>();

		String query = " SELECT  DATE_FORMAT(sud.use_start_time, '%Y-%m-%d %T') as 'use_start_time'"
				+ ",  DATE_FORMAT(sud.use_end_schedule, '%Y-%m-%d %T') as 'use_end_schedule'"
				+ ", DATE_FORMAT( sud.use_end_time, '%Y-%m-%d %T') as 'use_end_time'"
				+ ", sud.use_status,c.CMMN_NAME AS 'use_status_nm',s.seat_id, s.seat_nm,s.SEAT_LOCATION    FROM seat_use_detail sud    INNER JOIN seat s   ON sud.seat_id= s.seat_id    inner join cmmn c   on sud.use_status = c.cmmn_code AND c.PARENT_CODE = '1' AND c.USE_YN = 'Y'";
		query += " WHERE member_no = ? ";

		try {
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
				dto.setUseStartTime(rs.getString("use_start_time"));
				dto.setUseEndTime(rs.getString("use_end_time"));
				dto.setUseEndSchedule(rs.getString("use_end_schedule"));

				list.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("쿼리오류임 : " + query);
			e.printStackTrace();
		}

		return list;

	}

	public int useSeatDetail(Map<String, Object> map) {
		int result = 0;

		String query = " insert into seat_use_detail ( member_no, seat_id, regi_user, use_status, use_end_schedule) "
				+ " values( ?, ?, ?, ?, date_add(now(), INTERVAL 2 HOUR) ) ";

		try {

			psmt = con.prepareStatement(query);
			String memberNo = map.get("memberNo").toString();
			psmt.setString(1, memberNo);
			psmt.setString(2, map.get("seatId").toString());
			psmt.setString(3, memberNo);
			psmt.setString(4, map.get("useStatus").toString());

			result += psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}

	public int returnUseSeatDetail(Map<String, Object> map) {
		int result = 0;

		String query = " UPDATE seat_use_detail   SET use_end_time = current_timestamp()   , use_status = ?     , UPDT_USER = ?     , UPDT_DATE = current_timestamp() "
				+ " WHERE SEAT_ID = ?   AND member_no = ?  ";

		try {

			psmt = con.prepareStatement(query);

			String memberNo = map.get("memberNo").toString();
			psmt.setString(1, map.get("useStatus").toString());
			psmt.setString(2, memberNo);
			psmt.setString(3, map.get("seatId").toString());
			psmt.setString(4, memberNo);

			result += psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}

}
