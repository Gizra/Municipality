/**
 * @file
 */

(function ($) {

/**
 * Add the Elm app.
 */
Drupal.behaviors.elm = {
  attach: function (context, settings) {
    // We can have multiple Elm apps in the same page.
    var elmApps = settings.elm;

    // Iterate over the apps.
    Object.keys(elmApps).forEach(function (appName) {

      // The current app's settings.
      var appSettings = settings.elm[appName];

      // appName would the unique css ID, e.g. `elm-app-100`.
      var node = document.getElementById(appName);
      var page = appSettings.page;
      var app = Elm.Main.embed(node, {
        page: page,
        language : appSettings.language,
        showAsBlock : appSettings.showAsBlock,
        baseUrl : appSettings.baseUrl
      });

      // Inject the expected values to the right port based on the selected page.
      switch (page) {
        case 'contacts':
          var property = app.ports.contacts;
          break;

        case 'events':
          var property = app.ports.events;
          break;

        case 'event-page':
          var property = app.ports.event;
          break;
      }

      property.send(appSettings.values);
    });

  }
};

})(jQuery);
