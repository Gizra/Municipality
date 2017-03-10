/**
 * @file
 * Initialize semantic ui elements.
 */

(function ($) {

  /**
   * Initialize semantic ui accordions
   */
  Drupal.behaviors.semanticuiSearch = {
    attach: function(context) {
      $('.ui.accordion', context).accordion();
    }
  };

})(jQuery);
