function DaumPostCode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("member_addr3").value = extraAddr;

						} else {
							document.getElementById("member_addr3").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('member_zipcode').value = data.zonecode;
						document.getElementById("member_addr1").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("member_addr2").focus();
					}
				}).open();
	}



// 중복체크

$(document).ready(function() {
	$("#user_id_checkBtn").unbind("click").click(function(e) {
		e.preventDefault();
		fn_userIDCheck();
	});
});

function fn_userIDCheck() {
	
	var userId = $("#member_idjoin").val();
	var userData = {
		"member_id" : userId
	}

	if (userId.length < 1) {
		alert("아이디를 입력해주시기 바랍니다.");
	}

	else {
		$.ajax({
			type : "POST",
			url : "/kingsman/member/checkId",
			data : userData,
			dataType : "json",
			error : function(error) {
				alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
			},
			success : function(result) {
				if (result == 0) {
					$("#member_idjoin").attr("disabled", false);
					alert("사용이 가능한 아이디입니다.");
					return text1();
				} else if (result == 1) {
					alert("이미 존재하는 아이디입니다. \n다른 아이디를 사용해주세요.");
					return text2();
				} else {
					alert("에러가 발생하였습니다.");
				}
			}
		});
	}
}

function text1()
{
	document.getElementById('same1').innerHTML = '사용가능한 아이디 입니다';
	document.getElementById('same1').style.color = 'blue';
}
function text2()
{
	document.getElementById('same1').innerHTML = '사용중인 아이디입니다. 다른 아이디를 써주세요';
	document.getElementById('same1').style.color = 'red';
}