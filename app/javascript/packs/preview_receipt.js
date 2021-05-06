$(document).ready(function () {
  if (!window.location.href.includes("/activies"))
    return;

  function readURL(input) {
    if (input.files) {
      console.log("receipt pre")
      [...input.files].forEach(function (imageFile){
        var reader = new FileReader();
        reader.onload = function(e) {
          $(".preview-receipt").append($('<img class="card-img-top" src="' + e.target.result + '">')).addClass("size-pre-img");
        }
        reader.readAsDataURL(imageFile);
      })
    }
  }

  $("#receipt-source").change(function() {
    readURL(this);
  });
});
