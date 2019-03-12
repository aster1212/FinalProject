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

	var startYear = nowYear - 70;
	for (var i = 0; i < 71; i++) {
		yfrm['member_year'].options[i] = new Option(startYear + i,
				startYear + i);
	}

	for (var i = 0; i < 12; i++) {
		yfrm['member_month'].options[i] = new Option(i + 1, i + 1);
	}

	yfrm['member_year'].value = nowYear;
	yfrm['member_month'].value = nowMonth;
	setDay();

	yfrm['member_day'].value = nowDay;
}

function setDay() {
	var yfrm = document.getElementById('frm');

	var year = yfrm['member_year'].value;
	var month = yfrm['member_month'].value;
	var day = yfrm['member_day'].value;
	var dateDay = yfrm['member_day'];

	var arrayMonth = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

	if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
		arrayMonth[1] = 29;
	}

	for (var i = dateDay.length; i > 0; i--) {
		dateDay.remove(dateDay.selectedIndex);
	}

	for (var i = 1; i <= arrayMonth[month - 1]; i++) {
		dateDay.options[i - 1] = new Option(i, i);
	}

	if (day != null || day != "") {
		if (day > arrayMonth[month - 1]) {
			dateDay.options.selectedIndex = arrayMonth[month - 1] - 1;
		} else {
			dateDay.options.selectedIndex = day - 1;
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

function isSame()
{
	
	var passwd = document.frm.member_passwd.value;
	var passwd2 = document.frm.member_passwd2.value;
	
	/* if(passwd.length<6 || passwd.length>12)
	{
		alert("비밀번호는 6글자 이상, 12글자 이하만 사용가능");
		document.getElementById('pw1').value=document.getElementById("pw2").value='';
		document.getElementById('same').innerHTML='';
	} */
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
	<form action="/kingsman/member/join" id="frm" name="frm" method="post">
		<div id="join2"><a href="/kingsman/main"><img id="mainlogo" src="/kingsman/resources/upload/kingsman.png" height="134" ></a></div>
		<br>
		<div id="joinId" class="joinId">
			아이디&nbsp; &nbsp;
			<input type="text" class="joinIdText" id="member_idjoin" name="member_id" placeholder="예) kingsman1212">&nbsp;&nbsp;
			<input type="button" value="중복확인" id="joinIdCheck" onclick="fn_userIDCheck()">
		</div>
		<span id="same1"></span>
		<br>
		<div id="joinpw" class="joinpw">
			비밀번호&nbsp; &nbsp;
			<input type="password" name="member_passwd" id=pw1 placeholder="영문과 숫자 조합 6~12자리" onchange="isSame()">
		</div>
		<span id="warn1"></span>
		<br>
		<div id="joinpw2" class="joinpw2">
			비밀번호 확인&nbsp; &nbsp;
			<input type="password" name="member_passwd2" placeholder="영문과 숫자 조합 6~12자리" id=pw2 onchange="isSame()">
		</div>
		<span id="same"></span>
		<br>
		<div id="joinname" class="joinname">
			이름&nbsp; &nbsp;
			<input type="text" name="member_name" placeholder="예) 홍길동" id="member_name">
		</div>
		<br>
		<div id="joinBirth" class="joinBirth">
			생년월일&nbsp; &nbsp;
			<select name="member_year" id="memYear" onChange="setDay()"></select>&nbsp; &nbsp;
			<select name="member_month" id="memMonth" onChange="setDay()"></select>&nbsp; &nbsp;
			<select name="member_day" id="memDay"></select>
		</div>
		<br>
		<div id="joinGender" class="joinGender">
			성별&nbsp; &nbsp;
			<input type="radio" name="member_gender" id="man" value="1"><label for="man">남자&nbsp; &nbsp;</label> 
			<input type="radio" name="member_gender" id="woman" value="2">여자
		</div>
		<br>
		<div id="joinPhone" class="joinPhone">
			핸드폰&nbsp; &nbsp;
			<input type="text" name="member_phone" id="member_phone2" placeholder="숫자만 입력">
		</div>
		<br>
		<div id="joinEmail" class="joinEmail">
			이메일&nbsp; &nbsp;
			<input type="text" id="member_email" name="member_email" placeholder="이메일을 정확히 입력해주세요">&nbsp;
			<input type="button" id="joinemailcheck" value="인증하기" onclick="return emailcheck();">
		</div>
		<span id="same3"></span>
		<br>
		<div id="joinAddr" class="joinAddr">
			주소&nbsp; &nbsp;
			<input type="text" name="member_zipcode" id="member_zipcode" placeholder="우편번호">
			<input type="button" id="AddrBtn" onclick="DaumPostCode()" value="우편번호찾기"><br>
			<input type="text" name="member_addr1" id="member_addr1" placeholder="주소"><br>
			<input type="text" name="member_addr2" id="member_addr2" placeholder="상세주소"><br>
			<input type="text" name="member_addr3" id="member_addr3" placeholder="참고항목"><br>
		</div>
		<div id="finishJoin22">
			<input type="button" id="joinfinish1" value="회원가입" onclick="JoinValidate();"/>
		</div>
	</form>
</div>
</body>
</html>