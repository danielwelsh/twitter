$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $('.tweets-container').on('submit', '.like-form', likeListener)



  function likeListener (e) {
    e.preventDefault();
    var URL = $(this)[0].action
    var data = $(this).serialize()
    var insertLocation =
    debugger
    console.log(data)
    console.log(URL)

    var request = $.ajax({
      type: 'POST',
      data: data,
      url: URL
    })
    request.done(function(response) {
      console.log(response)
      debugger
      var data = JSON.parse(response)

    })
    request.fail(function () {
      console.log("This did not work out as expected.")
    })
    }


});

