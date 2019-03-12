package ksm.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ksm.common.dao.AbstractDAO;

@Repository("wishlistDAO")
public class WishlistDAO extends AbstractDAO{
	
	
	//���� �߰�
	public void insertWishlist(Map<String, Object> map) throws Exception {
		insert("wish.insertWishlist", map);
		
	}
	
	
	//���� �ߺ� üũ
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectWish(Map<String, Object> map) throws Exception {
		return selectList("wish.selectWish", map);
	}
	
	
	//���� ��������
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectWishlist(Map<String, Object> map) throws Exception {
		return selectList("wish.selectWishlist", map);
		
	}
	
	//���� ��������
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectWishlist2(Map<String, Object> map) throws Exception {
		return selectList("wish.selectWishlist2", map);
		
	}
	
	//�� �ϳ� ����
	public void deleteOneWishlist(Map<String, Object> map) throws Exception {
		delete("wish.deleteOneWishlist", map);
	}
	
	//�� ��ü ����
	public void deleteAllWishlist(Map<String, Object> map) throws Exception {
		delete("wish.deleteAllWishlist", map);
	}
	
	
	
	
	

}








