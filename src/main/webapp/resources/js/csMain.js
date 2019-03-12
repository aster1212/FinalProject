$(document).ready(function(e) {
	$(window).scroll(function() {
		fn_changeBackImg();
	});
	
	fn_content();
});

var toggle1 = false;
var toggle2 = false;
var toggle3 = false;
var toggleTime = Number(800);

function fn_changeBackImg() {
	var height = $(document).scrollTop();
	var first = $('#imgBlank1').offset().top;
	var second = $('#imgBlank2').offset().top;
	var third = $('#imgBlank3').offset().top;
	
	
	if (height > first && height < second){
		$('#mainImg1').css('z-index','-3');
		$('#mainImg2').css('z-index','-2');
		$('#mainImg3').css('z-index','-3');
		$('#mainImg4').css('z-index','-3');
	}else if(height > second && height < third){
		$('#mainImg1').css('z-index','-3');
		$('#mainImg2').css('z-index','-3');
		$('#mainImg3').css('z-index','-2');
		$('#mainImg4').css('z-index','-3');
	}else if(height > third){
		$('#mainImg1').css('z-index','-3');
		$('#mainImg2').css('z-index','-3');
		$('#mainImg3').css('z-index','-3');
		$('#mainImg4').css('z-index','-2');
	}else{
		$('#mainImg1').css('z-index','-2');
		$('#mainImg2').css('z-index','-3');
		$('#mainImg3').css('z-index','-3');
		$('#mainImg4').css('z-index','-3');
	}
	var plusInt = Number(500);
	
	
	if(height > (first+plusInt) && height < (second-plusInt)){
		if(toggle2 == false){
			$('#img2Logo').animate({
				opacity:'toggle',
				left:'toggle'
			},toggleTime);
			if(toggle1 == true){
				$('#img1Logo').toggle();
				toggle1 = false;
			}
			if(toggle3 == true){
				$('#img3Logo').toggle();
				toggle3 = false;
			}
			toggle2 = true;
		}
	}else if(height > (second+plusInt) && height < (third-plusInt)){
		if(toggle3 == false){
			$('#img3Logo').animate({
				opacity:'toggle',
				left:'toggle'
			},toggleTime);
			if(toggle1 == true){
				$('#img1Logo').toggle();
				toggle1 = false;
			}
			if(toggle2 == true){
				$('#img2Logo').toggle();
				toggle2 = false;
			}
			toggle3 = true;
		}
	}else if(height < plusInt){
		if(toggle1 == false){
			$('#img1Logo').animate({
				opacity:'toggle',
				left:'toggle'
			},toggleTime);
			if(toggle2 == true){
				$('#img2Logo').toggle();
				toggle2 = false;
			}
			if(toggle3 == true){
				$('#img3Logo').toggle();
				toggle3 = false;
			}
			toggle1 = true;
		}
	}else{
		if(toggle3 == true){
			$('#img3Logo').toggle();
			toggle3 = false;
		}
	}
}

function fn_content() {
	var imgHeight = $('#mainImg1').height();
	var imgWhiteContent = $('#imgBlank1').height();
	$('.imgContent').css({
		'width':'100%',
		'height':imgHeight
	});
	$('.imgWhiteContent').css({
		'width':'100%',
		'height':imgWhiteContent
	});
	
	$('#img1Logo').toggle();
	$('#img2Logo').toggle();
	$('#img3Logo').toggle();
	
	$('#img1Logo').stop().animate({
		opacity:'toggle',
		left:'toggle'
	},toggleTime);
	toggle1 = true;
}


