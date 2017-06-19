<?php

/**
 * @file
 * Page content template.
 */
?>

<div class="row text-center">
  <div class="col-xs-12">
    <div class="panel panel-default">
      <div class="panel-body">
        <h2><?php print $title; ?></h2>
      </div>
    </div>
  </div>
</div>

<div class="row text-center">
  <div class="col-xs-12">
    <div class="panel panel-default">
      <div class="panel-body">
        <small><?php print $published_date; ?></small>
        <?php if ($body): ?>
          <div class="panel panel-default">
            <div class="panel-body">
              <?php print $body; ?>
            </div>
          </div>
        <?php endif; ?>
      </div>
    </div>
  </div>
</div>
