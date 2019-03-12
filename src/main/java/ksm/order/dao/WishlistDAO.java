package ksm.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ksm.common.dao.AbstractDAO;

@Repository("wishlistDAO")
public class WishlistDAO extends AbstractDAO{
	
	
	//Âò¸ñ·Ï Ãß°¡
	public void insertWishlist(Map<String, Object> map) throws Exception {
		insert("wish.insertWishlist", map);
		
	}
	
	
	//Âò¸ñ·Ï Áßº¹ Ã¼Å©
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectWish(Map<String, Object> map) throws Exception {
		return selectList("wish.selectWish", map);
	}
	
	
	//Âò¸ñ·Ï °¡Á®¿À±â
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectWishlist(Map<String, Object> map) throws Exception {
		return selectList("wish.selectWishlist", map);
		
	}
	
	//Âò¸ñ·Ï °¡Á®¿À±â
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectWishlist2(Map<String, Object> map) throws Exception {
		return selectList("wish.selectWishlist2", map);
		
	}
	
	//Âò ÇÏ³ª »èÁ¦
	public void deleteOneWishlist(Map<String, Object> map) throws Exception {
		delete("wish.deleteOneWishlist", map);
	}
	
	//Âò ÀüÃ¼ »èÁ¦
	public void deleteAllWishlist(Map<String, Object> map) throws Exception {
		delete("wish.deleteAllWishlist", map);
	}
	
	
	
	
	

}








