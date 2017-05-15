var offset = 0;
var gifCategories;

//CALLED WHEN WANTING TO SHOW GIFS WHEN SEARCHING
function searchGIPHY(e) {
  console.log('searching')
  e.preventDefault();
  var userSearch = $("[name='gif-search']").val()
  if (userSearch == "") {
    $('#gif-categories').html(gifCategories);
    return;
  }
  var unencodedURL = 'https://api.giphy.com/v1/gifs/search?q=' + userSearch + `&offset=${offset}` + '&api_key=dc6zaTOxFJmzC'
  var encodedURL = encodeURI(unencodedURL)
  var request = $.ajax({
    url: encodedURL
  })

  request.done(function(response) {
    $('#gif-categories').html("")
    for (var i = 0; i < response.pagination.count; i++) {
      var gifURL = response.data[i].images.fixed_width.url
      var embedURL = response.data[i].embed_url
      var gifID = response.data[i].id
      var hotlinkURL = `https://media.giphy.com/media/${gifID}/giphy.gif`
      $('#gif-categories').append(`<div class="gif-category"><button style="background-image:url('${gifURL}')" data-gif-embed-url="${embedURL}" data-hotlink-url="${hotlinkURL}"></button></div>`)
    }
  })

  request.fail(function(response) {
    console.log("YOU DON GOOFED")
    console.log(response)
  })
}

function showGIFsInCategory(e) {
  e.preventDefault();
  var unencodedURL = 'https://api.giphy.com/v1/gifs/search?q=' + $(this).next().html() + `&offset=${offset}` + '&api_key=dc6zaTOxFJmzC'
  var encodedURL = encodeURI(unencodedURL)
  var request = $.ajax({
    url: encodedURL
  })

  request.done(function(response) {
    $('#gif-categories').html("")
    for (var i = 0; i < response.pagination.count; i++) {
      var gifURL = response.data[i].images.fixed_width.url
      var embedURL = response.data[i].embed_url
      var gifID = response.data[i].id
      var hotlinkURL = `https://media.giphy.com/media/${gifID}/giphy.gif`
      $('#gif-categories').append(`<div class="gif-category"><button style="background-image:url('${gifURL}')" data-gif-embed-url="${embedURL}" data-hotlink-url="${hotlinkURL}"></button></div>`)
    }

  })

  request.fail(function(response) {
    console.log("YOU DON GOOFED")
    console.log(response)
  })
}

function addGIFToForm(e) {
  console.log("i think I made it here DAN MY MAN")
  e.preventDefault();
  var embedURL = this.dataset.gifEmbedUrl
  var hotlinkURL = this.dataset.hotlinkUrl
  $('#gif-results').html(`
    <embed src="${hotlinkURL}"></embed>
    <input type="hidden" name="gif_url" value="${hotlinkURL}">
    `)
  toggleGifModule();
}

function toggleGifModule(e) {
  if (e) { e.preventDefault(); }
  $('#gif-module').toggleClass("show")
}

function showLongForm(e) {
  e.preventDefault();
  $('#small-form').toggleClass('hide');
  $('#big-form').toggleClass('show');
}

function hideLongFormIfOutside(e) {
  e.preventDefault
  if ($('#big-form').has(e.target).length == 0) {
    $('#small-form').toggleClass('hide');
    $('#big-form').toggleClass('show');
  }
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

  $('#create-tweet-form input').on('mousedown', showLongForm)

  $(document).mouseup(hideLongFormIfOutside)
});
