<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

</head>
<body>
<br><br><br><br>
	<h2>전체 주문 목록</h2>
<div>
	<label><input type="button" name="orderList" value="전체" onclick="fn_openOrderList();"></label>
	<label><input type="button" name="exchangeList" value="교환" onclick="fn_openExchangeList();"></label>
	<label><input type="button" name="refundList" value="환불" onclick="fn_openRefundList();"></label>
	<label><input type="button" name="completeList" value="완료" onclick="fn_openCompleteList();"></label>
</div>
	<table class="board_list">
		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">주문상태</th>
				<th scope="col">주문번호</th>
				<th scope="col">주문자</th>
				<th scope="col">ID</th>
				<th scope="col">전화번호</th>
				<th scope="col">주문일자</th>
				<th scope="col">결제방식</th>
				<th scope="col">주문총액</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(List) > 0}">
					<c:forEach items="${List}" var="row">
						<tr>
							<td>
 <c:choose>
<c:when test="${row.ORDER_STATE==0}">주문취소</c:when>
<c:when test="${row.ORDER_STATE==1}">주문완료</c:when>
<c:when test="${row.ORDER_STATE==2}">배송준비중</c:when>
<c:when test="${row.ORDER_STATE==3}">배송완료</c:when>
<c:when test="${row.ORDER_STATE==4}">구매완료</c:when>
<c:when test="${row.ORDER_STATE==5}">교환처리중</c:when>
<c:when test="${row.ORDER_STATE==6}">환불처리중</c:when>
<c:when test="${row.ORDER_STATE==7}">교환처리완료</c:when>
<c:when test="${row.ORDER_STATE==8}">환불처리완료</c:when>
<c:when test="${row.ORDER_STATE==9}">배송중</c:when>
<c:otherwise>처리완료</c:otherwise>
</c:choose> 
							</td>
							<td class="title"><a href="#this" name="title">${row.ORDER_NO}</a>
								<input type="hidden" id="ORDER_NO" value="${row.ORDER_NO}"></td>
							<td>${row.ORDER_NAME}</td>	
							<td>${row.MEMBER_ID}</td>
							<td>${row.ORDER_PHONE}</td>
							<td>${row.ORDER_DATE}</td>
							<c:if test="${row.ORDER_PAYMENT!=null}">
								 <td><c:if test="${row.ORDER_PAYMENT==1}">신용카드</c:if></td>
							</c:if>
							<td><fmt:formatNumber value="${row.ORDER_TOTALPAYMENT}" pattern="#,###"/>원</td>
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
	<div>${paging}</div>
	<br />


							<!-- 검색 추가 -->
<div id="searchBox">
<script type="text/javascript">
			//검색 로직을 위해 추가한 부분
	function validation(){
		if(document.form.keyword.value==""){
			alert("검색내용을 입력하세요.");
			document.form.keyword.value.focus();
			return false;
		}
	}
</script>

	
		<form name="form" id="form" onsubmit="return validation()">
	
<select name="searchn">
<option value="MEMBER_ID">ID</option>
<option value="ORDER_NO">주문번호</option>
<option value="ORDER_NAME">주문자</option>
</select>

		<input type="text" name="keyword" size="15" maxlength="50" height="25" placeholder="Search..." />
		<%-- <input type="hidden" id="ORDER_STATE" value="${List.ORDER_NO}"></td>  --%>
		<input type="submit" id="search" value="검색" />
	</form>
	
</div>
				<!-- 검색로직 : 끔찍한 혼종의 탄생 -->
<%@ include file="/WEB-INF/include/include-body.jspf"%> 

	<script type="text/javascript">	
		$(document).ready(function() {	
			$("a[name='title']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_openOrderDetail($(this));
			});
			
		 	$("#search").on("click", function(e){ //검색
				e.preventDefault();
				fn_searchOrder();
				
			}); 
		 	
			
		});
		</script>
		

		
		<script type="text/javascript">	
		
		//전체 주문목록
		function fn_openOrderList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/orderList' />");
			comSubmit.submit();
		}
		
		//교환 목록
		function fn_openExchangeList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/exchangeList' />");
			comSubmit.addParam("ORDER_STATE", "5");
			comSubmit.submit();
		}
		
		//환불 목록
		function fn_openRefundList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/refundList' />");
			comSubmit.addParam("ORDER_STATE", "6");
			comSubmit.submit();
		}
		
		//구매완료 목룍
		function fn_openCompleteList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/completeList' />");
			comSubmit.addParam("ORDER_STATE", "4");
			comSubmit.submit();
		}
		
		function fn_openOrderDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/orderDetail' />");
			comSubmit.addParam("ORDER_NO", obj.parent().find("#ORDER_NO").val());
			comSubmit.submit();
		}

				//검색
		function fn_searchOrder(){
			var ORDER_STATE = "${ORDER_STATE}";
			var comSubmit = new ComSubmit("form");
			comSubmit.setUrl("<c:url value='/admin/orderList' />");
 			comSubmit.addParam("ORDER_STATE", ORDER_STATE);
			comSubmit.submit(); 
				}
		
	</script>
</body>
</html>