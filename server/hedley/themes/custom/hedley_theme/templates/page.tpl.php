<?php
/**
 * @file
 * Page template.
 */
?>

<div class="ui menu <?php print $fixed_navbar; ?>">
  <?php if ($logo): ?>
    <a class="item logo" href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>">
      <img class="ui" src="<?php print $logo; ?>" alt="<?php print t('Home'); ?>" />
    </a>
  <?php endif; ?>

  <h1>
    <a class="item" href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>"><?php print $site_name; ?></a>
  </h1>

  <?php if (!empty($primary_navigation)): ?>
    <div class="right menu">
      <?php print render($primary_navigation); ?>
    </div>
  <?php endif; ?>
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

      <?php if ($breadcrumb): ?>
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
