$(document).ready(function() {
  console.log("jQuery'd!");

  $('.container').on('click', 'div.pic .carousel', function(e) {
    e.preventDefault();
    var route = $(this).attr('href');

    $.ajax({
      url: route,
      method: 'get'
    })
    .done(function(response, textStatus) {
      $(".mutt-display").remove();
      $(".container").append(response);
    })
  });

  $('#guess').on('click', function(e) {
    e.preventDefault();
    var route = $(this).attr('href');

    $.ajax({
      url: route,
      method: 'get'
    })
    .done(function(response, textStatus) {
      $("#guess").remove();
      $(".container").append(response);
    })
  });
});
