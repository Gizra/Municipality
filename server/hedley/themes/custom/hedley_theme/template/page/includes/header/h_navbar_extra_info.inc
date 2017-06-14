<?php
$phone_number = theme_get_setting('phone_number');
$get_in_touch = theme_get_setting('get_in_touch');
$email = theme_get_setting('email');
$send_email = theme_get_setting('send_email');
?>
<header id="header" class="header-no-border-bottom" data-plugin-options='{"stickyEnabled": true, "stickyEnableOnBoxed": true, "stickyEnableOnMobile": true, "stickyStartAt": 148, "stickySetTop": "-148px", "stickyChangeLogo": false}'>
<div class="header-body">
<?php print render($page['header_top']);?>
<div class="header-container container">
    <div class="header-row">
        <div class="header-column">
            <?php if (isset($page['branding'])) : ?>
                <?php print render($page['branding']); ?>
            <?php endif; ?>
            <?php if ($logo): ?>
                <div class="header-logo">
                    <a href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>" rel="home" id="logo">
                        <img alt="<?php print t('Home'); ?>" width="111" height="<?php print theme_get_setting('logo_height'); ?>" data-sticky-width="82" data-sticky-height="<?php print theme_get_setting('sticky_logo_height'); ?>" data-sticky-top="33" src="<?php print $logo; ?>">
                    </a>
                </div>
            <?php endif; ?>
            <?php if ($site_name || $site_slogan): ?>
                <div id="name-and-slogan"<?php if ($disable_site_name && $disable_site_slogan) { print ' class="hidden"'; } ?>>

                    <?php if ($site_name): ?>
                        <?php if ($title): ?>
                            <div id="site-name"<?php if ($disable_site_name) { print ' class="hidden"'; } ?>>
                                <a href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>" rel="home"><span><?php print $site_name; ?></span></a>
                            </div>
                        <?php else: ?>
                            <h1 id="site-name"<?php if ($disable_site_name) { print ' class="hidden"'; } ?>>
                                <a href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>" rel="home"><span><?php print $site_name; ?></span></a>
                            </h1>
                        <?php endif; ?>
                    <?php endif; ?>

                    <?php if ($site_slogan): ?>
                        <div id="site-slogan"<?php if ( ($disable_site_slogan ) ) { print ' class="hidden"'; } if ( (!$disable_site_slogan ) AND ($disable_site_name) ) { print ' class="slogan-no-name"'; } ?>>
                            <?php print $site_slogan; ?>
                        </div>
                    <?php endif; ?>

                </div> <!-- /#name-and-slogan -->
            <?php endif; ?>
        </div>
        <div class="header-column">
            <ul class="header-extra-info hidden-xs">
                <li>
                    <div class="feature-box feature-box-style-3">
                        <div class="feature-box-icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="feature-box-info">
                            <?php if(isset($phone_number)):?>
                            <h4 class="mb-none"><?php print $phone_number;?></h4>
                            <?php endif;?>
                            <?php if(isset($get_in_touch)):?>
                            <p><small><?php print $get_in_touch;?></small></p>
                            <?php endif;?>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="feature-box feature-box-style-3">
                        <div class="feature-box-icon">
                            <i class="fa fa-envelope"></i>
                        </div>
                        <div class="feature-box-info">
                            <?php if(isset($email)):?>
                            <h4 class="mb-none"><?php print $email;?></h4>
                            <?php endif;?>
                            <?php if(isset($send_email)):?>
                            <p><small><?php print $send_email;?></small></p>
                            <?php endif;?>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="header-container header-nav header-nav-bar header-nav-bar-primary">
<div class="container">
<button class="btn header-btn-collapse-nav" data-toggle="collapse" data-target=".header-nav-main">
    <i class="fa fa-bars"></i>
</button>
<div class="header-nav-main header-nav-main-light header-nav-main-effect-1 header-nav-main-sub-effect-1 collapse">
<nav>
    <?php print render($page['header_menu']); ?>
</nav>
</div>
</div>
</div>
</div>
</header>
