<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link type="text/css" rel="stylesheet" href="/kingsman/resources/css/memberFind.css">
<script>
	function idpwBack()
	{
		history.back();
	}
</script>
</head>
<body>
<div id="resultfindWrap">
	<div id="resultfind">
		<a href="/kingsman/main"><img id="mainlogo" src="/kingsman/resources/upload/kingsman.png"></a>
		<div id="resultIdTitle">비밀번호 찾기 결과</div>
		<div id="resultIdContent">
			<c:if test="${pw!=null}">이메일로 비밀번호가 발송되었습니다.</c:if>
			<c:if test="${pw==null}">결과가 없습니다.<br><br>정보를 제대로 입력해주세요 . </c:if>
		</div>
	</div>
	<div id="back1">
		<input type="button" id="back" value="뒤로가기" onclick="idpwBack();">
	</div>
</div>
</body>
</html>