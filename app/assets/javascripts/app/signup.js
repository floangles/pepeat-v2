$(document).ready( function() {
  $('#su-trigger').click(function(){
    $('.su').addClass( "hidden-form" );
    $('.si').removeClass( "hidden-form" );
  });
});

$(document).ready( function() {
  $('#si-trigger').click(function(){
    $('.si').addClass( "hidden-form" );
    $('.su').removeClass( "hidden-form" );
  });
});
