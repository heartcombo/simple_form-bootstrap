$(document).ready(function(){
  var $grid_target = $('[data-target="toggle.grid"]');
  var $button      = $('[data-toggle="button"]');
  var $buttons     = $('[data-toggle="buttons"]');

  // show
  if ( $grid_target.length ) {
    $button.removeClass('d-none');
    $buttons.removeClass('d-none');
  }

  $button.click(function(event) {
    $grid_target.last().toggleClass("order-first");
  });

  $buttons.click(function(event) {
    if ( $(event.target).hasClass("active") ) { return }
    $grid_target.toggleClass("col-md-12");
  });

});
