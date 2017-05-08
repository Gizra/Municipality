/**
 * @file
 * Font size controls.
 */

(function ($) {

  /**
   * Handle font size controls.
   */
  Drupal.behaviors.fontSizeControls = {
    attach: function(context) {
      // Min and max font size class, as defined in css/font-size.css.
      var minFontSize = -1;
      var maxFontSize = 3;

      // Set the font size body class according to the localStorage value
      var setFontSizeClass = function() {
        var currentSize = parseInt(localStorage.getItem('fontSize'));
        // Remove existing font size class from the body.
        for (var size = minFontSize; size <= maxFontSize; size++) {
          $('body').removeClass('font-size-' + size);
        }
        // Add the current font size class.
        $('body').addClass('font-size-' + currentSize);
      };

      // initialize the font size body class.
      $(document).ready(function() {
        // Make sure the fontSize localStorage item has a value.
        var currentSize = parseInt(localStorage.getItem('fontSize'));
        if (isNaN(currentSize)) {
          // Set default size to 0 when not set.
          localStorage.setItem('fontSize', 0);
        }
        setFontSizeClass();
      });

      // Handle font size controls clicks.
      $('a.change-font-size', context).click(function(event) {
        var currentSize = parseInt(localStorage.getItem('fontSize'));
        // Increment or decrement the current size.
        var delta = $(event.currentTarget).hasClass('minus') ? -1 : 1;
        // Bound the size between -1 and 3.
        var updatedSize = currentSize + delta;
        if (updatedSize >= minFontSize && updatedSize <= maxFontSize) {
          currentSize = updatedSize;
        }
        localStorage.setItem('fontSize', currentSize);
        setFontSizeClass();
      });
    }
  };

})(jQuery);
