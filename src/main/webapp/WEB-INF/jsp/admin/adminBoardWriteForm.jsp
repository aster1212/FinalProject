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
<link rel="stylesheet" type="text/css" href="/kingsman/resources/css/adminBoard.css">
<script type="text/javascript" src="/kingsman/resources/js/csValidateForm.js"></script>
<script type="text/javascript" src="/kingsman/resources/js/csAlert.js"></script>
</head>
<body>

<div style="text-align: center; width: 90%; height: auto; margin: 20px 0 0 0;">
<c:if test="${old != null}">
 
<div id="boardWriteContentBox">
<div id="boardListTitle">공지사항/이벤트 수정</div>
<form class="writeContent" action="boardModify" enctype="multipart/form-data" method="POST" onsubmit="return adminBoardValidateForm()">
	<input type="hidden" name="BOARD_NO" value="${old.BOARD_NO }">
	<input type="hidden" name="BOARD_CATEGORY" value="${old.BOARD_CATEGORY }">
</c:if>
<c:if test="${old == null}">

<div id="boardWriteContentBox">

<div id="boardListTitle">공지사항/이벤트 등록</div>
<form class="writeContent" action="boardWrite" enctype="multipart/form-data" method="POST" onsubmit="return adminBoardValidateForm()">
</c:if>
	<div style="height: 20px;"></div>
	<input type="hidden" class="writeText" id="MEMBER_ID" name="MEMBER_ID" value="${old.MEMBER_ID ? old.MEMBER_ID : '관리자' }">
	<div class="qnaContentLineBox">
		<div class="qnaContentLineLeft qnaInline">제목</div>
		<div class="qnaContentRight qnaInline">
			<input type="text" class="qnaText" id="BOARD_TITLE" name="BOARD_TITLE" value="${old.BOARD_TITLE }" autocomplete="off">
		</div>
	</div>
	<div class="qnaContentLineBox">
		<div class="qnaContentLineLeft qnaInline">옵션</div>
		<div class="qnaContentRight qnaInline">
			<label for="BOARD_CATEGORY">공지사항</label>
			<input type="radio" name="BOARD_CATEGORY" value="1" ${param.bylist == '1' ? "checked='checked'" : '' } ${old.BOARD_CATEGORY == '1' ? "checked='checked'" : '' } ${old!=null?" disabled='disabled'":'' } >
			&nbsp;&nbsp;&nbsp;
			<label for="BOARD_CATEGORY">이벤트</label>
			<input type="radio" name="BOARD_CATEGORY" value="2" ${param.bylist == '2' ? "checked='checked'" : '' } ${old.BOARD_CATEGORY == '2' ? 'checked="checked"' : '' } ${old!=null?" disabled='disabled'":'' } >
		</div>
	</div>
	<div style="height: 20px;"></div>
	<div id="qnaTextareaBox" class="qnaContentLineBox">
		<textarea class="qnaTextArea" rows="5" cols="50" id="BOARD_CONTENT" name="BOARD_CONTENT">${old.BOARD_CONTENT }</textarea>
	</div>
	<div id="qnaOptionBox">
		<input class="contentBtns" type="button" onclick="history.go(-1)" value="취소"> 
		<input class="contentBtns" type="reset" value="리셋"> 
		<input class="contentBtns" type="submit" value="작성"> 
	</div>
</form>
</div>
</div>
</body>
</html>