<?php
/**
 * @file
 * Page template.
 */
?>

<div class="ui menu <?php print $fixed_navbar; ?>">
  <?php if (!empty($primary_navigation)): ?>
    <div class="right menu">
      <?php print render($primary_navigation); ?>
    </div>
  <?php endif; ?>
</div>

<div class="ui centered grid container">
  <div class="ui row">
    <div class="ui four wide column">
      <?php if ($logo): ?>
        <a class="item logo" href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>">
          <img class="ui" src="<?php print $logo; ?>" alt="<?php print t('Home'); ?>" />
        </a>
      <?php endif; ?>
    </div>

    <div class="ui eight wide center aligned middle aligned column">
      <h2 class="ui header">
        <a href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>"><?php print $site_name; ?></a>
      </h2>
    </div>
    <div class="ui four wide center aligned middle aligned column">
      <div class="ui segments">
        <div class="ui vertical segment center aligned middle aligned">
          <?php if (isset($accessibility_url)): ?>
            <a href="<?php print $accessibility_url; ?>">
              <i class="large wheelchair icon"></i>
            </a>
          <?php endif; ?>

          <a href="#" class="change-font-size plus"><i class="plus icon"></i></a>
          <i class="font icon"></i>
          <a href="#" class="change-font-size minus"><i class="minus icon"></i></a>
        </div>

      </div>
    </div>
  </div>

  <div class="ui row">

    <div class="ui four wide column">
      <?php print $profile_type_links; ?>
    </div>

    <div class="ui eight wide center aligned column">
      <?php print render($social_links); ?>
    </div>

    <div class="ui four wide column">
      <div class="ui three item menu">
        <?php foreach ($language_switch_links as $link): ?>
          <?php print $link; ?>
        <?php endforeach; ?>
      </div>
    </div>
  </div>
</div>

<?php if (!empty($page['header'])): ?>
  <div class="top">
    <?php print render($page['header']); ?>
  </div>
<?php endif; ?>

<div class="ui container">
  <div class="ui stackable grid">

    <?php if (!empty($page['sidebar_first'])): ?>
      <aside class="<?php print $sidebar_left; ?> sidebars sidebar-first" role="complementary">
        <?php print render($page['sidebar_first']); ?>
      </aside>
    <?php endif; ?>

    <section class="<?php print $main_grid; ?> main" role="main">
      <?php if (!empty($page['highlighted'])): ?>
        <div class="highlighted ui massive message"><?php print render($page['highlighted']); ?></div>
      <?php endif; ?>

      <?php print render($secondary_navigation); ?>

      <?php if (!empty($breadcrumb)): ?>
        <?php print $breadcrumb; ?>
      <?php endif; ?>

      <a id="main-content"></a>
      <?php print render($title_prefix); ?>
      <?php print render($title_suffix); ?>
      <?php print $messages; ?>
      <?php if (!empty($tabs['#primary'])): ?>
        <?php print render($tabs_primary); ?>
      <?php endif; ?>

      <?php if (!empty($page['help'])): ?>
        <?php print render($page['help']); ?>
      <?php endif; ?>
      <?php if (!empty($action_links)): ?>
        <?php print render($action_links); ?><div class="ui hidden divider"></div>
      <?php endif; ?>

      <?php print render($tabs_secondary); ?>
      <?php print render($page['content']); ?>

    </section>

      <?php if (!empty($page['sidebar_second'])): ?>
      <aside class="<?php print $sidebar_right; ?> sidebars sidebar-last" role="complementary">
        <?php print render($page['sidebar_second']); ?>
      </aside>
      <?php endif; ?>

  </div> 
</div>

<?php if (!empty($page['footer'])): ?>
  <div class="ui divider"></div>
  <div class="ui grid container">
    <div class="column">
      <?php print render($page['footer']); ?>
    </div>
  </div>
<?php endif; ?>
