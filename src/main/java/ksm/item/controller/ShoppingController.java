package ksm.item.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.*;
import org.eclipse.core.internal.resources.File;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ksm.common.common.CommandMap;
import ksm.common.utils.AllFilePath;
import ksm.common.utils.PagingUtils;
import ksm.item.dao.ShoppingDAO;
import ksm.item.service.ShoppingService;


@Controller
public class ShoppingController {
   Logger log=Logger.getLogger(this.getClass());
   
   //ShoppingService shoppingService;
   
   @Resource(name="shoppingService")
   private ShoppingService shoppingService;
   
   @Resource(name="pagingUtils")
   PagingUtils pagingUtils;
   
   
   @RequestMapping(value="/item/manList")
   public ModelAndView selectItemManList(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv=new ModelAndView("manitemList.item");
      
      List<Map<String,Object>> list=shoppingService.selectItemManList(commandMap.getMap());
      
      // paging
      List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
      resList = pagingUtils.cutList(request, list,9,5);
      String paging = pagingUtils.getHtmlStr(request, list,9,5,"item/manList");
      mv.addObject("list",resList);
      mv.addObject("paging",paging);
      mv.addObject("nowPage",pagingUtils.getNowPage());
            
      return mv;
   }
   
   //상의
   @RequestMapping(value="/item/manUpList")
   public ModelAndView selectManUpList(CommandMap commandMap, HttpServletRequest request) throws Exception {
	   ModelAndView mv=new ModelAndView("manitemuplist.item");
	   
	   List<Map<String,Object>> manuplist=shoppingService.selectManUpList(commandMap.getMap());
	   mv.addObject("manuplist",manuplist);
	   // manuplist paging
	   List<Map<String,Object>> resList2 = new ArrayList<Map<String,Object>>();
	   resList2 = pagingUtils.cutList(request, manuplist,9,5);
	   String manuplistpaging = pagingUtils.getHtmlStr(request, manuplist,9,5,"item/manUpList");
	   mv.addObject("manuplist",resList2);
	   mv.addObject("manuplistpaging",manuplistpaging);
	   mv.addObject("nowPage",pagingUtils.getNowPage());
	   
	   mv.addObject("searchStr",commandMap.get("searchStr"));
	   
	   return mv;
   }
	 	//남자셔츠
	   @RequestMapping(value="/item/manMidList")
	   public ModelAndView selectManMidList(CommandMap commandMap, HttpServletRequest request) throws Exception {
	   ModelAndView mv=new ModelAndView("manitemuplist.item");
	   
	   List<Map<String,Object>> manmidlist=shoppingService.selectManMidList(commandMap.getMap());
	   mv.addObject("manmidlist",manmidlist);
	   // manmidlist paging
	   List<Map<String,Object>> resList4 = new ArrayList<Map<String,Object>>();
	   resList4 = pagingUtils.cutList(request, manmidlist,9,5);
	   String manmidlistpaging = pagingUtils.getHtmlStr(request, manmidlist,9,5,"item/manMidList");
	   mv.addObject("manmidlist",resList4);
	   mv.addObject("manmidlistpaging",manmidlistpaging);
	   mv.addObject("nowPage",pagingUtils.getNowPage());
	   
	   mv.addObject("searchStr",commandMap.get("searchStr"));
	   
	   return mv;
   }
	 //남자하의
	   @RequestMapping(value="/item/manDownList")
	   public ModelAndView selectManDownList(CommandMap commandMap, HttpServletRequest request) throws Exception {
	   ModelAndView mv=new ModelAndView("manitemdownlist.item");
	   
	   List<Map<String,Object>> mandownlist=shoppingService.selectManDownList(commandMap.getMap());
	   mv.addObject("mandownlist",mandownlist);
	// mandownlist paging
	      List<Map<String,Object>> resList3 = new ArrayList<Map<String,Object>>();
	      resList3 = pagingUtils.cutList(request, mandownlist,9,5);
	      String mandownlistpaging = pagingUtils.getHtmlStr(request, mandownlist,9,5,"item/manDownList");
	      mv.addObject("mandownlist",resList3);
	      mv.addObject("mandownlistpaging",mandownlistpaging);
	      mv.addObject("nowPage",pagingUtils.getNowPage());
	   
	   mv.addObject("searchStr",commandMap.get("searchStr"));
	   
	   return mv;
   }
	   @RequestMapping(value="/item/shoesManList")
	   public ModelAndView selectShoesManList(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv=new ModelAndView("shoesmanlist.item");
      
      List<Map<String,Object>> manlist=shoppingService.selectShoesManList(commandMap.getMap());
      mv.addObject("manlist",manlist);
      
      // manlist paging
      List<Map<String,Object>> resList3 = new ArrayList<Map<String,Object>>();
      resList3 = pagingUtils.cutList(request, manlist,9,5);
      String manlistpaging = pagingUtils.getHtmlStr(request, manlist,9,5,"item/shoesManList");
      mv.addObject("manlist",resList3);
      mv.addObject("manlistpaging",manlistpaging);
      mv.addObject("nowPage",pagingUtils.getNowPage());
       
      mv.addObject("searchStr",commandMap.get("searchStr"));
      
      return mv;
   }
	   
	   @RequestMapping(value="/item/womanList")
   		public ModelAndView selectItemWomanList(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv=new ModelAndView("womanitemList.item");
      
      List<Map<String,Object>> list=shoppingService.selectItemWomanList(commandMap.getMap());
      mv.addObject("list",list);
      
      // paging
      List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
      resList = pagingUtils.cutList(request, list,9,5);
      String paging = pagingUtils.getHtmlStr(request, list,9,5,"item/womanList");
      mv.addObject("list",resList);
      mv.addObject("paging",paging);
      mv.addObject("nowPage",pagingUtils.getNowPage());
                  
            
      mv.addObject("searchStr",commandMap.get("searchStr"));
      
      return mv;
   }
	   @RequestMapping(value="/item/womanUpList")
  		public ModelAndView selectWomanUpList(CommandMap commandMap, HttpServletRequest request) throws Exception {
     ModelAndView mv=new ModelAndView("womanitemuplist.item");
     
     List<Map<String,Object>> womanuplist=shoppingService.selectWomanUpList(commandMap.getMap());
     mv.addObject("womanuplist",womanuplist);
               
     // womanuplist paging
     List<Map<String,Object>> resList2 = new ArrayList<Map<String,Object>>();
     resList2 = pagingUtils.cutList(request, womanuplist,9,5);
     String womanuplistpaging = pagingUtils.getHtmlStr(request, womanuplist,9,5,"item/womanUpList");
     mv.addObject("womanuplist",resList2);
     mv.addObject("womanuplistpaging",womanuplistpaging);
     mv.addObject("nowPage",pagingUtils.getNowPage());

     mv.addObject("searchStr",commandMap.get("searchStr"));
     
     return mv;
  }
	   @RequestMapping(value="/item/womanMidList")
 		public ModelAndView selectWomanMidList(CommandMap commandMap, HttpServletRequest request) throws Exception {
    ModelAndView mv=new ModelAndView("womanitemmidlist.item");

    List<Map<String,Object>> womanmidlist=shoppingService.selectWomanMidList(commandMap.getMap());
    mv.addObject("womanmidlist",womanmidlist);	
    
    // womanmidlist paging
    List<Map<String,Object>> resList4 = new ArrayList<Map<String,Object>>();
    resList4 = pagingUtils.cutList(request, womanmidlist,9,5);
    String womanmidlistpaging = pagingUtils.getHtmlStr(request, womanmidlist,9,5,"item/womanMidList");
    mv.addObject("womanmidlist",resList4);
    mv.addObject("womanmidlistpaging",womanmidlistpaging);
    mv.addObject("nowPage",pagingUtils.getNowPage());
          
    mv.addObject("searchStr",commandMap.get("searchStr"));
    
    
    return mv;
 }
	   @RequestMapping(value="/item/womanDownList")
 		public ModelAndView selectWomanDownList(CommandMap commandMap, HttpServletRequest request) throws Exception {
    ModelAndView mv=new ModelAndView("womanitemdownlist.item");

    List<Map<String,Object>> womandownlist=shoppingService.selectWomanDownList(commandMap.getMap());
    mv.addObject("womandownlist",womandownlist);
              
    // womandownlist paging
    List<Map<String,Object>> resList3 = new ArrayList<Map<String,Object>>();
    resList3 = pagingUtils.cutList(request, womandownlist,9,5);
    String womandownlistpaging = pagingUtils.getHtmlStr(request, womandownlist,9,5,"item/womanDownList");
    mv.addObject("womandownlist",resList3);
    mv.addObject("womandownlistpaging",womandownlistpaging);
    mv.addObject("nowPage",pagingUtils.getNowPage());
    
    mv.addObject("searchStr",commandMap.get("searchStr"));
    return mv;
 }
	   @RequestMapping(value="/item/shoesWomanList")
	   public ModelAndView selectShoesWomanList(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv=new ModelAndView("shoeswomanlist.item");
      
      List<Map<String,Object>> womanlist=shoppingService.selectShoesWomanList(commandMap.getMap());
      mv.addObject("womanlist",womanlist);
      // womanlist paging
      List<Map<String,Object>> resList4 = new ArrayList<Map<String,Object>>();
      resList4 = pagingUtils.cutList(request, womanlist,9,5);
      String womanlistpaging = pagingUtils.getHtmlStr(request, womanlist,9,5,"item/shoeswomanlist");
      mv.addObject("womanlist",resList4);
      mv.addObject("womanlistpaging",womanlistpaging);
      mv.addObject("nowPage",pagingUtils.getNowPage());
            
      mv.addObject("searchStr",commandMap.get("searchStr"));
      
      return mv;
   }
   
   
   @RequestMapping(value="/item/accList")
   public ModelAndView selectAccList(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv=new ModelAndView("acclist.item");
      
      List<Map<String,Object>> acclist=shoppingService.selectAccList(commandMap.getMap());
      mv.addObject("acclist",acclist);
      
      // paging
      List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
      resList = pagingUtils.cutList(request, acclist,9,5);
      String paging = pagingUtils.getHtmlStr(request, acclist,9,5,"item/accList");
      mv.addObject("acclist",resList);
      mv.addObject("paging",paging);
      mv.addObject("nowPage",pagingUtils.getNowPage());
                  
      mv.addObject("searchStr",commandMap.get("searchStr"));
      
      return mv;
   }
   @RequestMapping(value="/item/detail")
   public ModelAndView itemDetail(CommandMap commandMap,HttpServletRequest request) throws Exception {
      ModelAndView mv=new ModelAndView("itemDetail.item");
      Map<String, Object> tempMap = commandMap.getMap();
      
      Map<String,Object> map=shoppingService.selectItemDetail(tempMap);
      System.out.println("나오나요값이?"+commandMap.getMap());
      mv.addObject("commentCategory",commandMap.get("commentCategory"));
      mv.addObject("map",map);
      
      // comment paging list
      
      // qna
      List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
      String paging = null;
      List<Map<String,Object>> qnalist=shoppingService.selectQnaList(tempMap);
      resList = pagingUtils.cutList(request, qnalist);
      paging = pagingUtils.getHtmlStr(request, qnalist,"item/detail?ITEM_NO="+commandMap.get("ITEM_NO"));
      mv.addObject("qnalist", resList);
      mv.addObject("qnaPaging",paging);
      
      // comment
      List<Map<String,Object>> commentlist=shoppingService.selectCommentList(tempMap);
      resList = pagingUtils.cutList(request, commentlist);
      paging = pagingUtils.getHtmlStr(request, commentlist,"item/detail?ITEM_NO="+commandMap.get("ITEM_NO"));
      mv.addObject("commentlist", resList);
      mv.addObject("commentPaging",paging);
      
      // photo
      List<Map<String,Object>> photocommentlist=shoppingService.selectPhotoCommentList(tempMap);
      resList = pagingUtils.cutList(request, photocommentlist);
      paging = pagingUtils.getHtmlStr(request, photocommentlist,"item/detail?ITEM_NO="+commandMap.get("ITEM_NO"));
      mv.addObject("photocommentlist", resList);
      mv.addObject("photoPaging",paging);
      
      String str = "C:\\spring\\app\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kingsman\\resources\\upload\\";
      mv.addObject("path",str);
      
      return mv;
   }
   @RequestMapping(value="/item/photoDelete")
   public ModelAndView deletePhotoDelete(CommandMap commandMap) throws Exception {
      ModelAndView mv=new ModelAndView("redirect:/item/detail?ITEM_NO="+commandMap.get("ITEM_NO"));
      
      shoppingService.deletePhotoDelete(commandMap.getMap());
      
      return mv;
   }
   @RequestMapping(value="/item/commentDelete")
   public ModelAndView deleteCommentDelete(CommandMap commandMap) throws Exception {
      ModelAndView mv=new ModelAndView("redirect:/item/detail?ITEM_NO="+commandMap.get("ITEM_NO"));
      mv.addObject("commentCategory",commandMap.get("commentCategory"));
      shoppingService.deleteCommentDelete(commandMap.getMap());
      
      return mv;
   }
   @RequestMapping(value="/item/qnaWrite")
   public ModelAndView itemQnaWrite(CommandMap commandMap) throws Exception {
      ModelAndView mv=new ModelAndView("redirect:/item/detail?ITEM_NO="+commandMap.get("ITEM_NO"));
      shoppingService.itemQnaWrite(commandMap.getMap());
      mv.addObject("commentCategory",commandMap.get("commentCategory"));
      return mv;
   }
   @RequestMapping(value="/item/commentWrite")
   public ModelAndView itemCommentWrite(CommandMap commandMap) throws Exception {
      ModelAndView mv=new ModelAndView("redirect:/item/detail?ITEM_NO="+commandMap.get("ITEM_NO"));
      System.out.println("나오나요값이?"+commandMap.getMap());
      mv.addObject("commentCategory",commandMap.get("commentCategory"));
      shoppingService.itemCommentWrite(commandMap.getMap());
      
      return mv;
   }
   @RequestMapping(value="/item/photoCommentWrite")
   public ModelAndView itemPhotoCommentWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv=new ModelAndView("redirect:/item/detail?ITEM_NO="+commandMap.get("ITEM_NO"));
      mv.addObject("commentCategory",commandMap.get("commentCategory"));
      shoppingService.itemPhotoCommentWrite(commandMap.getMap(), request);
      
      return mv;
   }
   @RequestMapping(value="/item/qnaUpdateForm")
   public ModelAndView itemQnaUpdateForm(CommandMap commandMap) throws Exception {
      ModelAndView mv=new ModelAndView("item/qnaUpdateForm");
      
      Map<String,Object> qna=shoppingService.selectQnaDetail(commandMap.getMap());
      mv.addObject("qna",qna);
      
      Map<String,Object> map=shoppingService.selectItemDetail(commandMap.getMap());
      mv.addObject("map",map);
      return mv;
   }
   @RequestMapping(value="/item/qnaUpdate")
      public ModelAndView updateQna(CommandMap commandMap) throws Exception{
         ModelAndView mv = new ModelAndView("item/qnaUpdate");
         
         /*boolean status =*/
         shoppingService.updateQna(commandMap.getMap());
         
         return mv;
      }
      
      public String makeParam(String name,String value) {
         return name+"="+value;
      }

      @RequestMapping(value="/item/UnifiedSearch")
      public ModelAndView SearchItemList(CommandMap commandMap,HttpServletRequest request) throws Exception
      {
         ModelAndView mav = new ModelAndView();
         
         String condition1 = request.getParameter("UnifiedSearch1");
         String condition2 = request.getParameter("UnifiedSearch2");
         String price1 = request.getParameter("ITEM_PRICE1");
         String price2 = request.getParameter("ITEM_PRICE2");
         System.out.println("조건1"+condition1+""+"조건2"+condition2+""+"가격"+price1+"~"+price2);
         if(condition1.equals("M"))
         {
            if(condition2.equals("JU"))
            {
               commandMap.put("item_gender", condition1);
               commandMap.put("item_type", condition2);
               commandMap.put("item_price1", price1);
               commandMap.put("item_price2", price2);
               List<Map<String,Object>> manuplist=shoppingService.selectSearchItemList(commandMap.getMap());
               mav.addObject("list",manuplist);
               mav.setViewName("manitemList.item");
            }
            else if(condition2.equals("JD"))
            {
               commandMap.put("item_gender", condition1);
               commandMap.put("item_type", condition2);
               commandMap.put("item_price1", price1);
               commandMap.put("item_price2", price2);
               List<Map<String,Object>> mandownlist=shoppingService.selectSearchItemList(commandMap.getMap());
               mav.addObject("list",mandownlist);
               mav.setViewName("manitemList.item");
            }
            else if(condition2.equals("JI"))
            {
               commandMap.put("item_gender", condition1);
                commandMap.put("item_type", condition2);
                commandMap.put("item_price1", price1);
                commandMap.put("item_price2", price2);
                List<Map<String,Object>> manmidlist=shoppingService.selectSearchItemList(commandMap.getMap());
                mav.addObject("list",manmidlist);
                mav.setViewName("manitemList.item");
            }
            else if(condition2.equals("JS"))
            {
               commandMap.put("item_gender", condition1);
                commandMap.put("item_type", condition2);
                commandMap.put("item_price1", price1);
                commandMap.put("item_price2", price2);
                List<Map<String,Object>> shoeslist=shoppingService.selectSearchItemList(commandMap.getMap());
                mav.addObject("shoeslist",shoeslist);
                mav.setViewName("shoeslist.item");
            }
            else
            {
               System.out.println("남자 에러.");
            }
         }
         else if(condition1.equals("W"))
         {
            if(condition2.equals("JU"))
            {
               commandMap.put("item_gender", condition1);
               commandMap.put("item_type", condition2);
               commandMap.put("item_price1", price1);
               commandMap.put("item_price2", price2);
               List<Map<String,Object>> womanuplist=shoppingService.selectSearchItemList(commandMap.getMap());
               mav.addObject("list",womanuplist);
               mav.setViewName("womanitemList.item");
               
               // paging
               List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
               resList = pagingUtils.cutList(request, womanuplist);
               String paging = pagingUtils.getHtmlStr(request, womanuplist,"item/manList");
               mav.addObject("list",resList);
               mav.addObject("paging",paging);
               mav.addObject("nowPage",pagingUtils.getNowPage());
                     
               mav.addObject("searchStr",commandMap.get("searchStr"));
            }
            else if(condition2.equals("JD"))
            {
               commandMap.put("item_gender", condition1);
               commandMap.put("item_type", condition2);
               commandMap.put("item_price1", price1);
               commandMap.put("item_price2", price2);
               List<Map<String,Object>> womandownlist=shoppingService.selectSearchItemList(commandMap.getMap());
               mav.addObject("list",womandownlist);
               mav.setViewName("womanitemList.item");
               
               // paging
               List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
               resList = pagingUtils.cutList(request, womandownlist);
               String paging = pagingUtils.getHtmlStr(request, womandownlist,"item/womanList");
               mav.addObject("list",resList);
               mav.addObject("paging",paging);
               mav.addObject("nowPage",pagingUtils.getNowPage());
                     
               mav.addObject("searchStr",commandMap.get("searchStr"));
               
            }
            else if(condition2.equals("JI"))
            {
               commandMap.put("item_gender", condition1);
                commandMap.put("item_type", condition2);
                commandMap.put("item_price1", price1);
                commandMap.put("item_price2", price2);
                List<Map<String,Object>> womanmidlist=shoppingService.selectSearchItemList(commandMap.getMap());
                mav.addObject("list",womanmidlist);
                mav.setViewName("womanitemList.item");
            }
            else if(condition2.equals("JS"))
            {
               commandMap.put("item_gender", condition1);
                commandMap.put("item_type", condition2);
                commandMap.put("item_price1", price1);
                commandMap.put("item_price2", price2);
                List<Map<String,Object>> shoeslist=shoppingService.selectSearchItemList(commandMap.getMap());
                mav.addObject("shoeslist",shoeslist);
                mav.setViewName("shoeslist.item");
               
               // paging
               List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
               resList = pagingUtils.cutList(request, shoeslist);
               String paging = pagingUtils.getHtmlStr(request, shoeslist,"item/shoesList");
               mav.addObject("list",resList);
               mav.addObject("paging",paging);
               mav.addObject("nowPage",pagingUtils.getNowPage());
                     
               mav.addObject("searchStr",commandMap.get("searchStr"));
            }
            else
            {
               System.out.println("여자 에러.");
            }
         }
         else if(condition1.equals("U"))
         {
            commandMap.put("item_gender", condition1);
             commandMap.put("item_type", condition2);
             commandMap.put("item_price1", price1);
             commandMap.put("item_price2", price2);
             List<Map<String,Object>> acclist=shoppingService.selectSearchItemList(commandMap.getMap());
             mav.addObject("acclist",acclist);
             mav.setViewName("acclist.item");
             
             // paging
             List<Map<String,Object>> resList = new ArrayList<Map<String,Object>>();
             resList = pagingUtils.cutList(request, acclist);
             String paging = pagingUtils.getHtmlStr(request, acclist,"item/shoesList");
             mav.addObject("list",resList);
             mav.addObject("paging",paging);
             mav.addObject("nowPage",pagingUtils.getNowPage());
                   
             mav.addObject("searchStr",commandMap.get("searchStr"));
         }
         else
         {
            System.out.println("이거는 에러다");
         }
         
         return mav;
      }
      @RequestMapping(value="/item/CombineList")
      public ModelAndView selectItemCombineList(CommandMap commandMap, HttpServletRequest request) throws Exception {
         ModelAndView mv=new ModelAndView("manitemList.item");
         String combine = request.getParameter("combine");
         commandMap.put("item_combine", combine);
         List<Map<String,Object>> list=shoppingService.selectSearchCombineList(commandMap.getMap());
         mv.addObject("list",list);
         return mv;
      }
}