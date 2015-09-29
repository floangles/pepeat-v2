$(document).ready(function() {
  $('#meal_takeaway').click(function() {
    if( $(this).is(':checked')) {
        $(".endhour").removeClass( "invisible");
        $(".starthour").removeClass( "invisible");
    } else {
        $(".endhour").addClass( "invisible");
        $(".starthour").addClass( "invisible");
    }
  });
  $('#meal_home').click(function() {
    if( $(this).is(':checked')) {
        $(".starthour").removeClass( "invisible");
    } else {
      $(".starthour").addClass( "invisible");
    }
  });
})




// $(document).ready(function() {
//   $('#meal_takeaway').click(function() {
//     if( $(this).is(':checked')) {
//         $(".endhour").hide();
//     } else {
//         $(".endhour").show();
//     }
//   });
// })
