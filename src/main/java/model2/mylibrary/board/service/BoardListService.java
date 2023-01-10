package model2.mylibrary.board.service;

import static common.DBConnPool.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;

import model2.mylibrary.board.dao.BoardDAO2;
import model2.mylibrary.board.vo.BoardDTO;

public class BoardListService {

	public int getListCount(Map<String,Object> map) throws Exception{
		System.out.println("BoardListService.getListCount 호출");
		int totalCount = 0;

		Connection con = getConnection();
		BoardDAO2 boardDAO2 = BoardDAO2.getInstance();
		boardDAO2.setConnection(con);
		totalCount = boardDAO2.selectListCount(map);
		
		//boardDAO2.close();
		
		return totalCount;
		
	}

	public ArrayList<BoardDTO> getArticleList(Map<String,Object> map) throws Exception{
		System.out.println("BoardListService.getArticleList 호출");
		ArrayList<BoardDTO> articleList = null;
		Connection con = getConnection();
		BoardDAO2 boardDAO2 = BoardDAO2.getInstance();
		boardDAO2.setConnection(con);
		System.out.println("============map 객체 내용 확인하기=========================");
		
		Set<String> keySet = map.keySet();
        for (String key : keySet) {
            System.out.println(key + " : " + map.get(key));
        }
		System.out.println("=====================             ================");
		
		articleList = boardDAO2.selectArticleList(map);
		
		
		
		//boardDAO2.close();
		
		return articleList;
		
	}

	
	
	
}
