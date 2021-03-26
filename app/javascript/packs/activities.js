$(document).ready(function () {
  if (!window.location.href.includes("/activies"))
    return false;

	/** Set date when open modal */
  $('a[data-target="#Modal_activies"]').on("click", function () {
    var date = $(this).closest(".day").data("date");
    $("#Modal_activies").find("#activity_time").val(date);
  });
});
