/**
 * this is new alert instead of basic alert
 */
$(document).ready(function(){
	fn_alertReady();
});
function fn_alertReady() {
	
	$('#banner').css('width','100%');
	$('#banner').css('height','100%');
	$('#banner').css('background-color','black');
	$('#banner').css('position','fixed');
	$('#banner').css('text-align','center');
	$('#banner').css('z-index','11');
	$('#banner').css('opacity','0.85');
	$('#banner').css('margin','0 0 0 0');
	$('#banner').css('padding','0 0 0 0');
	$('#banner').css('top','0px');
	$('#banner').css('left','0px');
	
	$('#bannerContent').css('width','300px');
	$('#bannerContent').css('height','auto');
	$('#bannerContent').css('background-color','#aaaaaa');
	$('#bannerContent').css('display','inline-block');
	$('#bannerContent').css('position','fixed');
	$('#bannerContent').css('text-align','center');
	$('#bannerContent').css('z-index','12');
	$('#bannerContent').css('margin','0 0 0 0');
	$('#bannerContent').css('padding','20px 0');
	$('#bannerContent').css('top','70px');
	$('#bannerContent').css('left','40%');
	

	$('#banner').hide();
	$('#bannerContent').hide();
}

function fn_warning(str){
	$('#bannerContent').html(str+'<br><a id="warningClose" href="#this">확인</a>');
	$('#banner').fadeIn(10);
	$('#bannerContent').fadeIn(10);
	/* setTimeout(function() { $('#banner').fadeOut(1000); }, 2000); */
	$('#warningClose').on('click', function(e) {
		e.preventDefault();
		$('#banner').fadeOut(100);
		$('#bannerContent').fadeOut(100);
	});
	$('#banner').on('click', function(e) {
		e.preventDefault();
		$('#banner').fadeOut(100);
		$('#bannerContent').fadeOut(100);
	});
}