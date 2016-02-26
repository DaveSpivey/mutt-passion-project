$(document).ready(function() {
  console.log("jQuery'd!");

  $('.container').on('click', 'div.pic .carousel', function(e) {
    e.preventDefault();
    var route = $(this).attr('href');
    var direction = $(this).text();

    $.ajax({
      url: route,
      method: 'get',
      data: {nav: direction}
    })
    .done(function(response, textStatus) {
      $(".mutt-display").remove();
      $(".container").append(response);
    })
  });

  $('.container').on('click', '#guess', function(e) {
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

  $('.container').on('submit', '#breed-search', function(e) {
    e.preventDefault();
    var route = $(this).attr('action');
      console.log($(this).serialize());
      console.log(route);
    $.ajax({
      url: route,
      method: 'get',
      data: $(this).serialize()
    })
    .done(function(responseText, textStatus) {
      $('#breed-search').remove();
      $('.container').append(responseText);
    })
  });
});
