package ksm.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ksm.common.common.CommandMap;
import ksm.common.utils.PagingUtils;
import ksm.admin.service.AdminShoppingService;

@Controller
public class AdminShoppingController {

	@Resource(name="adminShoppingService")
	AdminShoppingService adminShoppingService;
	
	@Resource(name="pagingUtils")
	PagingUtils pagingUtils;
	
	@RequestMapping("/admin/itemList")
	public ModelAndView adminItemList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("adminItemList.admin");
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
		// if search keyword is exist
		if(searchBool(commandMap.getMap()))
			list = adminShoppingService.selectItemList();
		else 
			list = adminShoppingService.selectItemSearchList(commandMap.getMap());
		
		// paging
		List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
		resList = pagingUtils.cutList(request, list,9,5);
		String paging = pagingUtils.getHtmlStr(request, list,9,5,"admin/itemList");
		mav.addObject("List",resList);
		mav.addObject("paging",paging);
		mav.addObject("nowPage",pagingUtils.getNowPage());
		
		mav.addObject("searchStr",commandMap.get("searchStr"));
		
		//title
		mav.addObject("title","이것은 타이틀");
		
		return mav;
	}
	
	@RequestMapping("/admin/itemWriteForm")
	public String adminItemWriteForm() {
		return "adminItemWriteForm.admin";
	}
	
	@RequestMapping("/admin/itemWrite")
	public String adminItemWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		adminShoppingService.insertItem(commandMap.getMap(),request);
		
		return "redirect:itemList";
	}
	
	@RequestMapping(value="/admin/itemModifyForm")
	public ModelAndView adminItemModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mav = new ModelAndView("adminItemWriteForm.admin");
		
		Map<String,Object> map = adminShoppingService.selectForModify(commandMap.getMap());
		
		mav.addObject("old",map);
		return mav;
	}
	
	@RequestMapping(value="/admin/itemModify")
	public ModelAndView adminItemModify(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:itemList");
		
		adminShoppingService.modifyItem(commandMap.getMap(),request);
		
		return mav;
	}
	
	@RequestMapping(value="/admin/itemDelete")
	public String adminItemDelete(CommandMap commandMap) throws Exception{
		
		adminShoppingService.deleteItem(commandMap.getMap());
		
		return "redirect:itemList";
	}
	
	@RequestMapping(value="/admin/itemCommentList")
	public ModelAndView adminItemQnaList(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mav = new ModelAndView("adminItemCommentList.admin");
		List<Map<String, Object>> qnaList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> commentList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> photoList = new ArrayList<Map<String, Object>>();
		
		
		
		// qna
		commandMap.put("COM_CATEGORY", 1);
		qnaList = adminShoppingService.selectCommentList(commandMap.getMap());
		
		List<Map<String,Object>> qnaList2 = new ArrayList<Map<String, Object>>();
		qnaList2 = pagingUtils.cutList(request, qnaList);
		String qnaListStr = pagingUtils.getHtmlStr(request, qnaList, "/admin/itemCommentList");
		mav.addObject("qna",qnaList2);
		mav.addObject("qnaPage", qnaListStr);
		
		// comment
		commandMap.put("COM_CATEGORY", 2);
		commentList = adminShoppingService.selectCommentList(commandMap.getMap());
		
		List<Map<String,Object>> commentList2 = new ArrayList<Map<String, Object>>();
		commentList2 = pagingUtils.cutList(request, commentList);
		String comListStr = pagingUtils.getHtmlStr(request, commentList, "/admin/itemCommentList");
		mav.addObject("comment",commentList2);
		mav.addObject("comPage", comListStr);
		
		// photo
		commandMap.put("COM_CATEGORY", 3);
		photoList = adminShoppingService.selectCommentList(commandMap.getMap());
		
		List<Map<String, Object>> photoList2 = new ArrayList<Map<String, Object>>();
		photoList2 = pagingUtils.cutList(request, photoList);
		String phoListStr = pagingUtils.getHtmlStr(request, photoList, "/admin/itemCommentList");
		mav.addObject("photo",photoList2);
		mav.addObject("phoPage", phoListStr);
		
		// 검색
		if(!searchBool(commandMap.getMap())) {
			List<Map<String,Object>> searchList = new ArrayList<Map<String, Object>>();
			
			commandMap.put("COM_CATEGORY", 1);
			searchList = adminShoppingService.selectCommentSearchList(commandMap.getMap());
			mav.addObject("qnaSearch", searchList);
			
			commandMap.put("COM_CATEGORY", 2);
			searchList = adminShoppingService.selectCommentSearchList(commandMap.getMap());
			mav.addObject("commentSearch", searchList);
			
			commandMap.put("COM_CATEGORY", 3);
			searchList = adminShoppingService.selectCommentSearchList(commandMap.getMap());
			mav.addObject("photoSearch", searchList);
			
			mav.addObject("COM_CATEGORY",4);
			mav.addObject("searchStr",commandMap.get("searchStr"));
		}else {
			mav.addObject("COM_CATEGORY",1);
		}
		
		return mav;
	}
	
	@RequestMapping(value="/admin/itemCommentWriteForm")
	public ModelAndView itemCommentWriteForm(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("adminItemCommentWriteForm.admin");
		Map<String,Object> parentMap = adminShoppingService.selectCommentOne(commandMap.getMap());
		
		mav.addObject("parent",parentMap);
		return mav;
	}
	
	@RequestMapping(value="/admin/itemCommentWrite")
	public String itemCommentWrite(CommandMap commandMap) throws Exception {
		
		adminShoppingService.insertItemComment(commandMap.getMap());
		
		return "redirect:itemCommentList";
	}
	
	@RequestMapping(value="/admin/itemCommentModifyForm")
	public ModelAndView itemCommentModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mav = new ModelAndView("adminItemCommentWriteForm.admin");
		Map<String, Object> map = adminShoppingService.selectCommentOne(commandMap.getMap());
		mav.addObject("old", map);
		return mav;
	}
	
	@RequestMapping(value="/admin/itemCommentModify")
	public String itemCommentModify(CommandMap commandMap) throws Exception{
		adminShoppingService.modifyItemComment(commandMap.getMap());
		return "redirect:itemCommentList";
	}
	
	@RequestMapping(value="/admin/itemCommentDelete")
	public ModelAndView itemCommentDelete(CommandMap commandMap) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:itemCommentList");
		
		adminShoppingService.deleteItemComment(commandMap.getMap());
		
		return mav;
	}
	
	
	
	// metrial
	private boolean searchBool(Map<String, Object> map) {
		String result = (String)map.get("searchStr");
		return result==null || result.isEmpty() || result.equals("");
	}
}
