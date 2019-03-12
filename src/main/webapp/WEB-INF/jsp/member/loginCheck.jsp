<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
if("${msg}"=="")
{
	window.location.href="/kingsman/main";
}
else
{
	window.alert("${msg}");
	history.go(-1);
}

</script>