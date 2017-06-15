<?php

/**
 * @file
 * User type links template.
 */
?>
<div class="btn-group user-types" role="group">
  <?php foreach ($links as $link): ?>
    <a
      class="btn btn-default <?php print $link['active'] ? 'active' : ''; ?>"
      href="<?php print $link['url']; ?>"
    >
      <?php print $link['label']; ?>
    </a>
  <?php endforeach; ?>
</div>
