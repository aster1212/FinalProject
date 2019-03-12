<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title != null ? title : "King\'s Man"}</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/kingsman/resources/css/adminTiles.css">
<link rel="stylesheet" type="text/css" href="/kingsman/resources/css/pagingBtn.css">
<script type="text/javascript">
	var isMain = false;
	var rightStatus = true;
	
	$(document).ready(function(e) {
		/* paing */
		$('.pagingBtn').each(function() {
			if($(this).val() == 'prev')
				$(this).val('이전');
			if($(this).val() == 'next')
				$(this).val('다음');
		});
		/* paing */
		
		$('#footer').hide();
		fn_menu();
		fn_right();
		$('#right').on('click', function(e) {
			e.preventDefault();
			fn_right();
		});

		var stat = 1;
		$("#rightMenu").hide();
		$(".sidebutton").click(function() {
			$(".sidebutton p").toggle();
			$('#rightMenu').animate({
				width : 'toggle'
			});
			if (stat == 1) {
				stat = 2;
				$('#side').animate({
					right : '15%'
				});
				$('#side2').animate({
					right : '15%'
				});
			} else {
				stat = 1;
				$('#side').animate({
					right : '0px'
				});
				$('#side2').animate({
					right : '0px'
				});
			}

		});
		
		var stat = 1;
		$("#side3").hide();
		$('#Allback').css('display', 'none');
		$(".sidebutton2").click(function() {
			$(".sidebutton2 p").toggle();
			$('#side3').show();
			if (stat == 1) {
				stat = 2;
				$('#side3').show({
					right : '18%'
				});
				$('#side3').css('z-index', '1');
				$('#side2').css('z-index', '1');
				$('#Allback').css('display', 'block');
				$('#Allback').css('z-index', '0');
			} else {
				stat = 1;
				$('#side3').hide();
				$('#side3').css('z-index', '0');
				$('#Allback').css('display', 'none');
			}

		});
	});
	
	function fn_menu() {
		if(isMain == true){
			$('#fixedMenu').hide();
			$('#fixedMenuBack').hide();
			$('#absoluteMenu').html($('#fixedMenu').html());
			$('#absoluteMenu').css('visibility','visible');
			
			$('#main').css('padding-top','0px');
			$(window).scroll(function() {
				var height = $(document).scrollTop();
				/* $('#topLogin').html(height); */
				if(height > 750){
					$('#fixedMenu').fadeIn(100);
					$('#fixedMenuBack').fadeIn(100);
				}else{
					$('#fixedMenu').fadeOut(100);
					$('#fixedMenuBack').fadeOut(100);
				}
			});
		}else{
			$('#fixedMenu').show();
			$('#absoluteMenu').hide();
		}
	}
	
	function fn_right() {
		if(rightStatus == true){
			rightStatus = false;
			$('#right').css('right','-14%');
			$('#open').css('display','block');
		}else{
			rightStatus = true;
			$('#right').css('right','0px');
			$('#open').css('display','none');
		}
	}
	
</script>
</head>
<body>
<!-- csAlert -->
<div id="banner"></div><div id="bannerContent"></div>
			<!-- 타일즈를 넣는 부우우우분-->
<%-- 	<tiles:insertAttribute name="top"/>
	<tiles:insertAttribute name="header" /> --%>
	
    <tiles:insertAttribute name="left" />
   	<tiles:insertAttribute name="footer" />
    <div id="wrap">
   		<div id="main">
    		<tiles:insertAttribute name="body" />
    	</div>
    </div>
 
    <script type="text/javascript">
        $(function() {
 
        });    
    </script>    
</body>
</html>