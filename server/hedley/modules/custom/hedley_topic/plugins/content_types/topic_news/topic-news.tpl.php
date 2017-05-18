<?php

/**
 * @file
 * Topic news.
 */
?>
<div class="ui grid container">
  <div class="centered row">
    <h3 class="ui purple header"><?php print t('News regarding @topic', ['@topic' => $title]); ?></h3>
  </div>

  <?php foreach ($news_items as $item): ?>
    <div class="ui positive message row">
      <?php print $item['title']; ?>
      <?php print $item['read_more']; ?>
    </div>
  <?php endforeach; ?>
</div>
