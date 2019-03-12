package ksm.order.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import ksm.order.dao.OrderDAO;

import javax.servlet.http.HttpServletRequest;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="orderDAO")
	private OrderDAO orderDAO;
	
	@Override
	public Map<String, Object> orderDetail(Map<String, Object> map) throws Exception {
		return orderDAO.orderDetail(map);
	}

	@Override
	public List<Map<String, Object>> orderDetail2(Map<String, Object> map) throws Exception {
		return orderDAO.orderDetail2(map);
		
	}
	
	@Override
	public void exchange(Map<String, Object> map) throws Exception {
		orderDAO.exchange(map);
	}
	
	@Override
	public void refund(Map<String, Object> map) throws Exception {
		orderDAO.refund(map);
	}

	@Override
	public void updateDetail(Map<String, Object> map) throws Exception {
		orderDAO.updateDetail(map);
		
	}
	@Override
	public void insertOrder(Map<String, Object> map) throws Exception {
		orderDAO.insertOrder(map);
		
	}

	@Override
	public void insertOrderDetail(Map<String, Object> map) throws Exception {
		orderDAO.insertOrderDetail(map);
		
	}

	@Override
	public Map<String, Object> selectOrderNo(Map<String, Object> map) throws Exception {
		return orderDAO.selectOrderNo(map);
	}

	@Override
	public List<Map<String, Object>> selectCoupon(Map<String, Object> map) throws Exception {
		return orderDAO.selectCoupon(map);
	}


}
