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

  function likeListener (e) {
    e.preventDefault();
    $(this).addClass('disable-link')
    var URL = $(this)[0].action
    // Passing: tweet_id, _method
    var data = $(this).serialize()
    var insertLocation = $(this).parent()
    var request = $.ajax({
      type: "POST",
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
    $(this).addClass('disable-link')
    // Getting the tweet id
    var data = $(this).serialize()
    var URL = $(this)[0].action
    var insertLocation = $(this).parent()
    var request = $.ajax({
      type: "POST",
      data: data,
      url: URL
    })
    request.done(function(response) {
      insertLocation.html(response)
    })
    request.fail(function(response) {
      console.log("Something has gone very wrong.")
    })
  }

  function createTweet (e) {
    e.preventDefault();
    var data = $(this).serialize()
    var URL = $(this)[0].action
    var request = $.ajax({
      type: "POST",
      data: data,
      url: URL
    })
    request.done(function (response) {
      $('.tweets-container').prepend(response)
      $('#create-tweet-form')[0].reset()
    })
    request.fail(function () {
      console.log("Something really bad has happened here.")
    })
  }

  $('.tweets-container').on('mouseenter', '.tweet-user-name', displayHoverProfile);
  $('.tweets-container').on('submit', '.like-form', likeListener)
  $('.tweets-container').on('submit', '.retweet-form', retweetListener)
  $('.create-tweet-form-container').on('submit', '#create-tweet-form',createTweet)


});


