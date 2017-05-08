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
      <a
        class="ui button"
        href="<?php print $action['href']; ?>"
        target="<?php print $action['target']; ?>"
      >
        <?php print $action['title']; ?>
      </a>
    <?php endforeach; ?>
  </div>
</div>
