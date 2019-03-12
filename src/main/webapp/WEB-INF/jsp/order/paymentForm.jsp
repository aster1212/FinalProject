<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<!--PG크로스브라우징필수내용 시작-->
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Pragma" content="no-cache">
<!--PG크로스브라우징필수내용 끝-->
<!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. -->
<link href="//fonts.googleapis.com/css?family=Lato:100,300,400,500,700,900,100italic,300italic,400italic,700italic,900italic"
   rel="stylesheet" type="text/css">
<link href="//fonts.googleapis.com/css?family=Cabin" rel="stylesheet" type="text/css">
<link href="//fonts.googleapis.com/css?family=Cabin:700" rel="stylesheet" type="text/css">
<meta name="format-detection" content="telephone=no">
<link rel="shortcut icon" href="/web/upload/favicon_20141006131340.ico">
<meta http-equiv="ImageToolbar" content="No">
<!-- 결제 API 아래두줄 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"> </script>
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<%@ include file="/WEB-INF/include/include-header.jspf"%>

<script>
    function ksm_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("ORDER_ADDR4").value = extraAddr;
                
                } else {
                    document.getElementById("ORDER_ADDR4").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('ORDER_ADDR1').value = data.zonecode;
                document.getElementById("ORDER_ADDR2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("ORDER_ADDR3").focus();
            }
        }).open();
    }
</script>

<script type="text/javascript">        
//체크박스 연결! 
$(document).ready(function(){
$('input[type="radio"]').change(function(){ 
    $('.' + this.className).prop('checked', this.checked); 
   }); 
});



//Validation
function checkForm(){
   if(document.getElementById("ORDER_NAME").value=="" || document.getElementById("ORDER_ADDR1").value=="" || document.getElementById("ORDER_ADDR2").value==""
      || document.getElementById("ORDER_ADDR3").value=="" || document.getElementById("ORDER_ADDR4").value=="" || document.getElementById("ORDER_PHONE").value==""
      || document.getElementById("ORDER_EMAIL").value=="" ){
      alert('필수 입력 항목 확인요망');
      
      //결제금액이 0원이면 바로 결제진행
   }else if(finalTotal.value==0){
        finalPayment();
        
        //0원 이상이면 다날 결제창 열기
   }else{
        pay();   
        /* finalPayment();  */
   }
}

//스크립트에서 끊으려고 했으나 실패
function numberWithCommas(x) {

    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

}

//쿠폰할인 - 계산금액 차감.
function changeCoupon(){
   var discountRate = document.querySelector('input[name="COU_DISCOUNT"]:checked').value;
   var total = document.getElementById("total").value;
   var getFinalTotal =document.getElementById("finalTotal").value;
   var result =  parseInt(getFinalTotal) - (parseInt(total) * ( parseInt(discountRate)/100 ));

   var discountTotal1 = (parseInt(total) * (parseInt(discountRate)/100));
   var orignValue = document.getElementById('discountTotal').innerHTML;
   
                           //콤마찍어주는 함수 추가
                           
   finalTotal.value = parseInt(result);
   finalTotal1.innerHTML= numberWithCommas(parseInt(result));
   
   discountTotal.innerHTML = (parseInt(orignValue) + parseInt(discountTotal1));
   alert('쿠폰이 적용되었습니다');
   
   return true;
}

//적립금할인
function change() {   
   var usePoint = document.getElementById("usePoint");
   var total = document.getElementById("finalTotal").value;
   var basicPoint2 = document.getElementById("MEMBER_MILEAGE").value;
      //적립금 validation check
   if(parseInt(basicPoint2) < parseInt(usePoint.value) ){
      alert('사용가능한 적립금이 부족합니다!!!');
      return false;
   }else if(1000 > parseInt(usePoint.value)) {
      alert('1000원 이상 일 때 결제 가능합니다.');
      return false;
   }
   else if(parseInt(total.value) < parseInt(usePoint.value)){
      alert('결제금액을 초과할 수 없습니다!!!');
      return false;
   }else{
      
      MEMBER_MILEAGE.value = parseInt(basicPoint2) - parseInt(usePoint.value);
     
      //적립금 적용된 금액을 hidden으로 보냄
      usedPoint.value = parseInt(usePoint.value);
      alert('적립금 할인이 적용되었습니다!!!');
      
      var discountTotal2 = parseInt(usePoint.value);
      var orignValue = document.getElementById('discountTotal').innerHTML;
      var getFinalTotal =document.getElementById("finalTotal").value;
      
      var result = parseInt(getFinalTotal)-parseInt(usePoint.value);
      
      discountTotal.innerHTML = (parseInt(orignValue) + parseInt(discountTotal2));
      //payment로 보낼 hidden 파라미터값
     finalTotal1.innerHTML = numberWithCommas(parseInt(result));
      finalTotal.value = parseInt(result);
   //보여줄 총액

           
      return true;
   }     

}
//결제창 띄우기
function pay(){
   //결제 API 연동 
var IMP = window.IMP; // 생략가능
IMP.init('imp71550950'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : $("#ORDERITEM_NAME").val(),
    amount : $("#finalTotal").val(),
    buyer_email : $("#ORDER_EMAIL").val(),
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
        finalPayment();
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }

    alert(msg);
});

}

function finalPayment(){
   var comSubmit = new ComSubmit("form");
   comSubmit.setUrl("<c:url value='/order/payment' />");
   comSubmit.submit(); 
      }
      
</script>

<style>
body{
position: relative;
top: 100px;
}

.titleArea{
font-size: xx-large;;
}

.title{
position: relative;
top: 35px;
right: 45%;
}

.order{
width: 100%;
border-top: 2px solid #444444;
border-collapse: collapse;
font-size: 13px;
}
th, td {
border-bottom: 2px solid #444444;
padding: 10%;
} 
th:nth-child(1n){
background-color: #D1F3E7;
color: #34916F;
}

.order2{
width: 100%;
border-top: 2px solid #444444;
border-collapse: collapse;
border-radius: 15px;
font-size: 13px;
}
th, td {
border-bottom: 2px solid #444444;
padding: 10%;
}


.info{
   list-style:none;
   font-size: xx-small;
   text-align: left;
   }
   
.info1{
list-style:none;
}

.info1-1{
list-style:none;
font-size: xx-small;
text-align: left;
}
  
.order3{
width: 100%;
border-top: 2px solid #444444;
border-collapse: collapse;
font-size: small;
text-align: left;
}
th, td {
border-bottom: 2px solid #444444;
padding: 10px;
}

.order4{
position: relative;
top: 55px;
right: 45%;
}

#button1{
width:45px;
background-color: #000000;
border: none;
color:#fff;
padding: 8px 0;
text-align: center;
text-decoration: none;
display: inline-block;
font-size: 15px;
margin: 4px;
cursor: pointer;
border-radius: 15px;
outline: none;
}

#button1:hover{
background-color: #50DEAA;
} 

#button2{
width:45px;
background-color: #000000;
border: none;
color:#fff;
padding: 8px 0;
text-align: center;
text-decoration: none;
display: inline-block;
font-size: 15px;
margin: 4px;
cursor: pointer;
border-radius: 15px;
outline: none;
}

#button2:hover{
background-color: #50DEAA;
} 

#button3{
width:100px;
background-color: #000000;
border: none;
color:#fff;
padding: 8px 0;
text-align: center;
text-decoration: none;
display: inline-block;
font-size: 20px;
margin: 4px;
cursor: pointer;
border-radius: 10px;
outline: none;
}

#button3:hover{
background-color: #50DEAA;
} 

#button4{
width:100px;
background-color: #000000;
border: none;
color:#fff;
padding: 8px 0;
text-align: center;
text-decoration: none;
display: inline-block;
font-size: 13px;
margin: 4px;
cursor: pointer;
border-radius: 10px;
outline: none;
}

#button4:hover{
background-color: #50DEAA;
}

.required{
position: relative;
top: 70px;
left: 545px;
}

.required1-1{
position: relative;
top: 50px;
left: 43%;
opacity: 0.4;
}

.required1-2{
position: relative;
top: 67px;
left: 37%;
opacity: 0.4;
}

.pay{
width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
    font-size: 13px;
  }
  th, td {
    border: 1px solid #444444;
    padding: 10px;
  }

.ec-base-help{
text-align: left; 
}

.operator{
position: relative;
right: 18.3%;
top: 125px;
}

.operator1{
position: relative;
left: 10.3%;
top: 100px;
}


</style>
<head>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script src="/kingsman/resources/js/common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>주문결제 폼</title>

</head>
<body>

<%@ include file="/WEB-INF/include/include-body.jspf"%> 

<div class="titleArea">
      <h2>ORDER</h2>
   </div>
   
<div class="orderListArea ">
         <div class="title">
            <h3>주문내역</h3>
         </div>
         
         <div class="ec-base-table typeList ">
            <table border="0" summary="" class="order">
                
               <%-- <colgroup>
                  <col style="width: 27px">
                  <col style="width: 100px">
                  <col style="width: auto">
                  <col style="width: 425px">
                  <col style="width: 75px">
                  <col style="width: 98px">
                  <col style="width: 98px">
                  <col style="width: 85px">
                  <col style="width: 98px"> 
               </colgroup> --%> 
                 <thead>
                  <tr>   
                     <th scope="col">번호</th>
                     <th scope="col">이미지</th>
                     <th scope="col">상품이름</th>
                     <!-- <th scope="col">색상</th> -->
                     <th scope="col">옵션</th>
                     <!-- <th scope="col">사이즈</th> -->
                     <th scope="col">수량</th>
                     <th scope="col">판매가</th>
                  </tr>
               </thead>
               <tfoot class="right">
               
               <c:set var = "total" value = "0" />      
               
                  <c:choose>
            <c:when test="${fn:length(cartList) > 0}">
            
            <!-- 첫번째 폼 -->
            <form id="form" name="form">
               <c:forEach items="${cartList}" var="row" varStatus="status">
                 <tr>
                    
                     <td>${row.ITEM_NO}</td>
                      <td><img src="/kingsman/resources/imagephoto/${row.ITEM_SHORTPATH}" style="width: 100px; height:100px;"/></td>
                     <td>${row.ITEM_NAME}</td>                     
                     <%-- <td>${row.ITEM_OPTION}</td> --%>
                     <td>색상 : ${row.ITEM_COLOR} / 옵션 : ${row.ITEM_OPTION} / 사이즈 : ${row.ITEM_SIZE}</td>   
                    <%--  <td>${row.ITEM_SIZE}</td> --%>       
                     <td>${row.ITEM_COUNT}</td>
                     <td>${row.ITEM_PRICE}</td>
                     
                     
            
                  <input type="hidden" name="ITEM_NO" id="ITEM_NO" value="${row.ITEM_NO}">
                  <input type="hidden" name="ORDERITEM_NAME" id="ORDERITEM_NAME" value="${row.ITEM_NAME}">
                  <input type="hidden" name="ORDERITEM_COUNT" id="ORDERITEM_COUNT" value="${row.ITEM_COUNT}">
                  <input type="hidden" name="ORDERITEM_SIZE" id="ORDERITEM_SIZE" value="${row.ITEM_SIZE}">
                  <input type="hidden" name="ORDERITEM_OPTION" id="ORDERITEM_OPTION" value="${row.ITEM_OPTION}">
                  <input type="hidden" name="ORDERITEM_COLOR" id="ORDERITEM_COLOR" value="${row.ITEM_COLOR}">
                  <input type="hidden" name="ORDERITEM_PRICE" id="ORDERITEM_PRICE" value="${row.ITEM_PRICE}">
                  <input type="hidden" name="ORDERITEM_STATE" id="ORDERITEM_STATE" value="1">
                  <input type="hidden" name="CART_NO" id="CART_NO" value="${row.CART_NO}">
                  
                                 
                                    <c:set var="statCount" value="${status.count}"/>
              </tr>
              
            <c:set var= "sum" value="${row.ITEM_COUNT * row.ITEM_PRICE}"/>
            <c:set var= "total" value="${total + sum}"/>            
               </c:forEach>
               </br>
            
                     <!-- 넘기는 아이템이 하나 / 여러개일 때를 구분하기 위한 stat -->
                  <input type="hidden" name="STATCOUNT" id="STATCOUNT" value="${statCount}">
                     <!-- 주문 후 삭제할 cartList 의 No를 전송 -->
                     
                 </br>
                   
            </c:when>
            <c:otherwise>
               <tr>
                  <td colspan="4">조회된 상품이 없습니다.</td>
               </tr>
            </c:otherwise>
         </c:choose>
               </tfoot>             
               </table>
              
              <%-- <h3>합계 : <fmt:formatNumber value="${total}" pattern="#,###"/>원 </h3> --%>
              <input type="hidden" id="total" name="total" value="${total}"/>
                
                
               </div>
         </div>
         
         <br/>
         <br/>
               

            
            <c:if test="${memberInfo.MEMBER_ID!=null}">
           <!--    <div class="title">
            <h3>할인 정보</h3>
       </div>  -->
      <table border="0" class="order2">
                  <tbody class="">
                         <tr>
                        <th scope="row">쿠폰</th>
                                        
                <c:if test="${fn:length(couponList) > 0}">
               <td>
                     </br>
                     <c:forEach items="${couponList}" var="row" varStatus="status">
                     
                     <!-- 날짜가 유효한 쿠폰만 띄워줌!! -->
                  <c:if test="${row.COU_EDATE > currTime}">
                     
         <strong>${row.COU_CONTENT}</strong>
         (할인율: ${row.COU_DISCOUNT}%, 
            유효기간: ${row.COU_EDATE})
           
         <input type="radio" class="${status.index}" id="COU_DISCOUNT" name="COU_DISCOUNT" value="${row.COU_DISCOUNT}"/>
                                 <!-- 각 COU_NO를 넘겨 STATE를 1로 UPDATE해야함 -->
                     <br>
                     
                   </c:if> 
                     
                            </c:forEach>   
                            </br>
                            <ul class="info1-1">
                            <li>쿠폰은 하나만 적용 가능합니다.</li>
                            </ul>
               </td>
               <td>
                <input type="button" id="button1" value="적용" onclick="changeCoupon(); this.onclick='';">
                <input type="button" id="button2" value="취소" onclick="window.location.reload()">
               </td>
                           
               
               
                 </c:if>
                             
                             <!-- 쿠폰이 존재하지 않을 때 -->
             <c:if test="${couponList==null}">
               <tr>
                  <td colspan="4">조회된 쿠폰이 없습니다.</td>
               </tr>
            </c:if>

                  </tbody>
                  <tbody class="">
                     <tr>
                        <th scope="row">적립금 </th>
                        <td>
                           <p>
                           <!-- 넘기는값 : userPoint, savingPoint -->
                           <input type="text" id="usePoint" name="usePoint" value="" style="border-radius: 15px; outline: none;">P 
                                
                                 <input type="button" id="button1" value="적용" onclick="change(); this.onclick='';">
                                 <input type="button" id="button2" value="취소" onclick="window.location.reload()">
                                 
                                </br> 
                                
                           
                               
                 사용가능 적립금 - <input type="text" id="MEMBER_MILEAGE" name="MEMBER_MILEAGE" value="${memberInfo.MEMBER_MILEAGE}" readonly="readonly" size="7" style="border-radius: 15px; outline: none;">p 
                              
                           </p>
                           <br/>
                                <ul class="info">
                              <li>적립금은 최소 1000원 이상일 때 결제가 가능합니다.</li>
                              <li id="mileage_max_unlimit" class="">최대 사용금액은 제한이 없습니다.</li>
                              <li>적립금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면
                                    주문이 완료됩니다.</li>
                               </ul>
                           
                          
                        </td>
                        <td>
                           <ul class="info1">
                              <li>
                              <c:set var= "savingPoint" value="${total/20}"/>
                                    총 적립예정 포인트 : 
                                 <span class="pointSum"> 
                                 <strong><fmt:formatNumber value="${savingPoint}" pattern="#,###" /></strong>P
                                 </span>
                                          <!-- 넘겨서 Controller에서 계산해서 ksm_member에 업데이트 -->
                                 <input type="hidden" name="orignPoint" id="orignPoint" value="${memberInfo.MEMBER_MILEAGE}">
                                 <input type="hidden" name="savingPoint" value="${savingPoint}">
                                 <input type="hidden" name="usedPoint" id="usedPoint" value="">
                              </li>
                              
                           </ul>
                           <ul id="use_point">
                              
                           </ul>
                        </td>
                     </tr>
                  </tbody>
                  
               </table> 
              
               <div style="display:none">
               <c:forEach items="${couponList}" var="row" varStatus="status">
                  <c:if test="${row.COU_EDATE > currTime}">
         <input type="radio" class="${status.index}" id="COU_NO" name="COU_NO" value="${row.COU_NO}"/>   
                   </c:if> 
                            </c:forEach>   
               </div>      
                        </c:if>
               
              
              <table border="0" class="pay">
              <thead>
              <tr>
              <th scope="col">주문금액</th>
              <th scope="col">할인총액</th>
              <th scope="col">최종결제금액</th>
              </tr>
              </thead>
              <tbody>
                <tr>
                <td> <fmt:formatNumber value="${total}" pattern="#,###"/>원</td> 
                  
                <td><div id="discountTotal" name="discountTotal" style="display:inline">0</div>P</td>
                
                <td><div id="finalTotal1" name="finalTotal1" style="display:inline"><fmt:formatNumber value="${total}" pattern="#,###"/></div>원</td>
                </tr>
              </tbody>
                 <br>
                 <input type="hidden" id="finalTotal" name="finalTotal" value="${total}">
                 
                 </table>
            <%--                <h3>     
              (주문금액 : <fmt:formatNumber value="${total}" pattern="#,###"/>원  -  
              
            할인총액 : <div id="discountTotal" name="discountTotal" style="display:inline">0</div>P ) = 
              
               최종결제금액 :   <div id="finalTotal1" name="finalTotal1" style="display:inline"><fmt:formatNumber value="${total}" pattern="#,###"/></div>원
                 </h3> --%>
                 
                 
                 <table border="1" class="order3">
                 <div class="order4">
               <h3>배송 정보</h3>
               </div>
            <br/>
            <br/>
               
             
            
                 <!-- 국내 배송지 정보 -->
               <tbody class="">
            
               
                 <c:if test="${memberInfo.MEMBER_NAME != null}">
                     <tr class="">
                        <th scope="row">배송지 선택</th>
                        <td>
                           <div class="address">
                              <input id="sameaddr0" name="sameaddr0" fw-filter="" 
                                 fw-label="1" fw-msg="" value="M" type="radio" checked="checked" > <label
                                 for="sameaddr0">회원 정보와 동일</label> &nbsp;&nbsp;<input id="sameaddr1"
                                 name="sameaddr1" fw-filter="" fw-label="1" fw-msg=""
                                 value="F" type="radio"> <label for="sameaddr1">새로운배송지</label>
                           </div>
                        </td>
                     </tr>
                  </c:if>
                  <tr>
               <th scope="row">받으시는 분<img
                        src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
                        alt="필수"></th>
                        
               <td><input type="text" id="ORDER_NAME" name="ORDER_NAME" value="${memberInfo.MEMBER_NAME}" style="border-radius: 15px; height: 20px; outline: none;"></td>
             </tr>
                     
                 <tr>
                   
               <th scope="row">주소<img
                        src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
                        alt="필수"></th>
               <td>
                  <input type="text" name="ORDER_ADDR1" id="ORDER_ADDR1" placehodler="우편번호" value="${memberInfo.MEMBER_ZIPCODE }" style="border-radius: 15px; height: 20px; outline: none;"> 
                  <input type="button" onclick="ksm_execDaumPostcode()" value="우편번호찾기" id="button4"><br>
                  <input type="text" name="ORDER_ADDR2" id="ORDER_ADDR2" placehodler="주소" value="${memberInfo.MEMBER_ADDR1}" style="border-radius: 15px; width: 200px; height: 20px; outline: none;"><br> 
                  <input type="text" name="ORDER_ADDR3" id="ORDER_ADDR3" placehodler="상세주소" value="${memberInfo.MEMBER_ADDR2}" style="border-radius: 15px; height: 20px; outline: none;"><br>
                  <input type="text" name="ORDER_ADDR4" id="ORDER_ADDR4" placehodler="참고항목" value="${memberInfo.MEMBER_ADDR3}" style="border-radius: 15px; width: 250px; height: 20px; outline: none;">
                  </td>
                  
            </tr>
              

                 <tr>
               <th scope="row">핸드폰<img
                        src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
                        alt="필수"></th>
               <td><input type="text" id="ORDER_PHONE" name="ORDER_PHONE" value="${memberInfo.MEMBER_PHONE}" style="border-radius: 15px; height: 20px; outline: none;">
                  </td>
            </tr>
                     <tr>
                     <br>
                    </tr>
               </tbody>
               <!-- 이메일 국내/해외 -->
               <tr>
               <th scope="row">이메일<img
                        src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
                        alt="필수"></th>
               <td>
                  <input type="text" id="ORDER_EMAIL" name="ORDER_EMAIL" value="${memberInfo.MEMBER_EMAIL}" style="border-radius: 15px; height: 20px; outline: none;">
                  
                  <input type="hidden" name="MEMBER_ID" id="MEMBER_ID" value="${memberInfo.MEMBER_ID}">
                  <input type="hidden" name="ORDER_STATE" id="ORDER_STATE" value="1">
               </td>
            </tr>
                     
                     
        </table> 
             <br/> 
             <br/> 
             <br/>  
             
             <a href="#" id="button3" onClick="history.go(-1); return false;">이전으로</a>
             <a href="/kingsman/main" id="button3">메인으로</a> 
                 
                  <br/> 
             <br/> 
             <br/> 
        <input type="button" id="button3" value="결제하기" onclick="checkForm();">

 </form>
 <br/>
 <br/>
 <br/>
 <br/>
  <!-- 이용안내 -->
      <div class="ec-base-help">
         <h3>이용안내</h3>
         <br/>
         <table class="inner1" border="1">
         <div class="inner">
            <h4>WindowXP 서비스팩2를 설치하신후 결제가 정상적인 단계로 처리되지 않는경우, 아래의 절차에 따라 해결하시기 바랍니다.</h4>
            <ol>
               <li class="item1"><a href="javascript:;"
                  onclick="window.open('http://service-api.echosting.cafe24.com/shop/notice_XP_ActiveX.html','','width=795,height=500,scrollbars=yes',resizable=1);">안심클릭
                     결제모듈이 설치되지 않은 경우 ActiveX 수동설치</a></li>
               <li class="item2"><a
                  href="http://www.microsoft.com/korea/windowsxp/sp2/default.asp"
                  target="_blank">Service Pack 2에 대한 Microsoft사의 상세안내 </a></li>
               
            </ol>
            <!-- 크로스 브라우징 지원 -->
            <br/>
            <div class="">
               <h4>아래의 쇼핑몰일 경우에는 모든 브라우저 사용이 가능합니다.</h4>
               <ol>
                  <li class="item1"><strong>KG이니시스, KCP, LG U+를 사용하는
                        쇼핑몰일 경우</strong></li>
                  <li class="item2">결제가능브라우저 : 크롬,파이어폭스,사파리,오페라 브라우저에서 결제 가능<br>(단,
                     window os 사용자에 한하며 리눅스/mac os 사용자는 사용불가)
                  </li>
                  <li class="item3">최초 결제 시도시에는 플러그인을 추가 설치 후 반드시 브라우저 종료 후
                     재시작해야만 결제가 가능합니다.<br>(무통장, 휴대폰결제 포함)
                  </li>
               </ol>
            </div>
            <br/>
            <h4>세금계산서 발행 안내</h4>
            <br/>
            <ol>
               <li class="item1">부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달
                  10일까지만 요청하실 수 있습니다.</li>
               <li class="item2">세금계산서는 사업자만 신청하실 수 있습니다.</li>
               <li class="item3">배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</li>
               <li class="item4">[세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로
                  사업자등록증사본을 보내셔야 세금계산서 발생이 가능합니다.</li>
               <li class="item5">[세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</li>
            </ol>
            <br/>
            <h4>부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경안내</h4>
            <br/>
            <ol>
               <li class="item1">변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에
                  대해서는 세금계산서 발행이 불가하며</li>
               <li class="item2">신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)</li>
               <li class="item3">상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서
                  발행이 가능함을 양지하여 주시기 바랍니다.</li>
            </ol>
            <br/>
            <h4>현금영수증 이용안내</h4>
            <br/>
            <ol>
               <li class="item1">현금영수증은 1원 이상의 현금성거래(무통장입금, 실시간계좌이체, 에스크로,
                  예치금)에 대해 발행이 됩니다.</li>
               <li class="item2">현금영수증 발행 금액에는 배송비는 포함되고, 적립금사용액은 포함되지 않습니다.</li>
               <li class="item3">발행신청 기간제한 현금영수증은 입금확인일로 부터 48시간안에 발행을 해야
                  합니다.</li>
               <li class="item4">현금영수증 발행 취소의 경우는 시간 제한이 없습니다. (국세청의 정책에 따라
                  변경 될 수 있습니다.)</li>
               <li class="item5">현금영수증이나 세금계산서 중 하나만 발행 가능 합니다.</li>
            </ol>
         </div>
         </table>
      </div>
      
      <br/>
      <br/>
      <br/>
      
      <div class="interest_free" id="SYRUP_TABLE" name="SYRUP_TABLE">
   
   <h4>무이자할부 적용카드</h4>
   <br/>
   
   
   <div>
      <table>
         
         
         <tbody>
            
   <tr>
      <th scope="row">
         <script>
                if(cardImgArr[08] != null && cardImgArr[08] != "" && typeof(cardNmArr[08] )  != "undefined")
                    document.write("<img src='" + cardImgArr[08]+"' alt='"+cardNmArr[08]+"'>");
         </script><img src="https://www.11st.co.kr/img/common/icon/ico_card_08.gif" alt="신한카드">
      </th>
      <td>
         <div>
            
            <span>
                        2,3,4,5개월 
                        (5만원 이상)

                        </span>
            
            <span>
                        7,8,9,10,11,12개월 
                        (20만원 이상,11Pay 전용)

                        </span>
            
            <span>
                        13,14,15,16,17,18,19,20,21,22개월 
                        (100만원 이상,11Pay 전용)

                        </span>
            
   </div>
   </td>
   </tr>
   
   <tr>
      <th scope="row">
         <script>
                if(cardImgArr[01] != null && cardImgArr[01] != "" && typeof(cardNmArr[01] )  != "undefined")
                    document.write("<img src='" + cardImgArr[01]+"' alt='"+cardNmArr[01]+"'>");
         </script><img src="https://www.11st.co.kr/img/common/icon/ico_card_01.gif" alt="국민카드">
      </th>
      <td>
         <div>
            
            <span>
                        2,3개월 
                        (5만원 이상)

                        </span>
            
            <span>
                        4,5개월 
                        (20만원 이상)

                        </span>
            
            <span>
                        6,7,8,9,10,11,12개월 
                        (20만원 이상,11Pay 전용)

                        </span>
            
            <span>
                        13,14,15,16,17,18,19,20,21,22개월 
                        (100만원 이상,11Pay 전용)

                        </span>
            
   </div>
   </td>
   </tr>
   
   <tr>
      <th scope="row">
         <script>
                if(cardImgArr[27] != null && cardImgArr[27] != "" && typeof(cardNmArr[27] )  != "undefined")
                    document.write("<img src='" + cardImgArr[27]+"' alt='"+cardNmArr[27]+"'>");
         </script><img src="https://www.11st.co.kr/img/common/icon/ico_card_02.gif" alt="비씨카드">
      </th>
      <td>
         <div>
            
            <span>
                        2,3,4,5,6개월 
                        (5만원 이상)

                        </span>
            
   </div>
   </td>
   </tr>
   
   <tr>
      <th scope="row">
         <script>
                if(cardImgArr[31] != null && cardImgArr[31] != "" && typeof(cardNmArr[31] )  != "undefined")
                    document.write("<img src='" + cardImgArr[31]+"' alt='"+cardNmArr[31]+"'>");
         </script><img src="https://www.11st.co.kr/img/common/icon/ico_card_100.gif" alt="우리카드">
      </th>
      <td>
         <div>
            
            <span>
                        2,3,4,5,6,7개월 
                        (5만원 이상)

                        </span>
            
   </div>
   </td>
   </tr>
   
   <tr>
      <th scope="row">
         <script>
                if(cardImgArr[07] != null && cardImgArr[07] != "" && typeof(cardNmArr[07] )  != "undefined")
                    document.write("<img src='" + cardImgArr[07]+"' alt='"+cardNmArr[07]+"'>");
         </script><img src="https://www.11st.co.kr/img/common/icon/ico_card_07.gif" alt="현대카드">
      </th>
      <td>
         <div>
            
            <span>
                        2,3,4,5개월 
                        (5만원 이상)

                        </span>
            
            <span>
                        12개월 
                        (20만원 이상,11Pay 전용)

                        </span>
            
            <span>
                        22개월 
                        (100만원 이상,11Pay 전용)

                        </span>
            
   </div>
   </td>
   </tr>
   
   <tr>
      <th scope="row">
         <script>
                if(cardImgArr[02] != null && cardImgArr[02] != "" && typeof(cardNmArr[02] )  != "undefined")
                    document.write("<img src='" + cardImgArr[02]+"' alt='"+cardNmArr[02]+"'>");
         </script><img src="https://www.11st.co.kr/img/common/icon/ico_card_04.gif" alt="삼성카드">
      </th>
      <td>
         <div>
            
            <span>
                        2,3,4,5개월 
                        (5만원 이상)

                        </span>
            
            <span>
                        12개월 
                        (20만원 이상,11Pay 전용)

                        </span>
            
   </div>
   </td>
   </tr>
   
   <tr>
      <th scope="row">
         <script>
                if(cardImgArr[11] != null && cardImgArr[11] != "" && typeof(cardNmArr[11] )  != "undefined")
                    document.write("<img src='" + cardImgArr[11]+"' alt='"+cardNmArr[11]+"'>");
         </script><img src="https://www.11st.co.kr/img/common/icon/ico_card_09.gif" alt="시티카드">
      </th>
      <td>
         <div>
            
            <span>
                        2,3,4,5,6개월 
                        (5만원 이상)

                        </span>
            
   </div>
   </td>
   </tr>
   
   <tr>
      <th scope="row">
         <script>
                if(cardImgArr[16] != null && cardImgArr[16] != "" && typeof(cardNmArr[16] )  != "undefined")
                    document.write("<img src='" + cardImgArr[16]+"' alt='"+cardNmArr[16]+"'>");
         </script><img src="https://www.11st.co.kr/img/common/icon/ico_card_18.gif" alt="농협카드">
      </th>
      <td>
         <div>
            
            <span>
                        2,3,4,5,6개월 
                        (5만원 이상)

                        </span>
            
            <span>
                        12개월 
                        (20만원 이상,11Pay 전용)

                        </span>
            
   </div>
   </td>
   </tr>
   
   <tr>
      <th scope="row">
         <script>
                if(cardImgArr[35] != null && cardImgArr[35] != "" && typeof(cardNmArr[35] )  != "undefined")
                    document.write("<img src='" + cardImgArr[35]+"' alt='"+cardNmArr[35]+"'>");
         </script><img src="https://www.11st.co.kr/img/common/icon/ico_card_35.gif" alt="SC리워드카드">
      </th>
      <td>
         <div>
            
            <span>
                        2,3,4,5,6개월 
                        (5만원 이상)

                        </span>
            

         </div>
      </td>
   </tr>
   </tbody>
   </table>
</div>
<ul class="info">
   <li>제외품목 : 순금매장, 아동용쥬얼리, 복지용구(요양보험), e-쿠폰/상품권/이용권, 문화비소득공제상품(도서/티켓) 등
      <span>(제외품목 상품을 포함하여 할부 결제 시 할부 수수료가 청구됩니다)</span></li>
   <li>제외카드 : 체크/법인/선불/기프트/NON-BC카드 제외(BC계열은 BC카드 무이자 한도 적용)</li>
</ul>
</div>
 <br/>
 <br/>
</body>
<script>

$(document).ready(function() 
   { 
   /* $("input:radio[name=sameaddr0]:radio[value='M']").prop('checked', true); */
   
      $("input:radio[name=sameaddr0]").click(function(){ 
          CopyInfo(); 
      }) 
      
      $("input:radio[name=sameaddr1]").click(function(){ 
                deleteInfo(); 
      }) 


   });
   
   
   function CopyInfo(){ 
            $('#ORDER_NAME').val("${memberInfo.MEMBER_NAME}");
            $('#ORDER_ADDR1').val("${memberInfo.MEMBER_ZIPCODE }");
            $('#ORDER_ADDR2').val("${memberInfo.MEMBER_ADDR1}");
            $('#ORDER_ADDR3').val("${memberInfo.MEMBER_ADDR2}");
            $('#ORDER_ADDR4').val("${memberInfo.MEMBER_ADDR3}");
            $('#ORDER_PHONE').val("${memberInfo.MEMBER_PHONE}");
            $('#ORDER_EMAIL').val("${memberInfo.MEMBER_EMAIL}");
           $("input:radio[name='sameaddr1']:radio").prop("checked", false); 
   }
   
   function deleteInfo(){
      $('#ORDER_NAME').val("");
      $('#ORDER_ADDR1').val("");
      $('#ORDER_ADDR2').val("");
      $('#ORDER_ADDR3').val("");
      $('#ORDER_ADDR4').val("");
      $('#ORDER_PHONE').val("");
      $('#ORDER_EMAIL').val("");
      $("input:radio[name='sameaddr0']:radio").prop("checked", false); 
   }
</script>
</html>