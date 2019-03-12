package ksm.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ksm.admin.service.AdminMemberService;
import ksm.common.common.CommandMap;
import ksm.common.utils.PagingUtils;

@Controller
public class AdminMemberController {

	@Resource(name = "adminMemberService")
	private AdminMemberService adminMemberService;
	@Resource(name="pagingUtils")
	private PagingUtils pagingUtils;

	@RequestMapping(value = "/admin/memberList")
	public ModelAndView memberList(HttpServletRequest request,CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("memberList.admin");
		
		List<Map<String,Object>> memberlist = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> memberlist2 = new ArrayList<Map<String,Object>>();
		
	
			if(request.getParameter("searchtext")==null || request.getParameter("searchtext").equals("")) {
	        	memberlist = adminMemberService.adminMemberList(commandMap.getMap());
	        	memberlist2 = pagingUtils.cutList(request, memberlist);
	        	String memberlistStr = pagingUtils.getHtmlStr(request, memberlist, "/admin/memberList");
	        	mav.addObject("pagingmem",memberlistStr);
	    	}else {
	        	memberlist = adminMemberService.adminMemberSearchList(commandMap.getMap());
	        	memberlist2 = pagingUtils.cutList(request, memberlist);
	        	String memberlistStr = pagingUtils.getHtmlStr(request, memberlist, "/admin/memberList");
	        	mav.addObject("pagingmem",memberlistStr);
	    	}
    	
		mav.addObject("memberList", memberlist2);
		

		return mav;
	}

	@RequestMapping(value = "/admin/createCoupon")
	public ModelAndView createCoupon(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("createCoupon.admin");

		return mav;
	}

	@RequestMapping(value = "/admin/createCouponTry")
	public ModelAndView creatCouponTry(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/admin/adminPage");

		adminMemberService.adminCouponCreate(commandMap.getMap());

		return mav;
	}

	@RequestMapping(value = "/admin/Couponlist")
	public ModelAndView ListCoupon(HttpServletRequest request,CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("couponList.admin");

		List<Map<String, Object>> couponlist = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> pagecoupon = new ArrayList<Map<String, Object>>();
		
		if(request.getParameter("searchtext")==null || request.getParameter("searchtext").equals(""))
		{
			System.out.println("");
			couponlist = adminMemberService.adminCouponList(commandMap.getMap());
			pagecoupon = pagingUtils.cutList(request, couponlist);
			String pagecouponStr = pagingUtils.getHtmlStr(request, couponlist, "/admin/Couponlist");
			mav.addObject("pagingCou",pagecouponStr);
		}
		else
		{
			couponlist = adminMemberService.adminSearchCouponList(commandMap.getMap());
			pagecoupon = pagingUtils.cutList(request, couponlist);
			String pagecouponStr = pagingUtils.getHtmlStr(request, couponlist, "/admin/Couponlist");
			mav.addObject("pagingCou",pagecouponStr);
		}
		
		
		mav.addObject("coulist", pagecoupon);

		return mav;
	}
	
	@RequestMapping(value="/admin/coumemlist")
	public ModelAndView coumem(HttpServletRequest request,CommandMap commandMap) throws Exception
	{
		ModelAndView mav = new ModelAndView("/admin/coumemlist");
		
		List<Map<String,Object>> coumemlist = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> coumemlist2 = new ArrayList<Map<String,Object>>();
		
		System.out.println(request.getParameter("searchtext")+" "+request.getParameter("searchname"));
		
		if(request.getParameter("searchtext")==null || request.getParameter("searchtext").equals(""))
		{
			coumemlist = adminMemberService.adminMemberList(commandMap.getMap());
			coumemlist2 = pagingUtils.cutList(request, coumemlist,5,5);
			String coumemlistStr = pagingUtils.getHtmlStr(request, coumemlist,5,5,"/admin/coumemlist");
			mav.addObject("pagingCoumem",coumemlistStr);
		}
		else
		{
			coumemlist = adminMemberService.adminMemberSearchList2(commandMap.getMap());
			coumemlist2 = pagingUtils.cutList(request, coumemlist,5,5);
			String coumemlistStr = pagingUtils.getHtmlStr(request, coumemlist,5,5,"/admin/coumemlist");
			mav.addObject("pagingCoumem",coumemlistStr);
		}
		
		mav.addObject("memlist",coumemlist2);
		
		return mav;
	}
	
	@RequestMapping(value="/admin/delYlist")
	public ModelAndView delList(HttpServletRequest request,CommandMap commandMap) throws Exception
	{
		ModelAndView mav = new ModelAndView("deleteMember.admin");
		
		List<Map<String,Object>> delmem = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> delmem2 = new ArrayList<Map<String,Object>>();
		
		if(request.getParameter("searchtext")==null || request.getParameter("searchtext").equals(""))
		{
			delmem = adminMemberService.delgb_y_list(commandMap.getMap());
			delmem2 = pagingUtils.cutList(request, delmem);
			String delmemStr = pagingUtils.getHtmlStr(request, delmem, "/admin/delYlist");
			mav.addObject("delPaging",delmemStr);
		}
		else
		{
			delmem = adminMemberService.delgb_y_list2(commandMap.getMap());
			delmem2 = pagingUtils.cutList(request, delmem);
			String delmemStr = pagingUtils.getHtmlStr(request, delmem, "/admin/delYlist");
			mav.addObject("delPaging",delmemStr);
		}
		
		mav.addObject("dellist",delmem2);
		
		return mav;
	}
	
	@RequestMapping(value="/admin/deleteMem")
	public ModelAndView deleteAbsolute(HttpServletRequest request,CommandMap commandMap) throws Exception
	{
		ModelAndView mav = new ModelAndView("redirect:/admin/delYlist");
	
		commandMap.put("member_id",request.getParameter("memid"));
		adminMemberService.deleteMem(commandMap.getMap());
		return mav;
		
	}
	
	@RequestMapping(value="/admin/deleteAll")
	public ModelAndView deleteAbsoluteAll(CommandMap commandMap) throws Exception
	{
		ModelAndView mav = new ModelAndView("redirect:/");
		
		adminMemberService.deleteAll(commandMap.getMap());
		
		return mav;
	}
	
	@RequestMapping(value="/admin/savaMember")
	public ModelAndView saveMember(HttpServletRequest request,CommandMap commandMap) throws Exception
	{
		ModelAndView mav = new ModelAndView("redirect:/admin/delYlist");
		
		commandMap.put("member_id",request.getParameter("memid"));
		adminMemberService.saveMember(commandMap.getMap());
		
		return mav;
	}
	
	@RequestMapping(value="/admin/adminPage")
	public ModelAndView adminPage(CommandMap commandMap) throws Exception
	{
		ModelAndView mav = new ModelAndView("adminPage.admin");
		
		return mav;
	}
	
	
	@RequestMapping(value="/admin/admin")
	public ModelAndView admin(CommandMap commandMap) throws Exception
	{
		ModelAndView mav = new ModelAndView("admin.admin");
		
		return mav;
	}
}
