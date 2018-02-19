$(document).ready(function(){
  var $grid_target = $('[data-target="toggle.grid"]');
  var $button = $('[data-toggle="buttons"]');
  if ( $grid_target.length ) { $button.removeClass('d-none'); }
  console.log( $grid_target.length )

  $button.click(function(event) {
    if ( $(event.target).hasClass("active") ) { return }
    $grid_target.toggleClass("col-md-12");
  });
});
