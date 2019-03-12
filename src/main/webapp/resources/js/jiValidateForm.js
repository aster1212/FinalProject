function itemOptionValidateForm(str){
   var v1 = $('#MEMBER_ID').val();
   var v2 = $('#MEMBER_NAME').val();
   if(v1 == '' && v2 == ''){
      alert('로그인을 해야 이용 가능한 서비스입니다.');
      openlogin();
      return false;
   }
   if($('#detailCount').val() < 1){
      alert('수량은 음수일 수 없습니다..');
      return false;
   }
   if($('#detailSize').val() == 'none'){
      alert('사이즈를 선택하여 주세요');
      return false;
   }
   if($('#detailOption').val() == 'none'){
      alert('옵션을 선택해 주세요');
      return false;
   }
   if($('#colorSelect').val() == 'none'){
      alert('색을 선택해 주세요');
      return false;
   }
   
   if(str == 'cart'){
      $('#goWhere').val('cart');
   }else{
      $('#goWhere').val('payment');
   }
   
   $( "#goForm" )[0].submit();
}

function qnaValidateForm() {
   var v1 = $('#qnaName').val();
   var v2 = $('#qnaPasswd').val();
   var v3 = $('#qnaContent').val();

   if(v1 == ' '   ){
      alert('작성자를 입력해주세요');
      $('#qnaName').focus();
      return false;
   }
   if(v2 == ''){
      alert('비밀번호를 입력해주세요');
      $('#qnaPasswd').focus();
      return false;
   }
   if(v3 == ''){
      alert('내용을 입력해 주세요');
      $('#qnaContent').focus();
      return false;
   }
}

function commentValidateForm() {
   var v8 = $('#MEMBER_ID').val();
   var v9 = $('#MEMBER_NAME').val();
   if(v8 == '' && v9 == ''){
      alert('회원에게만 글쓰기 권한이 있습니다.');
      return false;
   }
   if(v8==''){
	   alert('회원에게만 글쓰기 권환이 있습니다');
	   return false;
   }
   var v1 = $('#commentContent').val();
   if(v1 == ""){
      alert('내용을 입력해 주세요');
      $('#commentContent').focus();
      return false;
   }
   
}

function photoValidateForm() {
   var v8 = $('#MEMBER_ID').val();
   var v9 = $('#MEMBER_NAME').val();
   if(v8 == '' && v9 == ''){
      alert('회원에게만 글쓰기 권한이 있습니다.');
      return false;
   }
   var v1 = $('#photoContent').val();
   var v2 = $('#file').val();
   if(v1 == ""){
      alert('내용 입력해주세요');
      $('#photoContent').focus();
      return false;
   }
   if(v2 == ""){
      alert('파일 등록을 해주세요.');
      return false;
   }
}



