package ksm.admin.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface AdminOrderService {
	//전체주문목록
	List<Map<String, Object>> selectOrderList(Map<String, Object> map) throws Exception;
	
	//교환,환불,완료 리스트
	List<Map<String, Object>> processingList(Map<String, Object> map) throws Exception;
	
	//전체검색
	List<Map<String, Object>> searchAll(Map<String, Object> map) throws Exception;
	
	//조건검색
	List<Map<String, Object>> searchOrder(Map<String, Object> map) throws Exception;

	Map<String, Object> orderDetail(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> orderDetail2(Map<String, Object> map) throws Exception;
	
	void orderUpdate(Map<String, Object> map) throws Exception;
	void orderUpdate2(Map<String, Object> map) throws Exception;
				
	void orderDelete(Map<String, Object> map) throws Exception;
	void orderDelete2(Map<String, Object> map) throws Exception;
	
	//연 매출
	List<Map<String, Object>> salesPerMonth(Map<String, Object> map) throws Exception;
	
	//인기아이템 목록
	List<Map<String, Object>> hotItemListPeriod(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> hotItemList(Map<String, Object> map) throws Exception;
}