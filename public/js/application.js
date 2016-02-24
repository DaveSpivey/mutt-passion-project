$(document).ready(function() {
  console.log("jQuery'd!");

  $('#next').on('click', function(e) {
    e.preventDefault();
    var route = $(this).attr('href');

    $.ajax({
      url: route,
      method: 'get'
    })
    .done(function(response, textStatus) {
      console.log(response);
    })
  })
});
