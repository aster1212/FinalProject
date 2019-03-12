<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/kingsman/resources/css/Main.css">
<link rel="stylesheet" type="text/css" href="/kingsman/resources/css/Board.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/kingsman/resources/js/csMain.js"></script>
<script type="text/javascript">
	var isMain = true;
	$(document).ready(function(e) {
		
		$('.itemThumbnails').hover(function() {
			$(this).css('border','2px solid #4BD1A0');
		}, function () {
			$(this).css('border','2px solid #ffffff');
		});
		
		fn_resize();
	});
	
	function fn_resize() {
		$(window).resize(function() {
			fn_content();
		});
	}
</script>
</head>
<body>
<!-- 전체 빽 사진  -->
<img id="mainImg1" src="/kingsman/resources/upload/bestseller.jpg">
<div id="imgBlank1" class="backWite"></div>
<img id="mainImg2" src="/kingsman/resources/upload/manseller.jpg">
<div id="imgBlank2" class="backWite"></div>
<img id="mainImg3" src="/kingsman/resources/upload/womanseller.jpg">
<div id="imgBlank3" class="backWite"></div>
<div id="mainImg4"></div>
<!-- 전체 빽 사진 끝 -->

<div id="img1Content" class="imgContent">
	<div id="img1MenuBlank" style="height:10%; width: 30px;"></div>
	<article id="img1Logo" class="imgLogo">
		BEST<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		SELLER
	</article>
</div>

<div id="img1WhiteContent" class="imgWhiteContent">
	<div class="imgWhiteContentBlank"></div>
	<c:if test="${list1.size()<1}">
		가져온 리스트가 없음
	</c:if>
	<c:if test="${list1.size() > 0 }">
		<c:forEach items="${list1}" var="row">
			<div class="mainItems">
				<div class="itemTumbnailBox">
					<img alt="${row.ITEM_NAME}" 
					class="itemThumbnails" 
					src="/kingsman/resources/imagephoto/<c:out value="${row.ITEM_SHORTPATH}"/>" 
					onerror="this.src='/kingsman/resources/upload/kingsman.png'" 
					onclick="location.href='/kingsman/item/detail?ITEM_NO=${row.ITEM_NO}'">
				</div>
				<div class="itemAccounts">
					<span class="itemNames">${row.ITEM_NAME}</span>
					<br>
					<span class="money">${row.ITEM_PRICE}</span>원
				</div>
			</div>
		</c:forEach>
		<c:forEach begin="1" end="${8 - list1.size()}" step="1">
			<div class="mainItems">
			
			</div>
		</c:forEach>
	</c:if>
</div>

<div id="img2Content" class="imgContent">
	<article id="img2Logo" class="imgLogo">
		MAN's<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		SELLER
	</article>
</div>
<div id="img2WhiteContent" class="imgWhiteContent">
	<div class="imgWhiteContentBlank"></div>
	<c:if test="${list2.size()<1}">
		가져온 리스트가 없음
	</c:if>
	<c:if test="${list2.size() > 0 }">
		<c:forEach items="${list2}" var="row">
			<div class="mainItems">
				<div class="itemTumbnailBox">
					<img alt="${row.ITEM_NAME}" 
					class="itemThumbnails" 
					src="/kingsman/resources/imagephoto/<c:out value="${row.ITEM_SHORTPATH}"/>" 
					onerror="this.src='/kingsman/resources/upload/kingsman.png'" 
					onclick="location.href='/kingsman/item/detail?ITEM_NO=${row.ITEM_NO}'">
				</div>
				<div class="itemAccounts">
					<span class="itemNames">${row.ITEM_NAME}</span>
					<br>
					<span class="money">${row.ITEM_PRICE}</span>원
				</div>
			</div>
		</c:forEach>
		<c:forEach begin="1" end="${8 - list2.size()}" step="1">
			<div class="mainItems">
			
			</div>
		</c:forEach>
	</c:if>
</div>

<div id="img3Content" class="imgContent">
	<article id="img3Logo" class="imgLogo">
		WOMAN's<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		SELLER
	</article>
</div>
<div id="img3WhiteContent" class="imgWhiteContent">
	<div class="imgWhiteContentBlank"></div>
	<c:if test="${list3.size()<1}">
		가져온 리스트가 없음
	</c:if>
	<c:if test="${list3.size() > 0 }">
		<c:forEach items="${list3}" var="row" varStatus="stat">
			<div class="mainItems">
				<div class="itemTumbnailBox">
					<img alt="${row.ITEM_NAME}" 
					class="itemThumbnails" 
					src="/kingsman/resources/imagephoto/<c:out value="${row.ITEM_SHORTPATH}"/>" 
					onerror="this.src='/kingsman/resources/upload/kingsman.png'" 
					onclick="location.href='/kingsman/item/detail?ITEM_NO=${row.ITEM_NO}'">
				</div>
				<div class="itemAccounts">
					<span class="itemNames">${row.ITEM_NAME}</span>
					<br>
					<span class="money">${row.ITEM_PRICE}</span>원
				</div>
			</div>
		</c:forEach>
		<c:forEach begin="1" end="${8 - list3.size()}" step="1">
			<div class="mainItems">
			
			</div>
		</c:forEach>
	</c:if>
	
</div>

<div class="boardLine"></div>
<div style="height: 40px;"></div>
<div id="boardListTitle">EVENT
<input id="moreBtn" type="button" value="More" onclick="window.location='event/list'">
</div>
<br>
	<c:choose>
		<c:when test="${List.size() > 0}">
			<c:forEach items="${List}" var="row" varStatus="stat">
				<div class="boardList" onclick="window.location='event/detail?BOARD_NO=${row.BOARD_NO}&nowPage=${nowPage}'">
					<div class="boardListLeft" >
						<font class="boardTitle">${row.BOARD_TITLE}</font>
					</div>
					<div class="boardListRight">
						<div class="viewDiv">
							<img alt="조회수" src="/kingsman/resources/upload/view.png"><div class="viewCountDiv">${row.BOARD_CNT }</div>
						</div>
						&nbsp;&nbsp;
						<div class="dateDiv">
						<fmt:formatDate value="${row.BOARD_REGDATE}" pattern="yyyy.MM.dd"/>
						</div> 
					</div>
				</div>
				<br>
			</c:forEach>
			<c:if test="${10 - List.size() > 0}">
				<c:forEach begin="0" end="${10 - List.size()}" step="1">
				<div style="height: 54px; width: 100%;"></div>
				</c:forEach>
			</c:if>
		</c:when>
		<c:otherwise>
			<div class="boardList">공지사항이 없습니다.</div>
		</c:otherwise>
	</c:choose>
<%-- <div style="height: 10px"></div>
<div class="pagingView">${paging}</div> --%>
<div style="height: 20px"></div>

</body>
</html>