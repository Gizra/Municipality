jQuery(document).ready(function ($) {
    var ms_ie = false;
    var ua = window.navigator.userAgent;
    var old_ie = ua.indexOf('MSIE');
    var new_ie = ua.indexOf('Trident/');
    if ((old_ie > -1) || (new_ie > -1)) {
        ms_ie = true;
    }
    if (ms_ie) {
        jQuery('body').addClass('ie');
    }

    jQuery('.alert').append('<i class="icon-cancel message-close fa fa-close"></i>');
    jQuery('body').on('click', '.icon-cancel.message-close', function () {
        jQuery(this).parent().animate({
            'opacity': '0'
        }, function () {
            jQuery(this).slideUp();
        });
    });
});