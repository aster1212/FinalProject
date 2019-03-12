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

</script>
</head>
<body>
<div class="top">

<div class="col-sm-12 text-center location">
      <h1 style="color:#7b7b7b;font-size:3em;font-weight: 300;font-family: 'Montserrat', 'Helvetica', 'Arial', sans-serif;margin-bottom: 0px;">ACCESSORIES</h1>
</div>
<br>
<div class="itembox">
<div class="itemlist">
<input type="hidden" name="commentCategory" value="1">
		<c:choose>
			<c:when test="${fn:length(acclist) > 0}">
				<c:forEach items="${acclist }" var="row" varStatus="status" begin="0" step="1">
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
</div>
<br><br>
${paging}

</div>
</div>
</body>
</html>