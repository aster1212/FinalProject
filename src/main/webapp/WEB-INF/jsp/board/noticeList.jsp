<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="/kingsman/resources/css/Board.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/kingsman/resources/js/csBoard.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<div style="height: 100px"></div>
<div id="boardContent">
<div>
	<jsp:include page="subTab.jsp"></jsp:include>
</div>
<div id="boardListTitle">NOTICE</div>
<br>
	<c:choose>
		<c:when test="${List.size() > 0}">
			<c:forEach items="${List}" var="row" varStatus="stat">
				<div class="boardList" onclick="window.location='detail?BOARD_NO=${row.BOARD_NO}&nowPage=${nowPage}'">
					<div class="boardListLeft" >
						<font class="boardTitle">${row.BOARD_TITLE}</font>
					</div>
					<div class="boardListRight">
						<div class="viewDiv">
							<img alt="조회수" src="/kingsman/resources/upload/view.png"><div class="viewCountDiv">${row.BOARD_CNT }</div>
						</div>
						&nbsp;&nbsp;
						<div class="dateDiv">
						<fmt:formatDate value="${row.BOARD_REGDATE}" pattern="yyyy.MM.dd"/>
						</div>
					</div>
				</div>
				<br>
			</c:forEach>
			<c:if test="${10 - List.size() > 0}">
				<c:forEach begin="0" end="${10 - List.size()}" step="1">
				<div style="height: 54px; width: 100%;"></div>
				</c:forEach>
			</c:if>
		</c:when>
		<c:otherwise>
			<div class="boardList">공지사항이 없습니다.</div>
		</c:otherwise>
	</c:choose>
<div style="height: 10px"></div>
<div class="pagingView">${paging}</div>
<div style="height: 20px"></div>
<c:if test="${memgrade != null && memgrade == 99}">
<input id="boardWriteBtn" class="boardBtn pointer" type="button" value="글 쓰기" onclick="window.location='/kingsman/admin/boardWriteForm?bylist=1'">
</c:if>
</div>
<script type="text/javascript">
</script>
</body>
</html>