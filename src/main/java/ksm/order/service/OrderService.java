package ksm.order.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface OrderService {
	Map<String, Object> orderDetail(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> orderDetail2(Map<String, Object> map) throws Exception;
	
	void exchange(Map<String, Object> map) throws Exception;
	void refund(Map<String, Object> map) throws Exception;
	void updateDetail(Map<String, Object> map) throws Exception;
	
	void insertOrder(Map<String, Object> map) throws Exception;
	void insertOrderDetail(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectOrderNo(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectCoupon(Map<String, Object> map) throws Exception;
	
}
