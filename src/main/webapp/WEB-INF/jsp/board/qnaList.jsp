<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<%-- <%
request.getSession().setAttribute("memgrade", 99);
request.getSession().setAttribute("idSession", "admin");
%> --%>
<%-- <%
	request.getSession().invalidate();
%> --%>
<html>
<head>
<meta charset="UTF-8">
<title>문의</title>
<link rel="stylesheet" type="text/css" href="/kingsman/resources/css/Board.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/kingsman/resources/js/csBoard.js"></script>
<script type="text/javascript" src="/kingsman/resources/js/csAlert.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<div style="height: 100px"></div>
<div id="boardContent">
<div>
	<jsp:include page="subTab.jsp"></jsp:include>
</div>
<div id="boardListTitle">QnA</div>
	 <c:choose>
	 	<c:when test="${List.size() > 0}">
	 		<c:forEach items="${List}" var="row">
	 			<c:choose>
	 				<c:when test="${row.BOARD_SC_STATE == 'Y'}">
	 				<!-- 비공개 글일 때 -->
	 					<c:choose>
	 						<c:when test="${memgrade == 99 || row.MEMBER_ID eq idSession}">
	 						<!-- 관리자나 자신의 비공개 글일 때 -->
	 							<div class="boardList" onclick="window.location='detail?BOARD_NO=${row.BOARD_NO}&nowPage=${nowPage}'">
									<div class="boardListLeft">
									<c:forEach begin="1" end="${row.BOARD_RE_LEVEL}" step="1">&nbsp;&nbsp;</c:forEach>
									<c:if test="${row.BOARD_RE_LEVEL gt 0}"><img class="replyImg" src="/kingsman/resources/upload/reply.png"></c:if>
										<img alt="비밀글" src="/kingsman/resources/upload/boardLock.png" style="display: inline-block; width: 20px;height: 20px;"> <font class="boardTitle">${row.BOARD_TITLE}</font>
									</div>
									<div class="boardListRight">
										${row.MEMBER_ID} &nbsp;&nbsp;
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
	 						</c:when>
	 						<c:otherwise>
	 						<!-- 관련 없는 비공개 -->
	 							<div class="boardList" onclick="alert('비공개 글입니다.');">
									<div class="boardListLeft">
	 								<c:forEach begin="1" end="${row.BOARD_RE_LEVEL}" step="1">&nbsp;&nbsp;</c:forEach>
									<c:if test="${row.BOARD_RE_LEVEL gt 0}"><img class="replyImg" src="/kingsman/resources/upload/reply.png"></c:if>
	 								<img alt="비밀글" src="/kingsman/resources/upload/boardLock.png" style="display: inline-block; width: 20px;height: 20px;"> 비 공개 글입니다.
	 								</div>
	 								<div class="boardListRight">
	 									${row.MEMBER_ID} &nbsp;&nbsp;
	 									<div class="viewDiv">
											<img alt="조회수" src="/kingsman/resources/upload/view.png"><div class="viewCountDiv">${row.BOARD_CNT }</div>
										</div>
	 									&nbsp;&nbsp;
										<div class="dateDiv">
										<fmt:formatDate value="${row.BOARD_REGDATE}" pattern="yyyy.MM.dd"/>
										</div> 
									</div>
								</div>
	 						</c:otherwise>
	 					</c:choose>
	 				</c:when>
	 				<c:when test="${row.BOARD_SC_STATE == 'N'}">
	 				<!-- 공개 글일 때 -->
	 					<div class="boardList" onclick="window.location='detail?BOARD_NO=${row.BOARD_NO}&nowPage=${nowPage}'">
							<div class="boardListLeft">
							<c:forEach begin="1" end="${row.BOARD_RE_LEVEL}" step="1">&nbsp;&nbsp;</c:forEach>
							<c:if test="${row.BOARD_RE_LEVEL gt 0}"><img class="replyImg" src="/kingsman/resources/upload/reply.png"></c:if>
								<font class="boardTitle">${row.BOARD_TITLE}</font>
							</div>
							<div class="boardListRight">
								${row.MEMBER_ID} &nbsp;&nbsp;
								<div class="viewDiv">
									<img alt="조회수" src="/kingsman/resources/upload/view.png"><div class="viewCountDiv">${row.BOARD_CNT }</div>
								</div>
								&nbsp;&nbsp;
								<div class="dateDiv">
								<fmt:formatDate value="${row.BOARD_REGDATE}" pattern="yyyy.MM.dd"/>
								</div> 
							</div>
						</div>
	 				</c:when>
	 			</c:choose>
	 		</c:forEach>
	 		<c:if test="${10 - List.size() > 0}">
				<c:forEach begin="0" end="${10 - List.size()}" step="1">
				<div style="height: 54px; width: 100%;"></div>
				</c:forEach>
			</c:if>
	 	</c:when>
	 	<c:otherwise><div class="boardList">QnA가 없습니다.</div></c:otherwise>
	 </c:choose>
	 
<div style="height: 10px"></div>
<div class="pagingView">${paging}</div>
<div style="height: 20px"></div>
<c:if test="${memgrade != null}">
<input id="boardWriteBtn" class="boardBtn pointer" type="button" value="글 쓰기" onclick="window.location='writeForm?bylist=3'">
</c:if>
</div>
</body>
</html>