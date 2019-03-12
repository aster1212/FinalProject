<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<link type="text/css" rel="stylesheet" href="/kingsman/resources/css/admincoupon.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/kingsman/resources/js/common.js"></script>
<head>
<script>
	function search()
	{
		var searchtext = document.getElementById("searchtext").value;
		var searchname = document.getElementById("searchname").value;
		
		window.location.href="/kingsman/admin/Couponlist?searchtext="+searchtext+"&searchname="+searchname;
	}
	function coumem()
	{
		var url = "/kingsman/admin/coumemlist";
		window.open(url,'','toolbar=1, scrollbars=1, location=1, statusbar=0, menubar=1, resizable=1, width=700, height=500');
	}
	function btnsript()
	{
		$('#frm').submit();
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
<div id="adminSendCouponWrap">
	<div id="adminSendCouponTitle">회원 쿠폰 보내기</div>
	<form id=frm action="/kingsman/admin/SendCoupon" method="post">
	 <div id="arrStatus">
		<table id="adminCouponList1">
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
						<td>
							<input type="checkbox" value="${row.COU_NO}" id="cou_no" name="cou_no">
							${row.COU_NO}
						</td>
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
	</div>
	<div id="CouponListPage">
		${pagingCou}
	</div>	
	<div id="CouponListSelect">
		<select name="searchname" id="searchname">
			<option value="sContent">내용</option>
			<option value="sDiscount">할인율</option>
			<option value="sDate">기간</option>
		</select>
		<input type="text" name="searchtext" id="searchtext">&nbsp;
		<input type="button" id="ListAdminSearchBtn" value="검색" onclick="search()">
	</div>
	<div id="adminSendCouponMemList">
		<input type="button"  id="ListAdminListBtn" value="회원리스트" onclick="coumem()"/>
	</div>
	<div id="line22"></div>
	<div id="getmemtitle"> < 회원목록 >  <input type="button" id="ListAdminCouponSend" value="쿠폰보내기" onclick="btnsript();"/></div>
	<div id="getmemDiv">
		<div id="line33"></div>
		<div id="get" class="get"></div>
	</div>
	</form>
</div>
</body>
</html>