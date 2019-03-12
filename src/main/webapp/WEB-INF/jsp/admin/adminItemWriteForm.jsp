<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="/kingsman/resources/css/adminItem.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/kingsman/resources/js/common.js"></script>
<script type="text/javascript" src="/kingsman/resources/js/csItemWriteValidate.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	/* 수정폼 제이쿼리 */
	var isModifyForm = '<c:out value="${old.ITEM_TYPE}"></c:out>';
	switch (isModifyForm){
	case 'JU' : 
		$('#genderInfo').show();
		$('#sizeInfo').show();
			$('#forTop').show();
			$('#forBottom').hide();
			$('#forShoes').hide();			
		$('#optionInfo').show();
		$('#colorInfo').show();
		
		$('input:radio[name="ITEM_GENDER"]:radio[value="U"]').prop('checked', false);
		$('input:checkbox[name="sizeArray"]:checkbox[value="NONE"]').prop('checked', false);
		$('input:checkbox[name="optionArray"]:checkbox[value="NONE"]').prop('checked', false);
		break;
	case 'JD' : 
		$('#genderInfo').show();
		$('#sizeInfo').show();
			$('#forTop').hide();
			$('#forBottom').show();
			$('#forShoes').hide();
		$('#optionInfo').hide();
		$('#colorInfo').show();
		
		$('input:radio[name="ITEM_GENDER"]:radio[value="U"]').prop('checked', false);
		$('input:checkbox[name="sizeArray"]:checkbox[value="NONE"]').prop('checked', false);
		$('input:checkbox[name="optionArray"]:checkbox[value="NONE"]').prop('checked', true);
		break;
	case 'JI' : 
		$('#genderInfo').show();
		$('#sizeInfo').show();
			$('#forTop').show();
			$('#forBottom').hide();
			$('#forShoes').hide();
		$('#optionInfo').hide();
		$('#colorInfo').show();
		
		$('input:radio[name="ITEM_GENDER"]:radio[value="U"]').prop('checked', false);
		$('input:checkbox[name="sizeArray"]:checkbox[value="NONE"]').prop('checked', false);
		$('input:checkbox[name="optionArray"]:checkbox[value="NONE"]').prop('checked', true);
		break;
	case 'JS' : 
		$('#genderInfo').show();
		$('#sizeInfo').show();
			$('#forTop').hide();
			$('#forBottom').hide();
			$('#forShoes').show();
		$('#optionInfo').hide();
		$('#colorInfo').show();
		
		$('input:radio[name="ITEM_GENDER"]:radio[value="U"]').prop('checked', false);
		$('input:checkbox[name="sizeArray"]:checkbox[value="NONE"]').prop('checked', false);
		$('input:checkbox[name="optionArray"]:checkbox[value="NONE"]').prop('checked', true);
		break;
	case 'AC' : 
		$('#genderInfo').hide();
		$('#sizeInfo').hide();
		$('#optionInfo').hide();
		$('#colorInfo').hide();

		$('input:radio[name="ITEM_GENDER"]:radio[value="U"]').prop('checked', true);
		$('input:checkbox[name="sizeArray"]:checkbox[value="NONE"]').prop('checked', true);
		$('input:checkbox[name="optionArray"]:checkbox[value="NONE"]').prop('checked', true);
		break;
	default :
		break;
	}
});
</script>
<style type="text/css">
.canMove{cursor: pointer;}
</style>

</head>
<body>


<!-- 

item_no 코드는 아이템 구분 + 시퀀스   남자=M,여자=W,정장상의=JU,정장하의=JD,정장내의=JI 
item_date 제조일자 선택
item_size 세자리 080~110 수를 ,로 끊어서
item_option S,D,C 세가지 수
item_color 색상이름=#123123,색상이름=#123123,색상이름=#123123  식으로 


 -->
 <div id="csContentBox">

 <c:if test="${old != null}">
 	
	<form id="csAdminForm" action="itemModify" enctype="multipart/form-data" method="POST" onsubmit="return adminItemValidateForm()">
	<div class="Title">아이템 수정</div>
		<input type="hidden" name="ITEM_NO" value="${old.ITEM_NO}">
 </c:if>
 <c:if test="${old == null}">
 	
 	<form id="csAdminForm" action="itemWrite" enctype="multipart/form-data" method="POST" onsubmit="return adminItemValidateForm()">
 	<div class="Title">아이템 등록</div>
 </c:if>
	<input type="hidden" name="ITEM_STOCK" value="100">
	<input type="hidden" name="ITEM_SET" value="NONE">
	
	<div id="hideDiv">
		<input type="radio" name="ITEM_GENDER" value="U">
		<input type="checkbox" name="optionArray" value="NONE">
		<input type="checkbox" name="sizeArray" value="NONE">
	</div>
	
	<div id="itemLeft" class="partition">
		<div id="basicInfo">
			<div class="subTitle">BasicInfo</div><br>
			이름 <input type="text" name="ITEM_NAME" value="${old.ITEM_NAME}" autocomplete="off" class="inputs"> 
			<br><br>
			가격 <input type="number" id="ITEM_PRICE" name="ITEM_PRICE" min="0" value="${old.ITEM_PRICE}" autocomplete="off" class="inputs">(원)
			<br><br>
			썸네일 이미지 <input type="file" class="custom-file-input" name="file1">${old.ITEM_SHORTPATH eq 'NONE' ? '썸네일을 넣어주세요.' : old.ITEM_SHORTPATH != null ? '사진이 있습니다.' : ''}
			<br>
			컨텐츠 이미지 <input type="file" class="custom-file-input" name="file2">${old.ITEM_IMAGEPATH eq 'NONE' ? '상세사진을 넣어주세요.' : old.ITEM_SHORTPATH != null ? '사진이 있습니다.' : ''}
			<br>
			  
		</div>	
		<br>
		<div id="domInfo">
			<div class="subTitle">Date of Manufacture</div>
			제조일자  <input type="date" id="ITEM_DATE" name="ITEM_DATE" value="${old.ITEM_DATE}">
		</div>
		<br>
		<div id="classifyInfo">
			<div class="subTitle">Classify Info</div>
			<label for="ITEM_TYPE">정장 상의</label><input type="radio" name="ITEM_TYPE" value="JU" ${old.ITEM_TYPE eq 'JU' ? ' checked="checked"' : '' }> 
			<label for="ITEM_TYPE">정장 하의</label><input type="radio" name="ITEM_TYPE" value="JD" ${old.ITEM_TYPE eq 'JD' ? ' checked="checked"' : '' }> 
			<label for="ITEM_TYPE">셔츠</label><input type="radio" name="ITEM_TYPE" value="JI" ${old.ITEM_TYPE eq 'JI' ? ' checked="checked"' : '' }>
			<label for="ITEM_TYPE">구두</label><input type="radio" name="ITEM_TYPE" value="JS" ${old.ITEM_TYPE eq 'JS' ? ' checked="checked"' : '' }>
			<label for="ITEM_TYPE">악세사리</label><input type="radio" name="ITEM_TYPE" value="AC" ${old.ITEM_TYPE eq 'AC' ? ' checked="checked"' : '' }>
			
		</div>
	</div>
	<div id="middlePart" class="partition"></div>
	<div id="itemRight" class="partition">
		<div id="genderInfo">
			<div class="subTitle">Gender Info</div>
			<label for="ITEM_GENDER">남자</label><input type="radio" name="ITEM_GENDER" value="M" ${old.ITEM_GENDER eq 'M' ? ' checked="checked"' : '' }> 
			<label for="ITEM_GENDER">여자</label><input type="radio" name="ITEM_GENDER" value="W" ${old.ITEM_GENDER eq 'W' ? ' checked="checked"' : '' }>
		</div>
		<br>
		<div id="sizeInfo">
			<div class="subTitle">Size Info</div>
			<div id="forTop">
				<label for="sizeArray">80</label><input type="checkbox" name="sizeArray" value="080" ${old.sizeArray[10]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">85</label><input type="checkbox" name="sizeArray" value="085" ${old.sizeArray[11]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">90</label><input type="checkbox" name="sizeArray" value="090" ${old.sizeArray[12]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">95</label><input type="checkbox" name="sizeArray" value="095" ${old.sizeArray[13]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">100</label><input type="checkbox" name="sizeArray" value="100" ${old.sizeArray[14]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">105</label><input type="checkbox" name="sizeArray" value="105" ${old.sizeArray[15]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">110</label><input type="checkbox" name="sizeArray" value="110" ${old.sizeArray[16]==true ? ' checked="checked"' : '' }>
				
			</div>
			<div id="forBottom">
				<label for="sizeArray">25</label><input type="checkbox" name="sizeArray" value="25" ${old.sizeArray[0]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">26</label><input type="checkbox" name="sizeArray" value="26" ${old.sizeArray[1]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">27</label><input type="checkbox" name="sizeArray" value="27" ${old.sizeArray[2]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">28</label><input type="checkbox" name="sizeArray" value="28" ${old.sizeArray[3]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">29</label><input type="checkbox" name="sizeArray" value="29" ${old.sizeArray[4]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">30</label><input type="checkbox" name="sizeArray" value="30" ${old.sizeArray[5]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">31</label><input type="checkbox" name="sizeArray" value="31" ${old.sizeArray[6]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">32</label><input type="checkbox" name="sizeArray" value="32" ${old.sizeArray[7]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">33</label><input type="checkbox" name="sizeArray" value="33" ${old.sizeArray[8]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">34</label><input type="checkbox" name="sizeArray" value="34" ${old.sizeArray[9]==true ? ' checked="checked"' : '' }>
			</div>
			<div id="forShoes">
				<label for="sizeArray">250</label><input type="checkbox" name="sizeArray" value="250" ${old.sizeArray[17]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">255</label><input type="checkbox" name="sizeArray" value="255" ${old.sizeArray[18]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">260</label><input type="checkbox" name="sizeArray" value="260" ${old.sizeArray[19]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">265</label><input type="checkbox" name="sizeArray" value="265" ${old.sizeArray[20]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">270</label><input type="checkbox" name="sizeArray" value="270" ${old.sizeArray[21]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">275</label><input type="checkbox" name="sizeArray" value="275" ${old.sizeArray[22]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">280</label><input type="checkbox" name="sizeArray" value="280" ${old.sizeArray[23]==true ? ' checked="checked"' : '' }>
				<label for="sizeArray">285</label><input type="checkbox" name="sizeArray" value="285" ${old.sizeArray[24]==true ? ' checked="checked"' : '' }>
			</div>
		</div>
		<br>
		<div id="optionInfo">
			<div class="subTitle">Option Info</div>
			<label for="optionArray">싱글버튼</label><input type="checkbox" name="optionArray" value="S" ${old.optionArray[0]==true ? ' checked="checked"' : '' }>
			<label for="optionArray">더블버튼</label><input type="checkbox" name="optionArray" value="D" ${old.optionArray[1]==true ? ' checked="checked"' : '' }>
			<label for="optionArray">코트</label><input type="checkbox" name="optionArray" value="C" ${old.optionArray[2]==true ? ' checked="checked"' : '' }>
		</div>
		<br>
		<div id="colorInfo">
			<div class="subTitle">Color Info</div>
			<div id="colorDiv">
				<c:choose>
					<c:when test="${old.colorList != null}">
						<c:forEach items="${old.colorList}" var="row" varStatus="stat">
							<p>
							<input type="text" name="itemNameArray" placeholder="예)진파랑" value="${row.name}"> 코드 <input type="color" id="itemColorArray" name="itemColorArray" value="${row.code}"> 
							<c:if test="${stat.count != 1}">
							<a href="#this" class="btn" name="delete">삭제</a>
							</c:if>
							</p>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p>
						이름  <input type="text" name="itemNameArray" placeholder="예)진파랑"  class="inputs" autocomplete="off"> 색상코드 <input type="color" class="itemColorArray" name="itemColorArray"> <!-- <a href="#this" class="btn" name="delete">삭제</a> -->
						</p>
					</c:otherwise>
				</c:choose>
			</div>
			<a href="#this" class="btn" id="addColor">색상 추가</a>
		</div>
		<div id="noNeedMoreInfo" class="subTitle">No Need More Info</div>
		<div id="optionBox">
			<input type="submit" class="itemBtn" value="등록"> 
			<input type="button" class="itemBtn" onclick="history.go(-1)" value="뒤로">
		</div>
	</div>
</form>
 </div>
</body>
</html>