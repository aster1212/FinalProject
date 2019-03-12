<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이템 리스트</title>
<link rel="stylesheet" type="text/css" href="/kingsman/resources/css/itemList.css">
<script type="text/javascript">
	
$(function(){
	$('.itemlist').show();
    $('.man').hide();
    $('.woman').hide();
    
    $('.all').click(function(){
    	$('.man').hide();
    	$('.woman').hide();
    	$('.itemlist').show();
    	});
    
	$('.up').click(function(){
		$('.man').show();
		$('.woman').hide();
		$('.itemlist').hide();
	});
	
	$('.down').click(function(){
		$('.woman').show();
		$('.man').hide();
		$('.itemlist').hide();
	});
	
	var where = '<c:out value="${param.state}"></c:out>';
	switch (where){
	case '1' :
		$('.man').hide();
    	$('.woman').hide();
    	$('.itemlist').show();
		break;
	case '2' :
		$('.man').show();
		$('.woman').hide();
		$('.itemlist').hide();
		break;
	case '3' :
		$('.woman').show();
		$('.man').hide();
		$('.itemlist').hide();
		break;
	default : 
		$('.itemlist').show();
	    $('.man').hide();
	    $('.woman').hide();
		break;
	}
});

</script>
</head>
<body>
<div class="top">

<div class="col-sm-12 text-center location">
      <h1 style="color:#7b7b7b;font-size:3em;font-weight: 300;font-family: 'Montserrat', 'Helvetica', 'Arial', sans-serif;margin-bottom: 0px;">SHOES</h1>
      <a href="#this" class="all" style="font-size:.9em;">전체</a> &nbsp;&nbsp;/&nbsp;&nbsp;
      <a href="#this" class="up" style="cfont-size:.9em;">남자</a> &nbsp;&nbsp;/&nbsp;&nbsp;
      <a href="#this" class="down" style="font-size:.9em;">여자</a>
</div>
<br>
<div class="itembox">
<div class="itemlist">
		<c:choose>
			<c:when test="${fn:length(shoeslist) > 0}">
				<c:forEach items="${shoeslist }" var="row" varStatus="status" begin="0" step="1">
					<div class="itemLists" style="display: inline-block;">
						<br>	
						<a href="/kingsman/item/detail?ITEM_NO=${row.ITEM_NO }&commentCategory=1">
							<div class="itemImg" >
								<img alt="이미지" src="/kingsman/resources/imagephoto/${row.ITEM_SHORTPATH}">
							</div>
						</a>
						<br>
						<input type="hidden" name="ITEM_NO" value="${row.ITEM_NO}">
						<a href="/kingsman/item/detail?ITEM_NO=${row.ITEM_NO }&commentCategory=1">${row.ITEM_NAME }</a>
						<br>
						<a href="/kingsman/item/detail?ITEM_NO=${row.ITEM_NO }&commentCategory=1"><span class="money">${row.ITEM_PRICE }</span></a>
					</div>
					<c:if test="${(status.count)%3==0}"><br><br></c:if>
				</c:forEach>
			</c:when>
			<c:otherwise>
				
					조회된 결과가 없습니다.
				
			</c:otherwise>
		</c:choose>
		<br><br>
		${paging}
</div>
<div class="man">
		<c:choose>
			<c:when test="${fn:length(manlist) > 0}">
				<c:forEach items="${manlist }" var="row" varStatus="status" begin="0" step="1">
					<div class="itemLists" style="display: inline-block;">
						<br>	
						<a href="/kingsman/item/detail?ITEM_NO=${row.ITEM_NO }&commentCategory=1">
							<div class="itemImg" >
								<img alt="이미지" src="/kingsman/resources/imagephoto/${row.ITEM_SHORTPATH}">
							</div>
						</a>
						<br>
						<input type="hidden" name="ITEM_NO" value="${row.ITEM_NO}">
						<a href="/kingsman/item/detail?ITEM_NO=${row.ITEM_NO }&commentCategory=1">${row.ITEM_NAME }</a>
						<br>
						<a href="/kingsman/item/detail?ITEM_NO=${row.ITEM_NO }&commentCategory=1"><span class="money">${row.ITEM_PRICE }</span></a>
					</div>
					<c:if test="${(status.count)%3==0}"><br><br></c:if>
				</c:forEach>
			</c:when>
			<c:otherwise>
				
					조회된 결과가 없습니다.
				
			</c:otherwise>
		</c:choose>
		<br><br>
		${manlistpaging}
</div>
<div class="woman">
		<c:choose>
			<c:when test="${fn:length(womanlist) > 0}">
				<c:forEach items="${womanlist }" var="row" varStatus="status" begin="0" step="1">
					<div class="itemLists" style="display: inline-block;">
						<br>	
						<a href="/kingsman/item/detail?ITEM_NO=${row.ITEM_NO }&commentCategory=1">
							<div class="itemImg" >
								<img alt="이미지" src="/kingsman/resources/imagephoto/${row.ITEM_SHORTPATH}">
							</div>
						</a>
						<br>
						<input type="hidden" name="ITEM_NO" value="${row.ITEM_NO}">
						<a href="/kingsman/item/detail?ITEM_NO=${row.ITEM_NO }&commentCategory=1">${row.ITEM_NAME }</a>
						<br>
						<a href="/kingsman/item/detail?ITEM_NO=${row.ITEM_NO }&commentCategory=1"><span class="money">${row.ITEM_PRICE }</span></a>
					</div>
					<c:if test="${(status.count)%3==0}"><br><br></c:if>
				</c:forEach>
			</c:when>
			<c:otherwise>
				
					조회된 결과가 없습니다.
				
			</c:otherwise>
		</c:choose>
		<br><br>
		${womanlistpaging}
</div>
</div>
</div>
</body>
</html>