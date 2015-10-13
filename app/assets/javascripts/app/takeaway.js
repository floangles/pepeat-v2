$(document).ready(function() {
  $('#meal_takeaway').click(function() {
    if( $(this).prop('checked') || $(this).value == 1 ) {
        $(".goaway").removeClass( "invisible");
        $(".gohome").addClass( "invisible");
        $('#meal_home').prop('checked', false);
    } else {
        $(".goaway").addClass( "invisible");

    }
  });
  $('#meal_home').click(function() {
    if( $(this).prop('checked') || $(this).value == 1) {
        $(".gohome").removeClass( "invisible");
        $(".goaway").addClass( "invisible");
        $('#meal_takeaway').prop('checked', false);
    } else {
      $(".gohome").addClass( "invisible");
    }
  });
})



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
