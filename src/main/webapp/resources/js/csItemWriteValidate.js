$(document).ready(function(){
	$("#addColor").on("click", function(e){
		e.preventDefault();
		fn_addColor();
	});
	
	$("a[name='delete']").on("click", function(e) {
		e.preventDefault();
		fn_deleteColor($(this));
	});
	
	$('#genderInfo').hide();
	$('#sizeInfo').hide();
	$('#optionInfo').hide();
	$('#colorInfo').hide();
	$('#optionBox').hide();
	$('#noNeedMoreInfo').hide();
	
	/* jquery function */
	$("input:radio[name='ITEM_TYPE']").on('click', function(e) {
		var value1 = $(this).val();
		
		switch (value1){
		case 'JU' : 
			$('#genderInfo').show();
			$('#sizeInfo').show();
				$('#forTop').show();
				$('#forBottom').hide();
				$('#forShoes').hide();			
			$('#optionInfo').show();
			$('#colorInfo').show();
			$('#optionBox').show();
			$('#noNeedMoreInfo').hide();
			
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
			$('#optionBox').show();
			$('#noNeedMoreInfo').hide();
			
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
			$('#optionBox').show();
			$('#noNeedMoreInfo').hide();
			
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
			$('#optionBox').show();
			$('#noNeedMoreInfo').hide();
			
			$('input:radio[name="ITEM_GENDER"]:radio[value="U"]').prop('checked', false);
			$('input:checkbox[name="sizeArray"]:checkbox[value="NONE"]').prop('checked', false);
			$('input:checkbox[name="optionArray"]:checkbox[value="NONE"]').prop('checked', true);
			break;
		case 'AC' : 
			$('#genderInfo').hide();
			$('#sizeInfo').hide();
			$('#optionInfo').hide();
			$('#colorInfo').hide();
			$('#optionBox').show();
			$('#noNeedMoreInfo').show();

			$('input:radio[name="ITEM_GENDER"]:radio[value="U"]').prop('checked', true);
			$('input:checkbox[name="sizeArray"]:checkbox[value="NONE"]').prop('checked', true);
			$('input:checkbox[name="optionArray"]:checkbox[value="NONE"]').prop('checked', true);
			break;
		default :
			break;
		}
	});
});

function fn_addColor() {
	var str = '<p>'
			+ '이름 <input type="text" name="itemNameArray" placeholder="예)진파랑"  class="inputs"  autocomplete="off"> 색상코드 <input type="color" class="itemColorArray" name="itemColorArray"> <a href="#this" class="btn" name="delete">삭제</a>'
			+'</p>';
	$('#colorDiv').append(str);
	
	$('a[name="delete"]').on("click", function(e) {
		e.preventDefault();
		fn_deleteColor($(this));
	})
}

function fn_deleteColor(obj) {
	obj.parent().remove();
}

function adminItemValidateForm() {
	var sizeArrayBool = false;
	var optionArrayBool = false;
	
	if($('input:text[name="ITEM_NAME"]').val() == ""){
		alert('상품 이름을 입력해 주세요');
		$('input:text[name="ITEM_NAME"]').focus();
		return false;
	}
	
	if($('#ITEM_PRICE').val() < 1){
		alert('상품 가격을 입력해 주세요');
		$('#ITEM_PRICE').focus();
		return false;
	}
	
	if($("input:radio[name='ITEM_GENDER']").is(":checked") == false){
		alert('상품의 성별을 선택해 주세요');
		return false;
	}
	
	if($("input:radio[name='ITEM_TYPE']").is(":checked") == false){
		alert('상품의 타입을 선택해 주세요');
		return false;
	}
	
	if($('#ITEM_DATE').val() == "" || $('#ITEM_DATE').val() == null){
		alert('상품의 제조일자를 입력해 주세요');
		return false;
	}
	
	$('input:checkbox[name="sizeArray"]').each(function() {
		if(this.checked)
			sizeArrayBool = true;
	});
	if(sizeArrayBool == false){
		alert('사이즈를 하나 이상 선택해 주세요');
		return false;
	}
	
	$('input:checkbox[name="optionArray"]').each(function() {
		if(this.checked)
			optionArrayBool = true;
	});
	if(optionArrayBool == false){
		alert('옵션을 하나 이상 선택해 주세요');
		return false;
	}
	
	var itemNameArrayBool = true;
	
	if($('input:radio[name="ITEM_TYPE"]:radio[value="AC"]').is(":checked") == true){
		$('input:text[name="itemNameArray"]').each(function() {
			$(this).val('none');
		});
	}else{
		$('input:text[name="itemNameArray"]').each(function() {
			if($(this).val() == "" || $(this).val() == null || $(this).val() == 'null')
				itemNameArrayBool = false;
		});
	}
	
	if(itemNameArrayBool == false){
		alert('색상 입력');
		return false;
	}
	
	
	if($('#ITEM_SET').val() == ""){
		$('#ITEM_SET').val('none');
	}
	
}