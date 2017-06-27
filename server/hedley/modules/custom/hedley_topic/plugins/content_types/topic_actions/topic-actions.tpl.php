<?php

/**
 * @file
 * Topic actions.
 */
?>
<div class="ui center aligned column">
  <h3 class="ui purple centered header"></h3>
  <div class="ui basic primary buttons">



  </div>
</div>


<div class="featured-box featured-box-primary">
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
