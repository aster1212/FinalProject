package ksm.order.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import ksm.order.dao.WishlistDAO;

@Service("wishService")
public class WistlistServiceImpl implements WishlistService {
	
	@Resource(name = "wishlistDAO")
	private WishlistDAO  wishlistDAO;

	@Override
	public void insertWishlist(Map<String, Object> map) throws Exception {
		
		wishlistDAO.insertWishlist(map);
		
	}
	
	@Override
	public List<Map<String, Object>> selectWish(Map<String, Object> map) throws Exception{
		return wishlistDAO.selectWish(map);
	}
	

	@Override
	public List<Map<String, Object>> selectWishlist(Map<String, Object> map) throws Exception {
		return wishlistDAO.selectWishlist(map);
	}
	
	@Override
	public List<Map<String, Object>> selectWishlist2(Map<String, Object> map) throws Exception {
		return wishlistDAO.selectWishlist2(map);
	}

	@Override
	public void deleteOneWishlist(Map<String, Object> map) throws Exception {
		 wishlistDAO.deleteOneWishlist(map);
		
	}

	@Override
	public void deleteAllWishlist(Map<String, Object> map) throws Exception {
		wishlistDAO.deleteAllWishlist(map);
		
	}
	
	
	
	
	
	

}
