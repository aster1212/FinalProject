<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="google-site-verification" content="NqB0BDAEWJTvAPCCxzrckJYnS7-xJILFU40FvSmh5S8"><title>KingsMan 로그인</title>
<link type="text/css" rel="stylesheet" href="/kingsman/resources/css/member.css">
<link type="text/css" rel="stylesheet" charset="utf-8" href="//static.musinsa.com/mfile_outsrc/css/common/common-magazine.css?v=9.20889">
<link type="text/css" rel="stylesheet" href="//static.musinsa.com/mfile_outsrc/css/module/member.css?v=9.20889">
<link type="text/css" rel="stylesheet" href="//static.musinsa.com/mfile_outsrc/css/module/member.main.css?v=9.20889">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/kingsman/resources/js/common.js"></script>
<script src="/kingsman/resources/js/cookie.js"></script>
<script src="/kingsman/resources/js/member_validation.js"></script>
<script>
$(document).ready(function() {
	$('#member_id').focus();
       $("#nonmem_login_btn").unbind("click").click(function(e) {
           e.preventDefault();
           fn_nonmemlogin();
          });  
    $('input:radio[name=member_mem_gb]').on('click', function(e) {
      fn_swiching($(this));
   });
    $('#member1').prop('checked', true);
    $('#frm1').hide();
   });
   
   function fn_swiching(obj) {
      var status = obj.val();
      if(status==1){
         $('#frm').fadeIn(10);
         $('#frm1').hide();
      }else{
         $('#frm1').fadeIn(10);
         $('#frm').hide();
      }
   }
    
   function fn_login() {  
      
    if($("#member_id").val().length < 1)
    {
     alert("아이디를 입력해주세요.");
    }
    else if($("#member_passwd").val().length < 1)
    {
     alert("비밀번호를 입력해주세요.");
    }
    else
    {
     var comSubmit = new ComSubmit("frm");
     comSubmit.addParam("member_mem_gb",$("#member1").val());
     comSubmit.setUrl("<c:url value='/member/loginTry' />");
     comSubmit.submit();
    }
   }
function fn_nonmemlogin() {
   
   var nameval1 = /^[가-힝A-Za-z]{2,}$/;
   var phoneval1 =  /^[0-9]{10,11}$/;
   if(!nameval1.test(document.getElementById("member_name1").value))
   {
      alert("이름을 제대로 입력해주세요.");
      document.getElementById("member_name1").value="";
      document.getElementById("member_name1").focus();
   }
   else if(!phoneval1.test(document.getElementById("member_phone1").value))
   {
      alert("핸드폰 번호를 제대로 입력해 주세요");
      document.getElementById("member_phone1").value="";
      document.getElementById("member_phone1").focus();
   }
       else
       {
        var comSubmit = new ComSubmit("frm1");
        comSubmit.addParam("member_mem_gb",$("#member2").val());
        comSubmit.setUrl("<c:url value='/member/loginTry' />");
        comSubmit.submit();
       }
      }
</script>
</head>
<body>
<div class="loginBoxWrap">
<div>
	<a href="/kingsman/main" class="store"><img id="mainlogo" src="/kingsman/resources/upload/kingsman.png" alt="Kingsman Store"></a>
</div>
<div class="checkmember">
<input type="radio" id="member1" name="member_mem_gb" value="1">&nbsp; &nbsp;회원
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
<input type="radio" id="member2" name="member_mem_gb" value="2">&nbsp; &nbsp;비회원
</div>
<br><br>
<form id="frm">
<div class="loginBoxV3">
	<span class="id"><input type="text" class="inputV3" id="member_id" name="member_id" placeholder="아이디를 입력해주세요." title="아이디" autocomplete="off" onkeypress="if(event.keyCode == 13){ fn_login(); return; }"></span>
    <span class="pass"><input type="password" id="member_passwd" class="inputV3" name="member_passwd" placeholder="비밀번호를 입력해주세요." title="패스워드" onkeypress="if(event.keyCode == 13){ fn_login(); return; }"></span>
    <span class="submit submitWBOX"><input type="button" class="loginbtn" value="로그인" onclick="fn_login()"></span>    
	<label class="checkbox"><input type="checkbox" id="save_id" name="save_id"><b>아이디저장</b></label>
	<ul class="loginMenu">
		<li class="join"><a href="javascript:void(0)" title="회원가입" onclick="window.location='/kingsman/member/joinForm'">회원 가입</a></li>
		<li class="idsearch"><a href="/kingsman/member/findmemberid">아이디 찾기</a></li>
		<li class="pwsearch"><a href="/kingsman/member/findmemberpw">비밀번호 찾기</a></li>
	</ul>
</div>
</form>
<form id="frm1">
<div class="loginBoxV3">
<span class="id"><input type="text" class="inputV3" id="member_name1" name="member_name1"  autocomplete="off" placeholder="이름을 입력해주세요." title="이름" onkeypress="if(event.keyCode == 13){ fn_nonmemlogin(); return; }"></span>
<span class="pass"><input type="text" class="inputV3" id="member_phone1" name="member_phone1" autocomplete="off" placeholder="숫자만 입력해주세요." title="폰번호" onkeypress="if(event.keyCode == 13){ fn_nonmemlogin(); return; }"></span>
<span class="submit submitWBOX"><input type="button" value="로그인" onclick="fn_nonmemlogin()"></span>
<br>
	<ul class="loginMenu">
		<li class="join"><a href="javascript:void(0)" title="회원가입" onclick="window.location='/kingsman/member/joinForm'">회원 가입</a></li>
		<li class="idsearch"><a href="/kingsman/member/findmemberid">아이디 찾기</a></li>
		<li class="pwsearch"><a href="/kingsman/member/findmemberpw">비밀번호 찾기</a></li>
	</ul>
</div>
</form>
</div>
</body>
</html>