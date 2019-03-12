package ksm.common.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ksm.board.service.BoardService;
import ksm.common.common.CommandMap;
import ksm.common.service.MainService;
import ksm.common.utils.PagingUtils;
import ksm.member.service.MemberService;

@Controller
public class MainController {
	
	@Resource(name = "memberService")
	private MemberService memberService;

	@Resource(name="mainService")
	MainService mainService;
	
	@Resource(name="boardSerivce")
	private BoardService boardService;
	
	@Resource(name="pagingUtils")
	private PagingUtils pagingUtils;
	
	@RequestMapping(value="/")
	public ModelAndView birthcheck(CommandMap commandMap) throws Exception
	{
		ModelAndView mav = new ModelAndView("main/video");
		
		List<Map<String,Object>> birthlist = memberService.BirthDayCoupon(commandMap.getMap());
		Calendar now = Calendar.getInstance();
		
		System.out.println((now.get(now.MONTH)+1)+"월"+now.get(now.DAY_OF_MONTH)+"일");
		for(int i=0;i<birthlist.size();i++)
		{
			int month = Integer.parseInt(birthlist.get(i).get("MEMBER_MONTH").toString());
			int day = Integer.parseInt(birthlist.get(i).get("MEMBER_DAY").toString());
			
			System.out.println("=========여기부터는 회원생일");
			System.out.println(month+"월"+day+"일"+"==== 오늘날짜는??"+(now.get(now.MONTH)+1)+"월"+now.get(now.DAY_OF_MONTH)+"일");
			
			if((now.get(now.MONTH)+1)==month && now.get(now.DAY_OF_MONTH)==day)
			{
				System.out.println("생일이 같다");
				commandMap.put("member_id", birthlist.get(i).get("MEMBER_ID"));
				List<Map<String,Object>> couponlist = memberService.memberCouponList(commandMap.getMap());
				
				if(couponlist.size()==0)
				{
					System.out.println("생일쿠폰이 삽입.");
					memberService.Coupon_Birth(commandMap.getMap());
				}
				else
				{
					for(int j=0;j<couponlist.size();j++)
					{
						int checknum = Integer.parseInt(couponlist.get(j).get("COU_ORIGIN_NO").toString());
						System.out.println(checknum);
						if(checknum==7)
						{
							System.out.println("이사람은 생일 쿠폰이 있다.");
							break;
						}
						System.out.println("생일쿠폰이 삽입.");
						memberService.Coupon_Birth(commandMap.getMap());
					}
				}
			}
		}
				
		return mav;
	}
	
	@RequestMapping(value="/main")
	public ModelAndView main(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("main.main");
		List<Map<String, Object>> tempList = new ArrayList<Map<String, Object>>();
		Map<String, Object> tempMap = new HashMap<String, Object>();
		
		// best item for all
		tempList = pagingUtils.cutList(request, mainService.selectBestItemForAll(), 8, 5);
		mav.addObject("list1",tempList);
		
		// best item for man
		tempMap.put("gender", "M");
		tempList = pagingUtils.cutList(request, mainService.selectBestItemForGender(tempMap), 8, 5);
		mav.addObject("list2",tempList);
		
		// best item for woman
		tempMap.put("gender", "W");
		tempList = pagingUtils.cutList(request, mainService.selectBestItemForGender(tempMap), 8, 5);
		mav.addObject("list3",tempList);
		
		// board info
		// paging event list
		commandMap.put("status", 2);
		List<Map<String,Object>> list = boardService.selectBoardList(commandMap.getMap());
		List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
		resList = pagingUtils.cutList(request, list, 10,5);
		String paging = pagingUtils.getHtmlStr(request, list,10,5,"main");
		mav.addObject("List",resList);
		mav.addObject("paging",paging);
		mav.addObject("nowPage",pagingUtils.getNowPage());

		return mav;
	}
	
	@RequestMapping(value="/main/home")
	public ModelAndView Mainhome() throws Exception{
		ModelAndView mv = new ModelAndView("home.main");
		/*	mv.setViewName("main/home");*/
		return mv;
	}
}
