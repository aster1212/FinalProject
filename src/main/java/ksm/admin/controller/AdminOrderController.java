package ksm.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ksm.admin.service.AdminOrderService;
import ksm.common.common.CommandMap;

import javax.servlet.http.HttpServletRequest;
import ksm.common.utils.PagingUtils;

@Controller
public class AdminOrderController {
   
   Logger log = Logger.getLogger(this.getClass());

   //Autowired로 지정할 수도 있지만, 동일한 객체가 여러개 올라가면 문제가 되므로,  @Resouce를 이용해 ID로 지정
   @Resource(name="adminOrderService")
   private AdminOrderService adminOrderService;
   
   @Resource(name="pagingUtils")
   private PagingUtils pagingUtils;
  
   //전체 주문 목록
   @RequestMapping(value="/admin/orderList")
   public ModelAndView orderList(CommandMap commandMap, HttpServletRequest request) throws Exception{
   
       ModelAndView mv = new ModelAndView("adminOrderList.admin");
       
             List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
             commandMap.put("status", 1);
         
             list = adminOrderService.selectOrderList(commandMap.getMap());
             
             //검색어 있을 시
             if(commandMap.get("keyword")==null)
            list = adminOrderService.selectOrderList(commandMap.getMap());
             else                   //여기선 전체검색
            list = adminOrderService.searchAll(commandMap.getMap());

             // paging
             List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
             resList = pagingUtils.cutList(request, list);
             String paging = pagingUtils.getHtmlStr(request, list,"/admin/orderList");
             mv.addObject("List",resList);
             mv.addObject("paging",paging);
             mv.addObject("nowPage",pagingUtils.getNowPage());

             mv.addObject("keyword",commandMap.get("keyword"));
             mv.addObject("TITLE","관리자 주문관리");

             return mv;
   }
   
   //교환목록
   @RequestMapping(value="/admin/exchangeList")
   public ModelAndView exchangeList(CommandMap commandMap, HttpServletRequest request) throws Exception{
   
       ModelAndView mv = new ModelAndView("adminExchangeList.admin");
             List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
             commandMap.put("status", 1);
             commandMap.put("ORDER_STATE", 5);
             commandMap.put("ORDER_STATE2", 5);
             commandMap.put("ORDER_STATE3", 5);
         
             list = adminOrderService.processingList(commandMap.getMap());
             
             //검색어 있을 시
             if(commandMap.get("keyword")==null)
            list = adminOrderService.processingList(commandMap.getMap());
             else 
            list = adminOrderService.searchOrder(commandMap.getMap());

             // paging
             List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
             resList = pagingUtils.cutList(request, list);
             String paging = pagingUtils.getHtmlStr(request, list,"/admin/exchangeList");
             mv.addObject("List",resList);
             mv.addObject("paging",paging);
             mv.addObject("nowPage",pagingUtils.getNowPage());
             
             mv.addObject("ORDER_STATE", commandMap.get("ORDER_STATE"));
             mv.addObject("keyword",commandMap.get("keyword"));
             return mv;
   }
   
   //환불목록
   @RequestMapping(value="/admin/refundList")
   public ModelAndView refundList(CommandMap commandMap, HttpServletRequest request) throws Exception{
   
       ModelAndView mv = new ModelAndView("adminRefundList.admin");
             List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
             commandMap.put("status", 1);
             commandMap.put("ORDER_STATE", 6);
             commandMap.put("ORDER_STATE2", 6);
             commandMap.put("ORDER_STATE3", 6);
             
             list = adminOrderService.processingList(commandMap.getMap());
             
             //검색어 있을 시
             if(commandMap.get("keyword")==null)
            list = adminOrderService.processingList(commandMap.getMap());
             else 
            list = adminOrderService.searchOrder(commandMap.getMap());

             // paging
             List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
             resList = pagingUtils.cutList(request, list);
             String paging = pagingUtils.getHtmlStr(request, list,"/admin/refundList");
             mv.addObject("List",resList);
             mv.addObject("paging",paging);
             mv.addObject("nowPage",pagingUtils.getNowPage());
             
             mv.addObject("ORDER_STATE", commandMap.get("ORDER_STATE"));
             mv.addObject("keyword",commandMap.get("keyword"));

             return mv;
   }
   
   //교환 + 환불 + 주문처리 완료 목록
   @RequestMapping(value="/admin/completeList")
   public ModelAndView completeList(CommandMap commandMap, HttpServletRequest request) throws Exception{
   
       ModelAndView mv = new ModelAndView("adminCompleteList.admin");
             List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
             commandMap.put("status", 1);
             commandMap.put("ORDER_STATE", 4);
             commandMap.put("ORDER_STATE2", 7);
             commandMap.put("ORDER_STATE3", 8);
             
             list = adminOrderService.processingList(commandMap.getMap());
             
             //검색어 있을 시
             if(commandMap.get("keyword")==null)
            list = adminOrderService.processingList(commandMap.getMap());
             else 
            list = adminOrderService.searchOrder(commandMap.getMap());

             // paging
             List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
             resList = pagingUtils.cutList(request, list);
             String paging = pagingUtils.getHtmlStr(request, list,"/admin/completeList");
             mv.addObject("List",resList);
             mv.addObject("paging",paging);
             mv.addObject("nowPage",pagingUtils.getNowPage());
             
             mv.addObject("ORDER_STATE", commandMap.get("ORDER_STATE"));
             mv.addObject("keyword",commandMap.get("keyword"));

             return mv;
   }
   
   
   @RequestMapping(value="/admin/orderDetail")
   public ModelAndView orderDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
       ModelAndView mv = new ModelAndView("adminOrderDetail.admin");
       
       commandMap.put("ORDER_NO",commandMap.get("ORDER_NO"));
         Map<String, Object> map = adminOrderService.orderDetail(commandMap.getMap());
         mv.addObject("Detail", map);

         List<Map<String,Object>> list = (List<Map<String, Object>>) adminOrderService.orderDetail2(commandMap.getMap());
          mv.addObject("list", list);
          
/*         String MEMBER_ID="";
         if(request.getSession().getAttribute("MEMBER_ID")!=null) {
            MEMBER_ID=(String) request.getSession().getAttribute("MEMBER_ID");
         }
         
         mv.addObject("MEMBER_ID",MEMBER_ID);*/
         
         
         return mv;
       
   }
   
   //주문 수정 처리
   @RequestMapping(value="/admin/orderUpdate")
   public ModelAndView orderUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {

      ModelAndView mv = new ModelAndView("redirect:/admin/orderList");
      
      System.out.println("받아온 order_state의 값 : " + commandMap.get("ORDER_STATE").toString());
      commandMap.put("ORDER_NO", commandMap.get("ORDER_NO"));
      commandMap.put("ORDER_STATE", commandMap.get("ORDER_STATE"));
      commandMap.put("ORDERITEM_STATE", commandMap.get("ORDERITEM_STATE"));
      
      adminOrderService.orderUpdate(commandMap.getMap());
      adminOrderService.orderUpdate2(commandMap.getMap());
      
      return mv;
   }
   
   //주문 삭제
   @RequestMapping(value="/admin/orderDelete")
   public ModelAndView deleteOrder(CommandMap commandMap) throws Exception{
      ModelAndView mv = new ModelAndView("redirect:/admin/orderList");
      
      adminOrderService.orderDelete(commandMap.getMap());
      adminOrderService.orderDelete2(commandMap.getMap());
      
      return mv;
   }

   //이번년도 매출
   @RequestMapping(value="/admin/saleState")
   public ModelAndView saleState(CommandMap commandMap) throws Exception{
   
       ModelAndView mv = new ModelAndView("adminSaleState.admin");
       
       List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
       list = adminOrderService.salesPerMonth(commandMap.getMap());
       
       long maxMoney = 0;
       long[] stateArray = new long[list.size()];
       int i = 0;
       for (Map<String, Object> map : list) {
         long tempInt = Long.parseLong(String.valueOf(map.get("SUMRESULT")));
         
         if( tempInt > maxMoney)
            maxMoney = tempInt;
         
         stateArray[i] = tempInt;
         i++;
      }
       
       
       // string
       String str = maxMoney+"";
       long graphMaxSize = 1;
       for(int j=0;j<str.length();j++) {
          graphMaxSize *= 10;
       }
       

       // max money String
       long[] graphYArray = new long[11];
       graphYArray[0] = 0;
       for(int ai = 1; ai < graphYArray.length; ai++) {
          long tempLong = (long)(graphMaxSize * ai)/10;
          graphYArray[ai] = tempLong;
       }
       mv.addObject("graphYArray",graphYArray);
       
       
       mv.addObject("graphMaxSize",graphMaxSize);
       mv.addObject("stateArray",stateArray);
       
       mv.addObject("list",list);
       
      return mv;
   }

   //인기아이템 목록 
   @RequestMapping(value="/admin/hotItemList")
   public ModelAndView hotItemList(CommandMap commandMap) throws Exception{
   
       ModelAndView mv = new ModelAndView("adminHotItemList.admin");
       
       //월별, 년별, 전체 목록
      List<Map<String,Object>> thisMonthList = new ArrayList<Map<String,Object>>();
      List<Map<String,Object>> lastMonthList = new ArrayList<Map<String,Object>>();
      List<Map<String,Object>> thisYearList = new ArrayList<Map<String,Object>>();
      List<Map<String,Object>> lastYearList = new ArrayList<Map<String,Object>>();
      List<Map<String,Object>> entireList = new ArrayList<Map<String,Object>>();
   
      CommandMap map1 = new CommandMap();
      CommandMap map2 = new CommandMap();
      CommandMap map3 = new CommandMap();
      CommandMap map4 = new CommandMap();

      map1.put("INPUTNUM", (int) 0);
      map1.put("INPUTNUM2", (int) 1);
      
      map2.put("INPUTNUM", (int)-1);
      map2.put("INPUTNUM2", (int)0);
      
      map3.put("INPUTNUM", (int)-11);
      map3.put("INPUTNUM2", (int)1);
      
      map4.put("INPUTNUM", (int)-23);
      map4.put("INPUTNUM2", (int)-11);
      
      thisMonthList = adminOrderService.hotItemListPeriod(map1.getMap());
      lastMonthList = adminOrderService.hotItemListPeriod(map2.getMap());
      thisYearList = adminOrderService.hotItemListPeriod(map3.getMap());
      lastYearList = adminOrderService.hotItemListPeriod(map4.getMap());
      entireList = adminOrderService.hotItemList(commandMap.getMap());
      
      mv.addObject("thisMonthList", thisMonthList);
      mv.addObject("lastMonthList", lastMonthList);
      mv.addObject("thisYearList", thisYearList);
      mv.addObject("lastYearList", lastYearList);
      mv.addObject("entireList", entireList);
      
      return mv;
          
             
   }
}