<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="/kingsman/resources/css/memberFind.css">
<script>
function emailcheck()
{
	var email = document.getElementById("member_email").value;
	var phone = document.getElementById("member_phone").value;
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	var phoneval = /^[0-9]{10,11}$/;

	if(exptext.test(email)==false){

	alert("이메일 형식이 올바르지 않습니다.");

	return false;
	}
	else if(phoneval.test(phone)==false)
	{
		alert("핸드폰 번호를 제대로 입력해 주세요");
		document.getElementById("member_phone").value="";
		document.getElementById("member_phone").focus();
		
		return false;
	}
	else
	{
	var id = document.getElementById("member_id").value;
	var phone = document.getElementById("member_phone").value;
	var email = document.getElementById("member_email").value;
	window.location.href = "/kingsman/emailAuth2?member_email="+email+"&member_phone="+phone+"&member_id="+id;
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
	   } 
	   catch(e) { 
	      alert(e.message); 
	   } 
});  
</script>
</head>
<body>
<div id="findpwWrap">
<form id="frm" method="post">
<div id="find1"><a href="/kingsman/main"><img id="mainlogo" src="/kingsman/resources/upload/kingsman.png"></a></div>
<div id="findTitle" class="findTitle"> < 비밀번호 찾기 > </div>
<br><br>
<div id="findpw1">
	아이디&nbsp; &nbsp;
	<input type="text" id="member_id" name="member_id" placeholder="예) kingsman1212"><br><br>
	핸드폰 번호&nbsp; &nbsp;
	<input type="text" id="member_phone" name="member_phone" placeholder="예) 01012345678"><br><br>
	이메일&nbsp; &nbsp;
	<input type="text" id="member_email" name="member_email" placeholder="예) kingsman@suit.com">&nbsp;
</div>
<br>
<br>
<div id="emailbuttonDiv">
	<input type="button" id="emailbtn" value="이메일 전송" onclick="return emailcheck();">
	<br>
</div>
</form>
<br>
<br>
</div>
</body>
</html>