<?php

/**
 * @file
 * Elm template for blocks.
 */
if ($show_as_block) : ?>
  <div class="featured-box featured-box-quaternary">
    <div class="box-content">
      <div class="row">
        <h2><?php print $title; ?></h2>
      </div>
      <div class="row">
        <div id="<?php print $app_id; ?>"></div>
      </div>
    </div>
  </div>

<?php else: ?>
  <div id="<?php print $app_id; ?>"></div>
<?php endif; ?>
