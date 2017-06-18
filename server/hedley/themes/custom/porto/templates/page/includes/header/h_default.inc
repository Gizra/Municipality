<header id="header" data-plugin-options='{"stickyEnabled": true, "stickyEnableOnBoxed": true, "stickyEnableOnMobile": true, "stickyStartAt": 57, "stickySetTop": "-57px", "stickyChangeLogo": true}'>
<div class="header-body">
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
<div class="header-row">
    <?php if (isset($page['header_search'])) : ?>
        <div class="header-search hidden-xs">
            <?php print render($page['header_search']); ?>
        </div>
    <?php endif; ?>

    <nav class="header-nav-top">
        <ul class="nav nav-pills">
            <?php $about_us = theme_get_setting('about_us');
            $contact_us = theme_get_setting('contact_us');
            $phone_number = theme_get_setting('phone_number');

            ?>
            <?php if(isset($about_us)):?>
                <li class="hidden-xs">
                    <a href="<?php print theme_get_setting('about_us_link');?>"><i class="fa fa-angle-right"></i> <?php print $about_us;?></a>
                </li>
            <?php endif;?>
            <?php if(isset($contact_us)):?>
                <li class="hidden-xs">
                    <a href="<?php print theme_get_setting('contact_us_link');?>"><i class="fa fa-angle-right"></i> <?php print $contact_us;?></a>
                </li>
            <?php endif;?>
            <?php if(isset($phone_number)):?>
                <li class="hidden-xs">
                    <span class="ws-nowrap"><i class="fa fa-phone"></i> <?php print $phone_number;?></span>
                </li>
            <?php endif;?>
        </ul>
    </nav>

    <?php print render($page['header_top']); ?>

</div>
<div class="header-row">
<div class="header-nav">
<button class="btn header-btn-collapse-nav" data-toggle="collapse" data-target=".header-nav-main">
    <i class="fa fa-bars"></i>
</button>
<?php print render($page['header_icons']); ?>

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

