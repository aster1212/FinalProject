package ksm.order.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import ksm.common.common.CommandMap;




public interface CartlistService {
	
	public void insertCartlist(Map<String, Object> map ) throws Exception;
	
	public void insertCartlist2(CommandMap map, HttpServletRequest request) throws Exception;
	
	// 비회원 카트리스트
	public Map<String, Object> sessionCartList(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectCartlist(Map<String, Object> map) throws Exception;
	
	public void deleteOneCartlist(Map<String, Object> map) throws Exception;
	
	public void deleteAllCartlist(Map<String, Object> map) throws Exception;
	
	public void deleteSelectCartlist(Map<String, Object> map) throws Exception;
	
	public void countUp(Map<String, Object> map);
	
	public void countDown(Map<String, Object> map);

	public void countChange(Map<String, Object> map);
	
	public Map<String, Object> checkedCartList(Map<String, Object> map) throws Exception;

	public void deleteCartlistByNo(Map<String, Object> map) throws Exception;
	
}
