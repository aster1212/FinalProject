<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/kingsman/resources/js/common.js"></script>
<head>
<link type="text/css" rel="stylesheet"
	href="/kingsman/resources/css/admincoupon.css">
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
	<div id="adminCouponDelWrap">
		<div id="adminCouponDelTitle">쿠폰 삭제하기</div>
		<div id="arrStatus">
			<form id=frm44 action="/kingsman/admin/coupondelete" method="post">
				<table id="adminCouponDelTable">
					<thead>
						<tr>
							<th>번호</th>
							<th>쿠폰내용</th>
							<th>할인율</th>
							<th>사용기간</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(coulist) > 0}">
								<c:forEach items="${coulist}" var="row">
									<tr>
										<td><input type="checkbox" value="${row.COU_NO}"
											id="cou_no" name="cou_no"> ${row.COU_NO}</td>
										<td>${row.COU_CONTENT}</td>
										<td>${row.COU_DISCOUNT}%</td>
										<td>${row.COU_SDATE}~${row.COU_EDATE}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4">조회된 결과가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div id="deleteDiv">
					<input type="button" value="삭제하기" id="send"
						onclick="return Btndelete();" />
				</div>
			</form>
		</div>
		<div id="pagingSearchDiv">
		<div id="pagingmemlist">${pagingCou}</div>
		<div id="searchmemlist">
			<form id=frm444 action="/kingsman/admin/CouponDeleteList"
				method="post">
				<select name="searchname" id="searchname">
					<option value="sContent">내용</option>
					<option value="sDiscount">할인율</option>
					<option value="sDate">기간</option>
				</select> <input type="text" name="searchtext" id="searchtext">&nbsp;
				<input type="button" id="memlistCouSearch" value="검색"
					onclick="search();">
			</form>
		</div>
		</div>
	</div>
</body>
<script>
	function search() {
		document.getElementById("frm444").submit();
	}
	function Btndelete() {
		var deleteno = document.getElementById("cou_no")
				.getAttribute("checked");
		if (deleteno == null) {
			alert("삭제할 쿠폰을 선택해주세요");

			return;
		} else {
			document.getElementById("frm44").submit();
		}
	}
</script>
</html>