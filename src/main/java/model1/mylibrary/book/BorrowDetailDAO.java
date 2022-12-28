package model1.mylibrary.book;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import common.DBConnPool;

public class BorrowDetailDAO extends DBConnPool {

	public BorrowDetailDAO() {
		super();
	}

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "select count(*) from book_borrow_detail where member_no = ? ";
		if (map.get("searchWord") != null) {
			query += " and " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
		}

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("memberNo").toString());
			rs = psmt.executeQuery();

			rs.next();

			totalCount = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("대여권 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}

		return totalCount;
	}

	public ArrayList<BorrowDetailDTO> selectList(String mNo) {
		ArrayList<BorrowDetailDTO> board = new ArrayList<BorrowDetailDTO>();

		String query = " SELECT bbd.MEMBER_NO, bbd.BORROW_START_TIME,bbd.BORROW_END_TIME,b.book_code,b.BOOK_TITLE,b.BOOK_AUTHOR,bbd.BOOK_STATUS,b.BOOK_GENRE,cmmn1.CMMN_NAME AS 'book_status_nm', cmmn2.CMMN_NAME AS 'book_genre_nm',b.publisher FROM book_borrow_DETAIL bbd INNER JOIN book b ON bbd.BOOK_CODE  = b.BOOK_CODE   INNER JOIN CMMN cmmn1    ON bbd.borrow_status = cmmn1.CMMN_CODE    INNER JOIN CMMN cmmn2    ON b.book_genre = cmmn2.CMMN_CODE ";

		query += "   WHERE bbd.MEMBER_NO = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, mNo);
			rs = psmt.executeQuery();

			while (rs.next()) {
				BorrowDetailDTO dto = new BorrowDetailDTO();

				dto.setBookCode(rs.getString("book_code"));
				dto.setBookTitle(rs.getString("book_title"));
				dto.setBookAuthor(rs.getString("book_author"));
				dto.setBookGenre(rs.getString("book_genre"));
				dto.setBookGenreNm(rs.getString("book_genre_nm"));
				dto.setBorrowStatus(rs.getString("borrow_status"));
				dto.setBorrowStatusNm(rs.getString("borrow_status_nm"));
				dto.setBorrowStartTime(rs.getDate("borrow_start_time"));
				dto.setBorrowEndTime(rs.getDate("borrow_end_time"));
				dto.setPublisher(rs.getString("publisher"));

				board.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("쿼리 실행 중 예외 발생");
			e.printStackTrace();
		}

		return board;
	}

	public ArrayList<BorrowDetailDTO> selectListPage(Map<String, Object> map) {
		ArrayList<BorrowDetailDTO> bbdList = new ArrayList<BorrowDetailDTO>();

		// String query1 = "select * from ( select tb.* , rownum rNum from ( select *
		// from board ";
		String query = "  SELECT bbd.MEMBER_NO, bbd.BORROW_START_TIME,bbd.BORROW_END_TIME,bbd.borrow_STATUS,b.book_code,b.BOOK_TITLE,b.BOOK_AUTHOR,b.BOOK_GENRE,cmmn1.CMMN_NAME AS 'borrow_status_nm', cmmn2.CMMN_NAME AS 'book_genre_nm',b.publisher FROM book_borrow_DETAIL bbd INNER JOIN book b ON bbd.BOOK_CODE  = b.BOOK_CODE   INNER JOIN CMMN cmmn1    ON bbd.borrow_status = cmmn1.CMMN_CODE    INNER JOIN CMMN cmmn2    ON b.book_genre = cmmn2.CMMN_CODE where bbd.member_no = ? ";
		if (map.get("searchWord1") != null && map.get("searchWord1") != "") {
			query += " and " + map.get("searchField1") + " like '%" + map.get("searchWord1") + "%'";
		}
		if (map.get("searchWord2") != null && map.get("searchWord2") != "") {
			query += " and " + map.get("searchField2") + " >= '" + map.get("searchWord2") + "'";
		}

		query += " ORDER BY publish_date DESC limit ? , ? ";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("memberNo").toString());
			psmt.setInt(2, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(3, Integer.parseInt(map.get("end").toString()));
			System.out.println(query + " " + map.get("start").toString() + " " + map.get("end").toString());
			rs = psmt.executeQuery();

			while (rs.next()) {
				BorrowDetailDTO dto = new BorrowDetailDTO();

				dto.setBookCode(rs.getString("book_code"));
				dto.setBookTitle(rs.getString("book_title"));
				dto.setBookAuthor(rs.getString("book_author"));
				dto.setBookGenre(rs.getString("book_genre"));
				dto.setBookGenreNm(rs.getString("book_genre_nm"));
				dto.setBorrowStatus(rs.getString("borrow_status"));
				dto.setBorrowStatusNm(rs.getString("borrow_status_nm"));
				dto.setBorrowStartTime(rs.getDate("borrow_start_time"));
				dto.setBorrowEndTime(rs.getDate("borrow_end_time"));
				dto.setPublisher(rs.getString("publisher"));

				bbdList.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("게시물 페이징 처리 중 예외 발생");
			e.printStackTrace();
		}

		return bbdList;

	}

	public int borrowBookDetail(Map<String, Object> map) {
		int result = 0;

		String query = " insert into book_borrow_detail ( book_code, member_no, borrow_end_schedule, borrow_status , regi_user) "
				+ " values( ?, ? , date_add(now(), INTERVAL 14 DAY), ? , ? ) ";

		try {

			psmt = con.prepareStatement(query);
			// 인파라미터 설정
			psmt.setString(1, map.get("bookCode").toString());
			psmt.setString(2, map.get("memberNo").toString());
			psmt.setString(3, map.get("borrowStatus").toString());
			psmt.setString(4, map.get("memberNo").toString());

			result += psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}

	public int returnBookDetail(Map<String, Object> map) {
		int result = 0;

		String query = " update book_borrow_detail set borrow_status = ?,borrow_end_time = now() , updt_user = ? ,updt_date = now() where book_code = ? and member_no = ? and borrow_status = 'BK102'";

		try {

			psmt = con.prepareStatement(query);
			// 인파라미터 설정
			psmt.setString(1, map.get("borrowStatus").toString());
			psmt.setString(2, map.get("memberNo").toString());
			psmt.setString(3, map.get("bookCode").toString());
			psmt.setString(4, map.get("memberNo").toString());

			result += psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}

}
