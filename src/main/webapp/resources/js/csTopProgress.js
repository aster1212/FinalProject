$(document).ready(function(e) {
	fn_progressSetting();
	
	$(window).scroll(function() {
		fn_topProgress();
	});
    
});

var nowScroll;
var browserHeight;
var windowTotalHeight;
var barRate;

function fn_progressSetting() {
	nowScroll = $(document).scrollTop();
	browserHeight = $(window).height();
	windowTotalHeight = document.body.clientHeight;
	var realNowScroll = nowScroll;
	var perWidth = (realNowScroll / (windowTotalHeight-browserHeight)) * 100;
	$('#topProgressGage').css('width',perWidth+'%');
}

function fn_topProgress(){
	nowScroll = $(document).scrollTop();
	browserHeight = $(window).height();
	windowTotalHeight = document.body.clientHeight;
	var realNowScroll = nowScroll;
	var perWidth = (realNowScroll / (windowTotalHeight-browserHeight)) * 100;
	$('#topProgressGage').css('width',perWidth+'%');
}
