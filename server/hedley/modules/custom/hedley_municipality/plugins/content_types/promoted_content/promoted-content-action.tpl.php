<?php

/**
 * @file
 * Actions promoted-content template.
 */
?>
<?php foreach ($items as $item): ?>
  <div class="item action homepage-teaser thumb-info">
    <div class="content">
      <h3 class="header"><?php print $item['title']; ?></h3>
      <div class="description"></div>
    </div>
    <?php if ($item['edit_url']): ?>
      <span class="thumb-info-action">
        <span class="thumb-info-action-icon"><a href="<?php print $item['edit_url']; ?>" class="btn btn-xs btn-quaternary btn-edit"><?php print t('Edit'); ?></a></span>
      </span>
    <?php endif; ?>
  </div>
<?php endforeach; ?>
