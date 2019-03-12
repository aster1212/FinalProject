<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script>
function moveMain(){
   location.href="/kingsman/main";
}

function movePaymentList(){
   location.href="/kingsman/member/purchase";
}
</script>   

       <style>
               <style>
@font-face { 
   font-family: "NotoSansKR-Light"; 
   src: url('/kingsman/resources/font/NotoSansKR-Light.ttf');
}
table.type05 {
    border-collapse: separate;
    text-align: center;
    line-height: 1.5;
    border-top: 2px solid #444444;
    border-bottom: 2px solid #444444;
    margin: auto;
    width: 90%;
}
table.type05 th {
    width: 30%;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    
    border-bottom: 1px solid #ccc;
    background: #efefef;
}
table.type05 td {
    width: 70%;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    text-align: center;
}

body{
     font-size: 120%;
}

#memModifyBtn
{
   border: none;
   border-radius: 10px;
   background-color: #000000;
   width : 120px;
   height: 30px;
   text-align:center;
   font-family: "NotoSansKR-Light";
   font-size: 15px;
   font-weight:bold;
   color:#FFFFFF;
}
#memModifyBtn:hover
{
   border: none;
   outline:none;
   border-radius: 10px;
   background-color: #50DEAA;
   width : 120px;
   height: 30px;
   text-align:center;
   font-family: "NotoSansKR-Light";
   font-size: 15px;
   font-weight:bold;
   color:#FFFFFF;
}


        </style>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
    <div style="margint-left: auto;">
       <c:if test="${ORDER_STATE==1}"><h1>주문이 완료되었습니다</h1></c:if>
        <c:if test="${ORDER_STATE==5}"><h1>교환신청이 완료되었습니다</h1></c:if>
      <c:if test="${ORDER_STATE==6}"><h1>환불신청이 완료되었습니다</h1></c:if>
   </div>
   <br>
   <br>
      <c:if test="${ORDER_STATE==1}">
   
   <div style="margint-left: auto;">
   
   <table class="type05">
   
   <tr>
      <th>주문번호</th>
      <td>${ORDER_NO}</td>
   </tr>
   
   <tr>
      <th>주문자</th>
      <td>${Detail.ORDER_NAME}</td>
   </tr>
   
   <tr>
      <th>주문일자</th>
      <td>${Detail.ORDER_DATE}</td>
   </tr>
   
   <tr>
      <th>주문금액</th>
      <td><fmt:formatNumber value="${Detail.ORDER_TOTALPAYMENT}" pattern="#,###"/> 원</td>
      
   </tr>
   
   <tr>
      <th>배송지</th>
      <td>${Detail.ORDER_ADDR}</td>
   </tr>
   
   <tr>   
      <th>결제방식</th>
      
      <c:if test="${Detail.ORDER_PAYMENT==1}">
      <td>
      신용카드
      </td>
      </c:if>
      
      
      <c:if test="${Detail.ORDER_PAYMENT==2}">
      <td>
      무통장입금
      </td>
      </c:if>
      
   </tr>
   
   </table>
   
    </div>
   
       </c:if>
       
       </br>
       
      <input type="button" value="메인으로" onclick="moveMain()" id="memModifyBtn" style="cursor:pointer">
      
      <c:if test="${Detail.MEMBER_ID ne 'none'}">
      <input type="button" value="결제내역" onclick="movePaymentList()" id="memModifyBtn" style="cursor:pointer">
      </c:if>
</body>
</html>