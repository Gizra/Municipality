<?php

/**
 * @file
 * Topic news.
 */
?>

<div class="featured-box featured-box-primary">
  <div class="box-content">
    <div class="row">
      <h2><?php print t('News and Updates'); ?></h2>
    </div>
    <div class="row">
      <?php foreach ($news_items as $item): ?>
        <section class="call-to-action with-borders mb-xl">
          <div class="call-to-action-content align-left">
            <h3><?php print $item['title']; ?></h3>
          </div>
          <div class="call-to-action-btn">
            <?php print $item['read_more']; ?>
          </div>
        </section>
      <?php endforeach; ?>
    </div>
  </div>
</div>
