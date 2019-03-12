package ksm.admin.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
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
public class AdminCouponController {
	
	@Resource(name = "adminMemberService")
	private AdminMemberService adminMemberService;
	@Resource(name="pagingUtils")
	private PagingUtils pagingUtils;
	
	
	@RequestMapping(value="/admin/SendCoupon")
	public ModelAndView sendCou(CommandMap commandMap) throws Exception
	{
		ModelAndView mav = new ModelAndView("/admin/sendcouponCheck");
		
		if(commandMap.get("cou_no") instanceof String[])
		{
			mav.addObject("msg","쿠폰을 하나만 선택해주세요.");
		}
		else
		{
			String couno = (String)commandMap.get("cou_no");
			
			if(couno==null)
			{
				mav.addObject("msg","쿠폰을 선택해주세요.");
			}
			else
			{
				Map<String,Object> couOne = adminMemberService.couponInfo(commandMap.getMap());
				
				String cou_content = (String)couOne.get("COU_CONTENT");
				String cou_discount = (String)couOne.get("COU_DISCOUNT");
				Date cou_sdate = (Date)couOne.get("COU_SDATE");
				Date cou_edate = (Date)couOne.get("COU_EDATE");
				commandMap.put("cou_origin_no", couno);
				commandMap.put("cou_content", cou_content);
				commandMap.put("cou_discount", cou_discount);
				commandMap.put("cou_sdate", cou_sdate);
				commandMap.put("cou_edate", cou_edate);
				
				if(commandMap.get("member_id") instanceof String[])
				{
					String[] listId = (String[])commandMap.get("member_id");

					ArrayList<String> listId2 = new ArrayList<String>(Arrays.asList(listId));
					ArrayList<String> listId3 = new ArrayList<String>();
					
					for(int i=0;i<listId2.size();i++)
					{
						if(!listId3.contains(listId2.get(i)))
						{
							listId3.add(listId2.get(i));
						}
					}
					for(int j=0;j<listId3.size();j++)
					{
						commandMap.put("memid", listId3.get(j));
						adminMemberService.insertCouponInfo(commandMap.getMap());
						System.out.println(listId3.get(j)+" "+couno+" "+cou_content+" "+cou_discount+" "+cou_sdate+"~"+cou_edate);
					}
				}
				else
				{
					String listId = (String)commandMap.get("member_id");
					
					if(listId==null)
					{
						mav.addObject("msg","회원리스트에서 회원을 선택해주세요");
					}
					else
					{
						ArrayList<String> listId2 = new ArrayList<String>(Arrays.asList(listId));
						ArrayList<String> listId3 = new ArrayList<String>();
						
						for(int i=0;i<listId2.size();i++)
						{
							if(!listId3.contains(listId2.get(i)))
							{
								listId3.add(listId2.get(i));
							}
						}
						for(int j=0;j<listId3.size();j++)
						{
							commandMap.put("memid", listId3.get(j));
							adminMemberService.insertCouponInfo(commandMap.getMap());
							System.out.println(listId3.get(j)+" "+couno+" "+cou_content+" "+cou_discount+" "+cou_sdate+"~"+cou_edate);
						}
					}
				}
			}
		}
		return mav;
	}
	
	@RequestMapping(value = "/admin/CouponDeleteList")
	public ModelAndView ListCoupon(HttpServletRequest request,CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("coupondelete.admin");

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
	
	@RequestMapping(value="/admin/coupondelete")
	public ModelAndView coupondelete(CommandMap commandMap,HttpServletRequest request) throws Exception
	{
		ModelAndView mav = new ModelAndView("redirect:/admin/CouponDeleteList");
		
		if(commandMap.get("cou_no") instanceof String[])
		{
			System.out.println("쿠폰 여러개");
			
			String[] cou_no = (String[]) commandMap.get("cou_no");
			
			ArrayList<String> cou_no2 = new ArrayList<String>(Arrays.asList(cou_no));
			
			for(int i=0;i<cou_no2.size();i++)
			{
				commandMap.put("cou_no", cou_no2.get(i));
				System.out.println(cou_no2.get(i));
				adminMemberService.coupondelete(commandMap.getMap());
			}
		}
		else
		{
			System.out.println("쿠폰 한개");
			
			String cou_no = (String)commandMap.get("cou_no");
			
			System.out.println(cou_no);
			
			adminMemberService.coupondelete(commandMap.getMap());
		}
		
		return mav;
	}


}
