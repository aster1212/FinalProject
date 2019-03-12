<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
<link rel="stylesheet" type="text/css" href="/kingsman/resources/css/Board.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/kingsman/resources/js/csBoard.js"></script>
<script type="text/javascript" src="/kingsman/resources/js/csAlert.js"></script>
</head>
<body>
<div style="height: 100px"></div>
<div id="boardContent">
<div>
	<jsp:include page="subTab.jsp"></jsp:include>
</div>
<div id="boardListTitle">QnA | ${map.BOARD_TITLE }
	<div class="viewDiv" style="width: 70%; text-align: right;">
		<img alt="조회수" src="/kingsman/resources/upload/view.png" style="display: inline-block;">
		<div style="font-size: 15px;" class="viewCountDiv">
			${map.BOARD_CNT }
		</div>
		<font style="font-size: 15px;" class="dateDiv"><fmt:formatDate value="${map.BOARD_REGDATE }" pattern="yyyy.MM.dd"/></font>
	</div>
</div>
<div id="detailContent">
작성자 : ${map.MEMBER_ID }<br><br>

${map.BOARD_CONTENT}

</div>

<c:if test="${map.MEMBER_ID eq idSession || memgrade == 99}">
<input id="modiOption" class="detailOption pointer" type="button" value="글 수정" onclick="window.location='/kingsman/qna/modifyForm?BOARD_NO=${map.BOARD_NO}'">
</c:if>
<c:if test="${memgrade != null && memgrade == 99}">
<input id="delOption" class="detailOption pointer" type="button" value="글 삭제" onclick="window.location='/kingsman/admin/qnaBoardDelete?BOARD_NO=${map.BOARD_NO}'">
<input class="detailOption pointer" type="button" value="답변하기" onclick="openReplyForm()">
</c:if>

<!-- reply -->
<div id="hideDivForReply">
	<div class="boardLine"></div>
	<div style="height: 40px;"></div>
	<div id="qnareplyTitle" style="text-align: left;">답변</div>
	<div style="height: 20px;"></div>
	<form id="replyForm" action="/kingsman/admin/qnaWrite" onsubmit="return adminQnaValidateForm()">
		<input type="hidden" name="BOARD_REF" value="${map.BOARD_NO}">
		<input type="hidden" name="BOARD_RE_STEP" value="${map.BOARD_RE_STEP}">
		<input type="hidden" name="BOARD_RE_LEVEL" value="${map.BOARD_RE_LEVEL}">
		<input type="hidden" name="BOARD_TITLE" value="답변:${map.BOARD_TITLE}">
		<input type="hidden" name="MEMBER_ID" value="관리자">
		
		<textarea class="qnaTextArea" rows="10" cols="50" name="BOARD_CONTENT" id="BOARD_CONTENT" ></textarea>
		<div>
			<input class="detailOption pointer" type="submit" value="답변">
			<input class="detailOption pointer" type="button" onclick="closeReplyForm()" value="닫기">
		</div>
	
	</form>
</div>
<!-- reply end -->

<div class="boardLine"></div>
<div style="height: 40px;"></div>
<div id="boardListTitle">QnA
<c:if test="${memgrade != null}">
<input id="detailBoardWriteBtn" class="boardBtn pointer" type="button" value="글 쓰기" onclick="window.location='writeForm?bylist=3'">
</c:if>
</div>
<br>
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
	 							<div class="boardList" onclick="fn_warning('비공개 글입니다.')">
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

</div>
</body>
</html>