<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script type="text/javascript" src="/kingsman/resources/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="/kingsman/resources/css/adminItemList.css">
</head>
<body>
<div class="top">
<h1>관리자 상품 리스트</h1>
<br>
<form><input type="text" name="searchStr" value="${searchStr}"> <input type="submit"></form>
<br>
<ul>
	<c:choose>
		<c:when test="${List.size() > 0}">
			<c:forEach items="${List}" var="row" varStatus="status" begin="0" step="1">
				<div class="itemLists" style="display: inline-block;">
					<table >
						<tr>
							<td>아이템 번호</td>
							<td> ${row.ITEM_NO }</td>
						</tr>
						<tr>
							<td colspan="2">
							<div class="itemImg" >
								<img alt="이미지" style=" width:200px;" src="/kingsman/resources/imagephoto/${row.ITEM_SHORTPATH}" onmouseover="this.style.opacity='0.8'" onmouseout="this.style.opacity='0.5'">
							</div>
							</td>
						</tr>
						<tr>
							<td>이름</td>
							<td><a href="itemModifyForm?ITEM_NO=${row.ITEM_NO}&nowPage=${nowPage}">${row.ITEM_NAME}</a></td>
						</tr>
						<tr>
							<td>상품 가격</td>
							<td> ${row.ITEM_PRICE}원</td>
						</tr>
						<tr>
							<td colspan="2"><a href="itemDelete?ITEM_NO=${row.ITEM_NO}"> <img src="/kingsman/resources/image/delete.png"   width="50px"  ></a></td>
						</tr>
					</table>
				
				<br>
				</div>
				 <c:if test="${(status.count)%3==0}"><br><br></c:if>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<li>등록된 아이템이 없습니다.</li>
		</c:otherwise>
	</c:choose>
</ul>
<a href="/kingsman/admin/itemWriteForm"><img src="/kingsman/resources/image/insert.png"   width="80px"  ></a>
${paging}
</div>
</body>
</html>