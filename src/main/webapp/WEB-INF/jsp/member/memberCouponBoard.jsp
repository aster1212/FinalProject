<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<link type="text/css" rel="stylesheet"
	href="/kingsman/resources/css/memberCoupon.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {

		$('input:radio[name=use]').on('click', function(e) {
			fn_swiching($(this));
		});
		$('#use1').prop('checked', true);
		$('#uselist2').hide();
		
		$('#searchBtn').on('click', function() {
			$('#memCoufrm').submit();
		});
		$('#searchBtn2').on('click', function() {
			$('#memCoufrm').submit();
		});
	});

	function fn_swiching(obj) {
		var status = obj.val();
		if (status == 1) {
			$('#uselist1').fadeIn(10);
			$('#uselist2').hide();
		} else {
			$('#uselist2').fadeIn(10);
			$('#uselist1').hide();
		}
	}
</script>
</head>
<body>
	<div id="memCouBoard">
		<form id="memCoufrm" action="/kingsman/member/memcouponlist"
			method="post">
			<div id="couponLogo">
				<a href="/kingsman/"><img id="couponlogo1"
					src="/kingsman/resources/upload/kingsman.png" height="134"></a>
			</div>
			<div id="memCouBoardgb">
				<input type="radio" id="use1" name="use" value="1">사용 가능한 쿠폰
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input
					type="radio" id="use2" name="use" value="2">사용/만료 쿠폰
			</div>
			<div id="memCouBoardLine1"></div>
			<div id="uselist1">
				<table id="useTable">
					<thead>
						<tr>
							<th>쿠폰번호</th>
							<th>쿠폰내용</th>
							<th>할인율</th>
							<th>사용기간</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:choose>
								<c:when test="${fn:length(memcoulist) > 0}">
									<c:forEach items="${memcoulist}" var="row">
										<c:if test="${row.COU_STATE==2}">
											<tr>
												<td>${row.COU_ORIGIN_NO}</td>
												<td>${row.COU_CONTENT}</td>
												<td>${row.COU_DISCOUNT}%</td>
												<td>${row.COU_SDATE}~ ${row.COU_EDATE}</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
					조회된 결과가 없습니다.
				</c:otherwise>
							</c:choose>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="uselist2">
				<table id="useTable">
					<thead>
						<tr>
							<th>쿠폰번호</th>
							<th>쿠폰내용</th>
							<th>할인율</th>
							<th>사용상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:choose>
								<c:when test="${fn:length(memcoulist) > 0}">
									<c:forEach items="${memcoulist}" var="row">
										<c:if test="${row.COU_STATE==1 ||row.COU_STATE==3}">
											<td>${row.COU_ORIGIN_NO}</td>
											<td>${row.COU_CONTENT}</td>
											<td>${row.COU_DISCOUNT}%</td>
											<td><c:if test="${row.COU_STATE==1}">사용한쿠폰</c:if> <c:if
													test="${row.COU_STATE==3}">만료된쿠폰</c:if></td>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
					조회된 결과가 없습니다.
				</c:otherwise>
							</c:choose>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="couponPaging">${memcoupage}</div>
			<div id="couponSearch">
				<select id="search1" name="searchname">
					<option value="sContent">내용</option>
					<option value="sDiscount">할인율</option>
				</select> <input type="text" id="searchInput" name="searchtext">&nbsp;
				<img id="searchBtn" class="boardBtn"
					src="/kingsman/resources/upload/SearchBlack.png">
			</div>
			<div id="couponBoardBack">
				<input type="button" id="CouponBoardBtn" value="Mypage"
					onclick="location.href='/kingsman/member/mypage'">
			</div>
		</form>
	</div>
</body>
</html>
