package ksm.admin.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminNEQService {
	
	void insertNEBoard(Map<String, Object> map) throws Exception;
	
	void updateNEBoard(Map<String, Object> map) throws Exception;
	
	void deleteNEBoard(Map<String, Object> map) throws Exception;
	
	void deleteQnaBoard(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectBoardOne(Map<String, Object> map) throws Exception;
	
	void insertQnABoard(Map<String, Object> map) throws Exception;

}
