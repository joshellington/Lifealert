

$(function() {
  // Go go gadget

  $('#new').submit(function() {
    var d = $(this).serialize(),
        that = $(this);

    $.post('/new/', d, function(res) {
      log(res);

      
      if ( res == 'success' ) {
        location.reload();
      }
    });

    return false;
  });

  $('.delete').live('click', function() {
    var parent = $(this).closest('.site');

    $.get('/delete/'+parent.attr('id'), function(res) {
      log(res);

      if ( res == 'success' ) {
        parent.remove();
      } else {
        alert('Error!');
      }
    });

    return false;
  });

});




$.fn.clearForm = function() {
  return this.each(function() {
    var type = this.type, tag = this.tagName.toLowerCase();
    if (tag == 'form')
      return $(':input',this).clearForm();
    if (type == 'text' || type == 'password' || tag == 'textarea' || type == 'url' || type == 'email')
      this.value = '';
    else if (type == 'checkbox' || type == 'radio')
      this.checked = false;
    else if (tag == 'select')
      this.selectedIndex = -1;
  });
};