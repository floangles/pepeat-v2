
// Preview for kitchen picture in profile show

$(function() {
  $('#pictureInput').on('change', function(event) {
    var files = event.target.files;
    for (var i = 0; i < files.length; i++) {
      var image = files[i]
      var reader = new FileReader();
      reader.onload = function(file) {
        var img = new Image();
        console.log(file);
        img.src = file.target.result;




        $('#target3').addClass( "invisible" ); // Make invisible the placeholder
        $('.salut').addClass( "invisible2" );
        $('#target2').append($('<div/>', {class: 'salut' }, { id: 'r' + i}).html(img)); // pictures place
        $(".salut img").addClass("preview-size") // css class for img
        $('.go-btn').removeClass( "invisible" ); // The go button appear


      }
      reader.readAsDataURL(image);
      console.log(files);
    }
  });
});

// Preview for kitchen picture in profile edit

$(function() {
  $('#kitchenpictureInput').on('change', function(event) {
    $(".bonjour").addClass("invisible");
    var files = event.target.files;
    for (var i = 0; i < files.length; i++) {
      var image = files[i]
      var reader = new FileReader();
      reader.onload = function(file) {
        var img = new Image();
        console.log(file);
        img.src = file.target.result;


        $('#target11').append($('<div/>', {class: 'col-xs-3 bonjour' }, { id: 'r' + i}).html(img));
        $(".bonjour img").addClass("preview-size-kitchen");

      }
      reader.readAsDataURL(image);
      console.log(files);
    }
  });
});


// Preview for user picture in profile edit

$(function() {
  $('#profilepictureInput').on('change', function(event) {
    $('.oui-chef').addClass( "invisible2");
    var files = event.target.files;
    for (var i = 0; i < files.length; i++) {
      var image = files[i]
      var reader = new FileReader();
      reader.onload = function(file) {
        var img = new Image();
        console.log(file);
        img.src = file.target.result;


        $('#placeholder-chief').addClass( "invisible2" );
        $('.img-preview').addClass( "invisible2" );
        $('#picturechief').append($('<div/>', {class: 'oui-chef'}, { id: 'r' + i}).html(img));
        $(".oui-chef img").addClass("preview-size-profile cropbox");

      }
      reader.readAsDataURL(image);
      console.log(files);
    }
  });
});

// Preview for meal pictures in profile meal new

$(function() {
  $('#mealpictureInput').on('change', function(event) {
    var files = event.target.files;
    for (var i = 0; i < files.length; i++) {
      var image = files[i]
      var reader = new FileReader();
      reader.onload = function(file) {
        var img = new Image();
        console.log(file);
        img.src = file.target.result;


        $('#spacetarget').append($('<div/>', {class: 'col-xs-3 badaboom'}, { id: 'r' + i}).html(img));
        $(".badaboom img").addClass("preview-meal");

      }
      reader.readAsDataURL(image);
      console.log(files);
    }
  });
});



