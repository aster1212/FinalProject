<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>
<h5>${memname} 님 환영합니다.</h5>
<a href="/kingsman/member/memModifyForm">관리자 정보 수정</a>
<br><br>
로그인상태 : ${idSession} <br><br>

Admin (관리자전용점수 : ${memtotal/100})<br><br>

적립금 : ${memmileage}점<br><br>
<a href="/kingsman/admin/orderList">회원주문목록</a>&nbsp;&nbsp;&nbsp;<br><br>
<a href="/kingsman/admin/itemWriteForm">상품등록</a><br>
<a href="/kingsman/admin/createCoupon">쿠폰생성</a>&nbsp;&nbsp;&nbsp;
<a href="/kingsman/admin/Couponlist">쿠폰리스트보기</a>&nbsp;&nbsp;&nbsp;
<a href="/kingsman/admin/CouponDeleteList">쿠폰삭제하기</a>&nbsp;&nbsp;&nbsp;<br><br>
<a href="/kingsman/admin/memberList">회원리스트보기</a>&nbsp;&nbsp;&nbsp;<br><br>
<a href="/kingsman/admin/delYlist">탈퇴한회원보기</a> <br><br>
<a href="/kingsman/">메인으로</a>
</body>
</html>


