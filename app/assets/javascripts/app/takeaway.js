$(document).ready(function() {

 $('#meal_takeaway').click(function() {
    if( $(this).is(':checked')) {
        $(".takeawayhour").hide();
    } else {
        $(".takeawayhour").show();
    }
});

})
