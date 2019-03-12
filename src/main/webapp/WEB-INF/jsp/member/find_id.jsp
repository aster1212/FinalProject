<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="/kingsman/resources/css/memberFind.css">
<script>
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
<div id="findid">
<form id="frmfind" action="findId" method="post">
<div id="find1"><a href="/kingsman/main"><img id="mainlogo" src="/kingsman/resources/upload/kingsman.png"></a></div>
<div id="findTitle" class="findTitle"> < 아이디 찾기 > </div>
<br><br>
<div id="findBirth">
생년월일&nbsp; &nbsp;
	<input type="text" id="member_year" name="member_year" placeholder="ex)2019">
	<input type="text" id="member_month" name="member_month" placeholder="ex) 1,2,...,12">
	<input type="text" id="member_day" name="member_day" placeholder="ex)1,2,..,31">
</div>
<br><br>
<div id="findName">
이름&nbsp; &nbsp;
	<input type="text" id="member_name" name="member_name" placeholder="ex)홍길동">
</div>
<br>
<br>
<div id="findFinish">
	<input type="button" id="findFinish1" value="확인" onclick="FindId();">
</div>
</form>
</div>
</body>
<script src="/kingsman/resources/js/member_validation.js"></script>
</html>