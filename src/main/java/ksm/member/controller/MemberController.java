package ksm.member.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ksm.common.common.CommandMap;
import ksm.common.utils.PagingUtils;
import ksm.member.service.MemberService;

@Controller
public class MemberController {

   Logger log = Logger.getLogger(this.getClass());

   @Resource(name = "memberService")
   private MemberService memberService;
   @Resource(name="pagingUtils")
   private PagingUtils pagingUtils;
   

   @RequestMapping(value = "/member/joinForm")
   public ModelAndView memberJoinForm(CommandMap commandMap) throws Exception {
      ModelAndView mav = new ModelAndView("memberJoinForm.member");

      return mav;
   }

   @RequestMapping(value = "/member/checkId")
   @ResponseBody
   public int checkUserID(CommandMap commandMap) throws Exception {
      int checkResult = memberService.selectMemberID(commandMap.getMap());

      return checkResult;
   }

   @RequestMapping(value = "/member/join")
   public ModelAndView memberJoin(CommandMap commandMap) throws Exception {
      ModelAndView mav = new ModelAndView("redirect:/");

      memberService.insertMemberJoin(commandMap.getMap());

      return mav;
   }

   @RequestMapping(value = "/member/login")
   public ModelAndView memberLogin(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap)
         throws Exception {
      ModelAndView mav = new ModelAndView("/member/memberLogin");

      return mav;
   }

   @SuppressWarnings("unchecked")
   @RequestMapping(value = "/member/loginTry")
   public ModelAndView login(HttpServletRequest request, HttpSession session, CommandMap commandMap) throws Exception {
      ModelAndView mav = new ModelAndView("/member/loginCheck");
      
      if(request.getParameter("member_mem_gb").equals("2"))
      {
         System.out.println("비회원이다");
         session.setAttribute("nonmemname", request.getParameter("member_name1"));
         session.setAttribute("nonmemphone", request.getParameter("member_phone1"));   
      }
      else
      {
         Map<String, Object> map = memberService.selectMemberInfo(commandMap.getMap());
         
         if(map!=null)
         {
            System.out.println("map!=null 이것은 map에 정보가 있다");
            
            request.getSession().setAttribute("loginInfo", map);
      
            String memName = (String) ((Map<String, Object>) request.getSession().getAttribute("loginInfo")).get("MEMBER_ID");
               
            session.setAttribute("idSession", memName);
            session.setAttribute("memname", map.get("MEMBER_NAME"));
            session.setAttribute("memphone", map.get("MEMBER_PHONE"));
            session.setAttribute("memtotal", map.get("MEMBER_TOTAL"));
            session.setAttribute("memgrade", map.get("MEMBER_MEM_GB"));
            session.setAttribute("memmileage", map.get("MEMBER_MILEAGE"));
            session.setAttribute("memmonth", map.get("MEMBER_MONTH"));
            session.setAttribute("memday", map.get("MEMBER_DAY"));
               
            List<Map<String, Object>> memcoulist = memberService.memberCouponList(commandMap.getMap());

            Date now = new Date();
            SimpleDateFormat stringformat = new SimpleDateFormat("yyyyMMdd");
            String nowdate = stringformat.format(now);

            for (int i = 0; i < memcoulist.size(); i++) 
            {
               String finish = "";
               String edate_ = (String) memcoulist.get(i).get("COU_EDATE");
               StringTokenizer str = new StringTokenizer(edate_, "-");
               String[] array = new String[str.countTokens()];
               int j = 0;
               while (str.hasMoreElements()) {array[j++] = str.nextToken();}

               for (int k = 0; k < array.length; k++) {finish += array[k];}
               if (Integer.parseInt(finish) < Integer.parseInt(nowdate)) 
               {
                  System.out.println("성공 = " + i + "번째");
                  commandMap.put("cou_no", memcoulist.get(i).get("COU_NO"));
                  memberService.updateCouState(commandMap.getMap());
               }
            }
            
         }
         else
         {
            System.out.println("map==null 이것은 map에 정보가 없다");
            commandMap.put("memalert", request.getParameter("member_id"));
            Map<String, Object> map2 = memberService.MemAlertPass(commandMap.getMap());
            
            if(map2==null)
            {
               mav.addObject("msg","아이디 혹은 비밀번호를 확인해주세요.");
            }
            else
            {
               mav.addObject("msg","아이디 혹은 비밀번호를 확인해주세요.");
            }
         }
         
      }
      return mav;
   }

   @RequestMapping(value = "/member/logout")
   public ModelAndView memberLogout(HttpServletRequest request, HttpSession session) throws Exception {
      ModelAndView mav = new ModelAndView("redirect:/main");
      /*if (session.getAttribute("idSession") != null) {
         request.getSession().removeAttribute("loginInfo");
         session.removeAttribute("idSession");
      }
      if (session.getAttribute("nonmemname") != null) {
         session.removeAttribute("nonmemname");
         session.removeAttribute("nonmemphone");
         session.removeAttribute("sessionCartList");
      }*/
      session.invalidate();
      
      return mav;
   }

   @RequestMapping(value = "/member/findmemberid")
   public ModelAndView findMemberid(CommandMap commandMap) throws Exception {
      ModelAndView mav = new ModelAndView("find_id.member");

      return mav;
   }

   @RequestMapping(value = "/member/findId")
   public ModelAndView findId(HttpServletRequest request, CommandMap commandMap) throws Exception {
      ModelAndView mav = new ModelAndView();
      System.out.println(commandMap.getMap());
      String id = memberService.selectFindId(commandMap.getMap());

      mav.addObject("member_id", id);
      mav.setViewName("result_id.member");

      return mav;
   }

   @RequestMapping(value = "/member/findmemberpw")
   public ModelAndView findMemberpw(CommandMap commandMap) throws Exception {
      ModelAndView mav = new ModelAndView("find_pw.member");

      return mav;
   }

   @SuppressWarnings("unchecked")
   @RequestMapping(value = "/member/memModifyForm")
   public ModelAndView memberModifyForm(HttpServletRequest request, CommandMap commandMap) throws Exception {

      ModelAndView mav = new ModelAndView("modifyForm.member");

      String memName = (String) ((Map<String, Object>) request.getSession().getAttribute("loginInfo"))
            .get("MEMBER_ID");

      commandMap.put("member_id", memName);

      String memyear = (String) ((Map<String, Object>) request.getSession().getAttribute("loginInfo"))
            .get("MEMBER_YEAR");
      String memmonth = (String) ((Map<String, Object>) request.getSession().getAttribute("loginInfo"))
            .get("MEMBER_MONTH");
      String memday = (String) ((Map<String, Object>) request.getSession().getAttribute("loginInfo"))
            .get("MEMBER_DAY");
      mav.addObject("memyear", memyear);
      mav.addObject("memmonth", memmonth);
      mav.addObject("memday", memday);

      List<Map<String, Object>> mypage = memberService.selectMemberInfoList(commandMap.getMap());

      mav.addObject("mypage", mypage);

      return mav;
   }

   @RequestMapping(value = "/member/memModify")
   public ModelAndView memberModify(HttpServletRequest request, CommandMap commandMap) throws Exception {
      ModelAndView mav = new ModelAndView("redirect:/member/mypage");

      @SuppressWarnings("unchecked")
      String memName = (String) ((Map<String, Object>) request.getSession().getAttribute("loginInfo"))
            .get("MEMBER_ID");

      commandMap.put("member_id", memName);

      memberService.updateMember(commandMap.getMap());

      return mav;
   }

   @RequestMapping(value = "/member/memDelete")
   public ModelAndView memberDelete(HttpSession session, HttpServletRequest request, CommandMap commandMap)
         throws Exception {
      ModelAndView mav = new ModelAndView("redirect:/");

      String memName = (String) session.getAttribute("idSession");

      commandMap.put("member_id", memName);

      memberService.updateMemDelete(commandMap.getMap());

      request.getSession().removeAttribute("loginInfo");
      session.removeAttribute("idSession");

      return mav;
   }

   @RequestMapping(value = "/member/mypage")
   public ModelAndView memberMypage(HttpSession session, CommandMap commandMap) throws Exception {
      ModelAndView mav = new ModelAndView("mypage.member");
      commandMap.put("member_id", session.getAttribute("idSession"));
      int couCount = memberService.memberCouponCount(commandMap.getMap());
      mav.addObject("count", couCount);

      return mav;
   }
   @RequestMapping(value="/member/purchase")
   public ModelAndView memberPurchase(HttpServletRequest request,HttpSession session,CommandMap commandMap) throws Exception
   {
	   ModelAndView mav = new ModelAndView("memberPurchase.member");
	   
	   commandMap.put("member_id", session.getAttribute("idSession"));
	   List<Map<String,Object>> purList = memberService.memberpurchaseList(commandMap.getMap());
	   List<Map<String,Object>> pagePurList = new ArrayList<Map<String,Object>>();
	   pagePurList = pagingUtils.cutList(request, purList);
	   String purListStr = pagingUtils.getHtmlStr(request, purList, "/member/purchase");
	   
	   mav.addObject("purListPage",purListStr);
	   mav.addObject("purList",pagePurList);
	   
	   return mav;
   }
   @RequestMapping(value="/member/nonpurchase")
   public ModelAndView nonmemberPurchase(HttpServletRequest request,HttpSession session,CommandMap commandMap) throws Exception
   {
	   ModelAndView mav = new ModelAndView("nonmemPurchase.member");
	   
	   commandMap.put("nonmemname", session.getAttribute("nonmemname"));
	   List<Map<String,Object>> purList = memberService.nonmemberpurchaseList(commandMap.getMap());
	   List<Map<String,Object>> pagePurList = new ArrayList<Map<String,Object>>();
	   pagePurList = pagingUtils.cutList(request, purList);
	   String purListStr = pagingUtils.getHtmlStr(request, purList, "/member/nonpurchase");
	   
	   mav.addObject("purListPage",purListStr);
	   mav.addObject("purList",pagePurList);
	   
	   return mav;
   }
   

   @RequestMapping(value = "/member/memcouponlist")
   public ModelAndView memberCoulist(HttpSession session, HttpServletRequest request,CommandMap commandMap) throws Exception {
      ModelAndView mav = new ModelAndView("memberCouponBoard.member");

      commandMap.put("member_id", session.getAttribute("idSession"));

      List<Map<String, Object>> memcoulist = new ArrayList<Map<String,Object>>();
      List<Map<String, Object>> pagememcoulist = new ArrayList<Map<String,Object>>();
      
      if(request.getParameter("searchtext")==null || request.getParameter("searchtext").equals(""))
      {
         memcoulist = memberService.memberCouponList(commandMap.getMap());
         pagememcoulist = pagingUtils.cutList(request, memcoulist);
         String memcoulistStr = pagingUtils.getHtmlStr(request, memcoulist, "/member/memcouponlist");
         mav.addObject("memcoupage",memcoulistStr);
      }
      else
      {
         memcoulist = memberService.memberCouponList2(commandMap.getMap());
         pagememcoulist = pagingUtils.cutList(request, memcoulist);
         String memcoulistStr = pagingUtils.getHtmlStr(request, memcoulist, "/member/memcouponlist");
         mav.addObject("memcoupage",memcoulistStr);
      }
      
      
      mav.addObject("memcoulist", pagememcoulist);

      return mav;
   }

}