package ksm.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ksm.common.dao.AbstractDAO;

	/*DAO는 단순히 DB에 접속하여 데이터를 조회하는 역할만 수행하는 클래스다. 
	따라서 DAO에서 2개 이상의 동작을 수행하면 안된다. */
	
	//sampleDAO라는 이름으로 bean 자동등록 - 퍼다쓰세요
@Repository("adminOrderDAO")
public class AdminOrderDAO extends AbstractDAO {
								
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOrderList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("adminOrder.selectOrderList", map);
	}
	
	//교환,환불,완료 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> processingList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("adminOrder.processingList", map);
	}
	
	//전체검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchAll(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("adminOrder.searchAll", map);
	}
	
		//조건검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchOrder(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("adminOrder.searchOrder", map);
	}
	
	public void orderUpdate(Map<String, Object> map) throws Exception{
		update("adminOrder.orderUpdate", map);
	}
	
	public void orderUpdate2(Map<String, Object> map) throws Exception{
		update("adminOrder.orderUpdate2", map);
	}
	
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> orderDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("adminOrder.orderDetail", map);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderDetail2(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("adminOrder.orderDetail2", map);
	}



	public void orderDelete(Map<String, Object> map) throws Exception{
		update("adminOrder.orderDelete", map);
	}

	public void orderDelete2(Map<String, Object> map) throws Exception{
		update("adminOrder.orderDelete2", map);
	}
	
	//월별 매출현황
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> salesPerMonth(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("adminOrder.salesPerMonth", map);
	}
	
	//여기부터 인기아이템 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> hotItemListPeriod(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("adminOrder.hotItemListPeriod", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> hotItemList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("adminOrder.hotItemList", map);
	}
}