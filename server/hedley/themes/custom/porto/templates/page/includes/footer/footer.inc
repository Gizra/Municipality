<?php
$footer_layout = theme_get_setting('footer_layout');
if(isset($footer_layout) && $footer_layout != 'none'):
    include_once($footer_layout.'.inc');
else:
    if(arg(0) == 'index-footer-advanced'):
        include_once('f_advanced.inc');
    elseif(arg(0) == 'index-footer-simple' || arg(0) == 'index-corporate-3'):
        include_once('f_simple.inc');
    elseif(arg(0) == 'index-footer-latest-work'):
        include_once('f_latest_work.inc');
    elseif(arg(0) == 'index-footer-contact-form'):
        include_once('f_contact_form.inc');
    elseif(arg(0) == 'index-footer-narrow'):
        include_once('f_narrow.inc');
    else:
        include_once('f_default.inc');
    endif;
endif;
?>


