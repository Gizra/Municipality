<header id="header" class="header-mobile-nav-only" data-plugin-options='{"stickyEnabled": true, "stickyEnableOnBoxed": true, "stickyEnableOnMobile": true, "stickyStartAt": 57, "stickySetTop": "-57px", "stickyChangeLogo": true}'>
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
                        <div class="header-nav header-nav-top-line">
                            <button class="btn header-btn-collapse-nav" data-toggle="collapse" data-target=".header-nav-main">
                                <i class="fa fa-bars"></i>
                            </button>
                            <?php print render($page['header_icons']); ?>
                            <?php if($page['header_menu']):?>
                            <div class="header-nav-main header-nav-main-square header-nav-main-effect-3 header-nav-main-sub-effect-1 collapse">
                                <nav>
                                    <?php print render($page['header_menu']); ?>
                                </nav>
                            </div>
                            <?php endif;?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>


