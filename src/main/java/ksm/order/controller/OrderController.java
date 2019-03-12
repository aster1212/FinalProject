package ksm.order.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ksm.admin.service.AdminOrderService;
import ksm.common.common.CommandMap;
import ksm.common.utils.MemberGradeCoupon;
import ksm.member.service.MemberService;
import ksm.order.service.CartlistService;
import ksm.order.service.OrderService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class OrderController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	//같이 추가해야할 Resource
	@Resource(name="orderService")
	private OrderService orderService;

	@Resource(name="memberService")
	private MemberService memberService;
	
	@Resource(name = "cartService")
	private CartlistService cartlistService;
	
	@Resource(name="GradeUtils")
	private MemberGradeCoupon GradeUtils;
	
	
	//주문폼
	@RequestMapping(value="/order/paymentForm")
	public ModelAndView paymentForm(HttpServletRequest request, CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("paymentForm.order");
		
		HttpSession session = request.getSession();
		List<Map<String, Object>> sessionCartlist = new ArrayList<Map<String, Object>>();
		String cartArr[] = null;
		int cartNo=0;

		//회원일때 
		if(session.getAttribute("idSession") != null) {
			
			String id = (String) session.getAttribute("idSession");
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
					
	   		//카트 넘겨주기
	   		CommandMap mapForPaymentList = new CommandMap();
	   		CommandMap mapForCartNoList = new CommandMap();
			String cart_No[]=request.getParameterValues("CART_NO");
			
			List<Map<String, Object>> checkedCartList = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> cartNoList = new ArrayList<Map<String, Object>>();
			for(int i=0;i<cart_No.length;i++) {
				mapForPaymentList.put("CART_NO", cart_No[i]);
				mapForPaymentList.put("MEMBER_ID", id);
				checkedCartList.add(cartlistService.checkedCartList(mapForPaymentList.getMap()));
				mapForCartNoList.put("CART_NO", cart_No[i]);
				cartNoList.add(mapForCartNoList.getMap());
			}	
			System.out.println("체크드리스트 의 값 = "+checkedCartList.toString());
			
			mv.addObject("cartList", checkedCartList);
			mv.addObject("cartNoList", cartNoList);
			
			return mv;
			
			
			//비회원일때
		} else {
	         
	         List<Map<String,Object>> ItemList =(List<Map<String,Object>>) session.getAttribute("sessionCartList");
	         List<Map<String, Object>> sessionCheckedCartList = new ArrayList<Map<String, Object>>();
	         
	         
	         for(int i=0; i<ItemList.size(); i++) {
	            CommandMap mapForPaymentList = new CommandMap();
	            
	            System.out.println(i+ "번쨰로 넘겨주는 값");
	            System.out.println("가격  : " + ItemList.get(i).get("ITEM_PRICE"));
	            System.out.println("수량" +ItemList.get(i).get("ITEM_COUNT"));
	            System.out.println("item_no " +ItemList.get(i).get("ITEM_NO"));
	            System.out.println("item_name " + ItemList.get(i).get("ITEM_NAME"));
	            System.out.println("cart_no " + ItemList.get(i).get("CART_NO"));
	            System.out.println("MEMBER_NAME : " +ItemList.get(i).get("MEMBER_NAME"));
	            System.out.println("ITEM_SHORTPATH : " +ItemList.get(i).get("ITEM_SHORTPATH"));
	              String option = (String) ItemList.get(i).get("CART_OPTION");
	                 StringTokenizer str = new StringTokenizer(option, ",");
	                 String[] array = new String[str.countTokens()];
	                  int j = 0;
	                  while (str.hasMoreElements()) {array[j++] = str.nextToken();}
	                  for(int k=0;k<array.length;k++)
	                  {
	                     System.out.println(array[k]);
	                    if(k==0) { mapForPaymentList.put("ITEM_SIZE", array[k]);}
	                 if(k==1) {mapForPaymentList.put("ITEM_OPTION", array[k]);}
	                 if(k==2) {mapForPaymentList.put("ITEM_COLOR", array[k]);}
	                  }
	            
	            mapForPaymentList.putAll(ItemList.get(i));

	            sessionCheckedCartList.add(mapForPaymentList.getMap());
	            System.out.println(i + "번째 sessionCheckedCartList = " + sessionCheckedCartList.toString());
	               
	            }
	         
	         mv.addObject("cartList", sessionCheckedCartList);
	         /*session.invalidate();*/
	         //세션삭제
	         return mv;
	      
	      }
	}
	
	//주문처리
	@SuppressWarnings("unused")
	@RequestMapping(value="/order/payment")
	public ModelAndView payment(CommandMap commandMap,HttpServletRequest request, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("forward:/order/checkList");
		int ORDERITEM_STATE = 1;
		String ORDER_NO = null;
		String MEMBER_ID =null;
		CommandMap map2 = new CommandMap();
		CommandMap mapForStock = new CommandMap();
		String ORDER_NAME =  commandMap.get("ORDER_NAME").toString();
		String ORDER_PHONE =  commandMap.get("ORDER_PHONE").toString();
		String ORDER_EMAIL =  commandMap.get("ORDER_EMAIL").toString();
		
		System.out.println("받아온 memId : " +commandMap.get("MEMBER_ID").toString());
		//비회원일경우
		if(commandMap.get("MEMBER_ID")==null || commandMap.get("MEMBER_ID")=="") 
			MEMBER_ID =  "none";
		
		else 
			MEMBER_ID =  commandMap.get("MEMBER_ID").toString();

		String ORDER_TOTALPAYMENT = commandMap.get("finalTotal").toString();
		int ORDER_STATE =  1;
		String ORDER_ADDR =  null;
		
		String ORDER_ADDR1 = commandMap.get("ORDER_ADDR1").toString();//zipcode
		String ORDER_ADDR2 = commandMap.get("ORDER_ADDR2").toString();//기본주소
		String ORDER_ADDR3 = commandMap.get("ORDER_ADDR3").toString();//상세주소
		String ORDER_ADDR4 = null;//참고항목
		
		//참고항목은 생략될 수도 있으므로 존재할시에만 받아옴
		if(commandMap.get("ORDER_ADDR1").toString()!=null) {
		ORDER_ADDR4 = commandMap.get("ORDER_ADDR4").toString();
		}
		
		ORDER_ADDR = ("("+ORDER_ADDR1+")"+ORDER_ADDR2+" "+ORDER_ADDR3+ORDER_ADDR4);
		
		map2.put("ORDER_NAME", ORDER_NAME);
		map2.put("ORDER_ADDR", ORDER_ADDR);
		map2.put("ORDER_PHONE", ORDER_PHONE);
		map2.put("ORDER_EMAIL", ORDER_EMAIL);
		map2.put("MEMBER_ID", MEMBER_ID);
		map2.put("ORDER_STATE", ORDER_STATE);
		map2.put("ORDER_TOTALPAYMENT", ORDER_TOTALPAYMENT);
		map2.put("ORDER_PAYMENT", 1);
		orderService.insertOrder(map2.getMap());
		
		//방금 insert한 order의 Order_NO 불러오기
		Map<String, Object> map3 = null;
		map3 = orderService.selectOrderNo(map3);
		ORDER_NO = map3.get("ORDER_NO").toString();
		
		//아이템이 한개 이상일 때
		if(Integer.parseInt(commandMap.get("STATCOUNT").toString()) > 1) {
		String[] ORDERITEM_NAME = (String[]) commandMap.get("ORDERITEM_NAME");
		String[] ORDERITEM_COUNT = (String[]) commandMap.get("ORDERITEM_COUNT");
		String[] ORDERITEM_SIZE = (String[]) commandMap.get("ORDERITEM_SIZE");
		String[] ORDERITEM_OPTION = (String[]) commandMap.get("ORDERITEM_OPTION");
		String[] ORDERITEM_COLOR = (String[]) commandMap.get("ORDERITEM_COLOR");
		String[] ORDERITEM_PRICE = (String[]) commandMap.get("ORDERITEM_PRICE");
		String[] ITEM_NO = (String[]) commandMap.get("ITEM_NO");
		
		for(int i=0; i<ORDERITEM_NAME.length; i++) {
			CommandMap map = new CommandMap();
			map.put("ORDERITEM_NAME", ORDERITEM_NAME[i]);
			map.put("ORDERITEM_COUNT", ORDERITEM_COUNT[i]);
			map.put("ORDERITEM_SIZE", ORDERITEM_SIZE[i]);
			map.put("ORDERITEM_OPTION", ORDERITEM_OPTION[i]);
			map.put("ORDERITEM_COLOR", ORDERITEM_COLOR[i]);
			map.put("ORDERITEM_PRICE", ORDERITEM_PRICE[i]);	
			map.put("ITEM_NO", ITEM_NO[i]);	
			map.put("ORDERITEM_STATE", ORDERITEM_STATE);
			map.put("ORDER_NO", ORDER_NO);
			
			orderService.insertOrderDetail(map.getMap());
		}
		
		}else {
			String ORDERITEM_NAME =  commandMap.get("ORDERITEM_NAME").toString();
			String ORDERITEM_COUNT =  commandMap.get("ORDERITEM_COUNT").toString();
			String ORDERITEM_SIZE =  commandMap.get("ORDERITEM_SIZE").toString();
			String ORDERITEM_OPTION =  commandMap.get("ORDERITEM_OPTION").toString();
			String ORDERITEM_COLOR = commandMap.get("ORDERITEM_COLOR").toString();
			String ORDERITEM_PRICE =  commandMap.get("ORDERITEM_PRICE").toString();
			String ITEM_NO =  commandMap.get("ITEM_NO").toString();
			
				CommandMap map = new CommandMap();
				map.put("ORDERITEM_NAME", ORDERITEM_NAME);
				map.put("ORDERITEM_COUNT", ORDERITEM_COUNT);
				map.put("ORDERITEM_SIZE", ORDERITEM_SIZE);
				map.put("ORDERITEM_OPTION", ORDERITEM_OPTION);
				map.put("ORDERITEM_COLOR", ORDERITEM_COLOR);
				map.put("ORDERITEM_PRICE", ORDERITEM_PRICE);	
				map.put("ORDERITEM_STATE", ORDERITEM_STATE);
				map.put("ITEM_NO", ITEM_NO);
				map.put("ORDER_NO", ORDER_NO);
				orderService.insertOrderDetail(map.getMap());
				
				
		}
	
		
		//회원일 경우에만 아래의 쿠폰, 적립금 기능 사용 가능
		if(MEMBER_ID!="none") {
			
		//회원 주문총액 갱신
		CommandMap map6 = new CommandMap();
		map6.put("MEMBER_TOTAL2", ORDER_TOTALPAYMENT);
		map6.put("MEMBER_ID", MEMBER_ID);
		memberService.updateMemberTotal2(map6.getMap());
		GradeUtils.GradeCheck(commandMap, request);
		
			
		//주문된 CART목록 삭제
		String cart_No[]=request.getParameterValues("CART_NO");
		CommandMap map7 = new CommandMap();
		for(int i=0;i<cart_No.length;i++) {
			System.out.println("받아온 배열의 값 : " + cart_No[i]);
			map7.put("MEMBER_ID", MEMBER_ID);
			map7.put("CART_NO", cart_No[i]);
			cartlistService.deleteCartlistByNo(map7.getMap());
		}
			
		//orderDetail(상품상세정보) 입력
		 commandMap.put("ORDER_NO",ORDER_NO);
		 commandMap.put("ORDER_STATE",1);
		 mv.addObject("ORDER_NO", ORDER_NO);
		 mv.addObject("ORDER_STATE",1);
		 
		 //적립금이 0원일 때
		 CommandMap map4 = new CommandMap();
		 if(commandMap.get("usedPoint").toString()=="") {
			 int usedPoint = 0;
			 int savingPoint =Integer.parseInt(commandMap.get("savingPoint").toString());
			 int MEMBER_TOTAL = Integer.parseInt(commandMap.get("orignPoint").toString());
			 MEMBER_TOTAL = (MEMBER_TOTAL +savingPoint - usedPoint);
			 MEMBER_ID = commandMap.get("MEMBER_ID").toString();
			 map4.put("MEMBER_TOTAL", MEMBER_TOTAL);
			 map4.put("MEMBER_ID", MEMBER_ID);
			 memberService.updateMemberTotal(map4.getMap());
		 
			 //그렇지 않을 때 - 적립금이 0원 이상일 때
		 }else {
			 int usedPoint =Integer.parseInt(commandMap.get("usedPoint").toString());
			 int savingPoint =Integer.parseInt(commandMap.get("savingPoint").toString());
			 int MEMBER_TOTAL = Integer.parseInt(commandMap.get("orignPoint").toString());
			 MEMBER_TOTAL = (MEMBER_TOTAL +savingPoint - usedPoint);
			 MEMBER_ID = commandMap.get("MEMBER_ID").toString();
			 map4.put("MEMBER_TOTAL", MEMBER_TOTAL);
			 map4.put("MEMBER_ID", MEMBER_ID);
			 memberService.updateMemberTotal(map4.getMap());
		 }
		 
		 //쿠폰적용시
		 if(commandMap.get("COU_NO")!=null) {
		CommandMap map5 = new CommandMap();
		 String COU_NO = commandMap.get("COU_NO").toString();
		 MEMBER_ID = commandMap.get("MEMBER_ID").toString();
		 System.out.println("COU_NO를 찍어보자! : "+COU_NO);
		 map5.put("COU_NO", COU_NO);
		 map5.put("MEMBER_ID", MEMBER_ID);
		 memberService.updateCouponState(map5.getMap());
		 }
		 
		 //비회원이면 세션 날려버리기
		}else {
			session.invalidate();
		}
		
		return mv;
	}
	
	
	
	@RequestMapping(value="/order/checkList")
	public ModelAndView checkList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("orderCheckList.order");
		
		String ORDER_STATE = String.valueOf(commandMap.get("ORDER_STATE"));
	
		
			//교환의 경우
		if(commandMap.get("ORDER_EXCHANGE")!=null) {
   			String ORDER_EXCHANGE = commandMap.get("ORDER_EXCHANGE").toString();
   			String ORDER_NO = commandMap.get("ORDER_NO").toString();
   			ORDER_STATE = commandMap.get("ORDER_STATE").toString();
   			
   			commandMap.put("ORDER_EXCHANGE", ORDER_EXCHANGE);
   	   		commandMap.put("ORDER_NO", ORDER_NO);
   	   		commandMap.put("ORDER_STATE", ORDER_STATE);
   	   		
   	   		mv.addObject("ORDER_NO",commandMap.get("ORDER_NO"));
   	   		mv.addObject("ORDER_STATE",commandMap.get("ORDER_STATE"));
   			mv.addObject("ORDER_EXCHANGE",commandMap.get("ORDER_EXCHANGE"));
   	   		
		}else if(ORDER_STATE.equals("6")){ //환불
   			
   			ORDER_STATE = commandMap.get("ORDER_STATE").toString();
   			String ORDER_NO = commandMap.get("ORDER_NO").toString();
   	   		commandMap.put("ORDER_NO", ORDER_NO);
   	   		commandMap.put("ORDER_STATE", ORDER_STATE);
   	   		
   	   		mv.addObject("ORDER_NO",commandMap.get("ORDER_NO"));
   	   		mv.addObject("ORDER_STATE",commandMap.get("ORDER_STATE"));
   	   		
   	   		
		}else {
			//주문이 완료된 경우
			Map<String, Object> map3 = null;
			map3 = orderService.selectOrderNo(map3);
			String ORDER_NO = map3.get("ORDER_NO").toString();
			System.out.println("받아온 ORDER_NO 값 : "+ ORDER_NO);
			
			CommandMap map1 = new CommandMap();
			map1.put("ORDER_NO", ORDER_NO );
			commandMap.put("ORDER_NO", ORDER_NO);
			
			Map<String, Object> map = orderService.orderDetail(map1.getMap());
			mv.addObject("Detail", map);
			mv.addObject("ORDER_STATE",1);
			mv.addObject("ORDER_NO",ORDER_NO);
		}
		
		return mv;
		
		}
	
	   //교환처리폼
	   @RequestMapping(value="/order/exchangeForm")
	   public ModelAndView exchangeForm(HttpServletRequest request,CommandMap commandMap) throws Exception{
	      ModelAndView mv = new ModelAndView("exchangeForm.order");
	      
	       
	       commandMap.put("ORDER_NO", request.getParameter("order_no"));
	       
	         Map<String, Object> map = orderService.orderDetail(commandMap.getMap());
	         mv.addObject("Detail", map);
	         
	         List<Map<String,Object>> list = (List<Map<String, Object>>) orderService.orderDetail2(commandMap.getMap());
	         mv.addObject("list", list);
	         
	      return mv;
	   }
	   
	   //교환처리
	   @RequestMapping(value="/order/exchange")
	   public ModelAndView exchange(CommandMap commandMap) throws Exception{
	      ModelAndView mv = new ModelAndView("forward:/order/checkList");
	      
	      System.out.println("받아온값 1 : " + commandMap.get("ORDER_NO"));
	      System.out.println("받아온값 2 : " + commandMap.get("ORDER_STATE"));
	      System.out.println("받아온값 3 : " + commandMap.get("ORDER_EXCHANGE"));
	      
	       commandMap.put("ORDER_NO",commandMap.get("ORDER_NO"));
	       commandMap.put("ORDER_STATE",commandMap.get("ORDER_STATE"));
	       commandMap.put("ORDER_EXCHANGE",commandMap.get("ORDER_EXCHANGE"));
	       
	       CommandMap map = new CommandMap();
	       map.put("ORDER_NO",commandMap.get("ORDER_NO"));
	       map.put("ORDER_STATE",commandMap.get("ORDER_STATE"));
	       
	         orderService.exchange(commandMap.getMap());
	         orderService.updateDetail(map.getMap());
	         
	      return mv;
	   }
	   

	   

	   
	   //환불처리폼
	   @RequestMapping(value="/order/refundForm")
	   public ModelAndView refundForm(HttpServletRequest request,CommandMap commandMap) throws Exception{
	      ModelAndView mv = new ModelAndView("refundForm.order");
	      
	       commandMap.put("ORDER_NO",request.getParameter("order_no"));
	       
	         Map<String, Object> map = orderService.orderDetail(commandMap.getMap());
	         mv.addObject("Detail", map);
	         
	         List<Map<String,Object>> list = (List<Map<String, Object>>) orderService.orderDetail2(commandMap.getMap());
	         mv.addObject("list", list);
	         
	      return mv;
	   }
	   
	   //환불처리
	   @RequestMapping(value="/order/refund")
	   public ModelAndView refund(CommandMap commandMap) throws Exception{
	      ModelAndView mv = new ModelAndView("forward:/order/checkList");
	      
	       commandMap.put("ORDER_NO",commandMap.get("ORDER_NO"));
	       commandMap.put("ORDER_STATE",commandMap.get("ORDER_STATE"));
	       
	         orderService.refund(commandMap.getMap());
	         orderService.updateDetail(commandMap.getMap());
	      return mv;
	   }
}
