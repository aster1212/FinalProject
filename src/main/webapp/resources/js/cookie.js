$(document).ready(function(){
	var userInputId = getCookie("cookId");
	$("input[name='member_id']").val(userInputId);
	
	if($("input[name='member_id']").val()!="")
	{
		$("#save_id").attr("checked",true);
	}
	
	$("#save_id").change(function(){
		if($("#save_id").is(":checked"))
		{
			var userInputId = $("input[name='member_id']").val();
			setCookie("cookId",userInputId,7);
		}
		else
		{
			deleteCookie("cookId");
		}
	});
	
	$("input[name='member_id']").keyup(function(){
		if($("#save_id").is(":checked")){
			var userInputId = $("input[name='member_id']").val();
			setCookie("cookId",userInputId,7);
		}
	});
});

function setCookie(cookieName,value,exdays)
{
	var exdate =new Date();
	exdate.setDate(exdate.getDate()+exdays);
	var cookieValue = escape(value)+((exdays==null)?"":"; expires="+exdate.toGMTString());
	
	document.cookie=cookieName + "=" + cookieValue;
}

function deleteCookie(cookieName)
{
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate()-1);
	document.cookie = cookieName + "=" + "; expires="+expireDate.toGMTString();
}

function getCookie(cookieName)
{
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	
	if(start != -1)
	{
		start += cookieName.length;
		var end = cookieData.indexOf(';',start);
		if(end == -1)
			end = cookieData.length;
		
		cookieValue = cookieData.substring(start,end);
	}
	
	return unescape(cookieValue);
}
