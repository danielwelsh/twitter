$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $('.tweets-container').on('submit', '.like-form', likeListener)
  $('.tweets-container').on('submit', '.retweet-form', retweetListener)


  function likeListener (e) {
    e.preventDefault();
    var type = $(this).attr('method')
    var URL = $(this)[0].action
    // Only passing the tweet id
    var data = $(this).serialize()
    var insertLocation = $(this).parent()
    debugger
    var request = $.ajax({
      type: type,
      data: data,
      url: URL
    })
    request.done(function(response) {
      // console.log(response)
      insertLocation.replaceWith(response)
    })
    request.fail(function () {
      console.log("This did not work out as expected.")
    })
    }

    function retweetListener (e) {
      e.preventDefault();
      var type = $(this).attr('method')
      var URL = $(this)[0].action

      // Getting the tweet id
      var data = $(this).serialize()
      var insertLocation = $(this).parent()
      var request = $.ajax({
        type: type,
        data: data,
        url: URL
      })
      request.done(function(response) {

      })
      request.fail(function(response) {
        console.log("Something has gone very wrong.")
      })
    }


});

