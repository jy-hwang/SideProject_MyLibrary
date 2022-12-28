package model2.mylibrary.board;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class BoardDAO extends DBConnPool {

	public BoardDAO() {
		super();
	}

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = " select count(*) from multi_board where board_id = ?  and del_yn = 'N' ";
		if (map.get("searchWord") != null) {
			query += " and " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
		}

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("boardId").toString());
			rs = psmt.executeQuery();
			if (rs.next()) {

				totalCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}

		return totalCount;
	}

	public List<BoardDTO> selectListPage(Map<String, Object> map) {
		List<BoardDTO> board = new Vector<BoardDTO>();

		String query = " SELECT mb.bbs_idx, mb.board_id , mb.title, mb.regi_date, mb.member_no, mb.ofile, mb.sfile, mb.visit_count, mb.down_count "
				+ " , (select count(0) from comment c where mb.bbs_idx = c.bbs_idx and c.del_yn = 'N' ) commentCount "
				+ " FROM multi_board mb where board_id = ? and del_yn = 'N' ";

		if (map.get("searchWord") != null) {
			query += " and " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
		}

		query += " ORDER BY mb.regi_date DESC LIMIT ? , ? ";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("boardId").toString());
			psmt.setInt(2, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(3, Integer.parseInt(map.get("end").toString()));
			System.out.println(query + " " + map.get("start").toString() + " " + map.get("end").toString());
			rs = psmt.executeQuery();

			while (rs.next()) {
				BoardDTO dto = new BoardDTO();

				dto.setBbsIdx(rs.getInt("bbs_idx"));
				dto.setBoardId(rs.getString("board_id"));
				dto.setTitle(rs.getString("title"));
				dto.setCommentCount(rs.getInt("commentCount"));

				board.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("게시물 페이징 처리 중 예외 발생");
			e.printStackTrace();
		}

		return board;

	}

	public BoardDTO selectView(String idx) {
		BoardDTO dto = new BoardDTO();

		String query = " select * from multi_board where bbs_idx = ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);

			rs = psmt.executeQuery();

			if (rs.next()) {

			}

		} catch (SQLException e) {
			System.out.println("쿼리오류");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}

		return dto;

	}

	public void updateVisitCount(String idx) {

		String query = "update mvcboard set visitcount = visitcount + 1 where idx = ? ";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			;
			psmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외발생");
			e.printStackTrace();
		}
	}

}
