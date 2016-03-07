$(document).ready(function() {
  $('#meal_takeaway').click(function() {
    if( $(this).prop('checked') || $(this).value == 1 ) {
        $(".goaway").removeClass( "invisible");
        $(".gohome").addClass( "invisible");
        $('#meal_home').prop('checked', false);
        $(".hidden-field").addClass( "invisible");
        $(".take-away-txt").removeClass( "invisible");
        $(".home-txt").addClass( "invisible");

        $("#home").addClass("selected") // change the card unselected
        $("#takeaway").removeClass("selected")

    } else {
        $(".goaway").addClass( "invisible");

    }
  });
  $('#meal_home').click(function() {
    if( $(this).prop('checked') || $(this).value == 1) {
        $(".gohome").removeClass( "invisible");
        $(".goaway").addClass( "invisible");
        $('#meal_takeaway').prop('checked', false);
        $(".hidden-field").addClass( "invisible");
        $(".home-txt").removeClass( "invisible");
        $(".take-away-txt").addClass( "invisible");

        $("#takeaway").addClass("selected") // change the card unselected
        $("#home").removeClass("selected")

    } else {
      $(".gohome").addClass( "invisible");
    }
  });
})



// When Update or form error.
if( $('#meal_takeaway').prop('checked') || $('#meal_takeaway').value == 1 ) {
        $(".goaway").removeClass( "invisible");
        $(".gohome").addClass( "invisible");
        $('#meal_home').prop('checked', false);
        $(".hidden-field").addClass( "invisible");
        $(".take-away-txt").removeClass( "invisible");
        $(".home-txt").addClass( "invisible");

        $("#home").addClass("selected") // change the card unselected
        $("#takeaway").removeClass("selected")

        $("#click2").addClass( "invisible"); // remove the button ' je choisis ce mode'
        $(".validation1").removeClass( "invisible");
        $("#click1").removeClass( "invisible");
        $(".validation2").addClass( "invisible");

        $("#next-step1").removeClass("invisible"); // make the button visible anyway

    } else {
        $(".goaway").addClass( "invisible");

    }

if( $('#meal_home').prop('checked') || $('#meal_home').value == 1) {
        $(".gohome").removeClass( "invisible");
        $(".goaway").addClass( "invisible");
        $('#meal_takeaway').prop('checked', false);
        $(".hidden-field").addClass( "invisible");
        $(".home-txt").removeClass( "invisible");
        $(".take-away-txt").addClass( "invisible");

        $("#takeaway").addClass("selected") // change the card unselected
        $("#home").removeClass("selected")

        $("#next-step1").removeClass("invisible"); // make the button visible anyway

        $("#click1").addClass( "invisible");
        $(".validation2").removeClass( "invisible");
        $("#click2").removeClass( "invisible");
        $(".validation1").addClass( "invisible");


    } else {
      $(".gohome").addClass( "invisible");
    }
//END When update or form error.

// Change the button to a validation check
$(document).ready(function() {
  $('#click2').click(function(){
    $("#click2").addClass( "invisible");
    $(".validation1").removeClass( "invisible");
    $("#click1").removeClass( "invisible");
    $(".validation2").addClass( "invisible");
  });
  $('#click1').click(function(){
    $("#click1").addClass( "invisible");
    $(".validation2").removeClass( "invisible");
    $("#click2").removeClass( "invisible");
    $(".validation1").addClass( "invisible");
  });
});
//END Change the button to a validation check

$(document).ready(function() {
  if( $('#meal_home').prop('checked') || $(this).value == 1) {
        $(".gohome").removeClass( "invisible");
        $(".goaway").addClass( "invisible");
        $('#meal_takeaway').prop('checked', false);
    } else {
      $(".gohome").addClass( "invisible");

    }

  if( $('#meal_takeaway').prop('checked') || $(this).value == 1 ) {
        $(".goaway").removeClass( "invisible");
        $(".gohome").addClass( "invisible");
        $('#meal_home').prop('checked', false);
    } else {
        $(".goaway").addClass( "invisible");

    }
})
