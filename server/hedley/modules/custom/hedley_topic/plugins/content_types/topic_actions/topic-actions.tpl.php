<?php

/**
 * @file
 * Topic actions.
 */
?>
<div class="featured-box featured-box-quaternary">
  <div class="box-content">
    <div class="row">
      <h2><?php print t('What do you want to do?'); ?></h2>
    </div>
    <div class="row">
      <?php foreach ($actions as $action): ?>
        <?php print $action['title']; ?>
      <?php endforeach; ?>
    </div>
  </div>
</div>
