package ksm.admin.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ksm.common.utils.FileUtils;
import ksm.admin.dao.AdminNEQDAO;

@Service("adminNEQService")
public class AdminNEQServiceImpl implements AdminNEQService{
	
	@Resource(name="adminNEQDAO")
	private AdminNEQDAO adminNEQDAO;

	// �� ����
	@Override
	public void insertNEBoard(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		String content2 = (String)map.get("BOARD_CONTENT");
		String content = content2.replaceAll("\r\n", "<br>");
		map.put("BOARD_CONTENT", content);
		adminNEQDAO.insertNEBoard(map);
	}

	@Override
	public void updateNEBoard(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		String content2 = (String)map.get("BOARD_CONTENT");
		String content = content2.replaceAll("\r\n", "<br>");
		map.put("BOARD_CONTENT", content);
		adminNEQDAO.updateNEBoard(map);
	}

	@Override
	public void deleteNEBoard(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminNEQDAO.deleteNEBoard(map);
	}

	@Override
	public Map<String, Object> selectBoardOne(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = adminNEQDAO.selectBoardOne(map);
		
		resultMap.put("map", tempMap);
		
		return resultMap;
	}

	@Override
	public void insertQnABoard(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminNEQDAO.increaseReStep(map);
		int intLevel = (Integer.parseInt((String)map.get("BOARD_RE_LEVEL"))+1);
		map.put("BOARD_RE_LEVEL", intLevel);
		
		// content translate
		String content2 = (String)map.get("BOARD_CONTENT");
		String content = content2.replaceAll("\r\n", "<br>");
		map.put("BOARD_CONTENT", content);
		
		adminNEQDAO.insertQnAReply(map);
	}

	@Override
	public void deleteQnaBoard(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resMap = adminNEQDAO.selectBoardOne(map);
		adminNEQDAO.deleteQnaBoardTails(resMap);
		adminNEQDAO.deleteNEBoard(map);
	}

}
