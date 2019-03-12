<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<link type="text/css" rel="stylesheet" href="/kingsman/resources/css/member.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
<script src="/kingsman/resources/js/common.js"></script>
<script src="/kingsman/resources/js/member.js"></script>
<script src="/kingsman/resources/js/member_validation.js"></script>
<script>
window.onload = function() {
	var yfrm = document.getElementById('frm');

	var nowDate = new Date();
	var nowYear = nowDate.getFullYear();
	var nowMonth = eval(nowDate.getMonth()) + 1;
	var nowDay = eval(nowDate.getDate());

	/***************
	 * 년 세팅
	 ***************/
	var startYear = nowYear - 40;
	for (var i = 0; i < nowYear; i++) {
		yfrm['member_year'].options[i] = new Option(startYear + i,
				startYear + i);
	}

	/***************
	 * 월 세팅
	 **************/
	for (var i = 0; i < 12; i++) {
		yfrm['member_month'].options[i] = new Option(i + 1, i + 1);
	}

	/***************************************
	 * 먼저 현재 년과 월을 셋팅
	 * 윤년계산과 월의 마지막 일자를 구하기 위해
	 ***************************************/
	yfrm['member_year'].value = '${memyear}';
	yfrm['member_month'].value = '${memmonth}';
	setDay();
	/********************************************
	 * 일(day)의 select를 생성하고 현재 일자로 초기화
	 ********************************************/
	yfrm['member_day'].value = '${memday}';
}

/******************
 * 일(day) 셋팅
 ******************/
function setDay() {
	var yfrm = document.getElementById('frm');

	var year = yfrm['member_year'].value;
	var month = yfrm['member_month'].value;
	var day = yfrm['member_day'].value;
	var dateDay = yfrm['member_day'];

	var arrayMonth = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

	/*******************************************
	 * 윤달 체크 부분
	 * 윤달이면 2월 마지막 일자를 29일로 변경
	 *******************************************/
	if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
		arrayMonth[1] = 29;
	}

	/**************************************
	 * 기존 일(day) select를 모두 삭제한다.
	 **************************************/
	for (var i = dateDay.length; i > 0; i--) {
		dateDay.remove(dateDay.selectedIndex);
	}

	/*********************************
	 * 일(day) select 옵션 생성
	 *********************************/
	for (var i = 1; i <= arrayMonth[month - 1]; i++) {
		dateDay.options[i - 1] = new Option(i, i);
	}

	/*********************************************
	 * 기존에 선택된 일값 유지
	 * 기존 일값보다 현재 최대일값이 작을 경우
	 * 현재 선택 최대일값으로 세팅
	 ********************************************/
	if (day != null || day != "") {
		if (day > arrayMonth[month - 1]) {
			dateDay.options.selectedIndex = arrayMonth[month - 1] - 1;
		} else {
			dateDay.options.selectedIndex = day - 1;
		}
	}
}

function isSame()
{
	
	var passwd = document.frm.member_passwd.value;
	var passwd2 = document.frm.member_passwd2.value;
	
	if(document.getElementById('pw1').value != '' && document.getElementById('pw2').value != '')
	{
		if(document.getElementById('pw1').value == document.getElementById('pw2').value)
		{
			document.getElementById('same').innerHTML = '비밀번호가 일치합니다';
			document.getElementById('same').style.color = 'blue';
		}
		else
		{
			document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다';
			document.getElementById('same').style.color = 'red';
		}
	}
}

function emailcheck()
{
	alert(document.getElementById("member_email").value);

	var email = document.getElementById("member_email").value;

	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

	if(exptext.test(email)==false){

	alert("이메일 형식이 올바르지 않습니다.");

	return false;
	}
	else
	{
	var email = document.getElementById("member_email").value;
	var url = "/kingsman/emailAuth?member_email="+email;
	window.open(url,'','toolbar=1, scrollbars=1, location=1, statusbar=0, menubar=1, resizable=1, width=400, height=200');
	}
}
$(document).ready(function(e) { 
	   try { 
	     $('input[type=text]').focus(function() 
	       { 
	    	 $(this).css('border-color','#50DEAA'); 
	      });
	     $('input[type=text]').blur(function() 
	  	       { 
	  	    	 $(this).css('border-color','#D5D5D5'); 
	  	      });
	     $('input[type=password]').focus(function() 
	  	       { 
	  	    	 $(this).css('border-color','#50DEAA'); 
	  	      });
	  	 $('input[type=password]').blur(function() 
	  	  	       { 
	  	  	    	 $(this).css('border-color','#D5D5D5'); 
	  	  	      });
	   } 
	   catch(e) { 
	      alert(e.message); 
	   } 
	});  
</script>
</head>
<body>
<div id="join1">
	<form action="/kingsman/member/memModify" id="frm" name="frm" method="post">
		<div id="join2"><a href="/kingsman/main"><img id="mainlogo" src="/kingsman/resources/upload/kingsman.png" height="134" ></a></div>
		<br>
		<c:forEach items="${mypage}" var="row">
		<div id="joinId2" class="joinId">
			아이디&nbsp; &nbsp;
			<input type="text" id="member_idjoin" name="member_id" readonly value="${row.MEMBER_ID}">
		</div>
		<br>
		<div id="joinpw">
		비밀번호&nbsp; &nbsp;
			<input type="password" name="member_passwd" id=pw1 onchange="isSame()" value="${row.MEMBER_PASSWD}">
		</div>
		<span id="warn1"></span>
		<br>
		<div id="joinpw2">
		비밀번호 확인&nbsp; &nbsp;
			<input type="password" name="member_passwd2" id=pw2 onchange="isSame()">
		</div>		
		<span id="same"></span>	
		<br>
		<div id="joinname">
		이름&nbsp; &nbsp;
			<input type="text" id="member_name" name="member_name" readonly value="${row.MEMBER_NAME}">
		</div>
		<br>
		<div id="joinBirth">
			생년월일&nbsp; &nbsp;
			<select disabled id="memYear" name="member_year" onChange="setDay()"></select>&nbsp; &nbsp;
			<select disabled id="memMonth" name="member_month" onChange="setDay()" ></select>&nbsp; &nbsp;
			<select disabled id="memDay" name="member_day" ></select>
		</div>
		<br>
		<div id="joinGender">
			성별&nbsp; &nbsp;
			<c:if test="${row.MEMBER_GENDER==1}">
				<input disabled type="radio" name="member_gender" value="1" checked>남자&nbsp; &nbsp; 
				<input disabled type="radio" name="member_gender" value="2">여자
			</c:if>
			<c:if test="${row.MEMBER_GENDER==2}">
				<input disabled type="radio" name="member_gender" value="1">남자&nbsp; &nbsp; 
				<input disabled type="radio" name="member_gender" value="2" checked>여자
			</c:if>
		</div>
		<br>
		<div id="joinPhone">
			핸드폰&nbsp; &nbsp;
			<input type="text" id="member_phone2" name="member_phone" value="${row.MEMBER_PHONE}">	
		</div>
		<br>				
		<div id="joinEmail">
			이메일&nbsp; &nbsp;
			<input type="text" id="member_email" name="member_email" value="${row.MEMBER_EMAIL}">&nbsp;
			<input type="button" id="joinemailcheck" value="이메일 인증" onclick="return emailcheck();">
		</div>
		<span id="same3"></span>
		<br>			
		<div id="joinAddr">
			주소&nbsp; &nbsp;
			<input type="text" name="member_zipcode" id="member_zipcode" placehodler="우편번호" value="${row.MEMBER_ZIPCODE }"> 
			<input type="button" onclick="DaumPostCode()" id="AddrBtn" value="우편번호찾기"><br>
			<input type="text" name="member_addr1" id="member_addr1" placehodler="주소" value="${row.MEMBER_ADDR1}"><br> 
			<input type="text" name="member_addr2" id="member_addr2" placehodler="상세주소" value="${row.MEMBER_ADDR2}"><br>
			<input type="text" name="member_addr3" id="member_addr3" placehodler="참고항목" value="${row.MEMBER_ADDR3}"><br>
		</div>			
	</c:forEach>
	<div id="finishJoin22">
		<input type="button" id="joinfinish1" value="수정완료" onclick="ModifyValidate();"/>
	</div>
	<div id="backMypage">
		<input type="button" id="joinfinish1" value="마이페이지" onclick="location.href='/kingsman/member/mypage'">
	</div>
	</form>
</div>
</body>
</html>