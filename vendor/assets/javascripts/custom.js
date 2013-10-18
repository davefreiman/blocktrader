$(document).ready(function() {
   $('.icon').mouseenter(function() {
       $(this).animate({
           height: '+=10px'
       });
   });
   $('.icon').mouseleave(function() {
       $(this).animate({
           height: '-=10px'
       }); 
   });

});


