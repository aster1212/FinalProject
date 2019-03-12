<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.canMove{cursor: pointer;}
.clist{}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#qnabtn').on('click', function(e) {
			e.preventDefault();
			fn_list(1);
		});
		$('#combtn').on('click', function(e) {
			e.preventDefault();
			fn_list(2);
		});
		$('#phobtn').on('click', function(e) {
			e.preventDefault();
			fn_list(3);
		});
		fn_init();
		var recent = <c:out value="${COM_CATEGORY}"/>
		if(recent == null || recent == 0)
			recent = 1;
		fn_list(recent);
	});
	
	function fn_init() {
		$('#qna').css('display','none');
		$('#comment').css('display','none');
		$('#photo').css('display','none');
	}
	
	function fn_list(num) {
		if(num == 1){
			$('#qna').css('display','inline-block');
			$('#comment').css('display','none');
			$('#photo').css('display','none');
		}else if(num == 2){
			$('#qna').css('display','none');
			$('#comment').css('display','inline-block');
			$('#photo').css('display','none');
		}else if(num == 3){
			$('#qna').css('display','none');
			$('#comment').css('display','none');
			$('#photo').css('display','inline-block');
		}
	}
</script>
</head>
<body>

<h1>댓글 관리</h1>

<form><input type="search" name="searchStr" value="${searchStr}"> <input type="submit"></form>

<input type="button" id="qnabtn" value="QnA">
<input type="button" id="combtn" value="한줄평">
<input type="button" id="phobtn" value="포토 후기">
<br><br>
<ul id="qna" class="clist">

	<c:choose>
		<c:when test="${qna.size() > 0}">
			<c:forEach items="${qna }" var="row">
				<li>
					<c:forEach begin="1" end="${row.COM_RE_LEVEL}" step="1">-</c:forEach>
					<c:if test="${row.COM_RE_LEVEL gt 0}">></c:if>
					글쓴이 : ${row.COM_NAME}, 내용 : ${row.COM_CONTENT}, 작성 날짜 : ${row.COM_REGDATE} 
					<c:choose>
						<c:when test="${row.COM_RE_LEVEL gt 0}">
						<a href="itemCommentModifyForm?COM_NO=${row.COM_NO}">수정하기</a>
						</c:when>
						<c:otherwise>
						<a href="itemCommentWriteForm?COM_NO=${row.COM_NO}">답변하기</a>
						</c:otherwise>
					</c:choose>
					
					
					 | 
					<a href="itemCommentDelete?COM_NO=${row.COM_NO}">삭제</a>
				</li>
			</c:forEach>
			${qnaPage}
		</c:when>
		<c:otherwise>
			등록된 글이 없습니다.
		</c:otherwise>
	</c:choose>
</ul>


<ul id="comment" class="clist">
	<c:choose>
		<c:when test="${comment.size() > 0}">
			<c:forEach items="${comment }" var="row">
				<li>
					작성자 : ${row.COM_NAME}, 내용 : ${row.COM_CONTENT}, 작성 날짜 : ${row.COM_REGDATE} | 
					<a href="itemCommentDelete?COM_NO=${row.COM_NO}">삭제</a>
				</li>
			</c:forEach>
			${comPage}
		</c:when>
		<c:otherwise>
			등록된 글이 없습니다.
		</c:otherwise>
	</c:choose>
	
</ul>


<ul id="photo" class="clist">
	<c:choose>
		<c:when test="${photo.size() > 0}">
			<c:forEach items="${photo }" var="row">
				<li>
					작성자 : ${row.COM_NAME}, 내용 : ${row.COM_CONTENT}, 작성 날짜 : ${row.COM_REGDATE} | 
					<a href="itemCommentDelete?COM_NO=${row.COM_NO}">삭제</a>
				</li>
			</c:forEach>
			${phoPage}
		</c:when>
		<c:otherwise>
			등록된 글이 없습니다.
		</c:otherwise>
	</c:choose>
</ul>


<c:if test="${COM_CATEGORY==4}">
	<!-- qna -->
	<c:choose>
		<c:when test="${qnaSearch.size() > 0}">
			<h4>QnA</h4>
			<ul>
			<c:forEach items="${qnaSearch}" var="row">
				<li>
					작성자 : ${row.COM_NAME}, 내용 : ${row.COM_CONTENT}, 작성 날짜 : ${row.COM_REGDATE} | 
					<a href="itemCommentDelete?COM_NO=${row.COM_NO}">삭제</a>
				</li>
			</c:forEach>
			</ul>
		</c:when>
		<c:when test="${qnaSearch.size() < 1}">
			<h4>QnA</h4>
			<ul>
				<li>검색된 결과가 없습니다.</li>
			</ul>
		</c:when>
	</c:choose>
	
	<!-- comment -->
	<c:choose>
		<c:when test="${commentSearch.size() > 0}">
			<h4>한줄평</h4>
			<ul>
			<c:forEach items="${commentSearch }" var="row">
				<li>
					작성자 : ${row.COM_NAME}, 내용 : ${row.COM_CONTENT}, 작성 날짜 : ${row.COM_REGDATE} | 
					<a href="itemCommentDelete?COM_NO=${row.COM_NO}">삭제</a>
				</li>
			</c:forEach>
			</ul>
		</c:when>
		<c:when test="${commentSearch.size() < 1}">
			<h4>한줄평</h4>
			<ul>
				<li>검색된 결과가 없습니다.</li>
			</ul>
		</c:when>
	</c:choose>
	
	<!-- photo -->
	<c:choose>
		<c:when test="${photoSearch.size() > 0}">
			<h4>Photo</h4>
			<ul>
			<c:forEach items="${photoSearch }" var="row">
				<li>
					작성자 : ${row.COM_NAME}, 내용 : ${row.COM_CONTENT}, 작성 날짜 : ${row.COM_REGDATE} | 
					<a href="itemCommentDelete?COM_NO=${row.COM_NO}">삭제</a>
				</li>
			</c:forEach>
			</ul>
		</c:when>
		<c:when test="${photoSearch.size() < 1}">
			<h4>Photo</h4>
			<ul>
				<li>검색된 결과가 없습니다.</li>
			</ul>
		</c:when>
	</c:choose>
</c:if>


</body>
</html>