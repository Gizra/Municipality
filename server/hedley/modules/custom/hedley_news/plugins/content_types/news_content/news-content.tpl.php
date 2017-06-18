<?php

/**
 * @file
 * News content template.
 */
?>

<div class="row text-center">
  <div class="col-xs-12">
    <h2><?php print t('News and Updates'); ?></h2>
  </div>
</div>

<div class="row text-center">
  <div class="col-xs-12">
    <h3><?php print $title; ?></h3>

    <small>
      <?php print t('Published on: @date', ['@date' => $published_date]); ?>
    </small>
  </div>
</div>

<div class="row">
  <div class="col-xs-12">
    <p>
      <?php print $body; ?>
    </p>
  </div>
</div>
