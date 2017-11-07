<?php

/**
 * @file
 * Topic news.
 */
?>

<div class="featured-box featured-box-primary">
  <div class="box-content">
    <div class="row">
      <h2><?php print t('News regarding @topic', ['@topic' => $title]); ?></h2>
    </div>
    <div class="row">
      <?php foreach ($news_items as $item): ?>
        <section class="call-to-action with-borders mb-xl thumb-info">
          <div class="call-to-action-content align-left">
            <h3><?php print $item['title']; ?></h3>
          </div>
          <div class="call-to-action-btn">
            <?php print $item['read_more']; ?>
          </div>
          <?php if ($item['edit_url']): ?>
            <span class="thumb-info-action">
              <span class="thumb-info-action-icon"><a href="<?php print $item['edit_url']; ?>" class="btn btn-primary btn-xs btn-edit"><?php print t('Edit'); ?></a></span>
            </span>
          <?php endif; ?>
        </section>
      <?php endforeach; ?>
    </div>
  </div>
</div>
