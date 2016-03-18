$(window).load(function() {
  $('.carousel').slick({
    lazyLoad: 'ondemand',
    dots: true,
    adaptiveHeight: true,
    focusOnSelect: true,
    mobileFirst: true,
    respondTo: 'slider',
    responsive: "unslick",
  });
});

