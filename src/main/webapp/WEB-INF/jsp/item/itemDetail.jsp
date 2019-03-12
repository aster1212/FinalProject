<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이템 상세보기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/kingsman/resources/js/common.js"></script>
<script src="/kingsman/resources/js/jiValidateForm.js"></script>
<link rel="stylesheet" type="text/css" href="/kingsman/resources/css/itemDetail.css">
<style type="text/css">
button{
outline:none;
}
.button3{
background-color: #50DEAA;
border: none;
color:#fff;
padding: 8px 0;
text-align: center;
text-decoration: none;
display: inline-block;
cursor: pointer;
border-radius: 5px;
width:100px;
}
.button3:hover{
background-color: #86B381;
} 
</style>
<script type="text/javascript">
function openlogin(){
	var comSubmit = new ComSubmit("wish");
	comSubmit.setUrl("<c:url value='/member/login' />");
	comSubmit.submit();
}
	function fnMove(seq){
	    var offset = $("#h" + seq).offset();
	    $('html, body').animate({scrollTop : offset.top}, 300);
	}
	$(document).ready(function(e) {
		jin();
		$('#colorBox').contents().hide();
		$("#colorBox").children().eq(0).show();

		$('#basicCom').hide();
		$('#photoCom').hide();
		$('#colorSelect').change( function() {
			var Sindex = $('#colorSelect option').index(
					$('#colorSelect option:selected'));
			$('#colorBox').contents().hide();
			$('#colorBox').children().eq((Sindex)).show();
		});
		
		
		// count for cart
	      $('#detailCount').change( function() {
	         $('#cartCountHidden').val($(this).val());
	      });
	      
	      $('#realOption').change( function(){
	    	  $('#cartOptionHidden').val($(this).val());
	      });
	      
	      $('#realSelect').change( function(){
	    	  $('#cartColorHidden').val($(this).val());
	      });
	      
	      $('#realSize').change( function(){
	    	  $('#cartSizeHidden').val($(this).val());
	      });
	      
	      
	});

	
	function jin(){
		var v18 = $('#MEMBER_ID').val();
		var v19 = $('#MEMBER_NAME').val();
		if(v18 == '' && v19 == ''){ }
		else 	if(v19==''){
			var body = document.getElementById('rao');
			body.innerHTML ="<td class='left' style='  padding-left:80px'><h4>${nonmemname}${idSession}님의 후기작성</h4></td>"  ;     
			
			var body = document.getElementById('rao1');
			body.innerHTML ="<td class='left' style='  padding-left:80px'><h4>${nonmemname}${idSession}님의 후기작성</h4></td>"  ;       
			}
		
	}
	
	
	function fn_addWish() {
		var comSubmit = new ComSubmit("wish");
		comSubmit.setUrl("<c:url value='/wishList/addWish' />");
		comSubmit.submit();
	}
	
	
</script>
</head>
<body>
	
			
	<div id="detailSelect" class="detail">
		<form action="/kingsman/cart/addCart" method="post"  id="goForm">
			<input type="hidden" id="MEMBER_ID" name="MEMBER_ID" value="${idSession}">
			<input type="hidden" id="MEMBER_NAME" name="MEMBER_NAME" value="${nonmemname}">
			<input type="hidden" name="ITEM_NO" value="${map.ITEM_NO}">
			<input type="hidden" name="ITEM_NAME" value="${map.ITEM_NAME}">
			<input type="hidden" name="ITEM_PRICE" value="${map.ITEM_PRICE}">
			<input type="hidden" name="ITEM_SHORTPATH" value="${map.ITEM_SHORTPATH}">
			<input type="hidden" id="goWhere" name="goWhere" value="">

	<div  class="detail_Img">
		<img width="490"  height="490"  alt="이미지" src="/kingsman/resources/imagephoto/${map.ITEM_SHORTPATH}" height="250px" width="250px">
	</div>
	<div class="detail_Box" >
	<table border="0" width="100%">
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="left"><h3>${map.ITEM_NAME }</h3></td>
	</tr>
	<tr>
		<td class="left">&nbsp;</td>
	</tr>
	<tr>
		<td class="left">KRW <span class="money">${map.ITEM_PRICE}</span><br></td>
	</tr>
	<tr>
		<td class="left">
			<select id="detailSize" name="ITEM_SIZE" class="ss" style="width: 225px;">
					<option value="none">-사이즈선택-</option>
					<c:forEach items="${map.ITEM_SIZE.split(',')}" var="size"
						varStatus="status">
						<option value="${size}" id="realSize">${size }</option>
					</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td class="left">
			<select id="detailOption" name="ITEM_OPTION" class="ss" style="width: 225px;">
					<option value="none">-옵션선택-</option>
					<c:forEach items="${map.ITEM_OPTION.split(',')}" var="option" varStatus="status">
						<option value="${option }" id="realOption">${option }</option>
					</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td class="left">
			<select id="colorSelect" name="ITEM_COLOR" class="ss" style="width: 225px">
					<option value="none">-컬러선택-</option>
					<c:forEach items="${map.colorList}" var="color" varStatus="status">
						<option value="${color.name}" >${color.name}</option>
					</c:forEach>
			</select>
			<div id="colorBox" style="display: inline-block;">
					<div style="width: 30px; height: 20px; display: inline-block; background-color: #ffffff; border: 1px solid black;">
					</div>
					<c:forEach items="${map.colorList}" var="row" varStatus="status">
					<div style="width: 30px; height: 20px; display: inline-block; background-color: ${row.code} ; border: 1px solid black;" id="realColor">
						</div>
					</c:forEach>
			</div> 
		</td>
	</tr>
	<tr>
	<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="left"><input id="detailCount"  name="ITEM_COUNT" type="number" min="1" value="1"></td>
	</tr>
		<tr>
	<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2"  class="left" >
         <button type="button" onclick="itemOptionValidateForm('payment')" style="border:none;  background: white"><img src="/kingsman/resources/image/buy2.png"  onmouseover="this.src='/kingsman/resources/image/buy.png'" onmouseout="this.src='/kingsman/resources/image/buy2.png'" width="280px"  height="50px" ></button>
      </td>
   </tr>
   <tr>
      <td colspan="2"  class="left" >
         <button type="button" onclick="itemOptionValidateForm('cart')" style="border:none;  background: white"><img src="/kingsman/resources/image/cart.png"  onmouseover="this.src='/kingsman/resources/image/cart2.png'" onmouseout="this.src='/kingsman/resources/image/cart.png'" width="280px"  ></button>
      </td>
      
   </tr>
   </form>
	<tr>
		<td colspan="2"  class="left" >
		<form id="wish" onsubmit="return wishValidate()" action="/kingsman/wishList/addWish">
         <input type="hidden" name="ITEM_NO" value="${map.ITEM_NO }">
         <button type="submit"  style="border:none;  background: white"><img src="/kingsman/resources/image/wishlist.png" onmouseover="this.src='/kingsman/resources/image/wishlist2.png'" onmouseout="this.src='/kingsman/resources/image/wishlist.png'" width="280px"    ></button>
         <script type="text/javascript">
         function wishValidate() {
            var id = '<c:out value="${idSession}"></c:out>' ;
            if(id == ''){
               alert('회원으로 로그인 해주세요');
               return false;
            }
         }
         </script>
      </form>
		</td>
	</tr>
	</table>
</div>
</form>
</div>

	<br>
	<div class="img">
	<div id="h1">
	<table width="100%" style="border: 1px solid #B4B4B4;  border-collapse: collapse;">
		<tr>
			<td onclick="fnMove('1')" width="25%"  height="30px" style=" border: 1px solid #B4B4B4;  background-color: #4BD1A0; color:white;"> 상품상세보기 </td>
			<td onclick="fnMove('2')" width="25%" height="25px" style=" border: 1px solid #B4B4B4; background-color: #EAEAEA; color:black;"> 일반후기 </td>
			<td onclick="fnMove('3')" width="25%" height="25px" style="  border: 1px solid #B4B4B4;  background-color: #EAEAEA; color:black;"> 포토후기 </td>
			<td onclick="fnMove('4')" width="25%"height="25px"  style=" border: 1px solid #B4B4B4; background-color: #EAEAEA; color:black;"> 상품문의 </td>
		</tr>
	</table>

    <img  alt="이미지" src="/kingsman/resources/imagephoto/${map.ITEM_IMAGEPATH }"  style="padding-top:10px;"width="100%">
	</div>
	</div>

<div id="commentSelectBox">
    <div id="h2" class="btn">
    <table width="100%" style="border: 1px solid #B4B4B4;  border-collapse: collapse;">
		<tr>
			<td onclick="fnMove('1')" width="25%"  height="30px" style=" border: 1px solid #B4B4B4;  background-color: #EAEAEA; color:black;"> 상품상세보기 </td>
			<td onclick="fnMove('2')" width="25%" height="25px" style=" border: 1px solid #B4B4B4;  background-color: #4BD1A0; color:white;"> 일반후기 </td>
			<td onclick="fnMove('3')" width="25%" height="25px" style="  border: 1px solid #B4B4B4;  background-color: #EAEAEA; color:black;"> 포토후기 </td>
			<td onclick="fnMove('4')" width="25%"height="25px"  style=" border: 1px solid #B4B4B4; background-color: #EAEAEA; color:black;"> 상품문의 </td>
		</tr>
	</table>
	<br>
	<h3 class="left">일반후기</h3>
	<hr style="background-color: black;">
		<table width="100%" style="border-collapse: collapse;" border="0">
			<tr >
				<td  class="b" width="15%"> 번호</td>
				<td  class="b" width="45%">상품후기내용</td>
				<td  class="b" width="15%">작성자</td>
				<td class="b" colspan="2" width="25%">작성일</td>
			</tr>
			<tbody>
            <c:choose>
					<c:when test="${fn:length(commentlist) > 0}">
						<c:forEach items="${commentlist }" var="row">
               
                    <tr>
                        <td class="b">${row.COM_NO }</td>
                        <td class="b">${row.COM_CONTENT }</td>
                        <td class="b">${row.COM_NAME }</td>
                        <td class="b">${row.COM_REGDATE}</td>
                         <td class="b">
                        	<c:if test="${row.COM_NAME eq idSession}">
								<a href="/kingsman/item/commentDelete?COM_NO=${row.COM_NO }&ITEM_NO=${map.ITEM_NO}&commentCategory=2">삭제</a>
							</c:if>
						</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
            	<tr><td colapsn="4">&nbsp;</td></tr>
                <tr>
                    <td colspan="4" style="border-bottom: 1px solid #B4B4B4;">등록된 일반후기가 없습니다.<br><br></td>
                </tr>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>
</div>
<br>
<details>
		<table width="100%" border="0" style="margin: auto">
			<br>
			
			<summary>일반후기 작성하기</summary>
<form action="commentWrite"  method="post" onsubmit="return commentValidateForm()">
			<input type="hidden" name="commentCategory" value="2">
			<input type="hidden" name="ITEM_NO" value="${map.ITEM_NO }">
			<tr>
			<div id="rao">
			
			</div>			
			</tr>
			<tr>
		<td>
		&nbsp;
		 <input type="hidden" name="COM_PASSWD" value="comment">
		 <input type="hidden" name="COM_NAME" value="${idSession }">
		</td>
		</tr>
			<tr>
			<td class="left" style="  padding-left:80px"><textarea rows="10" cols="100" id="commentContent" name="COM_CONTENT"></textarea></td>
			</tr>
			<tr><td class="left" style="  padding-left:80px"><input type="submit" class="button3" id="button3" value="작성하기"></td></tr>
			</form>
		</table>
</details></div>
	
	
	<div class="comment">
	
	<!-- photo -->
    <div id="h3" class="btn">
    <table width="100%" style="border: 1px solid #B4B4B4;  border-collapse: collapse;">
		<tr>
			<td onclick="fnMove('1')" width="25%"  height="30px" style=" border: 1px solid #B4B4B4;  background-color: #EAEAEA; color:black;"> 상품상세보기 </td>
			<td onclick="fnMove('2')" width="25%" height="25px" style=" border: 1px solid #B4B4B4;  background-color: #EAEAEA;  color:black;"> 일반후기 </td>
			<td onclick="fnMove('3')" width="25%" height="25px" style="  border: 1px solid #B4B4B4;  background-color: #4BD1A0; color:white;"> 포토후기 </td>
			<td onclick="fnMove('4')" width="25%"height="25px"  style=" border: 1px solid #B4B4B4; background-color: #EAEAEA; color:black;"> 상품문의 </td>
		</tr>
	</table>
	<br>
	<h3 class="left">포토후기</h3>
	<hr style="background-color: black;">
		<table width="100%" style="border-collapse: collapse;">
			<tr >
				<td  class="b" width="15%"> 번호</td>
				<td  class="b" width="20%">포토</td>
				<td  class="b" width="25%">상품후기내용</td>
				<td  class="b" width="15%">작성자</td>
				<td class="b" colspan="2" width="25%">작성일</td>
			</tr>
			<tbody>
            <c:choose>
					<c:when test="${fn:length(photocommentlist) > 0}">
						<c:forEach items="${photocommentlist }" var="row">
               
                    <tr>
                        <td class="b">${row.COM_NO }</td>
                        <td class="b"><img  alt="이미지" src="/kingsman/resources/imagephoto/${row.COM_FILE_SAVE_NAME }" height="250px" width="250px"></td>
                        <td class="b">${row.COM_CONTENT }</td>
                        <td class="b">${row.COM_NAME }</td>
                        <td class="b">${row.COM_REGDATE}</td>
                         <td class="b">
                        	<c:if test="${row.COM_NAME eq idSession}">
								<a href="/kingsman/item/photoDelete?COM_NO=${row.COM_NO }&ITEM_NO=${map.ITEM_NO}&commentCategory=3">삭제</a>
							</c:if>
						</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
            	<tr><td colapsn="5">&nbsp;</td></tr>
                <tr>
                    <td colspan="5" style="border-bottom: 1px solid #B4B4B4;">등록된 포토후기가 없습니다.<br><br></td>
                </tr>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>
<br>
<details>
		<table width="100%">
			

			<br>
         <summary>포토후기 작성하기</summary>
         <form action="photoCommentWrite" method="post" enctype="multipart/form-data" onsubmit="return photoValidateForm()">
         <input type="hidden" name="commentCategory" value="3">
         <input type="hidden" name="ITEM_NO" value="${map.ITEM_NO}">
         <tr>
			<div id="rao1">
			
			</div>	
		</tr>
		<tr>
		<td>
		&nbsp;
		 <input type="hidden" name="COM_NAME" value="${idSession}">
		 <input type="hidden" name="COM_PASSWD" value="photo">
		</td>
		</tr>
        
         <tr>
         <td class="left" style="  padding-left:80px"> <textarea rows="10" cols="100" id="photoContent" name="COM_CONTENT"></textarea></td></tr>
         <tr><td class="left" style="  padding-left:80px"><input type="file" id="file" name="file"  ></td></tr>
         <tr><td class="left" style="  padding-left:80px"><input type="submit" class="button3" id="button3" value="작성하기"></td></tr>
         
		</form>
		</table>
</details>
	</div>
	</div>

<!-- qna -->
	<div id="h4" class="btn">
	<table width="100%" style="border: 1px solid #B4B4B4;  border-collapse: collapse;">
		<tr>
			<td onclick="fnMove('1')" width="25%"  height="30px" style=" border: 1px solid #B4B4B4;  background-color: #EAEAEA; color:black;"> 상품상세보기 </td>
			<td onclick="fnMove('2')" width="25%" height="25px" style=" border: 1px solid #B4B4B4;  background-color: #EAEAEA;  color:black;"> 일반후기 </td>
			<td onclick="fnMove('3')" width="25%" height="25px" style="  border: 1px solid #B4B4B4;  background-color: #EAEAEA; color:black;"> 포토후기 </td>
			<td onclick="fnMove('4')" width="25%"height="25px"  style=" border: 1px solid #B4B4B4; background-color: #4BD1A0;  color:white;"> 상품문의 </td>
		</tr>
	</table>
    
	<br>
	<h3 class="left">상품문의</h3>
	<hr style="background-color: black;">
		<table width="100%"style="border-collapse: collapse;">
			<tr >
				<td  class="b" width="15%"> 번호</td>
				<td  class="b" width="45%">	상품문의내용</td>
				<td  class="b" width="15%">작성자</td>
				<td class="b" colspan="2" width="25%">작성일</td>
			</tr>
			<tbody>
            <c:choose>
					<c:when test="${fn:length(qnalist) > 0}">
						<c:forEach items="${qnalist }" var="row">
                
                    <tr>	
                        <td  class="b" width="15%">${row.COM_NO }</td>
                        <td  class="b" width="45%">${row.COM_CONTENT }</td>
                        <td  class="b" width="15%">${row.COM_NAME }</td>
                        <td  class="b" width="20%">${row.COM_REGDATE}</td>
                        <td  class="b" width="5%">
                        <a href="#this" onclick="window.open('/kingsman/item/qnaUpdateForm?COM_NO=${row.COM_NO}&ITEM_NO=${map.ITEM_NO}','window팝업','width=1000, height=480, menubar=no, status=no, toolbar=no');">
                        수정</a>
                        </td>
                        
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
            	<tr><td colapsn="4">&nbsp;</td></tr>
                <tr>
                    <td colspan="4">등록된 Q&A가 없습니다.<br></td>
                </tr>
                <tr>
                    <td colspan="4" style="border-bottom: 1px solid #B4B4B4;">&nbsp;<br></td>
                </tr>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>
<br>
		</div>
		<div class="last">
			<details>
			<table width="100%" border="0">
				<form action="qnaWrite" method="post" onsubmit="return qnaValidateForm()">
				<summary id="left">작성하기</summary><br>
				<input type="hidden" name="commentCategory" value="1">
				<input type="hidden" name="ITEM_NO" value="${map.ITEM_NO}">
					<tr>
					<td class="left" style="  padding-left:80px"><h4>상품문의하기</h4></td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td class="left" style="  padding-left:80px;"><input type="text" id="qnaName" name="COM_NAME" placeholder="닉네임을 입력해주세요" style="height: 20px; width:400px" value="${idSession }"></td>
					</tr>
					<tr>
						<td class="left" style="  padding-left:80px">
						 <input type="password" id="qnaPasswd" name="COM_PASSWD" placeholder="비밀번호를 입력해주세요" style="height: 20px; width:400px">  </td>
					</tr>
					<tr>
						<td class="left" style="  padding-left:80px"><textarea rows="15" cols="100" id="qnaContent" name="COM_CONTENT"></textarea> </td>
					</tr>
					 <tr><td class="left" style="  padding-left:80px"><input type="submit" class="button3" id="button3" value="작성하기"></td></tr>
				
				</form>
				</table>
		</details>
		</div></div><br><br><br>
</div>
</body>
</html>