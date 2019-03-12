package ksm.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ksm.board.service.BoardService;
import ksm.common.common.CommandMap;
import ksm.common.utils.PagingUtils;

@Controller
public class BoardController {
	
	@Resource(name="boardSerivce")
	private BoardService boardService;
	
	@Resource(name="pagingUtils")
	private PagingUtils pagingUtils;
	
	// notice
	// noc list
	@RequestMapping(value="/notice/list")
	public ModelAndView noticeList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("noticeList.board");
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		commandMap.put("status", 1);
		
		// if search keyword is exist
		if(searchBool(commandMap.getMap()))
			list = boardService.selectBoardList(commandMap.getMap());
		else 
			list = boardService.selectBoardSearchList(commandMap.getMap());
		
		// paging
		List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
		resList = pagingUtils.cutList(request, list);
		String paging = pagingUtils.getHtmlStr(request, list,"notice/list");
		mav.addObject("List",resList);
		mav.addObject("paging",paging);
		mav.addObject("nowPage",pagingUtils.getNowPage());
		
		mav.addObject("searchStr",commandMap.get("searchStr"));
		
		return mav;
	}
	
	// noc detail
	@RequestMapping(value="/notice/detail")
	public ModelAndView noticeView(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("noticeDetail.board");
		Map<String, Object> map = boardService.selectBoardDetail(commandMap.getMap());
		
		mav.addObject("map",map.get("map"));
		
		
		// show list
		commandMap.put("status", 1);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		// if search keyword is exist
		if(searchBool(commandMap.getMap()))
			list = boardService.selectBoardList(commandMap.getMap());
		else 
			list = boardService.selectBoardSearchList(commandMap.getMap());
		
		// paging
		List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
		resList = pagingUtils.cutList(request, list);
		String paging = pagingUtils.getHtmlStr(request, list,"notice/list");
		mav.addObject("List",resList);
		mav.addObject("paging",paging);
		mav.addObject("nowPage",pagingUtils.getNowPage());
		
		mav.addObject("searchStr",commandMap.get("searchStr"));
		
		return mav;
	}
	
	// event
	// ev list
	@RequestMapping(value="/event/list")
	public ModelAndView eventList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("eventList.board");
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		commandMap.put("status", 2);
		
		if(searchBool(commandMap.getMap()))
			list = boardService.selectBoardList(commandMap.getMap());
		else 
			list = boardService.selectBoardSearchList(commandMap.getMap());
		// paging
		List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
		resList = pagingUtils.cutList(request, list);
		String paging = pagingUtils.getHtmlStr(request, list,"event/list");
		mav.addObject("List",resList);
		mav.addObject("paging",paging);
		mav.addObject("nowPage",pagingUtils.getNowPage());
				
		mav.addObject("searchStr",commandMap.get("searchStr"));
		
		return mav;
	}
	
	// ev detail
	@RequestMapping(value="/event/detail")
	public ModelAndView eventDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("eventDetail.board");
		Map<String, Object> map = boardService.selectBoardDetail(commandMap.getMap());
		
		mav.addObject("map",map.get("map"));
		
		// show list
		commandMap.put("status", 2);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		// if search keyword is exist
		if(searchBool(commandMap.getMap()))
			list = boardService.selectBoardList(commandMap.getMap());
		else 
			list = boardService.selectBoardSearchList(commandMap.getMap());
		
		// paging
		List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
		resList = pagingUtils.cutList(request, list);
		String paging = pagingUtils.getHtmlStr(request, list,"notice/list");
		mav.addObject("List",resList);
		mav.addObject("paging",paging);
		mav.addObject("nowPage",pagingUtils.getNowPage());
		
		mav.addObject("searchStr",commandMap.get("searchStr"));
		
		return mav;
	}
	
	private boolean searchBool(Map<String, Object> map) {
		String result = (String)map.get("searchStr");
		return result==null || result.isEmpty() || result.equals("");
	}
	
	// QnA
	// qna list
	@RequestMapping(value="/qna/list")
	public ModelAndView qnaList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("qnaList.board");
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		commandMap.put("status", 3); // 게시판 구분
		
		if(searchBool(commandMap.getMap()))
			list = boardService.selectBoardList(commandMap.getMap());
		else 
			list = boardService.selectBoardSearchList(commandMap.getMap());
		// paging
		List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
		resList = pagingUtils.cutList(request, list);
		String paging = pagingUtils.getHtmlStr(request, list,"qna/list");
		mav.addObject("List",resList);
		mav.addObject("paging",paging);
		mav.addObject("nowPage",pagingUtils.getNowPage());
				
		mav.addObject("searchStr",commandMap.get("searchStr"));
		
		return mav;
	}
	
	// qna detail
	@RequestMapping(value="/qna/detail")
	public ModelAndView qnaDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("qnaDetail.board");
		Map<String, Object> map = boardService.selectBoardDetail(commandMap.getMap());
		
		mav.addObject("map",map.get("map"));
		
		// show list
		commandMap.put("status", 3);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		// if search keyword is exist
		if(searchBool(commandMap.getMap()))
			list = boardService.selectBoardList(commandMap.getMap());
		else 
			list = boardService.selectBoardSearchList(commandMap.getMap());
		
		// paging
		List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
		resList = pagingUtils.cutList(request, list);
		String paging = pagingUtils.getHtmlStr(request, list,"notice/list");
		mav.addObject("List",resList);
		mav.addObject("paging",paging);
		mav.addObject("nowPage",pagingUtils.getNowPage());
		
		mav.addObject("searchStr",commandMap.get("searchStr"));
		
		return mav;
	}
	
	// qna writeForm
	@RequestMapping(value="/qna/writeForm")
	public String qnaWriteForm() {
		return "qnaWriteForm.board";
	}
	
	// qna write
	@RequestMapping(value="/qna/write")
	public String qnaWrite(CommandMap commandMap) throws Exception{
		boardService.insertQnA(commandMap.getMap());
		
		return "redirect:/qna/list";
	}
	
	// qna modifyForm
	@RequestMapping(value="/qna/modifyForm")
	public ModelAndView qnaModifyForm(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("qnaWriteForm.board");
		Map<String, Object> map = boardService.selectBoardDetail(commandMap.getMap());
		
		@SuppressWarnings("unchecked")
		Map<String,Object> tempMap = (Map<String, Object>) map.get("map");
		
		// reTranslate content
		String content2 = (String)tempMap.get("BOARD_CONTENT");
		String content = content2.replaceAll("<br>", "\r\n");
		tempMap.put("BOARD_CONTENT", content);
		
		mav.addObject("old",tempMap);
		return mav;
	}
	
	// qna modify
	@RequestMapping(value="/qna/modify")
	public ModelAndView qnaModify(CommandMap commandMap) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:detail?BOARD_NO="+commandMap.get("BOARD_NO"));
		
		boardService.updateQnA(commandMap.getMap());
		
		return mav;
	}
	
}
