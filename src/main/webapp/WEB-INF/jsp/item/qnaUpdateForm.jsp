<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/kingsman/resources/js/common.js"></script>
<script src="/kingsman/resources/js/jiValidateForm.js"></script>
<script language="javascript">
function updateValidateForm() {
	
	var v100 = $('#COM_PASSWD2').val();
	var v200 = $('#realPasswd').val();
	alert(v200);
 	if(v100!= v200){
		alert('비밀번호가 맞지않아 수정이 불가능합니다.');
		var check='false';
		return false;
	}else{
		alert('수정되었습니다');
		var check='true';
		return true;
	} 
}


</script>
<style type="text/css">
	#frm{padding-left: 6px; padding-top:10px;}
	td,table{border: 1px solid #B4B4B4; width:100%;}
	th {width:20%; background-color: #4BD1A0;border: 1px solid #B4B4B4;}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
    <form id="frm" name="frm"action="/kingsman/item/qnaUpdate"  method="post" onsubmit="return updateValidateForm()">
   
    <table>
         <tbody>
            <tr>
               <th >작성자이름</th>
               <td>
               <input type="hidden" id="COM_NAME" name="COM_NAME"  value="${qna.COM_NAME }"></input> ${qna.COM_NAME }</td>
            </tr>
            <tr>
               <th>비밀번호</th>
               <td><input type="password" id="COM_PASSWD2" name="COM_PASSWD" ></input>
               		<input type="hidden" id="realPasswd" name="realPasswd" value="${qna.COM_PASSWD }">
               </td>
            </tr>
            <tr>
            <th>내용</th>
               <td colspan="2" class="view_text">
                  <textarea rows="20" cols="100" title="내용" id="COM_CONTENT" name="COM_CONTENT"></textarea>
               </td>
            </tr>
         </tbody>
      </table><br>
      <input type="hidden" id="COM_NO" name="COM_NO" value="${qna.COM_NO }"/>
      <input type="hidden" id="ITEM_NO" name="ITEM_NO" value="${map.ITEM_NO }"/>
      <input type="submit" class="button3" id="button3" value="수정하기">
      
</form>
</body>


</html>