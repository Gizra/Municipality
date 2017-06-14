<?php

/**
 * @file
 * Topic actions.
 */
?>
<div class="ui center aligned column">
  <h3 class="ui purple centered header"><?php print t('What do you want to do?'); ?></h3>
  <div class="ui basic primary buttons">
    <?php foreach ($actions as $action): ?>
      <?php print $action['title']; ?>
    <?php endforeach; ?>
  </div>
</div>
