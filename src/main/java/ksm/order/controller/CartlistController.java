package ksm.order.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ksm.common.common.CommandMap;
import ksm.order.service.CartlistService;
import ksm.order.service.OrderService;
import ksm.member.service.MemberService;
import org.apache.log4j.Logger;

@Controller
public class CartlistController {
   Logger log = Logger.getLogger(this.getClass());
   
   @Resource(name = "cartService")
   private CartlistService cartlistService;
   
   @Resource(name = "memberService")
   private MemberService memberService;
   
   // buy one
   @Resource(name="orderService")
	private OrderService orderService;
   
   List<Map<String, Object>> sessionCartList = new ArrayList<Map<String, Object>>();
   List<Map<String, Object>> CartList = new ArrayList<Map<String, Object>>();
   
   String cartArr[];
   int cartNo=0;
   
   // 장바구니 담기
   @SuppressWarnings("unchecked")
   @RequestMapping(value = "/cart/addCart")
   public ModelAndView addCart(CommandMap commandMap, HttpServletRequest request) throws Exception {
      
      System.out.println("addCart 하면 넘어오는값:");
      System.out.println(commandMap.getMap());
      
      ModelAndView mv = new ModelAndView();
      mv.setViewName("redirect:/cart/list");
      
      
      
      HttpSession session = request.getSession();
      
      
      
      List<Map<String, Object>> cartList = new ArrayList<Map<String, Object>>();
      System.out.println(commandMap.get("ITEM_NO")+"/////////////////////////////////////");
      // 회원 장바구니 등록
      if (session.getAttribute("idSession") != null)
      
      
      { 

         
         commandMap.put("ITEM_NO", commandMap.get("ITEM_NO"));
         commandMap.put("CART_NO", commandMap.get("CART_NO"));
         commandMap.put("MEMBER_ID", session.getAttribute("idSession"));
         commandMap.put("ITEM_PRICE", commandMap.get("ITEM_PRICE"));
         commandMap.put("ITEM_NAME", commandMap.get("ITEM_NAME"));
         commandMap.put("ITEM_COUNT", commandMap.get("ITEM_COUNT"));
         commandMap.put("ITEM_OPTION", commandMap.get("ITEM_OPTION"));
         commandMap.put("ITEM_SIZE", commandMap.get("ITEM_SIZE"));
         commandMap.put("ITEM_COLOR", commandMap.get("ITEM_COLOR"));
         
         String tmp = commandMap.get("ITEM_SIZE") + "," + commandMap.get("ITEM_OPTION") + "," +commandMap.get("ITEM_COLOR");
         commandMap.put("CART_OPTION", tmp);
         
         
      //여러개 추가
      if(commandMap.get("ITEM_NO") instanceof Object[]) {
         
         String[] Item = (String[]) commandMap.get("ITEM_NO");
         
         List<Object> addList_Item=new ArrayList<Object>();
         for(int i=0; i<Item.length; i++) {
            addList_Item.add(Item[i]);
         }
         
         cartList = cartlistService.selectCartlist(commandMap.getMap());
         List<Object> cartList_Item = new ArrayList<Object>();
         
         for(int i=0; i<cartList.size(); i++) {
            cartList_Item.add(cartList.get(i).get("CART_OPTION"));
         }
         
         for(int j=0; j<cartList_Item.size(); j++) {
            for(int i=0; i<addList_Item.size(); i++) {
               if(cartList_Item.get(j).toString().equals(addList_Item.get(i).toString())) {
                  mv.setViewName("cart/sameItemError");
                  System.out.println("동일상품번호 중복");
                  return mv;
               }
               
            }
         }
      
         cartlistService.insertCartlist2(commandMap, request);
         return mv;
         
         //1개 추가
      }  else {
         
         if(cartList != null) {
            
            //하나만 장바구니에 넘겨줄경우.
            System.out.println(commandMap.get("ITEM_NO"));
            String addList_Item1=(String) commandMap.get("CART_OPTION");
            
            cartList=cartlistService.selectCartlist(commandMap.getMap());
            List<Object> cartlist_Item = new ArrayList<Object>();
            
            for(int i=0;i<cartList.size();i++) {
               cartlist_Item.add(cartList.get(i).get("CART_OPTION"));
            }
            
            for(int j=0;j<cartlist_Item.size();j++) {
                  System.out.println("값비교:"+j);
                  System.out.println(cartlist_Item.get(j));
                  System.out.println(addList_Item1);
               if(cartlist_Item.get(j).toString().equals(addList_Item1)) {
                  //장바구니에 동일한 속성의 상품이있습니다 장바구니에서 수량을 변경해주세요.
                  
                  mv.setViewName("cart/sameItemError");
                  System.out.println("동일속성상품 중복에러");
                  return mv;
               }
               
            }
            
         }
         
      }	
      
      cartlistService.insertCartlist(commandMap.getMap());
      
      }
         //비회원 장바구니 등록
         else {
            System.out.println("nonmemname정보:");
            System.out.println(session.getAttribute("nonmemname"));
            if(session.getAttribute("nonmemname")== null) {
               mv.setViewName("member/memberLogin");
               return mv;
            }
            
            else {
            System.out.println("비회원 하나");
            
            List<Map<String, Object>> CartList=new ArrayList<Map<String, Object>>();
            Map<String, Object> cartMap = new HashMap<String, Object>();
            
            System.out.println("비회원 장바구니 등록할 때 가져오는 값" + commandMap.getMap());
            
            //비회원 장바구니 등록시 세션아이디
            String n_id=(String) session.getAttribute("nonmemname");
            
            
            String ITEM_NO = (String) commandMap.get("ITEM_NO");
            String ITEM_COUNT = (String) commandMap.get("ITEM_COUNT");
            String ITEM_PRICE = (String) commandMap.get("ITEM_PRICE");
            String ITEM_NAME = (String) commandMap.get("ITEM_NAME");
            String ITEM_SHORTPATH = (String) commandMap.get("ITEM_SHORTPATH");
            
            String tmp = commandMap.get("ITEM_SIZE") + "," + commandMap.get("ITEM_OPTION") + "," +commandMap.get("ITEM_COLOR");
            commandMap.put("CART_OPTION", tmp);
            
            
            
            cartMap.put("CART_NO",    cartNo++);
            cartMap.put("MEMBER_NAME",    n_id);
            cartMap.put("ITEM_NO",     ITEM_NO);
            cartMap.put("ITEM_NAME",   ITEM_NAME);
            cartMap.put("ITEM_PRICE",   ITEM_PRICE);
            cartMap.put("ITEM_COUNT",    ITEM_COUNT);
            cartMap.put("ITEM_SHORTPATH",   ITEM_SHORTPATH);
            cartMap.put("CART_OPTION", tmp);
            
            
            
            //중복 비교
            if(session.getAttribute("sessionCartList") != null) {
               CartList=(List<Map<String, Object>>) session.getAttribute("sessionCartList");
               System.out.println("==========");
               System.out.println(CartList);
               
               for(int i=0; i<CartList.size(); i++) {
                  System.out.println("************************");
                  System.out.println(CartList.get(i).get("ITEM_NO")+","+cartMap.get("ITEM_NO"));
                  System.out.println(CartList.get(i).get("CART_OPTION").toString().equals(cartMap.get("CART_OPTION")));
                  if(CartList.get(i).get("CART_OPTION").toString().equals(cartMap.get("CART_OPTION"))) {
                     mv.setViewName("cart/sameItemError");
                     return mv;
               }
            }

            

         }
            
            
         sessionCartList.add(cartMap);
         
         
            
         session.setAttribute("sessionCartList", sessionCartList);
         System.out.println("***********세션에 저장된 sessionCartList 값 : "+session.getAttribute("sessionCartList"));
            
            List<Map<String, Object>> sessionCartMap=new ArrayList<Map<String, Object>>();
            sessionCartMap=(List<Map<String, Object>>) session.getAttribute("sessionCartList");
            System.out.println(sessionCartMap);
            
               System.out.println("아이템카운트" + commandMap.get("ITEM_COUNT"));
               System.out.println("카트넘버" + commandMap.get("CART_NO"));
                  System.out.println("세션값?");
                  System.out.println(session.getAttribute("sessionCartList"));
                


         }
            
            
            
            
         
      }
      	// buy now
      String goWhere = (String) commandMap.get("goWhere");
      if(goWhere.equals("payment")) {
    	  mv.setViewName("paymentForm.order");
    	  Map<String, Object> buyTempMap = new HashMap<String,Object>();
    	  //회원 장바구니 불러오기
          if (session.getAttribute("idSession") != null) { 
             commandMap.put("MEMBER_ID", session.getAttribute("idSession"));
             
             String id = (String) commandMap.get("MEMBER_ID");
             
             CommandMap mapForId = new CommandMap();
 			mapForId.put("member_id", id);
 			
 			//회원정보 받아오기
 			Map<String, Object> memberInfo = memberService.selectMemberInfoList2(mapForId.getMap());
 			mv.addObject("memberInfo",memberInfo);
 			
 			//쿠폰 보여주기
 			CommandMap map1 = new CommandMap();
 			map1.put("MEMBER_ID", id);
 			List<Map<String, Object>> couponList =  orderService.selectCoupon(map1.getMap());
 			
 			//만료된 쿠폰 안보여줍니다~
 			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");				
 			Date time = new Date();		
 			String currTime = format1.format(time);
 			mv.addObject("currTime",currTime);
 	   		mv.addObject("couponList",couponList);
             
             cartList=cartlistService.selectCartlist(commandMap.getMap());
             
             buyTempMap = cartList.get(cartList.size()-1);
             
            List<Map<String, Object>> checkedCartList = new ArrayList<Map<String, Object>>();
 			List<Map<String, Object>> cartNoList = new ArrayList<Map<String, Object>>();
 			
 			checkedCartList.add(buyTempMap);
 			cartNoList.add(buyTempMap);
 			
 			mv.addObject("cartList", checkedCartList);
			mv.addObject("cartNoList", cartNoList);
             
             //비회원도 로그인 안할시
          }else if(session.getAttribute("nonmemname")== null && session.getAttribute("idSession") ==null) {
        	  mv.setViewName("member/memberLogin");
              return mv;
              
              // 비회원
          }else {
        	  buyTempMap = sessionCartList.get(sessionCartList.size()-1);
        	  List<Map<String, Object>> sessionCheckedCartList = new ArrayList<Map<String, Object>>();
        	  
        	  buyTempMap.put("ITEM_OPTION",commandMap.get("ITEM_OPTION"));
        	  buyTempMap.put("ITEM_COLOR",commandMap.get("ITEM_COLOR"));
        	  buyTempMap.put("ITEM_SIZE",commandMap.get("ITEM_SIZE"));
        	  
        	  
        	  sessionCheckedCartList.add(buyTempMap);
        	  mv.addObject("cartList", sessionCheckedCartList);
          }
          
          
    	  
    	  return mv;
      }
      
         mv.addObject("goWhere", commandMap.get("goWhere"));
         return mv;
      }
   

   
   //장바구니 목록 불러오기
   @RequestMapping(value = "/cart/list")
   public ModelAndView cartList(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("list.cart");
      
      HttpSession session = request.getSession();
      List<Map<String, Object>> cartList = new ArrayList<Map<String, Object>>();
      
      //회원 장바구니 불러오기
      if (session.getAttribute("idSession") != null) { 
         commandMap.put("MEMBER_ID", session.getAttribute("idSession"));
         
         String id = (String) commandMap.get("MEMBER_ID");
         
         System.out.println(id);
         
         cartList=cartlistService.selectCartlist(commandMap.getMap());
         mv.addObject("cartList", cartList);
      }
      
      //비회원장바구니불러오기
      else {
    	  
          if(session.getAttribute("nonmemname")== null && session.getAttribute("idSession") ==null) {
              mv.setViewName("member/memberLogin");
              return mv;
           }
          else {
         System.out.println("비회원 장바구니 리스트:");
         System.out.println(sessionCartList);
         mv.addObject("sessionCartList", sessionCartList);
          }
         
/*         List cart_list = (List)session.getAttribute("sessionCartList");
         List cart_list2 = new ArrayList();
         for(int i=0;i<cart_list.size();i++) {
            Map<String, Object> map = (Map<String, Object>)cart_list.get(i);
         }
         mv.addObject("sessionCartList", cart_list);*/
      }
      return mv;
   }
   
   @RequestMapping(value = "/cart/deleteOneCartlist")
   public ModelAndView cartDeleteOne(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView();
      System.out.println("deleteOne 했을때 눌리는 카트번호 :"+commandMap.get("CART_NO"));
      HttpSession session = request.getSession();

      if(session.getAttribute("idSession") != null) {
         commandMap.put("MEMBER_ID", session.getAttribute("idSession"));
         cartlistService.deleteOneCartlist(commandMap.getMap());
         
      }else {
         for(int i=0;i<sessionCartList.size();i++) {
            if(sessionCartList.get(i).get("CART_NO").equals(Integer.parseInt(commandMap.get("CART_NO").toString()))) {
               sessionCartList.remove(i);
               
               System.out.println("카트넘버" + commandMap.get("CART_NO"));
               System.out.println("아이템카운트" + commandMap.get("ITEM_COUNT"));
               session.setAttribute("sessionCartList", sessionCartList);
               cartNo=0;
            }
         }
      }
      mv.setViewName("redirect:/cart/list");
      return mv;
   }
   
   
   @RequestMapping(value = "/cart/deleteAllCartlist")
   public ModelAndView deleteAllCartlist(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView();

      HttpSession session = request.getSession();
      
      if(session.getAttribute("idSession") != null) {
         commandMap.put("MEMBER_ID", session.getAttribute("idSession"));
         cartlistService.deleteAllCartlist(commandMap.getMap());
      }else {
         sessionCartList.clear();
         System.out.println("카트넘버" + commandMap.get("CART_NO"));
         System.out.println("아이템카운트" + commandMap.get("ITEM_COUNT"));
         session.setAttribute("sessionCartList", sessionCartList);
         cartNo=0;
         
      }   
      mv.setViewName("redirect:/cart/list");
      return mv;
   }
   
   
   
   //선택상품삭제.
      @RequestMapping(value = "/cart/deleteSelectCartlist")
      public ModelAndView cartDeleteSelect(CommandMap commandMap, HttpServletRequest request) throws Exception {
         ModelAndView mv = new ModelAndView();

         HttpSession session = request.getSession();
         
         String cart_No[]=request.getParameterValues("CART_NO");
         
         System.out.println("선택된 카트 번호 : ");
         for(int i=0;i<cart_No.length;i++) {
            System.out.println("cart_No["+i+"]:"+cart_No[i]);
         }
         
         if(session.getAttribute("idSession") != null) {
            commandMap.put("MEMBER_ID", session.getAttribute("idSession"));
            commandMap.put("cart_No", cart_No);
            
            cartlistService.deleteSelectCartlist(commandMap.getMap());
         }else {
            for(int i=0;i<sessionCartList.size();i++) {
               for(int j=0;j<cart_No.length;j++) {
                  if(sessionCartList.get(i).get("CART_NO").equals(Integer.parseInt(cart_No[j]))) {
                     sessionCartList.remove(i);
                     System.out.println("아이템카운트" + commandMap.get("CART_NO"));
                     System.out.println("아이템카운트" + commandMap.get("ITEM_COUNT"));
                     session.setAttribute("sessionCartList", sessionCartList);
                     cartNo=0;
                     
                  }
               }
            }
            
         }
         mv.setViewName("redirect:/cart/list");
         return mv;
      }
      
      
      
      
   
   @RequestMapping(value = "/cart/CountUp")
   public ModelAndView cartCountUp(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView();
      System.out.println("넘어오는값:"+commandMap.getMap());
      HttpSession session = request.getSession();
      
      if(session.getAttribute("idSession") != null) {
         commandMap.put("MEMBER_ID", session.getAttribute("idSession"));
         cartlistService.countUp(commandMap.getMap());
      }
      
      mv.setViewName("redirect:/cart/list");
      
      return mv;
   }
   
   @RequestMapping(value = "/cart/CountDown")
   public ModelAndView cartCountDown(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView();
      
      HttpSession session = request.getSession();
      
      if(session.getAttribute("idSession") != null) {
         commandMap.put("MEMBER_ID", session.getAttribute("idSession"));
         cartlistService.countDown(commandMap.getMap());
      }
      
      mv.setViewName("redirect:/cart/list");
      
      return mv;
   }
   @RequestMapping(value = "/cart/CountChange")
   public ModelAndView cartChange(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView();
      System.out.println("넘어오는값:"+commandMap.getMap());
      HttpSession session = request.getSession();
      
      if(session.getAttribute("idSession") != null) {
         commandMap.put("MEMBER_ID", session.getAttribute("idSession"));
         cartlistService.countChange(commandMap.getMap());
      }else {
         
      }
      
      mv.setViewName("redirect:/cart/list");
      
      return mv;
   }
   
   
   @RequestMapping(value = "/cart/CountUp2")
   public ModelAndView cartCountUp2(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView();
      System.out.println("비회원 카운트넘어오는값:"+commandMap.getMap());
      HttpSession session = request.getSession();
         
      if(session.getAttribute("nonmemname") != null) {
         commandMap.put("MEMBER_NAME", session.getAttribute("nonmemname"));
         
         
         int CartNo   =Integer.parseInt(commandMap.get("CART_NO").toString());
         int Cnt      =Integer.parseInt(commandMap.get("ITEM_COUNT").toString());
         
         sessionCartList.get(CartNo).put("ITEM_COUNT", Cnt+1);
         
      }   
         
      mv.setViewName("redirect:/cart/list");
         
      return mv;
   }      
   
   @RequestMapping(value = "/cart/CountDown2")
   public ModelAndView cartCountDown2(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView();
      
      HttpSession session = request.getSession();
      System.out.println("비회원 카운트넘어오는값:"+commandMap.getMap());
      if(session.getAttribute("nonmemname") != null) {
         commandMap.put("MEMBER_NAME", session.getAttribute("nonmemname"));
      
       
         int CartNo   =Integer.parseInt(commandMap.get("CART_NO").toString());
         int Cnt      =Integer.parseInt(commandMap.get("ITEM_COUNT").toString());
         
         sessionCartList.get(CartNo).put("ITEM_COUNT", Cnt-1);
      }
      
      mv.setViewName("redirect:/cart/list");
      
      return mv;
   }
   
   
   
/*   @RequestMapping(value = "/cart/CountChange2")
   public ModelAndView cartChange2(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView();
      System.out.println("넘어오는값:"+commandMap.getMap());
      HttpSession session = request.getSession();
      
      if(session.getAttribute("nonmemname") != null) {
         commandMap.put("MEMBER_NAME", session.getAttribute("nonmemname"));
         
      }
         
      mv.setViewName("redirect:/cart/list");
      
      return mv;
   }*/
   
   //회원,비회원 카트->오더 한개 추가  (장바구니에있는값으로 가져간다.)
   /*   @RequestMapping(value = "/cart/OnetoPayment")
      public ModelAndView cartAddtoPayment(CommandMap commandMap, HttpServletRequest request) throws Exception {
         ModelAndView mv = new ModelAndView("/order/paymentForm");
         HttpSession session = request.getSession();
         
         //회원일때 
         if(session.getAttribute("idSession") != null) {
            commandMap.put("MEMBER_ID", session.getAttribute("idSession"));
            
            
            String cart_No[]=request.getParameterValues("CART_NO");
            System.out.println("받아오는 카트 NO 값 >>");
            for(int i=0;i<cart_No.length;i++) {
               System.out.println("cart_No"+i+":"+cart_No[i]);
            }   
            commandMap.put("cart_No", cart_No);
            session.setAttribute("CART_NO", commandMap.get("cart_No"));
            
            List<Map<String, Object>> checkedCartList = new ArrayList<Map<String, Object>>();
            
            checkedCartList=cartlistService.checkedCartList(commandMap.getMap());
            
            mv.addObject("list", checkedCartList);
            return mv;
            

         } else {
            
            if (request.getParameterValues("CART_NO") != null) {
               cartArr = request.getParameterValues("CART_NO");
            } 
            List<Map<String, Object>> sessionCheckedCartList = new ArrayList<Map<String, Object>>();
            for (int i = 0; i < sessionCartlist.size(); i++) {
               for (int j = 0; j < cartArr.length; j++) {
                  if (sessionCartlist.get(i).get("CART_NO").equals(Integer.parseInt(cartArr[j]))) {
                     sessionCheckedCartList.add(sessionCartlist.get(i));

                  }
               }
            }
            System.out.println("sessionCheckedCartList" + sessionCheckedCartList);

            mv.addObject("list", sessionCheckedCartList);
            mv.addObject("MEMBER_NAME", session.getAttribute("memname"));
            return mv;
         }
      }
   */
   
   
   
}


         


         
   