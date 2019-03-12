package ksm.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ksm.common.dao.AbstractDAO;

@Repository("cartlistDAO")
public class CartlistDAO extends AbstractDAO{
	
	
	//장바구니 목록 추가
	public void insertCartlist(Map<String, Object> map) throws Exception {
		insert("cart.insertCartlist", map);
		
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> sessionCartList(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("cart.sessionCartList", map);
	}
	
	
	//장바구니 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCartlist(Map<String, Object> map) throws Exception {
		return selectList("cart.selectCartlist", map);
		
	}
	
	
	//장바구니 하나 삭제
	public void deleteOneCartlist(Map<String, Object> map) throws Exception {
		delete("cart.deleteOneCartlist", map);
	}
	
	//장바구니 전체삭제
	public void deleteAllCartlist(Map<String, Object> map) throws Exception {
		delete("cart.deleteAllCartlist", map);
	}
	
	//선택한거 삭제
	public void deleteSelectCartlist(Map<String, Object> map) throws Exception {
		delete("cart.deleteSelectCartlist", map);
	}
	
	//수량올리기
	public void countUp(Map<String, Object> map) {
		update("cart.updateCountUp", map);
	}
	
	//수량내리기
	public void countDown(Map<String, Object> map) {
		update("cart.updateCountDown", map);
	}
	
	//수량바뀐거업데이트
	public void countChange(Map<String, Object> map) {
		update("cart.updateCountChange", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> checkedCartList(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("cart.selectCheckedCartList", map);
	}
	
	public void deleteCartlistByNo(Map<String, Object> map) throws Exception {
		delete("cart.deleteCartlistByNo", map);
	}

}








