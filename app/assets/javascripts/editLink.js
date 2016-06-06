$(document).ready(function(){
  var $linkTable = $(".links-table")

  $linkTable.on("click", "td", function(){
    $(this).children('input').focus();
  });

  $linkTable.on("focus", "input, select", function(){
    $(this)
    .prop("readonly", false)
  });

  $linkTable.on('keydown', "input, select", function (e){
    event.preventDefault();
    if(e.keyCode === 13){
      textInputChanges($(this));
    }
  });

  $linkTable.on("blur", "input, select", function(){
    event.preventDefault();
    textInputChanges($(this));
  });

  var textInputChanges = function(input){
    input.prop("readonly", true);
    editIdea(input);
  };

  var editIdea = function(input){
    var ideaId = input.attr('data-id');
    var newText = input.val();
    var attribute = input.attr('name');
    $.ajax({
      url: '/links/'+ ideaId +'',
      type: 'PATCH',
      dataType: 'json',
      data: attribute + '=' + newText
    });
  };
});
