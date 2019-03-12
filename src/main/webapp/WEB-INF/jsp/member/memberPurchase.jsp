<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="/kingsman/resources/css/memberPurchase.css">
</head>
<body>
<div id="purchaseList">
   <table id="purchaseTable">
      <thead>
         <tr>
            <th><div id="thdiv">번호</div></th>
            <th>&nbsp;</th>
            <th>상품정보(색상,사이즈,옵션)</th>
            <th>수량</th>
            <th>주문일자</th>
            <th>주문상태</th>
            <th>교환/환불</th>
         </tr>
      </thead>
      <tbody>
         <tr>
            <c:choose>
            <c:when test="${fn:length(purList) > 0}">
               <c:forEach items="${purList}" var="row">
               <tr>
                  <td><div id="tddiv">${row.ORDER_NO}</div></td>
                  <td>
                     <img id="purchaseImg" src="/kingsman/resources/upload/${row.ITEM_SHORTPATH}">
                  </td>
                  <td>
                     ${row.ORDERITEM_NAME}<br>
                     <div id="purchaseOption">
                     ( 사이즈: ${row.ORDERITEM_SIZE} / 색상: ${row.ORDERITEM_COLOR} / 옵션: ${row.ORDERITEM_OPTION} )
                     </div>
                  </td>
                  <td>${row.ORDERITEM_COUNT}</td>
                  <td>${row.ORDERITEM_DATE}</td>
                  <td>
                     <c:choose>
                     <c:when test="${row.ORDERITEM_STATE==0}">주문취소</c:when>
                     <c:when test="${row.ORDERITEM_STATE==1}">주문완료</c:when>
                     <c:when test="${row.ORDERITEM_STATE==2}">배송준비중</c:when>
                     <c:when test="${row.ORDERITEM_STATE==3}">배송완료</c:when>
                     <c:when test="${row.ORDERITEM_STATE==4}">구매완료</c:when>
                     <c:when test="${row.ORDERITEM_STATE==5}">교환처리중</c:when>
                     <c:when test="${row.ORDERITEM_STATE==6}">환불처리중</c:when>
                     <c:when test="${row.ORDERITEM_STATE==7}">교환처리완료</c:when>
                     <c:when test="${row.ORDERITEM_STATE==8}">환불처리완료</c:when>
                     <c:when test="${row.ORDERITEM_STATE==9}">배송중</c:when>
                     <c:otherwise>처리완료&nbsp;</c:otherwise>
                     </c:choose>
                  </td>
                  <td>
                     <input type="button" id="exchange1" value="교환" onclick="location.href='/kingsman/order/exchangeForm?order_no=${row.ORDER_NO}'">
                     <input type="button" id="exchange2" value="환불" onclick="location.href='/kingsman/order/refundForm?order_no=${row.ORDER_NO}'">
                  </td>
               </tr>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td colspan="4">조회된 결과가 없습니다.</td>
               </tr>
            </c:otherwise>
            </c:choose>
         </tr>
      </tbody>
   </table>
</div>
   <div id="pagePurchase">
      ${purListPage}
   </div>
   <div id="mypagePurchase">
      <input type="button" id="mypagePurchasebtn" value="마이페이지" onclick="location.href='/kingsman/member/mypage'">
   </div>
</body>
</html>