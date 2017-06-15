<?php

$header_layout = theme_get_setting('header_layout');
if($header_layout != 'none'):
    include_once($header_layout.'.inc');
else:
    if(arg(0) == 'index-header-language-dropdown'):
        include_once('h_language_dropdown.inc');
    elseif(arg(0) == 'index-header-flat'):
        include_once('h_flat.inc');
    elseif(arg(0) == 'index-header-flat-top-bar'):
        include_once('h_flat_topbar.inc');
    elseif(arg(0) == 'index-header-flat-colored-top-bar'):
        include_once('h_flat_topbar_color.inc');
    elseif(arg(0) == 'index-header-flat-top-bar-search' || arg(0) == 'index-corporate-5'):
        include_once('h_flat_topbar_search.inc');
    elseif(arg(0) == 'index-header-transparent'):
        include_once('h_transparent.inc');
    elseif(arg(0) == 'index-header-transparent-bottom-border' || arg(0) == 'index-corporate-7'):
        include_once('h_transparent_border_bottom.inc');
    elseif(arg(0) == 'index-header-semi-transparent'):
        include_once('h_transparent_semi.inc');
    elseif(arg(0) == 'index-header-semi-transparent-light'):
        include_once('h_transparent_semi_light.inc');
    elseif(arg(0) == 'index-header-center'):
        include_once('h_center.inc');
    elseif(arg(0) == 'index-header-narrow'):
        include_once('h_narrow.inc');
    elseif(arg(0) == 'index-header-full-width'):
        include_once('h_fullwidth.inc');
    elseif(arg(0) == 'index-header-navbar'):
        include_once('h_navbar.inc');
    elseif(arg(0) == 'index-header-navbar-extra-info' || arg(0) == 'index-corporate-3'):
        include_once('h_navbar_extra_info.inc');
    elseif(arg(0) == 'index-header-side-header-left'):
        include_once('h_side_header_left.inc');
    elseif(arg(0) == 'index-header-side-header-right'):
        include_once('h_side_header_right.inc');
    elseif(arg(0) == 'index-corporate-hosting'):
        include_once('h_hosting.inc');
    else:
        include_once('h_default.inc');
    endif;
endif;
?>