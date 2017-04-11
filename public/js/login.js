$(document).ready(function() {

  $('#login-button').on('click', function(event) {
    event.preventDefault();
    $('#popup').removeClass().addClass('show');
  });

  $('#x-button').on('click', function(event) {
    event.preventDefault();
    $('#popup').removeClass().addClass('hidden');
  })

})
