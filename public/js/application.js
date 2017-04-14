$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  function displayHoverProfile() {
    var insertLocation = $(this)
    var URL = '/hover' + $(this).attr('href');
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
      insertLocation.replaceWith(response)
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


  function displayUsersPopUp (e) {
    e.preventDefault();
    var URL = $(this).attr('href')
    var insertLocation = $('body')
    var request = $.ajax({
      type: 'get',
      url: URL
    })
    request.done(function (response) {
      // $(insertLocation).append($(response));
      ($(response)).insertAfter($(insertLocation));
    })
    request.fail(function () {
      console.log("Something wrong has happened here.")
    })
  }

  function deleteUsersPopUp (e) {
    e.preventDefault();
    var toRemove = $(this).parent().parent();
    toRemove.remove();
  }

  function howManyTweets () {
    return $('.tweet-container').length
  }

  function atBottom () {
    return window.innerHeight + document.body.scrollTop >= document.body.scrollHeight - 1
  }

  function getMoreTweets (e) {
    load = false
    var data = { num_tweets: howManyTweets() }

    $.ajax({
      url: '/tweets',
      type: 'get',
      data: data
    })
    .done(function(response) {
      $('#loader-container').remove()
      $('.tweets-container').append(response)
      load = true
    })
    .fail(function() {
      console.log("Cry, something wrong happened")
    })
  }


  function deleteSuggestedUser (e) {
    e.preventDefault();
    $(this).parent().parent().remove()

    $.ajax({
      url: '/suggested_user',
      type: 'get'
    })
    .done(function (response) {
      $('.suggested-users-container').append(response)

    })
    .done(function () {

    })
  }

  function followUser (e) {
    e.preventDefault();
    var data = $(this).serialize();
    var url = $(this)[0].action;
    var type = $(this)[0].method;
    var insertLocation = $(this);
    $.ajax({
      url: url,
      type: type,
      data: data
    })
    .done(function (response) {
      insertLocation.replaceWith(response);   
    })
    .fail(function () {
      console.log("Something has failed here")
    }) 
  }


  function loginUser (e) {
    e.preventDefault();
    debugger
  }

  $(document).on('submit', '#login-form', loginUser)

  $(document).on('submit', '.unfollow-form', followUser)
  $(document).on('submit', '.follow-form', followUser)
  

  $('.suggested-users-container').on('click', '.delete-suggested-user-button', deleteSuggestedUser);
  // Applies the listener scrolling
  $(document).on('scroll', function(e) {
    console.log(atBottom())
    if (load) {
      if (atBottom()) {
        console.log("ho shit we made it")
          $('.tweets-container').append(`
      <div id="loader-container" class="section-borders">
        <img src="/images/loader.gif" alt="">
      </div>
        `)
        getMoreTweets();
      }
    }
  });
  $('.tweets-container').on('mouseenter', '.tweet-user-name', displayHoverProfile);
  $('.tweets-container').on('submit', '.like-form', likeListener)
  $('.tweets-container').on('submit', '.retweet-form', retweetListener)
  $('.create-tweet-form-container').on('submit', '#create-tweet-form',createTweet)

  $('.side-profile-profile-stats').on('click', 'ul a', displayUsersPopUp)
  $('.tweets-container').on('click', '#likes-count', displayUsersPopUp)
  $('.tweets-container').on('click', '#retweet-count', displayUsersPopUp)
  $(document).on('click', '.x-button', deleteUsersPopUp)

});

var load = true










































