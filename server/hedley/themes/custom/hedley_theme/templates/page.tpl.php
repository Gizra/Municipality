<?php
/**
 * @file
 * Page template.
 */
?>
<div class="background" <?php if (isset($background_image_url)): ?>style="background-image: url('<?php print $background_image_url; ?>'); background-size: cover;"<?php endif; ?>>
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
          <div class="ui segment center aligned middle aligned">

          </div>

        </div>
      </div>
    </div>

    <div class="row">
      <?php if ($user_type_links): ?>
        <div class="col-md-4">
          <?php print $user_type_links; ?>
        </div>
      <?php endif; ?>

      <div class="col-md-6">
        <?php print render($social_links); ?>
      </div>

      <div class="col-md-4">
        <?php if ($language_switch_links) : ?>
          <div class="ui <?php print $language_switch_links_class?> item menu languages">
            <?php foreach ($language_switch_links as $link): ?>
              <?php print $link; ?>
            <?php endforeach; ?>
          </div>
        <?php endif; ?>
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

    <footer class="ui inverted vertical footer segment">
      <div class="ui grid container">
        <div class="row">
          <div class="right floated ten wide column list">
            <?php if (isset($accessibility_url)): ?>
              <a href="<?php print $accessibility_url; ?>" class="item"><?php print t('Accessibility'); ?></a>
            <?php endif; ?>
            <?php if (isset($terms_url)): ?>
              <a href="<?php print $terms_url; ?>" class="item"><?php print t('Terms of use'); ?></a>
            <?php endif; ?>
          </div>
          <?php if (isset($last_updated)): ?>
          <div class="left aligned six wide column">
            <?php print t('Last updated at @last_updated', ['@last_updated' => $last_updated]); ?>
          </div>
          <?php endif; ?>
        </div>
        <?php if (!empty($footer_text)): ?>
          <div class="centered row">
            <?php print $footer_text; ?>
          </div>
        <?php endif; ?>
      </div>
    </footer>
  </div>
</div>
