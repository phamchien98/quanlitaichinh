$(document).ready(function () {
  if (!window.location.href.includes("/plans"))
    return false;

  var planMoneyComeElement = $("#plan_plan_money_come");
  var planMoneyOutElement = $("#plan_plan_money_out");

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

  $("#plan_end_date").change(function () {
    var startDate = document.getElementById("plan_start_date").value;
    var endDate = document.getElementById("plan_end_date").value;
    if ((Date.parse(startDate) >= Date.parse(endDate))) {
        alert("End date should be greater than Start date");
        document.getElementById("plan_end_date").value = "";
    }
  });  

  planMoneyComeElement.on("change", function () {
    if ($(this).val() <= 0) {
      alert("Insert money must bigger 0");
      $(this).val("");
    }
  });

  planMoneyOutElement.on("change", function () {
    if ($(this).val() <= 0) {
      alert("Insert money must bigger 0");
      $(this).val("");
    }
  });
});
