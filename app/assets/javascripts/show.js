$(document).ready(function() {
  $( "#list, #vote" ).sortable({
    connectWith: ".connectedSortable"
  }).disableSelection();

  $('#vote').sortable({
    update: function() {
      var ids = $(this).sortable('serialize');
      $.post('/votes/av_vote', ids);
    }
  });
});
