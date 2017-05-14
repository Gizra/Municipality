<?php

/**
 * @file
 * User type links template.
 */
?>
<div class="ui <?php print $count_class; ?> item menu">
  <?php foreach ($links as $link): ?>
    <a
      class="item <?php print $link['active'] ? 'active' : ''; ?>"
      href="<?php print $link['url']; ?>"
    >
      <?php print $link['label']; ?>
    </a>
  <?php endforeach; ?>
</div>
