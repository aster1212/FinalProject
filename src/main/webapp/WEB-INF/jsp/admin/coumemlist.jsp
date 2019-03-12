<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="/kingsman/resources/css/admincoupon.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
$(document).ready(function(){
    $('#send').on('click', function(e) {
       e.preventDefault();
       fn_addUser();
    });
 });
 
 var arrUser = new Array();
 var seletid = null;
 
 function fn_addUser() {
    $('input:checkbox[name="member_id"]').each(function() {
       /* this.checked = true; */ //checked 처리
       if(this.checked){   //checked 처리된 항목의 값
          var str = '<p><input type="hidden" name="member_id" value="'+this.value+'">'+this.value+'</p>';
           // 배열의 크기가 1이상이면
          var chkBool = false;
          for(var i = 0 ; i < arrUser.length ; i ++){
             if(this.value == arrUser[i]){ // 이 체크박스의 값이 i와 같으면 chkbool이 참
                chkBool = true;
             }
          }
          if(chkBool != true){ // chkbool이 거짓이면 
             $(opener.document).find('#get').append(str);
          
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

 
 function closeWindow()
 {
	 self.close();
 }
</script>
</head>
<body>
<div id="windowAdminMemlist">
	<table id="adminCouponList1">
		<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>생일</th>
				<th>구매총액</th>
				<th>회원등급</th>
				<th>가입날짜</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${fn:length(memlist) > 0}">
			<c:forEach items="${memlist}" var="row">
				<tr>
					<td>
						<input type="checkbox" name="member_id" id="member_id" value="${row.MEMBER_ID}">
						${row.MEMBER_NO}
					</td>
					<td>${row.MEMBER_ID}</td>
					<td>${row.MEMBER_YEAR}.${row.MEMBER_MONTH}.${row.MEMBER_DAY}</td>
					<td>${row.MEMBER_TOTAL}</td>
					<c:if test="${row.MEMBER_MEM_GB==0}"><td>Stone</td></c:if>
					<c:if test="${row.MEMBER_MEM_GB==10}"><td>Bronze</td></c:if>
					<c:if test="${row.MEMBER_MEM_GB==20}"><td>Silver</td></c:if>
					<c:if test="${row.MEMBER_MEM_GB==30}"><td>Gold</td></c:if>
					<c:if test="${row.MEMBER_MEM_GB==40}"><td>Diamond</td></c:if>
					<c:if test="${row.MEMBER_MEM_GB==50}"><td>Kingsman</td></c:if>
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
	<div id="coumemlistDiv">
		${pagingCoumem}
	</div>
<div id="searchdiv22">
<form id="frmcou3" action="/kingsman/admin/coumemlist" method="post">
	<select name="searchname">
		<option value="sContent2">통합검색</option>
	</select> 
	<input type="text" name="searchtext">&nbsp;<input type="button" id="memlistCouSearch" value="검색" onclick="memcouSearch();">
</form>
</div>
<div id="buttondiv22">
<input type="button" value="추가하기" id="send">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<input type="button" id="button333" onclick="closeWindow()" value="완료">
</div>
</div>
</body>
<script>
	function memcouSearch()
	{
		document.getElementById("frmcou33").submit();
	}
</script>
</html>