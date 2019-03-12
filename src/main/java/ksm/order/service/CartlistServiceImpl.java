package ksm.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import ksm.common.common.CommandMap;
import ksm.order.dao.CartlistDAO;

import ksm.common.utils.ItemInsertCart;



@Service("cartService")
public class CartlistServiceImpl implements CartlistService {
	
	@Resource(name = "cartlistDAO")
	private CartlistDAO  cartlistDAO;

	
	@Override
	public void insertCartlist(Map<String, Object> map) throws Exception {
		cartlistDAO.insertCartlist(map);
		
	}

	@Override
	public List<Map<String, Object>> selectCartlist(Map<String, Object> map) throws Exception {
		System.out.println(map);
		return cartlistDAO.selectCartlist(map);
	}
	
	public Map<String, Object> sessionCartList(Map<String, Object> map) throws Exception {
		return cartlistDAO.sessionCartList(map);
	}

	@Override
	public void deleteOneCartlist(Map<String, Object> map) throws Exception {
		cartlistDAO.deleteOneCartlist(map);
		
	}

	@Override
	public void deleteAllCartlist(Map<String, Object> map) throws Exception {
		cartlistDAO.deleteAllCartlist(map);
		
	}
	
	
	@Override
	public void deleteSelectCartlist(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		cartlistDAO.deleteSelectCartlist(map);
	}

	@Override
	public void countUp(Map<String, Object> map) {
		cartlistDAO.countUp(map);
		
	}

	@Override
	public void countDown(Map<String, Object> map) {
		cartlistDAO.countDown(map);
		
	}

	@Override
	public void countChange(Map<String, Object> map) {
		cartlistDAO.countChange(map);
		
	}

	@Override
	public void insertCartlist2(CommandMap map, HttpServletRequest request) throws Exception {
		Map<String , Object> maps=new HashMap<String, Object>();
		List<Map<String, Object>> addCartList = new ArrayList<Map<String, Object>>();
		addCartList=ItemInsertCart.parseInsertAttribute2(map, request);
		String[] size=(String[]) map.getList("ITEM_NO").get(0);
		for(int i=0;i<size.length;i++) {
			
			System.out.println(i+"��°:"+addCartList.get(i));
			cartlistDAO.insertCartlist(addCartList.get(i));
		}
	}

	@Override
	public Map<String, Object> checkedCartList(Map<String, Object> map) throws Exception {
		return cartlistDAO.checkedCartList(map);
	}

	@Override
	public void deleteCartlistByNo(Map<String, Object> map) throws Exception {
		cartlistDAO.deleteCartlistByNo(map);
	}
	

	


	
	
	
	
	
	

}
