var offset = 0;
var gifCategories;

//CALLED WHEN WANTING TO SHOW GIFS WHEN SEARCHING
function searchGIPHY(e) {
  e.preventDefault();
  var userSearch = $("[name='gif-search']").val()

  if (userSearch == "") {
    $('#gif-categories').html(gifCategories);
    return;
  }

  var unencodedURL = 'http://api.giphy.com/v1/gifs/search?q=' + userSearch + `&offset=${offset}` + '&api_key=dc6zaTOxFJmzC'
  var encodedURL = encodeURI(unencodedURL)
  var request = $.ajax({
    url: encodedURL
  })

  request.done(function(response) {
    $('#gif-categories').html("")

    for (var i = 0; i < response.pagination.count; i++) {
      var gifURL = response.data[i].images.fixed_width.url
      var embedURL = response.data[i].embed_url
      $('#gif-categories').append(`<div class="gif-category"><button style="background-image:url('${gifURL}')" data-gif-embed-url="${embedURL}"></button></div>`)
    }
  })

  request.fail(function(response) {
    console.log("YOU DON GOOFED")
    console.log(response)
  })


}

function showGIFsInCategory(e) {
  e.preventDefault();
  console.log("showGIFsInCategory")
  var unencodedURL = 'http://api.giphy.com/v1/gifs/search?q=' + $(this).next().html() + `&offset=${offset}` + '&api_key=dc6zaTOxFJmzC'
  var encodedURL = encodeURI(unencodedURL)
  var request = $.ajax({
    url: encodedURL
  })

  request.done(function(response) {
    $('#gif-categories').html("")

    for (var i = 0; i < response.pagination.count; i++) {
      var gifURL = response.data[i].images.fixed_width.url
      var embedURL = response.data[i].embed_url
      $('#gif-categories').append(`<div class="gif-category"><button style="background-image:url('${gifURL}')" data-gif-embed-url="${embedURL}"></button></div>`)
    }

  })

  request.fail(function(response) {
    console.log("YOU DON GOOFED")
    console.log(response)
  })

}

function addGIFToForm(e) {
  console.log("IM IN addGIFToForm")
  e.preventDefault();
  console.log(this);
  var embedURL = this.dataset.gifEmbedUrl
  $('#gif-results').html(`<embed src="${embedURL}" height="350px"></embed>`)
  toggleGifModule();

}

function toggleGifModule(e) {
  if (e) { e.preventDefault(); }
  console.log("I MADE IT TO TOGGLE GIF MODULE")
  $('#gif-module').toggleClass("show")
}

function showLongForm(e) {
  event.preventDefault();
  console.log('MADE IT into showLongForm')
  $('#small-form').toggleClass('hide')
  $('#big-form').toggleClass('show')
}

$(document).ready(function() {
  // Stores the original tweet data
  gifCategories = $('#gif-categories').html()

  // retrieves gifs from giphy based on user input
  $('[name="gif-search"]').keyup(function(e) {
    offset = 0;
    searchGIPHY(e);
  })

  // shows gifs in predetermined category
  $(document).on('click', '.overlay', showGIFsInCategory)

  $(document).on('click', '.gif-category button', addGIFToForm)

  $('.add-gif-button').on('click', toggleGifModule)

  $('#create-tweet-form input').on('click', showLongForm)
});
