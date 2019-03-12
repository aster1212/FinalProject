<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#myVideo {
	position: fixed;
 	right: 0;
	bottom: 0;
	min-width: 100%;
	min-height: 100%;
}

.video {
	position: relative;
	top: 350px;
}

img {
	display: block;
	margin-top: 350px;
	margin-left: 1000px;
}
img:hover
{
	content : url('/kingsman/resources/upload/EnterLogoNeon.png');
}
img {
    animation: fadein 7s;
    -webkit-animation: fadein 7s; /* Safari and Chrome */
}
@keyframes fadein {
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-webkit-keyframes fadein { /* Safari and Chrome */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<!-- The video -->
	<video autoplay muted loop id="myVideo">
		<source id="wrap" src="/kingsman/resources/upload/kingsman.mp4" type="video/mp4">
	</video>
	<div class="video">
		<a href="/kingsman/main" target="_self">
					<div id="imgEnter">
					<img class="fadeIn-element"
						src="/kingsman/resources/upload/EnterLogoWhite.png" width="200px" height="200">
					</div>
		</a>
	</div>
</body>
</html>