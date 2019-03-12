<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<html>
<head>
<!-- <script>
function fn_drop()
{
   if(window.confirm("진짜 탈퇴 한다고??? ????"))
   {
      window.location.href="/kingsman/member/memDelete";
   }
}
</script> -->
<link type="text/css" rel="stylesheet" href="/kingsman/resources/css/memberMypage.css">
</head>
<body>
<div id="mypageDiv">
<div id="mypageTitle">MY PAGE</div>
<br><div id="mypageLine1"></div><br>
<div id="mypageName">
	${memname}님 환영합니다.&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	Lv.
	<c:if test="${memgrade==0}">
		Stone&nbsp; &nbsp; &nbsp;
		<img src="/kingsman/resources/upload/stone.png" width="16" height="16">
	</c:if>
	<c:if test="${memgrade==10}">
		Bronze&nbsp; &nbsp; &nbsp;
		<img src="/kingsman/resources/upload/bronze.png" width="16" height="16">
	</c:if>
	<c:if test="${memgrade==20}">
		Silver&nbsp; &nbsp; &nbsp;
		<img src="/kingsman/resources/upload/silver.png" width="16" height="16">
	</c:if>
	<c:if test="${memgrade==30}">
		Gold&nbsp; &nbsp; &nbsp;
		<img id="gradelogo" src="/kingsman/resources/upload/gold.png" width="16" height="16">
	</c:if>
	<c:if test="${memgrade==40}">
		Diamond&nbsp; &nbsp; &nbsp;
		<img src="/kingsman/resources/upload/diamond.png" width="16" height="16">
	</c:if>
	<c:if test="${memgrade==50}">
		Kingsman&nbsp; &nbsp; &nbsp;
		<img src="/kingsman/resources/upload/kingsmanstar.png" width="16" height="16">
	</c:if>
</div>
<div id="mypageID">
	( 로그인정보 : ${idSession} )&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	( 현재점수 : ${memtotal/100} )&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	<input type="button" id="memModifyBtn" value="회원정보수정" onclick="location.href='/kingsman/member/memModifyForm'">
</div>
<br><div id="mypageLine2"></div><br>
<br><br>
<div id="mypageBasket">
<a href="/kingsman/cart/list"><img id="mypageBasket1" src="/kingsman/resources/upload/mypageBasket.png" width="64" height="64"></a>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<a href="/kingsman/wishList/list"><img id="mypageLike" src="/kingsman/resources/upload/mypageLike.png" width="64" height="64"></a>
</div>
<div id="mypageCoupon">보유한 쿠폰</div>
<div id="mypageCoupon2"><input type="button" id="CouponCount" value="${count}장" onclick="location.href='/kingsman/member/memcouponlist'"></div>
<div id="mypageMileage">( 적립금 : ${memmileage}점 )</div>
<div id="mypagePurchase"><input type="button" id="PurchaseMem" value="구매내역" onclick="location.href='/kingsman/member/purchase'"></div>
<div id="mypageLogo">
<a href="/kingsman/main"><img id="Mypagelogo1" src="/kingsman/resources/upload/kingsman.png" height="134" ></a>
</div>
<div id="buttonMypageDel">
		<input type="button" id="memModifyBtn" value="회원탈퇴" onclick="fn_drop();">
</div>
</div>
</body>
</html>