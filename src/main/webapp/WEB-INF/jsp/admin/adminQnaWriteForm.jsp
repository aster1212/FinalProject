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
<script type="text/javascript" src="/kingsman/resources/js/common.js"></script>
<script type="text/javascript" src="/kingsman/resources/js/csValidateForm.js"></script>
</head>
<body>

<div id="boardListTitle" style="text-align: left;">QnA 답변 등록</div>
<div id="parentViewDiv">
제목 : ${parent.BOARD_TITLE } | ${parent.BOARD_REGDATE }
<br>
작성자 : ${parent.MEMBER_ID }
<br>
내용 : ${parent.BOARD_CONTENT}
</div>


<div id="qnareplyTitle" style="text-align: left;">답변</div>
<form action="qnaWrite" onsubmit="return adminQnaValidateForm()">
	<input type="hidden" name="BOARD_REF" value="${parent.BOARD_NO}">
	<input type="hidden" name="BOARD_RE_STEP" value="${parent.BOARD_RE_STEP}">
	<input type="hidden" name="BOARD_RE_LEVEL" value="${parent.BOARD_RE_LEVEL}">
	<input type="hidden" name="BOARD_TITLE" value="답변:${parent.BOARD_TITLE}">
	<input type="hidden" name="MEMBER_ID" value="관리자">
	

	<textarea class="qnaReplyContent" rows="10" cols="50" name="BOARD_CONTENT" id="BOARD_CONTENT" ></textarea>
	<input class="contentBtns" type="submit" value="답변">
	<input class="contentBtns" type="button" onclick="history.go(-1)" value="뒤로">

</form>

</body>
</html>