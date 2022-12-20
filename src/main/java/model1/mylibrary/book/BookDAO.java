package model1.mylibrary.book;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import common.DBConnPool;

public class BookDAO  extends DBConnPool{

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
			//stmt = con.createStatement();
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
	
	public ArrayList<BookDTO> selectListPage(Map<String, Object> map){
		ArrayList<BookDTO> bbs = new ArrayList<BookDTO>();
		
		//String query1 = "select * from ( select tb.* , rownum rNum from ( select * from board ";
		String query = "SELECT * FROM ( SELECT tb.*, rownum rNum FROM ( SELECT BOOK_CODE, BOOK_TITLE,BOOK_AUTHOR,BOOK_GENRE,BOOK_STATUS,c.CMMN_NAME  AS book_status_nm ,PUBLISHER,PUBLISH_DATE  FROM book b   INNER JOIN cmmn C   ON b.BOOK_STATUS = c.CMMN_CODE ";
		if (map.get("searchWord") != null) {
			query += "WHERE " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
		}

		query += " ORDER BY publish_date DESC ) tb ) WHERE rNum BETWEEN ? AND ? ";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			System.out.println(query + " " + map.get("start").toString() + " " + map.get("end").toString());
			// stmt = con.createStatement();
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

}
//
//String query = "select book_title, book_author from ( select tb.* , rownum rNum from ( select * from book ";
//
//query += " order by book_code desc ) tb ) where rNum between 1 and 100 ";
