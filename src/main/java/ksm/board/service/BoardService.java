package ksm.board.service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectBoardSearchList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;
	
	void updateHitCnt(Map<String, Object> map) throws Exception;
	
	void insertQnA(Map<String, Object> map) throws Exception;
	
	void updateQnA(Map<String, Object> map) throws Exception;
}
