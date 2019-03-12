<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/kingsman/resources/js/csAlert.js" charset="UTF-8"></script>
<style type="text/css">
</style>
</head>
<body>

	<a href="#this" id="bannerBtn">경고창띄우기</a>
	
	<div id="banner">
	</div>
	<div id="bannerContent"></div>
	<br><br>
	
	<form>
	
		<p>
			<input type="radio" class="rate" name="rate" value="10">기존 &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="numb" name="numb" value="1"> 
		</p>
		<p>
			<input type="radio" class="rate" name="rate" value="20">기존 &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="numb" name="numb" value="2"> 
		</p>
		<p>
			<input type="radio" class="rate" name="rate" value="30">기존 &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="numb" name="numb" value="3"> 
		</p>
		<p>
			<input type="radio" class="rate" name="rate" value="40">기존 &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="numb" name="numb" value="4"> 
		</p>
	<input type="submit">
	</form>
	
	${param.rate != null ? param.rate: '' }<br>
	${param.numb != null ? param.numb: '' }
	
<script type="text/javascript">
	$(document).ready(function(){
		$('#bannerBtn').on('click', function(e) {
			e.preventDefault();
			fn_warning("경고!!");
		});
		
		$('input:radio[name="rate"]').on('click', function(e) {
			fn_checkingHidden($(this));
		});
		
		$('input:radio[name="numb"]').hide();
	});
	
	function fn_checkingHidden(obj) {
		obj.parent().find("input:radio[name=rate]").prop('checked', true);
		obj.parent().find("input:radio[name=numb]").prop('checked', true);
	}

</script>
</body>
</html>