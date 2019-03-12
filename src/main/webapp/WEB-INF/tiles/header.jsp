<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title></title>
<script type="text/javascript">
   function fn_menuGo(menu) {
      var str = menu;
      
      switch (str){
      case 'man': 
         location.href = '/kingsman/item/manList?';
         break;
      case 'manTop': 
         location.href = '/kingsman/item/manUpList';
         break;
      case 'manBottom': 
         location.href = '/kingsman/item/manDownList';
         break;
      case 'manInner': 
         location.href = '/kingsman/item/manMidList';
         break;
      case 'manShoes': 
         location.href = '/kingsman/item/shoesManList';
         break;
      case 'woman': 
         location.href = '/kingsman/item/womanList?state=1';
         break;
      case 'womanTop': 
         location.href = '/kingsman/item/womanUpList';
         break;
      case 'womanBottom': 
         location.href = '/kingsman/item/womanDownList';
         break;
      case 'womanInner': 
         location.href = '/kingsman/item/womanMidList';
         break;
      case 'womanShoes': 
         location.href = '/kingsman/item/shoesWomanList';
         break;
      case 'acc': 
         location.href = '/kingsman/item/accList';
         break;
      case 'about': 
         location.href = '/kingsman/notice/list';
         break;
      case 'aboutNotice': 
         location.href = '/kingsman/notice/list';
         break;
      case 'aboutEvent': 
         location.href = '/kingsman/event/list';
         break;
      case 'aboutQna': 
         location.href = '/kingsman/qna/list';
         break;
      case 'cart': 
         location.href = '/kingsman/cart/list';
         break;
      case 'main': 
          location.href = '/kingsman/main';
          break;
      case 'wayBackHome': 
          location.href = '/kingsman/main/home';
          break;
      default:
         break;
      }
   }
</script>
</head>
<body>
<div id="header">
   <div id="fixedMenuBack"></div>
   <div id="fixedMenu">
      <div id="logo" class="menuItem pointer">
        <div class="tabler" onclick="fn_menuGo('main')">
			<img alt="logo" src="/kingsman/resources/image/LOGOBTN.png">
		</div>
      </div>
      
      <div class="menuItem pointer">
         <div class="tabler">
            <a href="#this" onclick="fn_menuGo('man')">MAN</a>
         </div>
         <div class="naviSub">
         <br>
            <a href="#this" onclick="fn_menuGo('manTop')">상의</a><br>
            <a href="#this" onclick="fn_menuGo('manBottom')">하의</a><br>
            <a href="#this" onclick="fn_menuGo('manInner')">셔츠</a><br>
            <a href="#this" onclick="fn_menuGo('manShoes')">구두</a>
         </div>
      </div>
      <div class="menuItem pointer">
         <div class="tabler">
            <a href="#this" onclick="fn_menuGo('woman')">WOMAN</a>
         </div>
         <div class="naviSub">
         <br>
            <a href="#this" onclick="fn_menuGo('womanTop')">상의</a><br>
            <a href="#this" onclick="fn_menuGo('womanBottom')">하의</a><br>
            <a href="#this" onclick="fn_menuGo('womanInner')">셔츠</a><br>
            <a href="#this" onclick="fn_menuGo('womanShoes')">구두</a>
         </div>
      </div>
      <div class="menuItem pointer">
         <div class="tabler">
            <a href="#this" onclick="fn_menuGo('acc')">ACC</a>
         </div>
      </div>
      <div class="menuItem pointer">
         <div class="tabler">
            <a href="#this" onclick="fn_menuGo('about')">ABOUT</a>
         </div>
         <div class="naviSub">
         <br>
         	<a href="#this" onclick="fn_menuGo('wayBackHome')">오시는길</a><br>
            <a href="#this" onclick="fn_menuGo('aboutNotice')">공지사항</a><br>
            <a href="#this" onclick="fn_menuGo('aboutEvent')">이벤트</a><br>
            <a href="#this" onclick="fn_menuGo('aboutQna')">Q&A</a>
         </div>
      </div>
      <div id="menuCart" class="menuItem pointer">
         <div class="tabler">
            <a href="#this" onclick="fn_menuGo('cart')">CART</a>
         </div>
      </div>
      
   </div>
   
   <div id="absoluteMenu">
   </div>
</div>
</body>
 </html>
 
 