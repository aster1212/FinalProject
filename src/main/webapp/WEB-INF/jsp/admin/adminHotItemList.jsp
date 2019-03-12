<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</head>
<body>
	<h2>이번달 인기아이템</h2>
	<table class="board_list">
		<colgroup>
			<col width="10%" />
			<col width="20" />
 			<col width="10%" />
			<!--<col width="20%" /> -->
		</colgroup>
		<thead>
			<tr>
				<th scope="col">순위(1~5)</th>
				<th scope="col">품명</th>
				<th scope="col">판매량</th>
			</tr>
		</thead>		
		<tbody>		
		<c:choose>
				<c:when test="${fn:length(thisMonthList) > 0}">
					<c:forEach items="${thisMonthList}" var="row" begin="0" end="4" varStatus="status">	
		
				<tr>
				<td>${status.count}위</td>
				<td>${row.ORDERITEM_NAME}</td>
				<td>${row.COUNT}</td>
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
	<br />
	
<hr>

		<h2>지난달 인기아이템</h2>
	<table class="board_list">
		<colgroup>
			<col width="10%" />
			<col width="20" />
 			<col width="10%" />
			<!--<col width="20%" /> -->
		</colgroup>
		<thead>
			<tr>
				<th scope="col">순위(1~5)</th>
				<th scope="col">품명</th>
				<th scope="col">판매량</th>
			</tr>
		</thead>		
		<tbody>		
		<c:choose>
				<c:when test="${fn:length(lastMonthList) > 0}">
					<c:forEach items="${lastMonthList}" var="row" begin="0" end="4" varStatus="status">	
		
				<tr>
				<td>${status.count}위</td>
				<td>${row.ORDERITEM_NAME}</td>
				<td>${row.COUNT}</td>
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

<hr>

		<h2>금년 인기아이템(최근 12개월)</h2>
	<table class="board_list">
		<colgroup>
			<col width="10%" />
			<col width="20" />
 			<col width="10%" />
			<!--<col width="20%" /> -->
		</colgroup>
		<thead>
			<tr>
				<th scope="col">순위(1~5)</th>
				<th scope="col">품명</th>
				<th scope="col">판매량</th>
			</tr>
		</thead>		
		<tbody>		
		<c:choose>
				<c:when test="${fn:length(thisYearList) > 0}">
					<c:forEach items="${thisYearList}" var="row" begin="0" end="4" varStatus="status">	
		
				<tr>
				<td>${status.count}위</td>
				<td>${row.ORDERITEM_NAME}</td>
				<td>${row.COUNT}</td>
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
	
	<hr>
	
		<h2>작년 인기아이템</h2>
	<table class="board_list">
		<colgroup>
			<col width="10%" />
			<col width="20" />
 			<col width="10%" />
			<!--<col width="20%" /> -->
		</colgroup>
		<thead>
			<tr>
				<th scope="col">순위(1~5)</th>
				<th scope="col">품명</th>
				<th scope="col">판매량</th>
			</tr>
		</thead>		
		<tbody>		
		<c:choose>
				<c:when test="${fn:length(lastYearList) > 0}">
					<c:forEach items="${lastYearList}" var="row" begin="0" end="4" varStatus="status">	
		
				<tr>
				<td>${status.count}위</td>
				<td>${row.ORDERITEM_NAME}</td>
				<td>${row.COUNT}</td>
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
	
	<hr>
	
		<h2>인기아이템(전체 기간)</h2>
	<table class="board_list">
		<colgroup>
			<col width="10%" />
			<col width="20" />
 			<col width="10%" />
			<!--<col width="20%" /> -->
		</colgroup>
		<thead>
			<tr>
				<th scope="col">순위(1~5)</th>
				<th scope="col">품명</th>
				<th scope="col">판매량</th>
			</tr>
		</thead>		
		<tbody>		
		<c:choose>
				<c:when test="${fn:length(entireList) > 0}">
					<c:forEach items="${entireList}" var="row" begin="0" end="4" varStatus="status">	
		
				<tr>
				<td>${status.count}위</td>
				<td>${row.ORDERITEM_NAME}</td>
				<td>${row.COUNT}</td>
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
</body>
</html>