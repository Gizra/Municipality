<?php

/**
 * @file
 * Action content template.
 */
?>

<div class="row text-center">
  <div class="col-xs-12">
    <h2><?php print t('Events'); ?></h2>
  </div>
</div>

<div class="panel panel-default">
  <div class="row text-center">
    <div class="col-xs-12">
      <h1><?php print $title; ?></h1>
    </div>
  </div>
  <div class="panel-body text-center">
    <span class="img-thumbnail">
      <img class="img-responsive" src="<?php print $image_url; ?>" alt="<?php print $title; ?>">
    </span>
  </div>
</div>
