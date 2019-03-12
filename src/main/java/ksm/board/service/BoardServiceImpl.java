package ksm.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ksm.board.dao.BoardDAO;

@Service("boardSerivce")
public class BoardServiceImpl implements BoardService{

	@Resource(name="boardDAO")
	private BoardDAO boardDAO;

	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("맵에 넣은 값"+map.get("status"));
		return boardDAO.selectBoardList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectBoardSearchList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardSearchList(map);
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		updateHitCnt(map);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = boardDAO.selectBoardDetail(map);
		
		
		resultMap.put("map", tempMap);
		
		return resultMap;
	}

	@Override
	public void updateHitCnt(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.updateHitCnt(map);
	}

	@Override
	public void insertQnA(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		// content translate
		String content2 = (String)map.get("BOARD_CONTENT");
		String content = content2.replaceAll("\r\n", "<br>");
		map.put("BOARD_CONTENT", content);
		boardDAO.insertQnA(map);
	}

	@Override
	public void updateQnA(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		// content translate
		String content2 = (String)map.get("BOARD_CONTENT");
		String content = content2.replaceAll("\r\n", "<br>");
		map.put("BOARD_CONTENT", content);
		boardDAO.updateQnA(map);
	}
	
	

}
