<header id="header" class="header-narrow" data-plugin-options='{"stickyEnabled": true, "stickyEnableOnBoxed": true, "stickyEnableOnMobile": true, "stickyStartAt": 57, "stickySetTop": "-57px", "stickyChangeLogo": false}'>
<div class="header-body">
<div class="header-top header-top-quaternary header-top-style-3">
    <div class="container">
        <?php $about_us = theme_get_setting('about_us');
        $contact_us = theme_get_setting('contact_us');
        $phone_number = theme_get_setting('phone_number');
        global $base_url;
        global $user;
        ?>
        <nav class="header-nav-top pull-right">
            <ul class="nav nav-pills">
                <?php if(isset($phone_number)):?>
                <li class="hidden-xs">
                    <span class="ws-nowrap"><i class="fa fa-phone"></i> <?php print $phone_number;?></span>
                </li>
                <?php endif;?>
                <li>
                    <a href="#" class="dropdown-menu-toggle" id="dropdownLanguage" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        <img src="sites/all/modules/languageicons/flags/<?php print $language->language ?>.png" class="flag flag-us" alt="English" /> <?php print $language->name; ?>
                        <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownLanguage">
                        <?php print render($page['language']);?>
                    </ul>
                </li>
                <?php if(!isset($user->name)):?>

                <li class="hidden-xs">
                    <a href="<?php print $base_url?>/user"><i class="fa fa-angle-right"></i> <?php print t('Login');?></a>
                </li>
                <li class="hidden-xs">
                    <a href="<?php print $base_url?>/user/register"><i class="fa fa-angle-right"></i> <?php print t('Sign Up');?></a>
                </li>
                <?php else:?>
                    <li class="hidden-xs">
                        <a href="<?php print $base_url?>/user/logout"><i class="fa fa-angle-right"></i> <?php print t('Logout');?></a>
                    </li>
                <?php endif;?>
            </ul>
        </nav>
    </div>
</div>
<div class="header-container container">
<div class="header-row">
<div class="header-column">
    <?php if ($logo): ?>
        <div class="header-logo">
            <a href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>" rel="home" id="logo">
                <img alt="<?php print t('Home'); ?>" width="100" height="48" data-sticky-width="82" data-sticky-height="<?php print theme_get_setting('sticky_logo_height'); ?>" data-sticky-top="33" src="<?php print $logo; ?>">
            </a>
        </div>
    <?php endif; ?>
</div>
<div class="header-column">
<div class="header-row">
<div class="header-nav">
<button class="btn header-btn-collapse-nav" data-toggle="collapse" data-target=".header-nav-main">
    <i class="fa fa-bars"></i>
</button>
<div class="header-nav-main header-nav-main-effect-1 header-nav-main-sub-effect-1 collapse">
<nav>
    <?php print render($page['header_menu']); ?>
</nav>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</header>