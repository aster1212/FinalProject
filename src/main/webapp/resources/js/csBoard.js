$(document).ready(function(e) {
	$('.boardList').hover(function() {
		$(this).css('background','#ebebeb');
		$(this).children('.boardTitle').css('text-decoration','underline');
	}, function() {
		$(this).css('background','#ffffff');
		$(this).children('.boardTitle').css('text-decoration','none');
	});
	
});

function openReplyForm() {
	$('#hideDivForReply').show();
}
function closeReplyForm() {
	$('#hideDivForReply').hide();
}