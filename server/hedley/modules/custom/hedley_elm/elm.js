(function($) {

/**
 * Add the Elm app.
 */
Drupal.behaviors.elm = {
  attach: function (context, settings) {
    var node = document.getElementById('elm-app');
    var page = settings.elm.page;
    var app = Elm.Main.embed(node, {page: page});

    // Inject the expected values to the right port based on the selected page.
    switch (page) {
      case 'contact':
        app.ports.contacts.send(settings.elm.values);
    }
  }
};


})(jQuery);
