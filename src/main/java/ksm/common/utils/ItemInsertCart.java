package ksm.common.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import ksm.common.common.CommandMap;

//@Component ������̼��� �̿��Ͽ� �� ��ü�� ������ �������� ����ϵ��� �� ��ȹ�̴�.
@Component("CartUtils")
public class ItemInsertCart {
	
	//��ǰ ��ϼ���
	@SuppressWarnings("unchecked")
	public static List<Map<String, Object>> parseInsertAttribute2(CommandMap commandMap, HttpServletRequest request)
			throws Exception {
			
		List<Map<String, Object>> addCartList = new ArrayList<Map<String, Object>>();
			
		List<String> ItemList=new ArrayList<String>();
		List<String> CountList=new ArrayList<String>();
		
		String[] item_no=(String[]) commandMap.getList("item_no[]").get(0);
		String[] ea=(String[]) commandMap.getList("ea[]").get(0);
		
		for(int i=0;i<item_no.length;i++) {
			ItemList.add(item_no[i]);
			CountList.add(ea[i]);
		}
		
		
			
		for(int i=0;i<ItemList.size();i++) {
			Map<String, Object> listMap = new HashMap<String, Object>();
				
			listMap.put("CART_NO",		commandMap.get("CART_NO"));
			listMap.put("CART_COUNT",	CountList.get(i));
			listMap.put("ITEM_NO", ItemList.get(i));
			listMap.put("MEMBER_ID", 	request.getSession().getAttribute("idSession"));
			System.out.println(i +"��° �� ���,:"+listMap);
			
			addCartList.add(listMap);
		}

		return addCartList;
	}

}
