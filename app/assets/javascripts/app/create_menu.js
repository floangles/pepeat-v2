// Trigger takeaway or home

$(document).ready( function() {
  $('#click1').click(function(){
    $("#meal_home").click();
    $("#next-step1").removeClass("invisible");
  });
  $('#click2').click(function(){
    $("#meal_takeaway").click();
    $("#next-step1").removeClass("invisible");
  });
});

//END Trigger takeaway or home

$(document).ready( function() {
  $('#next-step1').click(function(){
    $(".create-second").removeClass("invisible");
    $("#next-step1").addClass("invisible2");
 });
  $('#next-step2').click(function(){
    $(".create-third").removeClass("invisible");
    $("#next-step2").addClass("invisible2");
 });
});

// render form for starter main or dessert

$(document).ready( function() {
  $('#click3').on('click', function(event) {
    $("#starter-input").toggleClass('invisible');
    $("#meal_starter").val('');

  });

  $('#click4').on('click', function(event) {
    $("#main-input").toggleClass('invisible');
  });

  $('#click5').on('click', function(event) {
    $("#dessert-input").toggleClass('invisible');
  });
});

// END render form for starter main or dessert
