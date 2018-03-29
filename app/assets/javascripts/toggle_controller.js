$(document).ready(function() {
  'use strict';

  var $grid_target = $('[data-target="toggle.grid"]');
  var $button      = $('[data-toggle="button"]');
  var $buttons     = $('[data-toggle="buttons"]');

  // init
  if ( $grid_target.length >= 2 ) {
    $button.removeClass('d-none');
    $buttons.removeClass('d-none');
  }

  // swap
  $button.click(function(event) {
    $grid_target.last().toggleClass("order-first");
  });

  // stack / split view
  $buttons.click(function(event) {
    if ( $(event.target).hasClass("active") ) { return }
    $grid_target.toggleClass("col-md-12");
  });

  // swap by press "s"
  $(document).keypress("s", function(e) {
    if(e.ctrlKey) { $button.click(); }
  });

  // stack view for inline forms
  if ( $('body[data-path="/examples/inline"]').length ) {
    $buttons.find('.btn')[0].click();
  }
});
