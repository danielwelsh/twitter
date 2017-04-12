$(document).ready(function() {

  $('#login-button').on('click', function(event) {
    event.preventDefault();
    $('.popup').addClass('show');
  });

  $('.x-button').on('click', function(event) {
    event.preventDefault();
    $('.popup').removeClass('show').addClass('hidden');
  })

})
