<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title != null ? title : "King\'s Man"}</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/kingsman/resources/js/csTopProgress.js"></script>
<script type="text/javascript" src="/kingsman/resources/js/csNavi.js"></script>
<link rel="stylesheet" type="text/css" href="/kingsman/resources/css/Tiles.css">
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
		fn_menu();
		
		var stat=1;
		var stat2=1;
		$('#Allback').css('display','none');
		$('#side3').css('display','none');
		$('#rightMenu').css('right','-10%');
		
		$('#menu0').click(function(){
			if(stat==1)
			{
				stat=2;
				$('#side').animate({right:'10%'});
				$('#side2').animate({right:'10%'});
				$('#rightMenu').animate({right:'0%'});
				var img1 = document.getElementById("rightimgleft");
				img1.src="/kingsman/resources/upload/rightclose.png";
			}
			else
			{
				stat=1;
				$('#side').animate({right:'0%'});
				$('#side2').animate({right:'0%'});
				$('#rightMenu').animate({right:'-10%'});
				var img2 = document.getElementById("rightimgleft");
				img2.src="/kingsman/resources/upload/leftopen.png";
			}
		});
		$('#menu1').click(function(){
			
				$('#side3').css('display','block');
				$('#side3').css('z-index','12');
				$('#Allback').css('display','block');
				$('#Allback').css('z-index','11');
				
				$('#Allback').on('click', function(){
					$('#side3').css('display', 'none');
					$('#Allback').css('display', 'none');
				});
				$('#close1').on('click',function(){
					$('#side3').css('display', 'none');
					$('#Allback').css('display', 'none');
				})
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
	
	$(document).ready(function(e) {
		$('.money').each(function() {
			$(this).text($(this).text().format());
		});
		
	});
	//숫자 타입에서 쓸 수 있도록 format() 함수 추가
	Number.prototype.format = function(){
	    if(this==0) return 0;

	    var reg = /(^[+-]?\d+)(\d{3})/;
	    var n = (this + '');

	    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

	    return n;
	};
	// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
	String.prototype.format = function(){
	    var num = parseFloat(this);
	    if( isNaN(num) ) return "0";

	    return num.format();
	};
	
	function fn_resize() {
		$(window).resize(function() {
			fn_content();
		});
	}
</script>
</head>
<body id="templateBody">
<!-- csAlert -->
<div id="banner"></div><div id="bannerContent"></div>
			<!-- 타일즈를 넣는 부우우우분-->
	<tiles:insertAttribute name="top"/>
	<tiles:insertAttribute name="header" />
	
    <div id="wrap">
    	<div id="main">
    		<tiles:insertAttribute name="body" />
    	</div>
    	<tiles:insertAttribute name="right" />
   		
    </div>
 	<tiles:insertAttribute name="footer" />
    <script type="text/javascript">
        $(function() {
 
        });    
    </script>    
</body>
</html>