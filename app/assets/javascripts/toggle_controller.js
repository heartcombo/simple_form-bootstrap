$(document).ready(function() {
  'use strict';

  // swap by press "s"
  $(document).keypress("s", function(e) {
    if(e.ctrlKey) { $button.click(); }
  });

  // stack view for inline forms
  // if ( $('body[data-path="/examples/inline"]').length ) {
  //   $buttons.find('.btn')[0].click();
  // }
});
