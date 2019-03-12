package ksm.item.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.log4j.Logger;
import org.springframework.stereotype.*;

import ksm.common.utils.FileUtils;
import ksm.item.dao.ShoppingDAO;

@Service("shoppingService")
public class ShoppingServiceImpl implements ShoppingService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "shoppingDAO")
	private ShoppingDAO shoppingDAO;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Override
	public List<Map<String, Object>> selectItemManList(Map<String, Object> map) throws Exception {
		return shoppingDAO.selectItemManList(map);
	}

	@Override
	public List<Map<String, Object>> selectItemWomanList(Map<String, Object> map) throws Exception {
		return shoppingDAO.selectItemWomanList(map);
	}
	@Override
	public List<Map<String, Object>> selectShoesList(Map<String, Object> map) throws Exception {
		return shoppingDAO.selectShoesList(map);
	}
	@Override
	public List<Map<String, Object>> selectAccList(Map<String, Object> map) throws Exception {
		return shoppingDAO.selectAccList(map);
	}
	
	
	@Override
	public List<Map<String, Object>> selectManUpList(Map<String, Object> map) throws Exception {
		return shoppingDAO.selectManUpList(map);
	}
	@Override
	public List<Map<String, Object>> selectManMidList(Map<String, Object> map) throws Exception {
		return shoppingDAO.selectManMidList(map);
	}
	@Override
	public List<Map<String, Object>> selectManDownList(Map<String, Object> map) throws Exception {
		return shoppingDAO.selectManDownList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectWomanUpList(Map<String, Object> map) throws Exception {
		return shoppingDAO.selectWomanUpList(map);
	}
	@Override
	public List<Map<String, Object>> selectWomanMidList(Map<String, Object> map) throws Exception {
		return shoppingDAO.selectWomanMidList(map);
	}
	@Override
	public List<Map<String, Object>> selectWomanDownList(Map<String, Object> map) throws Exception {
		return shoppingDAO.selectWomanDownList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectShoesManList(Map<String, Object> map) throws Exception {
		return shoppingDAO.selectShoesManList(map);
	}
	@Override
	public List<Map<String, Object>> selectShoesWomanList(Map<String, Object> map) throws Exception {
		return shoppingDAO.selectShoesWomanList(map);
	}
	
	
	@Override
	public Map<String, Object> selectItemDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resMap = shoppingDAO.selectItemDetail(map);
		// 색상 숫자 구하기
		List<Map<String, String>> colorList = colorList((String) resMap.get("ITEM_COLOR"));
		resMap.put("colorList", colorList);

		return resMap;
	}

	@Override
	public Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resMap = shoppingDAO.selectQnaDetail(map);

		return resMap;
	}

	@Override
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {
		return shoppingDAO.selectQnaList(map);
	}

	@Override
	public List<Map<String, Object>> selectCommentList(Map<String, Object> map) throws Exception {
		return shoppingDAO.selectCommentList(map);
	}

	@Override
	public List<Map<String, Object>> selectPhotoCommentList(Map<String, Object> map) throws Exception {
		return shoppingDAO.selectPhotoCommentList(map);
	}

	@Override
	public void itemQnaWrite(Map<String, Object> map) throws Exception {
		shoppingDAO.itemQnaWrite(map);
	}

	@Override
	public void itemCommentWrite(Map<String, Object> map) throws Exception {
		shoppingDAO.itemCommentWrite(map);
	}

	@Override
	public void itemPhotoCommentWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {

		List<Map<String, Object>> FileList = new ArrayList<Map<String, Object>>();
		FileList = fileUtils.parseInsertFileInfo(map, request);

		for (Map<String, Object> eachMap : FileList) {
			if (eachMap.get("fileName").equals("file")) {
				map.put("COM_FILE_ORI_NAME", eachMap.get("originalFileName"));
				map.put("COM_FILE_SAVE_NAME", eachMap.get("STORED_FILE_NAME"));
				break;
			}
		}

		String key = "";

		try {
			key = (String) map.get("COM_FILE_ORI_NAME");
		} catch (Exception e) {
			String str = "NONE";
			map.put("COM_FILE_ORI_NAME", str);
			map.put("COM_FILE_SAVE_NAME", str);
		}

		shoppingDAO.itemPhotoCommentWrite(map);
	}

	@Override
	public void deleteCommentDelete(Map<String, Object> map) throws Exception {
		shoppingDAO.deleteCommentDelete(map);
	}

	@Override
	public void deletePhotoDelete(Map<String, Object> map) throws Exception {
		shoppingDAO.deletePhotoDelete(map);
	}

	// 색상 분해 함수
	public List<Map<String, String>> colorList(String item_color) {
		List<Map<String, String>> colorList = new ArrayList<Map<String, String>>();
		StringTokenizer st = new StringTokenizer((String) item_color, ",");

		while (st.hasMoreTokens()) {
			String nextStr = st.nextToken();
			Map<String, String> colorMap = new HashMap<String, String>();
			StringTokenizer secSt = new StringTokenizer(nextStr, "=");
			colorMap.put("name", secSt.nextToken());
			colorMap.put("code", secSt.nextToken());
			colorList.add(colorMap);
		}

		return colorList;
	}

	@Override
	public boolean updateQna(Map<String, Object> map) throws Exception {
		Map<String, Object> dbPasswd = shoppingDAO.getCommentPasswd(map); // sql com no passwd
		boolean passChecker = false;
		if ((dbPasswd.get("COM_PASSWD")).equals((String) map.get("COM_PASSWD"))) {
			// 비밀번호가 같을 때
			shoppingDAO.updateQna(map); // required com no not passwd
			passChecker = true;
			return passChecker; // 1
		} else {
			// 비밀번호가 다를 때
			return passChecker; // 0
		}
		/* shoppingDAO.updateItemQna(map); */
	}
	@Override
	public List<Map<String, Object>> selectSearchItemList(Map<String, Object> map) throws Exception {
		return shoppingDAO.selectSearchItemList(map);
	}
	@Override
	public List<Map<String, Object>> selectSearchCombineList(Map<String, Object> map) throws Exception {
		return shoppingDAO.selectSearchCombineList(map);
	}
}