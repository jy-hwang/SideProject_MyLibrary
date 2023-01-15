package model2.mylibrary.cmmn.vo;

import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnPool;
import model1.mylibrary.book.BookDTO;

public class CmmnDAO extends DBConnPool{

	public CmmnDAO() {
		super();
	}
	
	public CmmnDTO selectCodeOne(String cmmnCode) {
		CmmnDTO dto = new CmmnDTO();
		
		String query = " SELECT cmmn_code, cmmn_name,parent_code,use_yn,description FROM cmmn WHERE cmmn_code = '' ";

		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();

			if (rs.next()) {

				dto.setCmmnCode(rs.getString("cmmn_code"));
				dto.setCmmnName(rs.getString("cmmn_name"));
				dto.setParentCode(rs.getString("parent_code"));
				dto.setDesc(rs.getString("description"));
				dto.setUseYn(rs.getString("use_yn"));

			}

		} catch (SQLException e) {
			System.out.println("쿼리 실행 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
		
	}
	
	public ArrayList<CmmnDTO> selectParentCodeList(){
		ArrayList<CmmnDTO> parentCodeList = new ArrayList<CmmnDTO>();
		
		String query = " SELECT cmmn_code, cmmn_name,parent_code,use_yn FROM cmmn WHERE parent_code = '' ";

		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();

			while (rs.next()) {
				CmmnDTO dto = new CmmnDTO();

				dto.setCmmnCode(rs.getString("cmmn_code"));
				dto.setCmmnName(rs.getString("cmmn_name"));
				dto.setParentCode(rs.getString("parent_code"));
				dto.setUseYn(rs.getString("use_yn"));

				parentCodeList.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("쿼리 실행 중 예외 발생");
			e.printStackTrace();
		}
		
		return parentCodeList;
	}

	public ArrayList<CmmnDTO> selectChildCodeList(String parentCode){
		ArrayList<CmmnDTO> childCodeList = new ArrayList<CmmnDTO>();
		System.out.println("DAO - selectChildCodeList");
		String query = " SELECT cmmn_code, cmmn_name,parent_code,use_yn FROM cmmn WHERE parent_code = ? ";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, parentCode);
			System.out.println("query + parentCode" + query + parentCode);
			rs = psmt.executeQuery();
			System.out.println("rs.getFetchSize()"+rs.getFetchSize());
			while (rs.next()) {
				CmmnDTO dto = new CmmnDTO();

				dto.setCmmnCode(rs.getString("cmmn_code"));
				dto.setCmmnName(rs.getString("cmmn_name"));
				dto.setParentCode(rs.getString("parent_code"));
				dto.setUseYn(rs.getString("use_yn"));
				
				childCodeList.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("쿼리 실행 중 예외 발생");
			e.printStackTrace();
		}
		
		return childCodeList;
	}

	
}
