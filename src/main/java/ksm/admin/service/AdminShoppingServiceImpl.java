package ksm.admin.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import ksm.admin.dao.AdminShoppingDAO;
import ksm.common.utils.FileUtils;

@Service("adminShoppingService")
public class AdminShoppingServiceImpl implements AdminShoppingService{
	
	@Resource(name="adminShoppingDAO")
	AdminShoppingDAO adminShoppingDAO;
	
	@Resource(name="fileUtils")
	FileUtils fileUtils;

	@Override
	public List<Map<String, Object>> selectItemList() throws Exception {
		// TODO Auto-generated method stub
		return adminShoppingDAO.adminItemList();
	}

	@Override
	public List<Map<String, Object>> selectItemSearchList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminShoppingDAO.adminItemSearchList(map);
	}

	@Override
	public void insertItem(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String,Object>();
		
		// 손 댈게 없는 코드는 그냥 넣는다.
		paramMap.put("ITEM_STOCK", Integer.parseInt((String)map.get("ITEM_STOCK")));
		paramMap.put("ITEM_NAME", map.get("ITEM_NAME"));
		paramMap.put("ITEM_PRICE", Integer.parseInt((String)map.get("ITEM_PRICE")));
		
		/*paramMap.put("ITEM_NO", (String)map.get("codeFrag1")+map.get("codeFrag2")+seqMap.get("NUM"));*/
		paramMap.put("ITEM_GENDER", map.get("ITEM_GENDER"));
		paramMap.put("ITEM_TYPE", map.get("ITEM_TYPE"));
		
		// 조합해야 하는 코드는 메소드를 거쳐서 넣는다.
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		paramMap.put("ITEM_DATE", sf.parse((String)map.get("ITEM_DATE")));
		
		if(map.get("sizeArray") instanceof String[])
			paramMap.put("ITEM_SIZE", arrayBind((String[])map.get("sizeArray")));
		else
			paramMap.put("ITEM_SIZE", (String)map.get("sizeArray"));
		
		if(map.get("optionArray") instanceof String[])
			paramMap.put("ITEM_OPTION", arrayBind((String[])map.get("optionArray")));
		else 
			paramMap.put("ITEM_OPTION", map.get("optionArray"));
		
		if(map.get("itemNameArray") instanceof String[])
			paramMap.put("ITEM_COLOR", arrayBind((String[])map.get("itemNameArray"),(String[])map.get("itemColorArray")));
		else 
			paramMap.put("ITEM_COLOR", (String)map.get("itemNameArray")+"="+map.get("itemColorArray"));
		
		// 파일 처리
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		try {
			list = fileUtils.parseInsertFileInfo(map, request);
			for (Map<String, Object> eachMap : list) {
				if(eachMap.get("fileName").equals("file1"))
					paramMap.put("ITEM_SHORTPATH", eachMap.get("STORED_FILE_NAME"));
				else if(eachMap.get("fileName").equals("file2"))
					paramMap.put("ITEM_IMAGEPATH", eachMap.get("STORED_FILE_NAME"));
			}
		}catch(StringIndexOutOfBoundsException e){
			System.out.println("파일 없음");
			paramMap.put("ITEM_SHORTPATH", "NONE");
			paramMap.put("ITEM_IMAGEPATH", "NONE");
		}finally {
			if(paramMap.get("ITEM_SHORTPATH")==null || paramMap.get("ITEM_SHORTPATH").equals(""))
				paramMap.put("ITEM_SHORTPATH", "NONE");
			if(paramMap.get("ITEM_IMAGEPATH")==null || paramMap.get("ITEM_IMAGEPATH").equals(""))
				paramMap.put("ITEM_IMAGEPATH", "NONE");
		}
		
		// add ITEM SET
		paramMap.put("ITEM_SET", map.get("ITEM_SET"));
		
		// 보내기
		adminShoppingDAO.adminItemInsert(paramMap);
	}
	
	@Override
	public Map<String, Object> selectItemOne(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminShoppingDAO.selectItemOne(map);
	}

	@Override
	public Map<String, Object> selectForModify(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> tempMap = selectItemOne(map);

		Date resDate = (Date)tempMap.get("ITEM_DATE");
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String ITEM_DATE = sf.format(resDate);
		tempMap.put("ITEM_DATE", ITEM_DATE);
		
		// 사이즈 나눠서 넣기
		StringTokenizer st = new StringTokenizer((String)tempMap.get("ITEM_SIZE"), ",");
		boolean[] size = new boolean[25];
		while(st.hasMoreTokens()) {
			String nextStr = st.nextToken();
			/*
			 *  불리안 사이즈 배열 
			 *  하의용 0~9   10개     25~34  단위 1
			 *  상의용 10~16  7개   080~110 단위 5
			 *  신발용 17~24  8개   250~285 단위 5
			 *  총 합 크기 25
			 * */
			String str = (String)tempMap.get("ITEM_TYPE");
			for(int i = 25,j = 0; i <=285 ; j++) {
				if(str.equals("AC")) {
					break;
				}
				if(i == Integer.parseInt(nextStr)) {
					size[j] = true;
				}
				
				if(i >= 25 && i < 35) {
					i++;
				}else if(i == 35) {
					i = 80;
				}else if(i >= 80 && i <= 285) {
					i+=5;
					if(i == 110) {
						i = 250;
					}
					if(i == 285) {
						break;
					}
				}
			}
		}
		tempMap.put("sizeArray", size);
		
		// 옵션 나눠서 넣기
		st = new StringTokenizer((String)tempMap.get("ITEM_OPTION"), ",");
		size = new boolean[3];
		while(st.hasMoreTokens()) {
			String nextStr = st.nextToken();
			if(nextStr.equals("S"))
				size[0] = true;
			else if(nextStr.equals("D"))
				size[1] = true;
			else if(nextStr.equals("C"))
				size[2] = true;
		}
		
		tempMap.put("optionArray", size);
		
		// 색상 숫자 구하기
		List<Map<String,String>> colorList = colorList((String)tempMap.get("ITEM_COLOR"));
		tempMap.put("colorList", colorList);
				
		return tempMap;
	}

	@Override
	public void modifyItem(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String,Object>();
		
		paramMap.put("ITEM_NAME", map.get("ITEM_NAME"));
		paramMap.put("ITEM_PRICE", Integer.parseInt((String)map.get("ITEM_PRICE")));
		
		/*paramMap.put("ITEM_NO", (String)map.get("codeFrag1")+map.get("codeFrag2")+seqMap.get("NUM"));*/
		paramMap.put("ITEM_GENDER", map.get("ITEM_GENDER"));
		paramMap.put("ITEM_TYPE", map.get("ITEM_TYPE"));
		
		// 조합해야 하는 코드는 메소드를 거쳐서 넣는다.
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		paramMap.put("ITEM_DATE", sf.parse((String)map.get("ITEM_DATE")));
		
		if(map.get("sizeArray") instanceof String[])
			paramMap.put("ITEM_SIZE", arrayBind((String[])map.get("sizeArray")));
		else
			paramMap.put("ITEM_SIZE", (String)map.get("sizeArray"));
		
		if(map.get("optionArray") instanceof String[])
			paramMap.put("ITEM_OPTION", arrayBind((String[])map.get("optionArray")));
		else 
			paramMap.put("ITEM_OPTION", map.get("optionArray"));
		
		if(map.get("itemNameArray") instanceof String[])
			paramMap.put("ITEM_COLOR", arrayBind((String[])map.get("itemNameArray"),(String[])map.get("itemColorArray")));
		else 
			paramMap.put("ITEM_COLOR", (String)map.get("itemNameArray")+"="+map.get("itemColorArray"));
		
		paramMap.put("ITEM_NO", map.get("ITEM_NO"));
		
		// 세트추가
		paramMap.put("ITEM_SET", map.get("ITEM_SET"));
		
		
		adminShoppingDAO.modifyItem(paramMap);
		
		// 파일처리
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		try {
			list = fileUtils.parseInsertFileInfo(map, request);
			for (int i=0; i<list.size();i++) {
				Map<String,Object> eachMap = list.get(i);
				if(eachMap.get("fileName").equals("file1")) {
					paramMap.put("ITEM_SHORTPATH", eachMap.get("STORED_FILE_NAME"));
					adminShoppingDAO.itemShortPathUpdate(paramMap);
				}
				else if(eachMap.get("fileName").equals("file2")) {
					paramMap.put("ITEM_IMAGEPATH", eachMap.get("STORED_FILE_NAME"));
					adminShoppingDAO.itemImagePathUpdate(paramMap);
				}
			}
		}catch(StringIndexOutOfBoundsException e) {
			System.out.println("파일 없음");
		}
	}

	@Override
	public void deleteItem(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminShoppingDAO.deleteItem(map);
	}
	
	@Override
	public List<Map<String, Object>> selectCommentList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminShoppingDAO.selectCommentList(map);
	}
	@Override
	public List<Map<String, Object>> selectCommentSearchList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return adminShoppingDAO.selectCommentSearchList(map);
	}
	

	@Override
	public Map<String, Object> selectCommentOne(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminShoppingDAO.selectCommentOne(map);
	}

	@Override
	public void insertItemComment(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminShoppingDAO.increaseCommentStep(map);
		
		// level 증가
		int level = Integer.parseInt((String)map.get("parent_re_level"));
		level += 1;
		map.put("COM_RE_LEVEL", level);
		
		adminShoppingDAO.insertCommentReply(map);
	}
	

	@Override
	public void modifyItemComment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		adminShoppingDAO.modifyItemComment(map);
	}

	@Override
	public void deleteItemComment(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		adminShoppingDAO.deleteItemComment(map);
	}

	@Override
	public String arrayBind(String[] array) {
		String resStr = null;
		
		for (int i = 0; i < array.length; i++) {
			if(i == 0)
				resStr = array[i];
			else
				resStr += ","+array[i];
		}
		return resStr;
	}
	
	// 색상용 함수
	public String arrayBind(String[] name, String[] code) {
		String resStr = null;
		
		for (int i = 0; i < name.length; i++) {
			if(i == 0)
				resStr = name[i]+"="+code[i];
			else
				resStr += ","+ name[i]+"="+code[i] ;
		}
		return resStr;
	}
	
	// 색상 분해 함수
	public List<Map<String, String>> colorList(String item_color){
		List<Map<String,String>> colorList = new ArrayList<Map<String,String>>();
		StringTokenizer st = new StringTokenizer((String)item_color, ",");
		
		while(st.hasMoreTokens()) {
			String nextStr = st.nextToken();
			Map<String,String> colorMap = new HashMap<String, String>();
			StringTokenizer secSt = new StringTokenizer(nextStr, "=");
			colorMap.put("name", secSt.nextToken());
			colorMap.put("code", secSt.nextToken());
			colorList.add(colorMap);
		}
		
		return colorList;
	}

}
