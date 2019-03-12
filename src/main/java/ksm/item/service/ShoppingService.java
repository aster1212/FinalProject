package ksm.item.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ShoppingService {
	List<Map<String,Object>> selectItemManList(Map<String,Object>map) throws Exception;
	List<Map<String,Object>> selectItemWomanList(Map<String,Object>map) throws Exception;
	List<Map<String,Object>> selectShoesList(Map<String,Object>map) throws Exception;
	List<Map<String,Object>> selectAccList(Map<String,Object>map) throws Exception;
	
	List<Map<String,Object>> selectManUpList(Map<String,Object>map) throws Exception;
	List<Map<String,Object>> selectManMidList(Map<String,Object>map) throws Exception;
	List<Map<String,Object>> selectManDownList(Map<String,Object>map) throws Exception;
	List<Map<String,Object>> selectWomanUpList(Map<String,Object>map) throws Exception;
	List<Map<String,Object>> selectWomanMidList(Map<String,Object>map) throws Exception;
	List<Map<String,Object>> selectWomanDownList(Map<String,Object>map) throws Exception;
	List<Map<String,Object>> selectShoesManList(Map<String,Object>map) throws Exception;
	List<Map<String,Object>> selectShoesWomanList(Map<String,Object>map) throws Exception;
	
	
	Map<String,Object> selectItemDetail(Map<String,Object>map) throws Exception;	
	Map<String,Object> selectQnaDetail(Map<String,Object>map) throws Exception;	
	List<Map<String,Object>>selectQnaList(Map<String,Object> map)throws Exception ;
	
	List<Map<String,Object>>selectCommentList(Map<String,Object> map)throws Exception ;
	List<Map<String,Object>>selectPhotoCommentList(Map<String,Object> map)throws Exception ;
	
	void itemQnaWrite(Map<String,Object> map) throws Exception ;
	void itemCommentWrite(Map<String,Object> map) throws Exception ;

	boolean updateQna(Map<String,Object> map)throws Exception ;
	void itemPhotoCommentWrite(Map<String, Object> map, HttpServletRequest request ) throws Exception;
	void deleteCommentDelete(Map<String,Object> map) throws Exception;
	void deletePhotoDelete(Map<String,Object> map) throws Exception;
	
	List<Map<String,Object>> selectSearchItemList(Map<String,Object>map) throws Exception;
	List<Map<String,Object>> selectSearchCombineList(Map<String,Object>map) throws Exception;
	
	
}