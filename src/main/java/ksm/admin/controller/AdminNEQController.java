package ksm.admin.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ksm.admin.service.AdminNEQService;
import ksm.common.common.CommandMap;

@Controller
public class AdminNEQController {
	
	@Resource(name="adminNEQService")
	private AdminNEQService adminNEQService;
	
	// ��������/�̺�Ʈ �۾��� ��
	@RequestMapping(value="/admin/boardWriteForm")
	public ModelAndView adminNEWriteForm() {
		ModelAndView mav = new ModelAndView("adminBoardWriteForm.admin");
		return mav;
	}
	
	// ��������/�̺�Ʈ �۾��� ó��
	@RequestMapping(value="/admin/boardWrite")
	public String adminNEWrite(CommandMap commandMap)throws Exception{
		adminNEQService.insertNEBoard(commandMap.getMap());
		int status = Integer.parseInt((String)commandMap.get("BOARD_CATEGORY"));
		if(status==1)
			return "redirect:/notice/list";
		else
			return "redirect:/event/list";
	}
	
	// ��������/�̺�Ʈ �� ���� ��
	@RequestMapping(value="/admin/boardModifyForm")
	public ModelAndView adminNEModifyForm(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("adminBoardWriteForm.admin");
		Map<String, Object> map = adminNEQService.selectBoardOne(commandMap.getMap());
		
		@SuppressWarnings("unchecked")
		Map<String, Object> tempMap = (Map<String, Object>) map.get("map");
		
		// reTranslate content
		String content2 = (String)tempMap.get("BOARD_CONTENT");
		String content = content2.replaceAll("<br>", "\r\n");
		tempMap.put("BOARD_CONTENT", content);
		
		mav.addObject("old", tempMap);
		
		return mav;
	}
	
	// ��������/�̺�Ʈ �� ���� ó��
	@RequestMapping(value="/admin/boardModify")
	public ModelAndView adminNEModify(CommandMap commandMap) throws Exception{
		int status = Integer.parseInt((String)commandMap.get("BOARD_CATEGORY"));
		String model = status==1?"notice":"event";
		ModelAndView mav = new ModelAndView("redirect:/"+model+"/detail?BOARD_NO="+commandMap.get("BOARD_NO"));
		adminNEQService.updateNEBoard(commandMap.getMap());
		return mav;
	}
	
	// ��������/�̺�Ʈ �� ����
	@RequestMapping(value="/admin/boardDelete")
	public String adminNEDelete(CommandMap commandMap) throws Exception{
		// 나보다 스텝이 아래인 것 중에서 나보다 레벨이 깊은 것들도 같이 삭제
		adminNEQService.deleteNEBoard(commandMap.getMap());
		int status = Integer.parseInt((String) commandMap.get("status"));
		if(status==1) return "redirect:/notice/list";
		else if(status==2) return "redirect:/event/list";
		else return "redirect:/qna/list";
	}
	
	@RequestMapping(value="/admin/qnaBoardDelete")
	public String adminQnaDelete(CommandMap commandMap) throws Exception{
		adminNEQService.deleteQnaBoard(commandMap.getMap());
		return "redirect:/qna/list";
	}
	
	// �������� �˻� ??? ����
	
	// ��� ���� �亯
	
	// ��� ���� �亯 ����
	
	// QnA
	
	
	// admin qna reply form
	@RequestMapping(value="/admin/qnaWriteForm")
	public ModelAndView adminQnaWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mav = new ModelAndView("adminQnaWriteForm.admin");
		Map<String,Object> map = adminNEQService.selectBoardOne(commandMap.getMap());
		
		mav.addObject("parent",map.get("map"));
		
		
		return mav;
	}
	
	// admin qna reply action
	@RequestMapping(value="/admin/qnaWrite")
	public ModelAndView	 adminQnaWrite(CommandMap commandMap) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:/qna/list");
		
		adminNEQService.insertQnABoard(commandMap.getMap());
		
		return mav;
	}
}
