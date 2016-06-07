$(document).ready(function(){

  $('.sort').on('click', function(e){
    var $sort = this;
    let links = $('.link');

    links.sort(function(a,b){
      let keyA = $(a).children('.title').children('.title').val()
      let keyB = $(b).children('.title').children('.title').val()


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
    let links = $('.link');

    $.each(links, function(link) {
      if($(this).children('.read').length > 0){
        $(this).hide();
      }
    });
  })

  $('.filterRead').on('click', function(){
    let links = $('.link');

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

  let searchLinks = function(searchString){
    let links = $('.link');

    $.each(links, function(link) {
      let title = $(this).children('.title').children('.title').val();
      let url = $(this).children('.url').children('.url').val();
      let matchingIdeas = findMatches(title, url, searchString);
        $(this).toggle(matchingIdeas);
    });
  };

  let findMatches = function(title, url, searchString) {
    return contains(title, searchString) || contains(url, searchString);
  };

  let contains = function(titleOrUrlString, searchString) {
    return titleOrUrlString.toLowerCase().indexOf(searchString.toLowerCase()) !== -1;
  };
});
