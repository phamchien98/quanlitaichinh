$(document).ready(function () {
  if (!window.location.href.includes("/activies"))
    return false;

  var moneyElement = $("#activity_money");
  var noteElement = $("#activity_note");

  $("form").submit(function(e) {  
    $("input").each(function() {
      if ($(this).val() == "") { 
        $(this).addClass("blank-background");
        e.preventDefault();
        return false;            
      }
      else {$(this).removeClass("blank-background");}
    });
    return;
  });
  
  moneyElement.on("change", function () {
    if ($(this).val() <= 0) {
      alert("Insert money must bigger 0");
      $(this).val("");
    }
  });
});
