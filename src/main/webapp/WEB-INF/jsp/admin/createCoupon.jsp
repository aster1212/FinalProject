<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<html>
<head>
<link type="text/css" rel="stylesheet" href="/kingsman/resources/css/admincoupon.css">
<script src="/kingsman/resources/js/member_validation.js"></script>
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
<div id="adminCouponCreateWrap">
<div id="adminCouponCreateTitle">관리자 쿠폰 생성</div>
	<form id="frm" name="frm" action="/kingsman/admin/createCouponTry" method="post">
	<div id="createCoupon1">
		이름&nbsp;&nbsp;&nbsp;
		<input type="text" name="cou_content" id="cou_content" placeholder="ex) 오픈 기념 쿠폰.">
	</div>
	<div id="createCoupon2">
		할인율&nbsp;&nbsp;&nbsp;
		<input type="text" name="cou_discount" id="cou_discount" placeholder="ex) 10,15,20..">
	</div>
	<div id="createCoupon3">
		사용기간&nbsp;&nbsp;&nbsp;
		<input type="text" name="cou_sdate" id="cou_sdate" placeholder="ex) 2019-01-24">
		~
		<input type="text" name="cou_edate" id="cou_edate" placeholder="ex) 2019-01-31">
	</div>
	<div id="createCouponBtn">
			<input type="button" id="createCouponBtn1" value="생성" onclick="creatCouponValidation();">
	</div>
	</form>
</div>
</body>
</html>