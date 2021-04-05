$(document).ready(function () {
  if (!window.location.href.includes("/posts"))
    return;

  function readURL(input) {
    if (input.files) {
      [...input.files].forEach(function (imageFile){
        var reader = new FileReader();
        reader.onload = function(e) {
          $(".preview-images").append($('<img class="card-img-top" src="' + e.target.result + '">')).addClass("size-pre-img");
        }
        reader.readAsDataURL(imageFile);
      })
    }
  }

  $("#img-source").change(function() {
    readURL(this);
  });
});
