$(document).ready(function() {
  $('#meal_takeaway').click(function() {
    if( $(this).is(':checked')) {
        $(".goaway").removeClass( "invisible");
    } else {
        $(".goaway").addClass( "invisible");
    }
  });
  $('#meal_home').click(function() {
    if( $(this).is(':checked')) {
        $(".gohome").removeClass( "invisible");
    } else {
      $(".gohome").addClass( "invisible");
    }
  });
})


// $(document).ready(function() {
//   $('#meal_takeaway').click(function() {
//     if( $(this).is(':checked')) {
//         $(".endhour").removeClass( "invisible");
//         $(".starthour").removeClass( "invisible");
//     } else {
//         $(".endhour").addClass( "invisible");
//         $(".starthour").addClass( "invisible");
//     }
//   });
//   $('#meal_home').click(function() {
//     if( $(this).is(':checked')) {
//         $(".starthour").removeClass( "invisible");
//     } else {
//       $(".starthour").addClass( "invisible");
//     }
//   });
// })

