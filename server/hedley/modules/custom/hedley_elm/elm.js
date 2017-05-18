(function($) {

  /**
   * Add the Elm app.
   */
  Drupal.behaviors.elm = {
    attach: function (context, settings) {
      var node = document.getElementById('elm-app');
      var app = Elm.Main.embed(node, {page: settings.elm.page});
    }
  };


})(jQuery);
