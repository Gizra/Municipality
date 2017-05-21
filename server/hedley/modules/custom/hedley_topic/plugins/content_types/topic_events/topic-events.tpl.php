<?php

/**
 * @file
 * Topic events.
 */
?>
<div class="ui four width column cards">
  <h3 class="ui purple header"><?php print t('Events'); ?></h3>

  <?php foreach ($events as $event): ?>
    <div class="card event">
      <div class="content">
        <?php if ($event['image_url']): ?>
          <div class="ui tiny image <?php print $event['float_direction']; ?> floated">
            <img src="<?php print $event['image_url']; ?>">
          </div>
        <?php endif; ?>
        <a href="<?php print $event['url']; ?>" class="header"><?php print $event['title']; ?></a>
        <div class="meta">
          <?php print t('@date_start to @date_end',['@date_start' => $event['date_start'], '@date_end' => $event['date_end']]); ?>
        </div>
      </div>
    </div>
  <?php endforeach; ?>
</div>
