$(document).ready(function() {
  'use strict';

  var $pw_append = $('#user_password').next('.input-group-append');

  // password show/hide toggle
  $pw_append.click(function() {
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
  $pw_append.css('cursor', 'pointer').prop('title', 'toggle me');
});
