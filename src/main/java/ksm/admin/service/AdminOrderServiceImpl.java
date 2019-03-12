package ksm.admin.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ksm.admin.dao.AdminOrderDAO;

import javax.servlet.http.HttpServletRequest;

//@Controller, @Service, @Component, @Repository 이 네가지는 자동으로 컴포넌트로 등록된다
//xml에서는 <context:component-scan base-package="first.common"> 을 이용해서 scan함	
@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService{
	Logger log = Logger.getLogger(this.getClass());
	
/*클래스를 사용할때 new를 사용하여 객체를 만드는것이 아니라,
  위에서 보는것과 같이 @Resource 어노테이션을 이용하여 객체의 선언만 해주면 된다.*/
	
	@Resource(name="adminOrderDAO")
	private AdminOrderDAO adminOrderDAO;
	
	
	@Override
	public List<Map<String, Object>> searchOrder(Map<String, Object> map) throws Exception {
		return adminOrderDAO.searchOrder(map);
	}
	
	@Override
	public List<Map<String, Object>> searchAll(Map<String, Object> map) throws Exception {
		return adminOrderDAO.searchAll(map);
	}
	
	@Override
	public List<Map<String, Object>> selectOrderList(Map<String, Object> map) throws Exception {
		return adminOrderDAO.selectOrderList(map);
		
	}
	
	//교환,환불,완료 리스트
	@Override
	public List<Map<String, Object>> processingList(Map<String, Object> map) throws Exception {
		return adminOrderDAO.processingList(map);
	}



	@Override
	public Map<String, Object> orderDetail(Map<String, Object> map) throws Exception {
		return adminOrderDAO.orderDetail(map);
	}

	@Override
	public List<Map<String, Object>> orderDetail2(Map<String, Object> map) throws Exception {
		return adminOrderDAO.orderDetail2(map);
		
	}
	
	@Override
	public void orderUpdate(Map<String, Object> map) throws Exception {
		adminOrderDAO.orderUpdate(map);
		
	}
	
	@Override
	public void orderUpdate2(Map<String, Object> map) throws Exception {
		adminOrderDAO.orderUpdate2(map);
		
	}


	@Override
	public void orderDelete(Map<String, Object> map) throws Exception {
		adminOrderDAO.orderDelete(map);
		
	}

	@Override
	public void orderDelete2(Map<String, Object> map) throws Exception {
		adminOrderDAO.orderDelete2(map);
		
	}
	
	//매출
	@Override
	public List<Map<String, Object>> salesPerMonth(Map<String, Object> map) throws Exception {
		return adminOrderDAO.salesPerMonth(map);
	}

	@Override
	public List<Map<String, Object>> hotItemListPeriod(Map<String, Object> map) throws Exception {
		return adminOrderDAO.hotItemListPeriod(map);
	}

	@Override
	public List<Map<String, Object>> hotItemList(Map<String, Object> map) throws Exception {
		return adminOrderDAO.hotItemList(map);
	}


















}