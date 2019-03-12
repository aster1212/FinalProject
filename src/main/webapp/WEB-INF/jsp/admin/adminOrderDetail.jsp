<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
<br><br><br><br>
<div>
<select name="orderState" id="orderState" onchange="fn_updateState()">
<option value="1">주문완료</option>
<option value="2">배송준비중</option>
<option value="3">배송완료</option>
<option value="4">구매완료</option>
<option value="5">교환처리중</option>
<option value="6">환불처리중</option>
<option value="0">주문취소</option>
<option value="7">교환처리완료</option>
<option value="8">환불처리완료</option>
<option value="9">배송중</option>
</select>

&nbsp;
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
</div>

<table class="board_list">
		<colgroup>
		 	<col width="5%"/>
			<col width="30%"/>
			<col width="5%"/>
			<col width="10%"/>
			<col width="5%"/>
			<col width="5%"/>
		</colgroup>
		
		<caption>주문정보</caption>
		
		<tbody>
			<tr>
				<th scope="row">주문번호</th>
				<td>${Detail.ORDER_NO}</td>
				<th scope="row">주문자</th>
				<td>${Detail.ORDER_NAME}</td>
				<th scope="row">주문상태</th>
				<td>
<c:choose>
<c:when test="${Detail.ORDER_STATE==0}">주문취소</c:when>
<c:when test="${Detail.ORDER_STATE==1}">주문완료</c:when>
<c:when test="${Detail.ORDER_STATE==2}">배송준비중</c:when>
<c:when test="${Detail.ORDER_STATE==3}">배송완료</c:when>
<c:when test="${Detail.ORDER_STATE==4}">구매완료</c:when>
<c:when test="${Detail.ORDER_STATE==5}">교환처리중</c:when>
<c:when test="${Detail.ORDER_STATE==6}">환불처리중</c:when>
<c:when test="${Detail.ORDER_STATE==7}">교환처리완료</c:when>
<c:when test="${Detail.ORDER_STATE==8}">환불처리완료</c:when>
<c:when test="${Detail.ORDER_STATE==9}">배송중</c:when>
<c:otherwise>처리완료</c:otherwise>
</c:choose>
		 </td>
			</tr>
			<tr>
				<th scope="row">주문자ID</th>
				<td>${Detail.MEMBER_ID}</td>
				<th scope="row">주문일자</th>
				<td>${Detail.ORDER_DATE}</td>
				<th scope="row">휴대전화</th>
				<td>${Detail.ORDER_PHONE}</td>

			</tr>
			<tr>
				<th scope="row">배송지</th>
				<td>${Detail.ORDER_ADDR}</td>
				
				<c:if test="${Detail.ORDER_PAYMENT!=null}">
				<th scope="row">거래수단</th>
				<td><c:if test="${Detail.ORDER_PAYMENT==1}">신용카드</c:if></td>
				</c:if>
				
				<th scope="row">주문총액</th>
				<td><fmt:formatNumber value="${Detail.ORDER_TOTALPAYMENT}" pattern="#,###"/>원</td>
				
				
			</tr>		
				<c:if test="${Detail.ORDER_EXCHANGE!=null}">
			<tr>
				<th scope="row">교환사유</th>
				<td>${Detail.ORDER_EXCHANGE}</td>	
			</tr>
				</c:if>
				
		</tbody>
	</table>


</br>

<table class="board_list">
		<colgroup>
		 	<col width="20%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="15%"/>
			<col width="10%"/>
			<col width="10%"/>
		</colgroup>
		
		<caption>물품정보</caption>
		
		<tbody>
	<tr>
				<th scope="col">상품이름</th>
				<th scope="col">수량</th>
				<th scope="col">사이즈</th>
				<th scope="col">색상</th>
				<th scope="col">가격</th>
				<th scope="col">옵션</th>
			</tr>

			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list}" var="row">
						<tr>
							<td>${row.ORDERITEM_NAME}</td>	
							<td>${row.ORDERITEM_COUNT}</td>
							<td>${row.ORDERITEM_SIZE}</td>
							<td>${row.ORDERITEM_COLOR}</td>	
							<td>${row.ORDERITEM_PRICE}</td>
							<td>${row.ORDERITEM_OPTION}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
</table>

<%@ include file="/WEB-INF/include/include-body.jspf"%>

	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});

			$("#delete").on("click", function(e){
				e.preventDefault();
				fn_deleteBoard();
			});
			
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/orderList' />");
			comSubmit.submit();
		}
		
		//상품업데이트
		function fn_updateState(){
			var ORDER_NO = "${Detail.ORDER_NO}";
			var target = document.getElementById("orderState");
			
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/orderUpdate'/>");
			comSubmit.addParam("ORDER_NO", ORDER_NO);
			comSubmit.addParam("ORDER_STATE", target.options[target.selectedIndex].value);
			comSubmit.addParam("ORDERITEM_STATE", target.options[target.selectedIndex].value);
			comSubmit.submit();
		}
		
		function fn_deleteBoard(){
			var ORDER_NO = "${Detail.ORDER_NO}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/orderDelete'/>");
			comSubmit.addParam("ORDER_NO", ORDER_NO);
			comSubmit.submit();
			
		}
	</script>

	
	
</body>
</html>