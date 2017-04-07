$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  function displayHoverProfile() {
    var insertLocation = $(this)
    var URL = '/hover' + $(this).attr('href');
    console.log('here')
    var request = $.ajax({
      method: 'POST',
      url: URL
    });

    var done = request.done(function(response) {
      insertLocation.after(response);
    });
  }

  $('.tweets-container').on('mouseenter', '.tweet-user-name', displayHoverProfile);

});



