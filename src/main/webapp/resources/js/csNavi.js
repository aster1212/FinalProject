$(document).ready(function(e) {
   $('#fixedMenuBack').mouseenter(function() {
      openNavi();
   });
   $('#fixedMenuBack').mouseleave(function() {
      closeNavi();
   });
   $('#fixedMenu').mouseenter(function() {
      openNavi();
   });
   $('#fixedMenu').mouseleave(function() {
      closeNavi();
   });
});

function openNavi() {
   $('#fixedMenuBack').css('height','180px');
   $('.naviSub').show();
}

function closeNavi() {
   $('#fixedMenuBack').css('height','40px');
   $('.naviSub').hide();
}