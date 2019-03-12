<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
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
<link type="text/css" rel="stylesheet" href="/kingsman/resources/css/adminMember.css">
</head>
<body>
	<form id="memfrm" action="/kingsman/admin/memberList" method="post">
		<div id="adminMemberWrap">
			<div id="adminMemberTitle">회원목록</div>
			<table id="adminmemberList1">
				<thead>
					<tr>
						<th>이름</th>
						<th>성별</th>
						<th>생년월일</th>
						<th>아이디</th>
						<th>회원등급</th>
						<th>구매금액</th>
						<th>적립금</th>
						<th>핸드폰번호</th>
						<th>이메일</th>
						<th id="adminMemberAddr">주소</th>
						<th>가입날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(memberList) > 0}">
							<c:forEach items="${memberList}" var="row">
								<tr>
									<td>${row.MEMBER_NAME}</td>
									<c:if test="${row.MEMBER_GENDER==1}">
										<td>남자&nbsp;&nbsp;</td>
									</c:if>
									<c:if test="${row.MEMBER_GENDER==2}">
										<td>여자&nbsp;&nbsp;</td>
									</c:if>
									<td>${row.MEMBER_YEAR}-${row.MEMBER_MONTH}-${row.MEMBER_DAY}&nbsp;&nbsp;</td>
									<td>${row.MEMBER_ID}</td>
									<td>${row.MEMBER_MEM_GB}</td>
									<td>${row.MEMBER_TOTAL}</td>
									<td>${row.MEMBER_MILEAGE}</td>
									<td>${row.MEMBER_PHONE}</td>
									<td>${row.MEMBER_EMAIL}</td>
									<td id="adminMemberAddr">${row.MEMBER_ZIPCODE}&nbsp;${row.MEMBER_ADDR1}&nbsp;${row.MEMBER_ADDR2}&nbsp;${row.MEMBER_ADDR3}&nbsp;&nbsp;</td>
									<td>${row.MEMBER_REGDATE}</td>
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

		
		<div id="adminMemberPaging">
			${pagingmem}</div>
		<div id="adminMemberSearch">
			<select id="searchname" name="searchname">
							<option value="sbasic">검색</option>
							<option value="sid">아이디</option>
							<option value="sname">이름</option>
							<option value="saddr1">주소</option>
							<option value="sphone">핸드폰</option>
					</select> <input type="text" id="searchtext" name="searchtext">
					<span id="space1">
					<input type="button" value="검색" id="ListAdminSearchBtn" onclick="search22();">
					</span>
		</div>
	</div>
	</form>
</body>
<script>
function search22()
{
	document.getElementById("memfrm").submit();
}
</script>
</html>