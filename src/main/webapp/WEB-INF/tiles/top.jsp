<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#topProgressBar{
	position: fixed;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 2px;
	z-index: 12;
	background: white;	
}
#topProgressGage{
	position: fixed;
	display: inline-block;
	top: 0px;
	left: 0px;
	width: 0%;
	height: 2px;
	z-index: 12;
	background: #EB8286;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	$("#logoutBtn").bind("click").click(function(e){
    		e.preventDefault();
    		fn_logout();
    	});
    });
    
    function fn_logout()
    {
    	if(window.confirm("로그아웃 ????"))
    	{
    		window.location.href="/kingsman/member/logout";
    	}
    }
    
    $(document).ready(function(){
    	$("#dropOut").bind("click").click(function(e){
    		e.preventDefault();
    		fn_drop();
    	});
    });
    
    function fn_drop()
    {
    	if(window.confirm("탈퇴 하시겠습니까?"))
    	{
    		window.location.href="/kingsman/mypage/memDelete";
    	}
    }
</script>
</head>
<body>
<div id="topProgressBar">
	<div id="topProgressGage"></div>
</div>
<div id="topLine"> 
<%-- <%String str = request.getRealPath("/"); %>
<%=str %> --%>
<c:if test="${idSession!=null}">
	${memname}님 환영합니다.
	&nbsp;&nbsp;&nbsp;&nbsp;
	<a id="topLogin" href="/kingsman/member/logout">logout</a>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<c:choose>
		<c:when test="${idSession=='admin'}">
			<a id="topLogin" href="/kingsman/admin/adminPage">AdminPage</a>
		</c:when>
		<c:otherwise>
			<a id="topLogin" href="/kingsman/member/mypage">MyPage</a>
		</c:otherwise>
	</c:choose>
</c:if>

<c:if test="${idSession==null}">
	<c:if test="${nonmemname==null}">
		<a id="topLogin" href="/kingsman/member/login">login</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a id="topLogin" href="/kingsman/member/joinForm">join us</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    </c:if>
    <c:if test="${nonmemname!=null}">
    	${nonmemname}님 환영합니다.
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a id="topLogin" href="/kingsman/member/logout">logout</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a id="topLogin" href="/kingsman/member/nonpurchase">Order</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </c:if>
</c:if>
</div>
</body>
</html>