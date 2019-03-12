package ksm.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ksm.common.dao.AbstractDAO;

@Repository("orderDAO")
public class OrderDAO extends AbstractDAO{
	
	public void exchange(Map<String, Object> map) throws Exception{
		update("order.exchange", map);
	}
	
	public void refund(Map<String, Object> map) throws Exception{
		update("order.refund", map);
	}
	
	public void updateDetail(Map<String, Object> map) throws Exception{
		update("order.updateDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> orderDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("order.orderDetail", map);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderDetail2(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("order.orderDetail2", map);
	}
	
		//orderList에 삽입
	@SuppressWarnings("unchecked")	
	public void insertOrder(Map<String, Object> map) throws Exception {
		insert("order.insertOrder", map);
		
	}
		//orderDetail에 삽입
	@SuppressWarnings("unchecked")
	public void insertOrderDetail(Map<String, Object> map) throws Exception {
		insert("order.insertOrderDetail", map);
	}
	
		//orderNo를 골라와!
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOrderNo(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("order.selectOrderNo", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCoupon(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("order.selectCoupon", map);
	}

}
