function qnaValidateForm() {
	var v1 = $('#BOARD_TITLE').val();
	var v2 = $('#BOARD_CONTENT').val();
	if($("input:radio[name='BOARD_SC_STATE']").is(":checked") == false){
		alert('Radio must be check out');
		return false;
	}
	if(v1 == ""){
		alert('Subject must be filled out');
		$('#BOARD_TITLE').focus();
		return false;
	}
	if(v2 == ""){
		alert('Content must be filled out');
		$('#BOARD_CONTENT').focus();
		return false;
	}
}

function adminQnaValidateForm() {
	var v1 = $('#BOARD_CONTENT').val();
	if(v1 == ""){
		alert('Content must be filled out')
		$('#BOARD_CONTENT').focus();
		return false;
	}
}

function adminBoardValidateForm() {
	if($('#BOARD_TITLE').val() == ""){
		alert("제목을 입력해 주세요");
		$('#BOARD_TITLE').focus();
		return false;
	}
	
	if($('#MEMBER_ID').val() == ""){
		alert('작성자를 입력해 주세요');
		$('#MEMBER_ID').focus();
		return false;
	}
	
	if($('#BOARD_CONTENT').val() == ""){
		alert('내용을 입력해 주세요');
		$('#BOARD_CONTENT').focus();
		return false;
	}
}

function adminItemCommentValidateForm(){
	if($('#COM_CONTENT').val() == ""){
		alert('내용을 입력해 주세요');
		$('#COM_CONTENT').focus();
		return false;
	}
}



















