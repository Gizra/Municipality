<?php

/**
 * @file
 * Topic events.
 */
?>
<div class="four width column">
  <h3 class="ui purple header"><?php print t('Events'); ?></h3>

  <?php foreach ($events as $event): ?>
    <div class="item event">
      <?php if ($event['image_url']): ?>
        <a class="ui tiny image">
          <img src="<?php print $event['image_url']; ?>">
        </a>
      <?php endif; ?>
      <div class="middle aligned content">
        <a class="header"><?php print $event['title']; ?></a>
        <p>
          <?php print $event['date_start']; ?>
        </p>
        <p><?php print t('to') ?></p>
        <p>
          <?php print $event['date_end']; ?>
        </p>
      </div>
    </div>
  <?php endforeach; ?>
</div>