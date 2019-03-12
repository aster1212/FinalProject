package ksm.order.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;




public interface WishlistService {
	
	public void insertWishlist(Map<String, Object> map ) throws Exception;
	
	public List<Map<String, Object>> selectWish(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectWishlist(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectWishlist2(Map<String, Object> map) throws Exception;
	
	public void deleteOneWishlist(Map<String, Object> map) throws Exception;
	
	public void deleteAllWishlist(Map<String, Object> map) throws Exception;
	

}
