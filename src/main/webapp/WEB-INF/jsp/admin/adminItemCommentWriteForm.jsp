<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/kingsman/resources/js/csValidateForm.js"></script>
</head>
<body>
<c:if test="${parent != null}">
<!-- 부모글 끌어오기 -->
글쓴이	: ${parent.COM_NAME}<br>
내용		: ${parent.COM_CONTENT}<br>
작성 날짜	: ${parent.COM_REGDATE}<br>
</c:if>

<!-- 답변 -->
<c:if test="${parent != null}">
	<form action="itemCommentWrite" method="post" onsubmit="return adminItemCommentValidateForm()">
		<h1>답변하기</h1>
		<!-- hidden -->
		<input type="hidden" name="COM_ORI_NO" value="${parent.COM_ORI_NO}">
		<input type="hidden" name="COM_NAME" value="관리자">
		<input type="hidden" name="COM_PASSWD" value="admin">
		<input type="hidden" name="COM_REF" value="${parent.COM_REF}">
		<input type="hidden" name="COM_FILE_ORI_NAME" value="NONE">
		<input type="hidden" name="COM_FILE_SAVE_NAME" value="NONE">
		<input type="hidden" name="COM_CATEGORY" value="${parent.COM_CATEGORY}">
		<input type="hidden" name="COM_RE_STEP" value="${parent.COM_RE_STEP}">
		<input type="hidden" name="parent_re_level" value="${parent.COM_RE_LEVEL}">
		<!-- hidden -->
</c:if>
<c:if test="${old != null}">
	<form action="itemCommentModify" method="post" onsubmit="return adminItemCommentValidateForm()">
		<h1>답변 수정</h1>
		<input type="hidden" name="COM_NO" value="${old.COM_NO}">
</c:if>
<textarea rows="10"cols="50" id="COM_CONTENT" name="COM_CONTENT">${old != null ? old.COM_CONTENT : ''}</textarea><br>
<input type="submit" value="확인">
</form>
</body>
</html>