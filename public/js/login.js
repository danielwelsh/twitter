$(document).ready(function() {

  $('#login-button').on('click', function(event) {
    event.preventDefault();
    $('.popup').addClass('show');
  });

  $('.x-button').on('click', function(event) {
    event.preventDefault();
    $('.popup').removeClass('show').addClass('hidden');
  })

  $(document).on('submit', '#login-form', loginUser)

})

function loginUser (e) {
  e.preventDefault();
  var data = $(this).serialize();
  var url = $(this)[0].action;
  var type = $(this)[0].method;
  var insertLocation = $(this).children()[0]
  $.ajax({
    url: url,
    type: type,
    data: data
  })
  .done(function (response) {
    console.log(response)
    response = JSON.parse(response)
    if (response.error) {
      $(insertLocation).html(response.error)
    } else {
      window.location.replace("/");
    }
  })
  .fail(function () {
    console.log("Something has failed here")
  })
}

