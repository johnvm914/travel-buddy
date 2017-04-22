$(document).ready(function() {
  var test = document.createElement('input');
  test.type = 'date';
  if (test.type === 'text') {
    $(".datepicker").datepicker();
  }
} );