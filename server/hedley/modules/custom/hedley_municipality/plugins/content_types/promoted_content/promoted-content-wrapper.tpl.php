<?php

/**
 * @file
 * Promoted content template.
 */
?>
<div class="<?php print $items_class; ?> featured-box featured-box-primary">
  <div class="box-content">
    <div class="row">
      <h2><?php print $title; ?></h2>
    </div>
    <div class="row">
      <?php print $content; ?>
    </div>
    <div class="row">
      <?php print $all_nodes_link; ?>
    </div>
  </div>
</div>
