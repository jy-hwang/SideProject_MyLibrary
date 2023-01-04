package model2.mylibrary.board.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import common.DBConnPool;
import model2.mylibrary.board.vo.BoardDTO;

public class BoardDAO2 extends DBConnPool {

	private static BoardDAO2 boardDAO2;

	private BoardDAO2() {

		super();

	}

	public static BoardDAO2 getInstance() {

		if (boardDAO2 == null) {
			boardDAO2 = new BoardDAO2();

		}

		return boardDAO2;
	}

	// 게시판 글의 갯수 구하기
	public int selectListCount(Map<String, Object> map) {

		int listCount = 0;

		String query = " select count(*) from multi_board where board_id = ?  and del_yn = 'N' ";
		if (map.get("searchWord") != null) {
			query += " and " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
		}

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("boardId").toString());
			rs = psmt.executeQuery();
			if (rs.next()) {

				listCount = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getListCount 에러 : " + ex);
		} finally {
			close();
		}

		return listCount;

	}

	public ArrayList<BoardDTO> selectArticleList(Map<String, Object> map) {

		ArrayList<BoardDTO> articleList = new ArrayList<BoardDTO>();

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
				dto.setMemberNo(rs.getString("member_no"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setRegiDate(rs.getString("regi_date"));
				dto.setCommentCount(rs.getInt("commentCount"));

				articleList.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("쿼리 에러 발생");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("기타 여러가지 오류 발생");
		} finally {
			close();
		}

		return articleList;

	}

}
