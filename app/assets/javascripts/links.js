// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('click', '.read', function(){
  event.preventDefault();

  var ideaId = $(this).attr('data-id');
  var result = $(this).attr('data-read');

  if(result === 'false'){
    $(this).removeClass('btn-success')
    $(this).addClass('btn-danger')
    $(this).empty().append('mark read')
  } else {
    $(this).removeClass('btn-danger')
    $(this).addClass('btn-success')
    $(this).empty().append('mark unread')
  }

  $.ajax({
    url: '/links/'+ ideaId +'',
    type: 'PATCH',
    dataType: 'json',
    data: 'read=' + result
  });
})
