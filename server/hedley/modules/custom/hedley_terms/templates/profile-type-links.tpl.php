<?php

/**
 * @file
 * Profile type links template.
 */
?>
<div class="ui <?php print $count_class; ?> item menu">
  <?php foreach ($links as $link): ?>
    <a
      class="item <?php if ($link['active']): ?>active<?php endif; ?>"
      href="<?php print $link['url']; ?>"
    >
      <?php print $link['label']; ?>
    </a>
  <?php endforeach; ?>
</div>
