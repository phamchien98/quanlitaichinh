$(document).ready(function () {
  if (!window.location.href.includes("/posts"))
    return;

  $(".upload-photos-icon").on("click", function(){
      $("#img-source").click();
  });
});
