<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
function submitFunction()
{
   var searchMaingb1Select = document.getElementById("searchMaingb1Select").value;
   var searchMaingb2Select = document.getElementById("searchMaingb2Select").value;
   if(searchMaingb1Select=="no1")
   {
      alert("카테고리를 선택해주세요");
      
      return;
   }
   else if(searchMaingb2Select=="no2")
   {
      alert("카테고리를 선택해주세요");
      
      return;
   }
   else
   {
      document.getElementById("searchfrm1").submit();
   }
}
function submitFunction2()
{
   var searchMain22combine = document.getElementById("searchMain22combine").value;
   if(searchMain22combine==null)
   {
      alert("검색어를 입력해주세요");
      
      return;
   }
   else
   {
      document.getElementById("searchfrm2").submit();   
   }
}
$(document).ready(function(e) { 
      try { 
        $('input[type=text]').focus(function() 
          { 
           $(this).css('border-color','#50DEAA'); 
         });
        $('input[type=text]').blur(function() 
               { 
                $(this).css('border-color','#D5D5D5'); 
              });
      } 
      catch(e) { 
         alert(e.message); 
      } 
   });  
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="rightMenu">

</div>

<div id="side" class="sidebutton">
   <div id="menu0">
   <img id="rightimgleft" src="/kingsman/resources/upload/leftopen.png" width="25" height="25">
   </div>
</div>

<div id="side2">
   <div id="menu1" class="sidebutton2">
   <img id="rightimgfind" src="/kingsman/resources/upload/find.png" width="20" height="20">
   </div>
   <div id="menu2">
   <a href="/kingsman/cart/list"><img id="rightimgbasket" src="/kingsman/resources/upload/basket.png" width="20" height="20"></a>
   </div>
   <div id="menu3">
   <a href="/kingsman/wishList/list"><img id="rightimglike" src="/kingsman/resources/upload/like.png" width="20" height="20"></a>
   </div>
   <div id="menu4">
   <a href="/kingsman/main"><img id="rightimghome" src="/kingsman/resources/upload/home.png" width="20" height="20"></a>
   </div>
</div>

<div id="side3Wrap">
<div id="side3" class="sidebutton3">
<form id="searchfrm1" action="/kingsman/item/UnifiedSearch" method="post">
<div id="searchMain1">
<div id="searchmain1Title">Search<img id="close1" src="/kingsman/resources/upload/close.png" width="40" height="40"></div>
<div id="searchMaingb1Title">
성별구분
<select id="searchMaingb1Select" name="UnifiedSearch1">
   <option value="no1">-선택-</option>
   <option value="M">남자</option>
   <option value="W">여자</option>
   <option value="U">장신구</option>
</select>
</div>
<div id="searchmain2Title">
상품분류
<select id="searchMaingb2Select" name="UnifiedSearch2">
   <option value="no2">-선택-</option>
   <option value="JU">정장상의</option>
   <option value="JD">정장하의</option>
   <option value="JI">셔츠/블라우스</option>
   <option value="JS">구두</option>
   <option value="AC">악세사리</option>
</select>
</div>
<div id="searchmain3Title">
판매가격
<input type="text" id="searchmaingb3text" name="ITEM_PRICE1" placeholder="2900">
&nbsp;~&nbsp;
<input type="text" id="searchmaingb3text1" name="ITEM_PRICE2" placeholder="5000"><br>
<input type="button" value="조건검색" id="submitbtn" onclick="return submitFunction();">
</div>
</div>
</form>
<br><br><br>
<form id="searchfrm2" action="/kingsman/item/CombineList" method="post">
<div id="searchMain2">
<div id="searchMain22Title">
통합검색
<input id="searchMain22combine" type="text" name="combine" placeholder="search...">
<input type="button" value="검색" id="searchMain22submitBtn" onclick="return submitFunction2();">
</div>
</div>
</form>
</div>
</div>

<div id="Allback">
</div>

</body>
</html>