<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항/이벤트 등록</title>
<link rel="stylesheet" type="text/css" href="/kingsman/resources/css/Board.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/kingsman/resources/js/csValidateForm.js"></script>
</head>
<body>

<div style="height: 100px"></div>

<div id="boardContent">
<div>
	<jsp:include page="subTab.jsp"></jsp:include>
</div>

<c:if test="${old != null}">
<div id="boardListTitle">QnA | 수정하기</div>
<div id="qnaContentBox">
<form action="modify" enctype="multipart/form-data" method="POST" onsubmit="return qnaValidateForm()">
	<input type="hidden" name="BOARD_NO" value="${old.BOARD_NO }">
</c:if>
<c:if test="${old == null}">
<div id="boardListTitle">QnA | 등록하기</div>
<div id="qnaContentBox">
<form action="write" enctype="multipart/form-data" method="POST" onsubmit="return qnaValidateForm()">
</c:if>
<input type="hidden" name="MEMBER_ID" value="${old == null ? idSession : old.MEMBER_ID }">
	<div style="height: 30px"></div>
	<div class="qnaContentLineBox">
		<div class="qnaContentLineLeft qnaInline">제목</div>
		<div class="qnaContentRight qnaInline">
			<input type="text" id="BOARD_TITLE" class="qnaText" name="BOARD_TITLE" value="${old.BOARD_TITLE }" autocomplete="off">
		</div>
	</div>
	<div class="qnaContentLineBox">
		<div class="qnaContentLineLeft qnaInline">옵션</div>
		<div class="qnaContentRight qnaInline">
			<label for="BOARD_SC_STATE">공개</label>
			<input type="radio" name="BOARD_SC_STATE" value="N" ${old.BOARD_SC_STATE == 'N' ? "checked='checked'" : '' }>
			&nbsp;&nbsp;&nbsp;
			<label for="BOARD_SC_STATE">비공개</label>
			<input type="radio" name="BOARD_SC_STATE" value="Y" ${old.BOARD_SC_STATE == 'Y' ? 'checked="checked"' : '' }>
		</div>
	</div>
	<div style="height: 20px;"></div>
	<div id="qnaTextareaBox" class="qnaContentLineBox">
		<textarea rows="10" cols="30" id="BOARD_CONTENT" class="qnaTextArea" name="BOARD_CONTENT">${old.BOARD_CONTENT }</textarea>
	</div>
	<div id="qnaOptionBox">
		<input type="button" class="detailOption" onclick="history.go(-1)" value="취소"> 
		<input type="reset" class="detailOption" value="리셋"> 
		<input type="submit" class="detailOption" value="작성">
	</div>
</form>
</div>
</div>

</body>
</html>