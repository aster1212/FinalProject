// 회원가입 

function JoinValidate()
{
	var idval1 = /^[a-zA-Z0-9]{4,12}$/;
	var idval2 = /^[a-zA-Z0-9]{6,12}$/;
	var nameval = /^[가-힝]{2,}$/;
	var phoneval =  /^[0-9]{10,11}$/;
	var id = document.getElementById("member_idjoin").value;
	var idchec = document.getElementById("same1").innerHTML;
	var pw = document.getElementById("pw1").value;
	var name = document.getElementById("member_name").value;
	var phone = document.getElementById("member_phone2").value;
	var email = document.getElementById("same3").innerHTML;
	var zipcode = document.getElementById("member_zipcode").value;
	var addr1 = document.getElementById("member_addr1").value;
	var addr2 = document.getElementById("member_addr2").value;
	var addr3 = document.getElementById("member_addr3").value;
	
	if(!idval1.test(id))
	{
		alert("아이디는 4~12자 , 대소문자 및 숫자로 입력해주세요.");
		document.getElementById("member_idjoin").value = "";
		document.getElementById("member_idjoin").focus();
		
		return;
	}
	else if(!idval2.test(pw))
	{
		alert("비밀번호는 6~12자 , 대소문자 및 숫자로 입력해주세요.");
		document.getElementById("pw1").value = "";
		document.getElementById("pw1").focus();
		
		return;
	}
	else if((pw.slice(0,pw.length)==id.slice(0,id.length)))
	{
		alert("비밀번호를 아이디와 다르게 입력해주새요");
		document.getElementById("pw1").value="";
		document.getElementById("pw1").focus();
		
		return;
	}
	else if(!nameval.test(name))
	{
		alert("한글로 이름을 적어주세요.");
		document.getElementById("member_name").value="";
		document.getElementById("member_name").focus();
		
		return;
	}
	else if(document.frm.man.checked==false && document.frm.woman.checked==false)
	{
		alert("성별을 선택 해주세요.");
		
		return
	}
	else if(!phoneval.test(document.getElementById("member_phone2").value))
	{
		alert("핸드폰 번호를 제대로 입력해 주세요");
		document.getElementById("member_phone2").value="";
		document.getElementById("member_phone2").focus();
		
		return
	}
	else if(email=="")
	{
		alert("이메일 인증을 해주세요");
		
		return
	}
	else if(zipcode=="" || addr1=="" || addr2=="")
	{
		alert("주소를 입력해주세요.");
		
		return
	}
	else if(idchec!="사용가능한 아이디 입니다")
	{
		alert("아이디 중복확인을 해주세요.");
		
		return
	}
	else
	{
		document.frm.submit();
	}
}

// 비회원 로그인 발리데이션

function NonMemValidation()
{
	var nameval1 = /^[가-힝A-Za-z]{2,}$/;
	var phoneval1 =  /^[0-9]{10,11}$/;
	
	if(!nameval1.test(document.getElementById("member_name1").value))
	{
		alert("이름을 제대로 입력해주세요.");
		document.getElementById("member_name1").value="";
		document.getElementById("member_name1").focus();
		
		return;
	}
	else if(!phoneval1.test(document.getElementById("member_phone1").value))
	{
		alert("핸드폰 번호를 제대로 입력해 주세요");
		document.getElementById("member_phone1").value="";
		document.getElementById("member_phone1").focus();
		
		return
	}
	else
	{
		document.frm.submit();
	}
}

// 아이디, 비밀번호 찾기 발리데이션

function FindId()
{
	var yearval = /^[0-9]{4}$/;
	var monthval = /^[0-9]{1,2}$/;
	var dayval = /^[0-9]{1,2}$/;
	var nameval = /^[가-힝]{2,}$/;
	
	var year = document.getElementById("member_year").value;
	var month = document.getElementById("member_month").value;
	var day = document.getElementById("member_day").value;
	var name = document.getElementById("member_name").value;
	
	if(!yearval.test(year))
	{
		alert("생년월일을 형식에 맞게 입력해주세요.");
		document.getElementById("member_year").value="";
		document.getElementById("member_year").focus();
		
		return;
	}
	else if(!monthval.test(month))
	{
		alert("생년월일을 형식에 맞게 입력해주세요.");
		document.getElementById("member_month").value="";
		document.getElementById("member_month").focus();
		
		return;
	}
	else if(!dayval.test(day))
	{
		alert("생년월일을 형식에 맞게 입력해주세요.");
		document.getElementById("member_day").value="";
		document.getElementById("member_day").focus();
		
		return;
	}
	else if(!nameval.test(name))
	{
		alert("이름을 재대로 입력해주세요.");
		document.getElementById("member_name").value="";
		document.getElementById("member_name").focus();
		
		return
	}
	else
	{
		document.getElementById("frmfind").submit();
	}
}

// 회원정보 수정 발리데이션

function ModifyValidate()
{
	var idval2 = /^[a-zA-Z0-9]{6,12}$/;
	var phoneval =  /^[0-9]{10,11}$/;
	var id = document.getElementById("member_idjoin").value;
	var pw = document.getElementById("pw1").value;
	var pw2 = document.getElementById("pw2").value;
	var pw3 = document.getElementById("same").innerHTML;
	var phone = document.getElementById("member_phone2").value;
	var email = document.getElementById("same3").innerHTML;
	var zipcode = document.getElementById("member_zipcode").value;
	var addr1 = document.getElementById("member_addr1").value;
	var addr2 = document.getElementById("member_addr2").value;
	var addr3 = document.getElementById("member_addr3").value;
	

	if(!idval2.test(pw))
	{
		alert("비밀번호는 6~12자 , 대소문자 및 숫자로 입력해주세요.");
		document.getElementById("pw1").value = "";
		document.getElementById("pw1").focus();
		
		return;
	}
	else if(!idval2.test(pw2))
	{
		alert("비밀번호는 6~12자 , 대소문자 및 숫자로 입력해주세요.");
		document.getElementById("pw2").value = "";
		document.getElementById("pw2").focus();
		
		return;
	}
	else if((pw.slice(0,pw.length)==id.slice(0,id.length)))
	{
		alert("비밀번호를 아이디와 다르게 입력해주새요");
		document.getElementById("pw1").value="";
		document.getElementById("pw1").focus();
		
		return;
	}
	else if(!phoneval.test(document.getElementById("member_phone2").value))
	{
		alert("핸드폰 번호를 제대로 입력해 주세요");
		document.getElementById("member_phone2").value="";
		document.getElementById("member_phone2").focus();
		
		return
	}
	else if(email=="")
	{
		alert("이메일 인증을 해주세요");
		
		return
	}
	else if(zipcode=="" || addr1=="" || addr2=="")
	{
		alert("주소를 입력해주세요.");
		
		return
	}
	else if(pw3!='비밀번호가 일치합니다')
	{
		alert("비밀번호를 동일하게 입력해주세요");
	}
	else
	{
		document.frm.submit();
	}
}

// 쿠폰생성 발리데이션

function creatCouponValidation()
{
	var nameval = /^[가-힝A-Za-z\s]{2,}$/;
	var disval =  /^[0-9]{1,2}$/;
	var sdateval =  /^[0-9\-]{10}$/;
	var edateval =  /^[0-9\-]{10}$/;
	var name = document.getElementById("cou_content").value;
	var discount = document.getElementById("cou_discount").value;
	var sdate = document.getElementById("cou_sdate").value;
	var edate = document.getElementById("cou_edate").value;
	
	if(!nameval.test(name))
	{
		alert("쿠폰 이름을 제대로 적어주새요.");
		document.getElementById("cou_content").value = "";
		document.getElementById("cou_content").focus();
		
		return;
	}
	else if(!disval.test(discount))
	{
		alert("할인율은 숫자만 적어주세요.");
		document.getElementById("cou_discount").value = "";
		document.getElementById("cou_discount").focus();
		
		return;
	}
	else if(!sdateval.test(sdate))
	{
		alert("날짜는 형식에 맞게 입력해주세요.");
		document.getElementById("cou_sdate").value="";
		document.getElementById("cou_sdate").focus();
		
		return;
	}
	else if(!edateval.test(edate))
	{
		alert("날짜는 형식에 맞게 입력해주세요.");
		document.getElementById("cou_edate").value="";
		document.getElementById("cou_edate").focus();
		
		return
	}
	else
	{
		document.frm.submit();
	}
}
