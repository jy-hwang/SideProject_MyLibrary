package model1.mylibrary.book;

import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnPool;

public class BookDAO  extends DBConnPool{

	public BookDAO() {
		super();
	}
	public ArrayList<BookDTO> selectList() {
		ArrayList<BookDTO> board = new ArrayList<BookDTO>();

		String query = " select book_title, book_author  from book ";
		
		try {
			psmt = con.prepareStatement(query);
			//stmt = con.createStatement();
			rs = psmt.executeQuery();

			while (rs.next()) {
				BookDTO dto = new BookDTO();

				dto.setTitle(rs.getString(1));
				dto.setAuthor(rs.getString(2));

				board.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("쿼리 실행 중 예외 발생");
			e.printStackTrace();
		}

		return board;
	}
	

}
//
//String query = "select book_title, book_author from ( select tb.* , rownum rNum from ( select * from book ";
//
//query += " order by book_code desc ) tb ) where rNum between 1 and 100 ";
