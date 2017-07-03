<header id="header" data-plugin-options='{"stickyEnabled": true, "stickyEnableOnBoxed": true, "stickyEnableOnMobile": true, "stickyStartAt": 57, "stickySetTop": "-57px", "stickyChangeLogo": true}'>
  <div class="header-body">
    <div class="container">
      <div class="row">
        <div class="col-md-3 col-xs-12">
          <?php if (isset($page['branding'])) : ?>
            <?php print render($page['branding']); ?>
          <?php endif; ?>
          <?php if ($logo): ?>
            <div class="header-logo logo">
              <a href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>" rel="home" id="logo">
                <img alt="<?php print t('Home'); ?>" height="<?php print theme_get_setting('logo_height'); ?>" data-sticky-width="100" data-sticky-height="<?php print theme_get_setting('sticky_logo_height'); ?>" data-sticky-top="33" src="<?php print $logo; ?>">
              </a>
            </div>
          <?php endif; ?>
        </div>
        <div class="col-md-6 col-xs-12 center">
          <?php if ($site_name || $site_slogan): ?>
            <div id="name-and-slogan"<?php if ($disable_site_name && $disable_site_slogan) { print ' class="hidden"'; } ?>>

              <?php if ($site_name): ?>
                <?php if ($title): ?>
                  <div id="site-name"<?php if ($disable_site_name) { print ' class="hidden"'; } ?>>
                    <h1 class="text-primary"><?php print $site_name; ?></h1>
                  </div>
                <?php else: ?>
                  <h1 id="site-name"<?php if ($disable_site_name) { print ' class="hidden"'; } ?>>
                    <a href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>" rel="home"><h1 class="text-primary"><?php print $site_name; ?></h1></a>
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
        <div class="col-md-3 col-xs-12 align-right">
            <?php if (isset($page['header_search'])) : ?>
              <div class="header-search hidden-xs">
                <?php print render($page['header_search']); ?>
              </div>
            <?php endif; ?>

            <nav class="header-nav-top">
              <ul class="nav nav-pills">
                <?php if (isset($accessibility_url)): ?>
                  <li>
                    <a href="<?php print $accessibility_url; ?>">
                      <i class="fa fa-wheelchair fa-2"></i>
                    </a>
                  </li>
                <?php endif; ?>
                <li>
                  <a href="#" class="change-font-size plus"><i class="fa fa-plus"></i></a>
                  <i class="fa fa-font"></i>
                  <a href="#" class="change-font-size minus"><i class="fa fa-minus"></i></a>
                </li>
              </ul>
            </nav>

            <?php print render($page['header_top']); ?>
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
  <div class="container">
    <div class="divider divider-small dashed"></div>
    <div class="row">
      <div class="col-md-3 col-xs-12 mb-sm align-left">
        <?php if ($user_type_links): ?>
          <?php print $user_type_links; ?>
        <?php endif; ?>
      </div>

      <div class="col-md-6 col-xs-12 mb-sm center">
        <?php print render($social_links); ?>
      </div>

      <div class="col-md-3 col-xs-12 mb-sm align-right">
        <?php if ($language_switch_links) : ?>
          <div class="languages btn-group" role="group">
            <?php foreach ($language_switch_links as $link): ?>
              <?php print $link; ?>
            <?php endforeach; ?>
          </div>
        <?php endif; ?>
      </div>
    </div>
  </div>
</header>
