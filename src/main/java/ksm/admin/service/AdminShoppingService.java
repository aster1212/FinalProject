package ksm.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminShoppingService {

	List<Map<String, Object>> selectItemList() throws Exception;
	
	List<Map<String, Object>> selectItemSearchList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectCommentList(Map<String, Object> map) throws Exception;
	
	void insertItem(Map<String, Object> map ,HttpServletRequest request)throws Exception;
	
	void insertItemComment(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectItemOne(Map<String,Object> map) throws Exception;
	
	Map<String, Object> selectCommentOne(Map<String,Object> map) throws Exception;
	
	Map<String, Object> selectForModify(Map<String, Object> map) throws Exception;
	
	void modifyItem(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void deleteItem(Map<String, Object> map) throws Exception;
	
	void deleteItemComment(Map<String, Object> map) throws Exception;
	
	String arrayBind(String[] array);

	void modifyItemComment(Map<String, Object> map);

	List<Map<String, Object>> selectCommentSearchList(Map<String, Object> map);
}
