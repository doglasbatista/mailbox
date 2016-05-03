$(document).ready(function() {
  $('.archive-message').click(function(event) {
    $.ajax({
      url: $(this).attr('href'),
      type: 'put',
    })
    .always(function() {
      $(event.target).closest('li').slideUp('slow');
    });
  });
  $('.archive-all-messages').click(function(event) {
    $.ajax({
      url: $(this).attr('href'),
      type: 'put',
    })
    .always(function() {
      $('.message').hide();
    });
  });
});