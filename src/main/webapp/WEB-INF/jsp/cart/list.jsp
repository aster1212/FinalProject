<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--PG크로스브라우징필수내용 시작-->
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Pragma" content="no-cache">
<!--PG크로스브라우징필수내용 끝-->
<!--해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요.-->
<!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. -->
<link
   href="//fonts.googleapis.com/css?family=Lato:100,300,400,500,700,900,100italic,300italic,400italic,700italic,900italic"
   rel="stylesheet" type="text/css">
<link href="//fonts.googleapis.com/css?family=Cabin" rel="stylesheet"
   type="text/css">
<link href="//fonts.googleapis.com/css?family=Cabin:700"
   rel="stylesheet" type="text/css">
<meta name="format-detection" content="telephone=no">
<script async="" src="//www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async=""
   src="http://www.google-analytics.com/ga.js"></script>
<script
   src="https://connect.facebook.net/signals/config/829030643890604?v=2.8.25&amp;r=stable"
   async=""></script>
<script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script>
<link rel="canonical" href="http://asclo.com/order/basket.html">
<link rel="alternate" href="http://m.asclo.com/order/basket.html">
<meta property="og:url" content="http://asclo.com/order/basket.html">
<meta property="og:site_name" content="애즈클로">
<meta property="og:type" content="website">
<link rel="shortcut icon" href="/web/upload/favicon_20141006131340.ico">
<meta http-equiv="ImageToolbar" content="No">

<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"> </script>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@ include file="/WEB-INF/include/include-body.jspf"%>





<script type="text/javascript">



window.onkeydown = function() {
    var kcode = event.keyCode;
    if(kcode == 8 || kcode == 116) event.returnValue = true;
 } 

  
   
  function comma(str) {
     str = String(str);
     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
 }
  
   
    
   //체크박스 단일 선택
    var sum = 0;
    var delivery = 0;
    var totalSum =0;
    
    function checkedRows(index){
      var index = index;
      var tagName = "#checkbox"+index;
      
      //price 클래스의 value 값을 가져온다.
      var price = $(".price").eq(index).attr("value");
      var totprice = $(".totprice").eq(index).attr("value");
      
      price = parseInt(price);
      totprice = parseInt(totprice);
      
      console.log("price:"+price);
      console.log("totPrice:"+totprice);
      
        if($(tagName).is(":checked")){
          
             sum += totprice;
             
             if(sum>50000){
                delivery=0;
             }else{
                delivery=0;
             }
             totalSum = sum + delivery;
              
             $("#totalPrice").html(comma(sum)+" KRW");
             $("#delivery").html(comma(delivery)+" KRW");
             $("#totalSum").html(comma(totalSum)+" KRW");
          $("#totalPrice2").html(comma(sum)+" KRW");
             $("#delivery2").html(comma(delivery)+" KRW");
             $("#totalSum2").html(comma(totalSum)+" KRW");
             
      }else{
         
          sum -=  totprice;
          
          if(sum>50000){
             delivery=0;
             }else{
                delivery=0;
             }
          
            totalSum = sum + delivery;
                
                $("#totalPrice").html(comma(sum)+" KRW");
                $("#delivery").html(comma(delivery)+" KRW");
                $("#totalSum").html(comma(totalSum)+" KRW");
                $("#totalPrice2").html(comma(sum)+" KRW");
                $("#delivery2").html(comma(delivery)+" KRW");
                $("#totalSum2").html(comma(totalSum)+" KRW");
      } 
   };
   
   //체크박스 다중 선택
   var chkCount = $("input[type=checkbox]").length ;
   
   function checkAll(){    
      console.log("checkAll실행");
      if($("#chkBox").is(":checked")) {
         for(i=0;i<$("input[type=checkbox]").length-1;i++){
            if($("#checkbox"+i).is(":checked")){
            }
            else{
               $("#checkbox"+i).prop("checked",true);
               checkedRows(i); 
            }
         }
      } else{
         for(i=0;i<$("input[type=checkbox]").length-1;i++){
            if($("#checkbox"+i).is(":checked")){
               $("#checkbox"+i).prop("checked",false);
               checkedRows(i); 
            }
            else{
            }
         }
      } 
   }
   
   function checkAll2(){    
      
      for(i=0;i<$("input[type=checkbox]").length-1;i++){
         if($("#checkbox"+i).is(":checked")){
         }
         else{
            $("#checkbox"+i).prop("checked",true);
            checkedRows(i); 
         }
      }
   }
   function back(){
      history.go(-2);
   }        
          
          
     $(document).ready(function() {
          $("#cartAddSelected").on("click", function(e) {
             e.preventDefault();
             fn_cartAddSelected();
          });
          
        
       
         var goWhere = '<%=request.getParameter("goWhere")%>';
          if(goWhere == 'payment'){
              fn_cartAddSelected(); 
          }
       
       $("#addOrderAll").on("click", function(e) { 
          e.preventDefault();
          checkAll2();
          fn_addOrderAll();
       });
       $("#addOrderOne").on("click", function(e) { 
          e.preventDefault();
          fn_addOrderAll();
       });
       $("#deleteSelected").on("click", function(e) { 
           e.preventDefault();
           fn_deleteSelected();
        });
       $("#deleteAll").on("click", function(e) { 
           e.preventDefault();
           fn_deleteAll();
        });
       
    });
    
   function fn_cartAddSelected() {
      
      var boolAll = false;
      var checkBool = false;
      $('input:checkbox[name="CART_NO"]').each(function() {
           if(this.checked)
              checkBool = true;
        });
        if(checkBool == false){
           alert('체크박스를 하나이상 선택해라');
           boolAll = true;
        }
      
      var comSubmit = new ComSubmit("frm");
      comSubmit.setUrl("<c:url value='/order/paymentForm' />");
      if(boolAll == false){
         comSubmit.submit();
      }
   }
      function fn_addOrderAll() {
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/order/paymentForm' />");
        comSubmit.submit();
   }
      function fn_addOrderOne() {
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/order/paymentForm' />");
        comSubmit.submit();
   }
      function fn_deleteOne() {
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/cart/deleteOneCartlist' />");
        comSubmit.submit();
   }
      function fn_deleteSelected() {
       var comSubmit = new ComSubmit("frm");
       comSubmit.setUrl("<c:url value='/cart/deleteSelectCartlist' />");
       comSubmit.submit();
   }
      function fn_deleteAll() {
       var comSubmit = new ComSubmit("frm");
       comSubmit.setUrl("<c:url value='/cart/deleteAllCartlist' />");
       comSubmit.submit();
   }
</script>
<title>CART</title>
<link type="text/css" rel="stylesheet"
   href="/kingsman/resources/css/cartTest.css">
<%-- <link href="<c:url value='/resources/css/cartTest.css'/>" rel="stylesheet" type="text/css" /> --%>
<style type="text/css">
.xanx-order-totalsummary {
   color: #353535;
   line-height: 1.5;
}

.xans-order-totalsummary th {
   height: 39px;
   line-height: 39px;
   background: #F2FFED;
   font-weight: normal;
   text-align: center;
   font-size: 11px;
}

.xans-order-totalsummary td {
   height: 58px;
   line-height: 58px;
   text-align: center;
   font-size: 15px;
   font-weight: bold;
}

xans-order-totalsummary th:first-child, xans-order-totalsummary td:first-child
   {
   text-align: center;
   font-size: 11px;
}

.xans-order-totalsummary th img {
   margin: 0 0 0 10px;
   vertical-align: middle;
}

.xans-order-totalsummary td.total {
   color: #333;
   font-size: 12px;
}

.xans-order-totalsummary td .box {
   word-wrap: break-word;
   word-break: break-all;
   font-size: 12px;
}

.xans-order-totalsummary td .tail {
   font-size: 12px;
}

.xans-order-totalsummary td strong {
   letter-spacing: -1px;
   padding: 0 5px;
   font-size: 14px;
   font-weight: bold;
}

.total_order {
   text-align: left;
}
</style>
</head>
<body>
<div id="AllcartWrap">
<div id="AllcartDiv1">
   <form id="frm">
         <div id="AllcartTitle">CART</div>
         <c:if test="${idSession!=null }">
         <div id="AllcartMemInfo">( ${memname} 님의 장바구니 목록 ) </div>
         <div id="AllcartMemTable1">
            <div class="xans-element- xans-order xans-order-basketpackage ">
               <div class="orderListArea">
               <!-- 테이블 시작점 -->
               <table border="0" summary=""
                     class="xans-element- xans-order xans-order-normnormal boardList xans-record-">

                     <thead>
                        <tr>
                           <th scope="col" class="chk"><input type="checkbox"
                              id="chkBox" onclick=checkAll()></th>
                           <th scope="col" class="thumb">이미지</th>
                           <th scope="col" class="product">상품 이름</th>
                           <th scope="col" class="option">상품옵션</th>
                           <th scope="col" class="price">가격</th>
                           <th scope="col" class="quantity">수량</th>
                           <th scope="col" class="mileage">배송비</th>
                           <th scope="col" class="total">배송종류</th>
                           <th scope="col" class="button">select</th>
                           <th scope="col" class="total">총가격</th>
                           <th scope="col" class="etc">기타</th>

                        </tr>
                     </thead>
                     <tfoot>
                        <tr>

                           <td colspan="11"><strong class="type">[기본배송]</strong>
                              상품구매금액 <strong id="totalPrice">0 KRW </strong> + 배송비 <strong
                              id="delivery">0 KRW </strong> = 합계 : <strong id="totalSum">0
                                 KRW </strong></td>
                        </tr>
                     </tfoot>
                     <tbody class="xans-element- xans-order xans-order-list">
                        <c:choose>
                           <c:when test="${fn:length(cartList) > 0}">
                              <c:forEach items="${cartList}" var="row" varStatus="stat">
                                 <tr class="xans-record-">

                                    <td><input type="checkbox" id="checkbox${stat.index}"
                                       name="CART_NO" id="CART_NO" value="${row.CART_NO}"
                                       onclick="javascript:checkedRows(${stat.index});"
                                       <c:if test="${param.goWhere eq 'payment'}">
                                        ${stat.last ? 'checked="checked"' : '' }
                                       </c:if>>
                                    </td>
                                    <td class="thumb"><a
                                       href="/kingsman/item/detail?ITEM_NO=${row.ITEM_NO }"> <img
                                          width="75" height="75"
                                          src="/kingsman/resources/imagephoto/${row.ITEM_SHORTPATH.split(',')[0] }" />
                                    </a></td>
                                    <td class="product" width="150"><a
                                       href="/kingsman/item/detail?ITEM_NO=${row.ITEM_NO }"> <strong>${row.ITEM_NAME }</strong>
                                    </a></td>
                                    <td class="option" width="180">
                            [옵션:
                           ${row.CART_OPTION.split(",")[0]}/${row.CART_OPTION.split(",")[1]}/${row.CART_OPTION.split(",")[2]}]

                                    </td>
                                    <td><span class="price" value="${row.ITEM_PRICE}"><fmt:formatNumber
                                             value="${row.ITEM_PRICE}" pattern="#,###" /></span></td>
                                    <td><c:url var="cntUp" value="/cart/CountUp">
                                          <c:param name="CART_NO" value="${row.CART_NO }" />
                                          <c:param name="COUNT" value="${row.ITEM_COUNT}" />
                                       </c:url> <c:url var="cntDown" value="/cart/CountDown">
                                          <c:param name="CART_NO" value="${row.CART_NO }" />
                                          <c:param name="COUNT" value="${row.ITEM_COUNT}" />
                                       </c:url> <span class="quantity"> <input name="ChangeCnt"
                                          value="${row.ITEM_COUNT }" type="text"> <a
                                          href="${cntUp}"><img
                                             src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_quantity_up.gif"
                                             alt="증가" class="QuantityUp"></a> <c:if
                                             test="${row.ITEM_COUNT>1 }">
                                             <a href="${cntDown}"><img
                                                src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_quantity_down.gif"
                                                alt="감소" class="QuantityDown"></a>
                                          </c:if>
                                    </span></td>
                                    <td class="mileage">배송비 무료</td>
                                    <td class="delivery">기본배송</td>
                                    <td><span class="totprice"
                                       value="${row.ITEM_PRICE*row.ITEM_COUNT}">${row.ITEM_PRICE*row.ITEM_COUNT}</span></td>
                                    <td class="total"><strong><fmt:formatNumber
                                             value="${row.ITEM_PRICE * row.ITEM_COUNT }"
                                             pattern="#,###" /></strong></td>

                                    <td class="button"><c:url var="deleteOne"
                                          value="/cart/deleteOneCartlist">
                                          <c:param name="CART_NO" value="${row.CART_NO }" />
                                       </c:url> <c:url var="addOne" value="/order/paymentForm">
                                          <c:param name="CART_NO" value="${row.CART_NO }" />
                                          <c:param name="ITEM_NO" value="${row.ITEM_NO}" />
                                          <c:param name="CART_COUNT" value="${row.CART_COUNT }" />
                                          <c:param name="ITEM_COUNT" value="${row.ITEM_COUNT}" />
                                       </c:url> <a href="${addOne}"> <img
                                          src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_order.gif"
                                          alt="주문하기"></a>
                                          <c:if test="${memberInfo.MEMBER_ID!=null }">
                                             <a href="${deleteOne }"> <img
                                                src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_delete.gif"
                                                alt="삭제"></a>
                                          </c:if> <c:if test="${memberInfo.MEMBER_ID==null }">
                                             <a href="${deleteOne }"> <img
                                                src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_delete.gif"
                                                alt="삭제"></a>
                                          </c:if></td>

                                 </tr>

                              </c:forEach>
                           </c:when>
                           <c:otherwise>
                              <tr>
                                 <td colspan="10" align="center">장바구니가 비어있습니다.</td>
                              </tr>
                           </c:otherwise>
                        </c:choose>
                     </tbody>
                  </table>                  
               <!-- 테이블 종료점 -->
      
         </div>
         </c:if>
         <!-- 비회원 시작점 -->
                  <c:if test="${nonmemname!=null }">
         <div id="AllcartMemInfo">( ${nonmemname} 님의 장바구니 목록 ) </div>
            <div class="xans-element- xans-order xans-order-basketpackage ">
               <div class="orderListArea">
                  <br />
                  <br />
                  <br />

                  <!-- 일반상품 (기본배송) -->
                  <table border="0" summary=""
                     class="xans-element- xans-order xans-order-normnormal boardList xans-record-">

                     <thead>
                        <tr>
                           <th scope="col" class="chk"><input type="checkbox"
                              id="chkBox" onclick=checkAll()></th>
                           <th scope="col" class="thumb">이미지</th>
                           <th scope="col" class="product">상품 이름</th>
                           <th scope="col" class="option">상품옵션</th>
                           <th scope="col" class="price">가격</th>
                           <th scope="col" class="quantity">수량</th>
                           <th scope="col" class="mileage">배송비</th>
                           <th scope="col" class="total">배송종류</th>
                           <th scope="col" class="button">select</th>
                           <th scope="col" class="total">총가격</th>
                           <th scope="col" class="etc">기타</th>

                        </tr>
                     </thead>
                     <tfoot>
                        <tr>
                           <td colspan="11"><strong class="type">[기본배송]</strong>
                              상품구매금액 <strong id="totalPrice">0 KRW </strong> + 배송비 <strong
                              id="delivery">0 KRW </strong> <!-- -상품할인금액 0 <strong
                              id="discount">0 KRW </strong> --> = 합계 : <strong id="totalSum">0
                                 KRW </strong></td>
                        </tr>
                     </tfoot>
                     <tbody class="xans-element- xans-order xans-order-list">
                        <c:choose>
                           <c:when test="${fn:length(sessionCartList) > 0}">
                              <c:forEach items="${sessionCartList}" var="row"
                                 varStatus="stat">

                                 <tr class="xans-record-">

                                    <td><input type="checkbox" id="checkbox${stat.index}"
                                       name="CART_NO" id="CART_NO" value="${row.CART_NO}"
                                       onclick="javascript:checkedRows(${stat.index});"
                                       <c:if test="${param.goWhere eq 'payment'}">
                                        ${stat.last ? 'checked="checked"' : '' }
                                       </c:if>>

                                    </td>
                                    <td class="thumb"><a
                                       href="/kingsman/item/detail?ITEM_NO=${row.ITEM_NO }"> <img
                                          width="75" height="75"
                                          src="/kingsman/resources/imagephoto/${row.ITEM_SHORTPATH}" />
                                    </a></td>
                                    <td class="product" width="150"><a
                                       href="/kingsman/item/detail?ITEM_NO=${row.ITEM_NO }"> <strong>${row.ITEM_NAME }</strong>
                                    </a></td>
                                    <td class="option" width="180">[옵션:
                                       ${row.CART_OPTION.split(",")[0]}/${row.CART_OPTION.split(",")[1]}/${row.CART_OPTION.split(",")[2]}]

                                    </td>
                                    <td><span class="price" value="${row.ITEM_PRICE}"><fmt:formatNumber
                                             value="${row.ITEM_PRICE}" pattern="#,###" /></span></td>
                                    <td><c:url var="cntUp" value="/cart/CountUp2">
                                          <c:param name="CART_NO" value="${row.CART_NO}" />
                                          <c:param name="ITEM_COUNT" value="${row.ITEM_COUNT}" />
                                       </c:url> <c:url var="cntDown" value="/cart/CountDown2">
                                          <c:param name="CART_NO" value="${row.CART_NO }" />
                                          <c:param name="ITEM_COUNT" value="${row.ITEM_COUNT}" />
                                       </c:url> <span class="quantity"> <input name="ChangeCnt2"
                                          value="${row.ITEM_COUNT }" type="text"> <a
                                          href="${cntUp}"><img
                                             src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_quantity_up.gif"
                                             alt="증가" class="QuantityUp"></a> <c:if
                                             test="${row.ITEM_COUNT>1 }">
                                             <a href="${cntDown}"><img
                                                src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_quantity_down.gif"
                                                alt="감소" class="QuantityDown"></a>
                                          </c:if>
                                    </span></td>
                                    <td class="mileage">배송비 무료</td>
                                    <td class="delivery">기본배송</td>
                                    <td><span class="totprice"
                                       value="${row.ITEM_PRICE*row.ITEM_COUNT}">${row.ITEM_PRICE*row.ITEM_COUNT}</span></td>
                                    <td class="total"><strong><fmt:formatNumber
                                             value="${row.ITEM_PRICE * row.ITEM_COUNT }"
                                             pattern="#,###" /></strong></td>

                                    <td class="button"><c:url var="deleteOne"
                                          value="/cart/deleteOneCartlist">
                                          <c:param name="CART_NO" value="${row.CART_NO }" />
                                       </c:url> <c:url var="addOne" value="/order/paymentForm">
                                          <c:param name="CART_NO" value="${row.CART_NO }" />
                                          <c:param name="ITEM_NO" value="${row.ITEM_NO}" />
                                          <c:param name="CART_COUNT" value="${row.CART_COUNT }" />
                                          <c:param name="ITEM_COUNT" value="${row.ITEM_COUNT}" />
                                       </c:url> <a href="${addOne}"> <img
                                          src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_order.gif"
                                          alt="주문하기"></a>
                                       <c:if test="${memberInfo.MEMBER_ID!=null }">
                                             <a href="${deleteOne }"> <img
                                                src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_delete.gif"
                                                alt="삭제"></a>
                                          </c:if> <c:if test="${memberInfo.MEMBER_ID==null }">
                                             <a href="${deleteOne }"> <img
                                                src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_delete.gif"
                                                alt="삭제"></a>
                                          </c:if></td>

                                 </tr>

                              </c:forEach>
                           </c:when>
                           <c:otherwise>
                              <tr>
                                 <td colspan="10" align="center">장바구니가 비어있습니다.</td>
                              </tr>
                           </c:otherwise>
                        </c:choose>
                     </tbody>
                  </table>
                  </c:if>
         <!-- 비회원종료점 -->


         <div class="xans-element- xans-order xans-order-basketpriceinfoguide  ">
            <p class="info ">결제 예정 금액의 5% 는 포인트로 적립됩니다.</p>
         </div>
         </div>
         </div>
         <!-- 선택상품 제어 버튼 -->
         <div id="AllcartDel">
         <div class="xans-element- xans-order xans-order-selectorder ">
            <span class="left"> <strong class="ctrlTxt">선택상품을</strong>
            &nbsp;
            <input type="button" value="삭제하기" id="deleteSelected" onclick="fn_deleteSelected();" style="outline: none;">
            <input type="button" value="장바구니 비우기" id="deleteAll" onclick=" fn_deleteAll();" style="outline: none;">
            </span>
         </div>
         </div>
         
         <div id="AllcartDiv2">
         <div class="xans-order-totalsummary">
            <table border="0" summary="">
               <div id="AllcartTotalTitle">총 주문금액</div>
               <br><br>
               <colgroup>
                  <col style="width: 250px;">
                  <col style="width: 250px;">
                  <col style="width: 549px;">
               </colgroup>
               <thead>
                  <tr>
                     <th scope="col"><span>총 상품금액</span></th>
                     <th scope="col">배송비</th>
                     <th scope="col">총 금액</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td><strong id="totalPrice2">0 KRW</strong></td>
                     <td><strong id="free">무료</strong></td>
                     <td><strong>=</strong><strong id="totalSum2">0 KRW</strong></td>
                  </tr>
               </tbody>
            </table>
         </div>
         </div>
         <div id="AllcartBtnFinish">
         <div class="xans-element- xans-order xans-order-totalorder">
            <input type="button" id="cartAddSelected" value="선택상품주문" onclick="fn_cartAddSelected();" style="outline: none;">
            &nbsp;&nbsp;
            <input type="button" id="addOrderAll" value="전체상품주문" onclick="fn_addOrderAll();" style="outline: none;">
            &nbsp;&nbsp;
            <input type="button" id="continueShop" value="쇼핑계속하기" onclick="javascript:back();" style="outline: none;">
         </div>
         </div>
      </form>
   </div>
  </div>   
</body>
</html>