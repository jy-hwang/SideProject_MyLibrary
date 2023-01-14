package model1.mylibrary.book;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import common.DBConnPool;

public class BookDAO extends DBConnPool {

	public BookDAO() {
		super();
	}

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "select count(*) from book ";
		if (map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
		}

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			rs.next();

			totalCount = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}

		return totalCount;
	}

	public ArrayList<BookDTO> selectList() {
		ArrayList<BookDTO> board = new ArrayList<BookDTO>();

		String query = " SELECT BOOK_CODE, BOOK_TITLE,BOOK_AUTHOR,BOOK_GENRE,BOOK_STATUS,c.CMMN_NAME  AS book_status_nm ,PUBLISHER,PUBLISH_DATE  FROM book b   INNER JOIN cmmn C   ON b.BOOK_STATUS = c.CMMN_CODE ";

		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();

			while (rs.next()) {
				BookDTO dto = new BookDTO();

				dto.setBookCode(rs.getString(1));
				dto.setBookTitle(rs.getString(2));
				dto.setBookAuthor(rs.getString(3));
				dto.setBookGenre(rs.getString(4));
				dto.setBookStatus(rs.getString(5));
				dto.setBookStatusNm(rs.getString(6));
				dto.setPublisher(rs.getString(7));
				dto.setPublishDate(rs.getDate(8));

				board.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("쿼리 실행 중 예외 발생");
			e.printStackTrace();
		}

		return board;
	}

	public ArrayList<BookDTO> selectListPage(Map<String, Object> map) {
		ArrayList<BookDTO> bbs = new ArrayList<BookDTO>();

		// String query1 = "select * from ( select tb.* , rownum rNum from ( select *
		// from board ";
		String query = " SELECT BOOK_CODE, BOOK_TITLE,BOOK_AUTHOR,BOOK_GENRE,BOOK_STATUS,c.CMMN_NAME  AS book_status_nm ,PUBLISHER,PUBLISH_DATE  FROM book b   INNER JOIN cmmn c   ON b.BOOK_STATUS = c.CMMN_CODE and c.parent_code = 'BK100' and c.use_yn='Y' ";
		if (map.get("searchWord1") != null && map.get("searchWord1") != "") {
			query += "WHERE " + map.get("searchField1") + " like '%" + map.get("searchWord1") + "%'";
		}
		if (map.get("searchWord2") != null && map.get("searchWord2") != "") {
			query += "WHERE " + map.get("searchField2") + " >= '" + map.get("searchWord2") + "'";
		}

		query += " ORDER BY publish_date DESC limit ? , ? ";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			System.out.println(query + " " + map.get("start").toString() + " " + map.get("end").toString());
			rs = psmt.executeQuery();

			while (rs.next()) {
				BookDTO dto = new BookDTO();

				dto.setBookCode(rs.getString(1));
				dto.setBookTitle(rs.getString(2));
				dto.setBookAuthor(rs.getString(3));
				dto.setBookGenre(rs.getString(4));
				dto.setBookStatus(rs.getString(5));
				dto.setBookStatusNm(rs.getString(6));
				dto.setPublisher(rs.getString(7));
				dto.setPublishDate(rs.getDate(8));

				bbs.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("게시물 페이징 처리 중 예외 발생");
			e.printStackTrace();
		}

		return bbs;

	}

	public int borrowReturnBook(Map<String, Object> map) {
		int result = 0;

		String query = " update book set book_status = ? , updt_user = ? ,updt_date = now() where book_code = ?";

		try {

			psmt = con.prepareStatement(query);
			// 인파라미터 설정
			psmt.setString(1, map.get("bookStatus").toString());
			psmt.setString(2, map.get("memberNo").toString());
			psmt.setString(3, map.get("bookCode").toString());

			result += psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}

}
