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
        $('#target').append($('<div/>', {class: 'col-xs-3 preview-js' }, { id: 'r' + i}).html(img));
      }
      reader.readAsDataURL(image);
      console.log(files);
    }
  });
});






