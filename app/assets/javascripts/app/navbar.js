$(document).ready(function() {
  // navbar transition jQuery script
  $(window).scroll(function(e){
    if ($(this).scrollTop() > 3500) {
      $(".signup-home").css({
        "display": "none",
      });
    }
  });
  $(window).scroll(function(e){
    if ($(this).scrollTop() < 3500) {
      $(".signup-home").css({
        "display": "block",
      });
    }
  });
});



