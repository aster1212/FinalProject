package ksm.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ksm.member.service.MemberService;
import ksm.common.common.CommandMap;
import ksm.order.service.WishlistService;
import ksm.common.utils.PagingUtils;

@Controller
public class WishlistController {
   
   @Resource(name = "wishService")
   private WishlistService wishlistService;
   
   @Resource(name = "memberService")
   private MemberService memberService;
   
   @Resource(name="pagingUtils")
   private PagingUtils pagingUtils;
   
   
   @RequestMapping(value = "/wishList/addWish")
   public ModelAndView addWish(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView();
      
      HttpSession session = request.getSession();
      
      commandMap.put("MEMBER_ID", session.getAttribute("idSession"));
      commandMap.put("ITEM_NO", commandMap.get("ITEM_NO"));
      commandMap.put("WISH_NO", commandMap.get("WISH_NO"));
      String[] wish_no = (String[]) commandMap.get("WISH_NO");

      commandMap.put("WISH_NO", wish_no);
      
      List<Map<String, Object>> wishlist = wishlistService.selectWishlist(commandMap.getMap());
      List<Map<String, Object>> wishlist2 = wishlistService.selectWishlist2(commandMap.getMap());
      System.out.println("wishlist1:" +wishlist);
      //�ߺ�üũ (�ߺ��Ȱ� ������)
      
      
      if(session.getAttribute("idSession") != null) {
         commandMap.put("ITEM_NO", commandMap.get("ITEM_NO"));
         commandMap.put("WISH_NO", commandMap.get("WISH_NO"));
         commandMap.put("MEMBER_ID", session.getAttribute("idSession"));
      }
         for(int i=0; i<wishlist2.size(); i++) {
              
                  if(wishlist2.get(i).get("ITEM_NO").toString().equals(commandMap.get("ITEM_NO"))) {
                     
                     mv.setViewName("wishList/wisherror");
                     return mv;
                  }
         }     
         
       
         wishlistService.insertWishlist(commandMap.getMap());
         mv.setViewName("wishList/wishsuccess");
         return mv;
         
      
   }





      
   

   
   //리스트
   @RequestMapping(value = "/wishList/list")
   public ModelAndView list(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView("list.wishList");
      
      HttpSession session = request.getSession();
      List<Map<String, Object>> wishlist = new ArrayList<Map<String, Object>>();
      List<Map<String, Object>> wishlist2 = new ArrayList<Map<String,Object>>();
      
      commandMap.put("MEMBER_ID", session.getAttribute("idSession"));
      
        if(session.getAttribute("idSession")== null) {
            mv.setViewName("member/memberLogin");
            return mv;
         }
        
      if(request.getParameter("searchtext")==null || request.getParameter("searchtext").equals("")) {
         wishlist = wishlistService.selectWishlist(commandMap.getMap());
         wishlist2 = pagingUtils.cutList(request, wishlist, 12, 5);
           String wishlistStr = pagingUtils.getHtmlStr(request, wishlist, 12, 5, "/wishList/list");
           mv.addObject("pagingwish",wishlistStr);
       }else {
          wishlist = wishlistService.selectWishlist(commandMap.getMap());
          wishlist2 = pagingUtils.cutList(request, wishlist, 12, 5);
           String wishlistStr = pagingUtils.getHtmlStr(request, wishlist, 12, 5, "/wishList/list");
           mv.addObject("pagingwish",wishlistStr);
       }

      
      
        
        
        
        
           
      wishlist = wishlistService.selectWishlist(commandMap.getMap());
      mv.addObject("wishlist", wishlist);
      mv.addObject("wishlist", wishlist2);
      return mv;
      

      
      
      
   }
   
   
   
   //위시 하나삭제
   @RequestMapping(value = "/wishList/deleteOneWishlist")
   public ModelAndView deleteOneWishlist(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView("redirect:/wishList/list");
      HttpSession session = request.getSession();
      
      if(session.getAttribute("idSession") != null) { 
         commandMap.put("MEMBER_ID", session.getAttribute("idSession"));
         commandMap.put("WISH_NO", commandMap.get("WISH_NO"));
   
         wishlistService.deleteOneWishlist(commandMap.getMap());
         
      }
      
      return mv;
   }
   
   //위시 전체삭제
   @RequestMapping(value = "/wishList/deleteAllWishlist")
   public ModelAndView deleteAllWishlist(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView("redirect:/wishList/list");
      
      HttpSession session = request.getSession();
      
      if(session.getAttribute("idSession") != null) { 
         commandMap.put("MEMBER_ID", session.getAttribute("idSession"));
         wishlistService.deleteAllWishlist(commandMap.getMap());
         
      }
      
      return mv;
   }
   
   
   
   
   
}









