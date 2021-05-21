$(document).ready(function() {
  'use strict';

  var $bootstrap = $("#exampleInputPassword").next(".input-group-text");
  var $simple_form = $("#user_password").next(".input-group-text");

  var $pw_appends = $bootstrap.add($simple_form);

  // password show/hide toggle
  $pw_appends.click(function() {
    $(this).toggleClass('active');
    if ( $(this).hasClass('active') ) {
      $(this).prev().prop("type", "text");
      $(this).text("🙈");
    } else {
      $(this).prev().prop("type", "password");
      $(this).text("🙊");
    }
    $(this).prev().focus();
  });

  // styling
  $pw_appends.css('cursor', 'pointer').prop('title', 'toggle me');
});
