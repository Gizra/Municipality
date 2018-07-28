/**
 * @file
 * High contrast toggle.
 */


(function () {

  /**
   * Handle toggling high contrast.
   */
  Drupal.behaviors.highContrastToggle = {
    attach: function() {
      var Contrast = {

        /**
         * Init Function
         */
        init: function () {
          Contrast.municipalityAccessible();
        },

        /**
         * Toggle accessibility mode and save a cookie for 14 days.
         */
        municipalityAccessible: function () {
          var self = this,
            $body = jQuery('body');

          // Check cookie for accessibility mode.
          self.checkAccessibilityCookie();

          jQuery('.municipality-accessible').on('click', function () {
            $body.toggleClass('municipality-is-accessible');
            self.setCookie("municipalityAccessible", $body.hasClass('municipality-is-accessible'), 14);
          });
        },

        /**
         * Check if accessibility mode cookie is true and add the body class.
         */
        checkAccessibilityCookie: function () {
          var self = this,
            municipalityAccessible = self.getCookie("municipalityAccessible");

          if (municipalityAccessible === 'true') {
            jQuery('body').addClass('municipality-is-accessible');
          }
        },

        /**
         * A function to set a cookie.
         *
         * @param cname
         *   Cookie name.
         * @param cvalue
         *   Cookie value.
         * @param exdays
         *   cookie expiration in days.
         */
        setCookie: function (cname, cvalue, exdays) {
          var d = new Date();
          d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
          var expires = "expires=" + d.toUTCString();

          document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
        },

        /**
         * A function to get a cookie.
         *
         * @param cname
         *   Cookie name.
         *
         * @returns {*}
         *   The value of the cookie or an empty string.
         */
        getCookie: function (cname) {
          var name = cname + "=";
          var decodedCookie = decodeURIComponent(document.cookie);
          var ca = decodedCookie.split(';');
          for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) === ' ') {
              c = c.substring(1);
            }
            if (c.indexOf(name) === 0) {
              return c.substring(name.length, c.length);
            }
          }
          return "";
        }
      };

      Contrast.init();
    }
  };

})(jQuery);
