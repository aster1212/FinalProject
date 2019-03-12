<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div id="arrStatus"></div>
<ul>
	<li> <input type="checkbox" name="chkBox" value="val1"> <a href="#this" name="chkA">추가</a> <label>이름1</label></li>
	<li> <input type="checkbox" name="chkBox" value="val2"> <a href="#this" name="chkA">추가</a> <label>이름2</label></li>
	<li> <input type="checkbox" name="chkBox" value="val3"> <a href="#this" name="chkA">추가</a> <label>이름3</label></li>
	<li> <input type="checkbox" name="chkBox" value="val4"> <a href="#this" name="chkA">추가</a> <label>이름4</label></li>
	<li> <input type="checkbox" name="chkBox" value="val5"> <a href="#this" name="chkA">추가</a> <label>이름5</label></li>
</ul>

<input type="button" id="addUser" value="추가하기">

<form action="asd">

<div>
	쿠폰 리스트
</div>

<div id="testDiv">
	회원 리스트
	<div id="userDiv">
	</div>
</div>
	
</form>

<script type="text/javascript">
	$(document).ready(function(){
		$('#addUser').on('click', function(e) {
			e.preventDefault();
			fn_addUser();
		});
	});
	
	var arrUser = new Array();
	var selectIds = null;
	
	function fn_addUser() {
		$('input:checkbox[name="chkBox"]').each(function() {
			/* this.checked = true; */ //checked 처리
			if(this.checked){	//checked 처리된 항목의 값
				var str = '<p><input type="hidden" name="ids" value="'+this.value+'">'+this.value+'</p>';
				 // 배열의 크기가 1이상이면
				var chkBool = false;
				for(var i = 0 ; i < arrUser.length ; i ++){
					if(this.value == arrUser[i]){ // 이 체크박스의 값이 i와 같으면 chkbool이 참
						chkBool = true;
					}
				}
				if(chkBool != true){ // chkbool이 거짓이면 
					//$('#userDiv').append(str);
					selectIds += str;	
				
					var arrUserBool = false;
					for(var i = 0 ; i < arrUser.length ; i ++){
						if(this.value == arrUser[i])
							arrUserBool = true;
					}
					if(arrUserBool != true)
						arrUser.push(this.value);
					$('#arrStatus').html(arrUser);
				}else{
					alert(this.value + ' 는 중복입니다.')
				}
			}
		});
	}

</script>
</body>
</html>