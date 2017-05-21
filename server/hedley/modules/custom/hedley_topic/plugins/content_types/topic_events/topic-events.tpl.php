<?php

/**
 * @file
 * Topic events.
 */
?>
<div class="ui four column grid cards">
  <h3 class="ui purple header"><?php print t('Events'); ?></h3>

  <?php foreach ($events as $event): ?>
    <div class="card column event">
      <div class="content">
        <?php if ($event['image_url']): ?>
          <div class="ui tiny image <?php print $event['float_direction']; ?> floated">
            <img src="<?php print $event['image_url']; ?>">
          </div>
        <?php endif; ?>
        <a href="<?php print $event['url']; ?>" class="header"><?php print $event['title']; ?></a>
        <div class="meta">
          <?php print $event['date_start']; ?>
          <?php
          if ($event['date_end']) {
            print t('to') . ' ' . $event['date_end'];
          }
          ?>
        </div>
      </div>
    </div>
  <?php endforeach; ?>
</div>
