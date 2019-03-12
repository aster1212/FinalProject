<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <HTML>
 <head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    function fnMove(seq){
        var offset = $("#h" + seq).offset();
        $('html, body').animate({scrollTop : offset.top}, 300);
    }
 </script>
 <style type="text/css">
 .top{padding-top:300px}
 .btn {margin-bottom:500px; padding-top:80px;}
 </style>
 </head>
 <BODY>
 <div class="top">
   <button onclick="fnMove('1')">div1로 이동</button>
    <button onclick="fnMove('2')">div2로 이동</button>
    <button onclick="fnMove('3')">div3로 이동</button>
    <div id="h1" class="btn">div1</div>
    <button onclick="fnMove('1')">div1로 이동</button>
    <button onclick="fnMove('2')">div2로 이동</button>
    <button onclick="fnMove('3')">div3로 이동</button>
    <div id="h2" class="btn">div2</div>
    <button onclick="fnMove('1')">div1로 이동</button>
    <button onclick="fnMove('2')">div2로 이동</button>
    <button onclick="fnMove('3')">div3로 이동</button>
    <div id="h3" class="btn">div3</div>
</div>
</HTML>
