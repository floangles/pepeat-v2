var today = new Date();
  var dd = today.getDate();
  var mm = today.getMonth()+1; //January is 0!
  var yyyy = today.getFullYear();

  if(dd<10) {
      dd='0'+dd
  }

  if(mm<10) {
      mm='0'+mm
  }

  today = mm+'/'+dd+'/'+yyyy;


$(function () {
      $('#datetimepicker3').datetimepicker({
          format: 'L',
          minDate: moment(today, "MM DD YYYY")
      });
  });

$(function () {
      $('#datetimepicker4').datetimepicker({
          format: 'LT'
      });
  });

$(function () {
      $('#datetimepicker5').datetimepicker({
          format: 'LT'
      });
  });

$(function () {
      $('#datetimepicker6').datetimepicker({
          format: 'LT'
      });
  });


$(function () {
      $('#datetimepicker7').datetimepicker({
          viewMode: 'years',
          format: 'L',
          viewDate: false,
          widgetPositioning: {vertical: 'top'}
      });
  });



