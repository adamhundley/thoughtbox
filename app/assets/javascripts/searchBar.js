$(document).ready(function(){

  $('.sort').on('click', function(e){
    var $sort = this;
    var links = $('.link');

    links.sort(function(a,b){
      var keyA = $(a).children('.title').children('.title').val()
      var keyB = $(b).children('.title').children('.title').val()


      if($($sort).hasClass('asc')){
            return (keyA > keyB) ? 1 : 0;
        } else {
            return (keyA < keyB) ? 1 : 0;
        }
    });

    $.each(links, function(index, row){
      $('.links-table').append(row);
    });

    e.preventDefault();
  });

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
