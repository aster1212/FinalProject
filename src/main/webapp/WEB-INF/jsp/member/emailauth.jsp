<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
<link type="text/css" rel="stylesheet" href="/kingsman/resources/css/member.css">
<head>
<script>
	function check()
	{
		var form = document.authenform;
		var authNum = ${authNum};
		
		if(!form.authnum.value)
		{
			alert("인증번호를 입력하세요");
			return false;
		}
		if(form.authnum.value!=authNum)
		{
			alert("인증번호가 맞지 않습니다.");
			form.authnum.value="";
			return false;
		}
		if(form.authnum.value==authNum)
		{
			alert("인증완료");
			/* opener.document.frm.emailsucc.value="인증완료"; */
			opener.document.getElementById('same3').innerHTML = '인증완료';
			opener.document.getElementById('same3').style.color = 'blue';
			self.close();
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
<div id="emailauthWrap">
	<form method="post" name="authenform" onsubmit="return check();">
		<input type="text" id="emailTextBox" name="authnum" placeholder="인증번호를 입력하세요"><br/><br/>
		<input type="submit" id="emailNumberFinish" value="인증완료">
	</form>
</div>
</body>
</html>