package ksm.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ksm.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("board.selectBoardList",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardSearchList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("board.selectBoardSearchList",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("board.selectBoardDetail", map);
	}
	
	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("board.updateHitCnt", map);
	}
	
	public void insertQnA(Map<String, Object> map) throws Exception{
		insert("board.insertQnA", map);
	}
	
	public void updateQnA(Map<String, Object> map ) throws Exception{
		update("board.updateQnA", map);
	}
}
