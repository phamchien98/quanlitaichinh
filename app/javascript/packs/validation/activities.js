$(document).ready(function () {
  if (!window.location.href.includes('/activies'))
  return false;

  var moneyElement = $('#activity_money');
  var noteElement = $('#activity_note');

  moneyElement.on('change', function () {
    if ($(this).val() <= 0) {
      alert('Insert money >= 0');
      $(this).val('');
    }
  });

  noteElement.blur(function(){
    console.log ("abc")
      if($(this).val() == ''){
	      alert('empty'); 
	    }
	});
});
