$(document).ready(function(){

  $('.filterUnread').on('click', function(){
    var links = $('.link');

    $.each(links, function(link) {
      if($(this).children('.read').length > 0){
        $(this).hide();
      }
    });
  })

  $('.filterRead').on('click', function(){
    var links = $('.link');

    $.each(links, function(link) {
      if($(this).children('.unread').length > 0){
        $(this).hide();
      }
    });
  })

  $('.showAll').on('click', function(){
    $('.link').show();
  })

  $('#clear').on('click', function(){
    $('#searchIdeaForm').trigger('reset');
  });

  $('#search').on('keyup', function() {
    searchLinks($(this).val());
  });

  var searchLinks = function(searchString){
    var links = $('.link');

    $.each(links, function(link) {
      var title = $(this).children('.title').children('.title').val();
      var url = $(this).children('.url').children('.url').val();
      var matchingIdeas = findMatches(title, url, searchString);
        $(this).toggle(matchingIdeas);
    });
  };

  var findMatches = function(title, url, searchString) {
    return contains(title, searchString) || contains(url, searchString);
  };

  var contains = function(titleOrUrlString, searchString) {
    return titleOrUrlString.toLowerCase().indexOf(searchString.toLowerCase()) !== -1;
  };
});
