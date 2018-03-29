$(document).ready(function() {
  'use strict';

  var $bootstrap = $('#exampleInputPassword').next('.input-group-append');
  var $simple_form = $('#user_password').next('.input-group-append');

  var $pw_appends = $bootstrap.add($simple_form);

  // password show/hide toggle
  $pw_appends.click(function() {
    $(this).toggleClass('active');
    if ( $(this).hasClass('active') ) {
      $(this).prev().prop("type", "text");
      $(this).find('.input-group-text').html("🙈");
    } else {
      $(this).prev().prop("type", "password");
      $(this).find('.input-group-text').html("🙊");
    }
    $(this).prev().focus();
  });

  // styling
  $pw_appends.css('cursor', 'pointer').prop('title', 'toggle me');
});
