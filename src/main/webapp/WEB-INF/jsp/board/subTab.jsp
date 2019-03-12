<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.subBtn{
	background: white;
	font-size: 20px;
	cursor: pointer;
	height: inherit;
	display: table-cell;
	vertical-align: middle;
	width: 100px;
	border: 3px solid #dbdbdb;
}

#subBox{
	height: 60px;
	text-align: center;
	display: inline-block;
}
.subTableBox{
	height: inherit;
	display: inline-block;
	margin: 0 -2px 0 -3px;
	z-index: 1;
}



.verticalLine{
	display: inline-block;
	height: 60px;
	border: 3px solid #dbdbdb;
	border-left:none;
}

#noticeBtn{
	border-bottom-left-radius: 10px;
	border-top-left-radius: 10px;
}
#eventBtn{
	border-left: none;
	border-right: none;
}
#qnaBtn{
	border-bottom-right-radius: 10px;
	border-top-right-radius: 10px;
}
#boardSearchForm{
	display: block;
	margin: 30px 0 5px 0;
	border:none;
}

#searchInput{
	width: 130px;
	height: 30px;
	position:absolute;
	padding-right :50px;
	padding-left : 20px;
	border-style: none;
	border: 2px solid #555555;
	border-radius: 12px;
	top: 158px;
	right: 20.5%;
	outline: none;
	z-index: 3;
}

#searchBtn{
	width: 25px;
	height: 25px;
	display: inline-block;
	cursor: pointer;
	line-height: 30px;
	position: absolute;
	top: 162px;
	right: 21%;
	z-index: 4;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function (e) {
		$('.subBtn').hover(function() {
			$(this).css('border-color','#4BD1A0');
			
			if($(this).attr('id') == 'eventBtn'){
				$('#noticeBtn').css('border-right-color','#4BD1A0');
				$('#qnaBtn').css('border-left-color','#4BD1A0');
			}
		}, function() {
			$(this).css('border-color','#dbdbdb');
			
			if($(this).attr('id') == 'eventBtn'){
				$('#noticeBtn').css('border-right-color','#dbdbdb');
				$('#qnaBtn').css('border-left-color','#dbdbdb');
			}
		});
		
		// search
		$('#searchInput').focus(function(e) {
			e.preventDefault();
			$(this).css('border-color','#50DEAA');
		});
		$('#searchInput').blur(function(e) {
			e.preventDefault();
			$(this).css('border-color','#aaaaaa');
		});
		$('#searchBtn').on('click', function() {
			fn_searchGo();
		});
	});
	function fn_searchGo() {
		$('#boardSearchForm').submit();
	}
</script>
</head>
<body>
<div id="subBox">
	<div class="subTableBox">
		<div id="noticeBtn" class="subBtn" onclick="window.location='/kingsman/notice/list'" >공지사항</div>
	</div>
	<!-- <div id="with12" class="verticalLine"></div> -->
	<div id="subMiddle" class="subTableBox">
		<div id="eventBtn" class="subBtn" onclick="window.location='/kingsman/event/list'" > 이벤트</div>
	</div>
	<!-- <div id="with23" class="verticalLine"></div> -->
	<div class="subTableBox">
		<div id="qnaBtn" class="subBtn" onclick="window.location='/kingsman/qna/list'"> 문의</div>
	</div>
</div>
<form id="boardSearchForm" action="list">
	<input id="searchInput" type="text" name="searchStr" value="${searchStr}" placeholder="search..." autocomplete="off">
	<img id="searchBtn" class="searchBtns" src="/kingsman/resources/upload/search.png">
</form>
</body>
</html>