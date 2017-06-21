<?php

/**
 * @file
 * News content template.
 */
?>

<div class="row text-center">
  <div class="col-xs-12">
    <div class="panel panel-default">
      <div class="panel-body">

        <h2><?php print t('News and Updates'); ?></h2>

      </div>
    </div>
  </div>
</div>

<div class="row text-center">
  <div class="col-xs-12">
    <div class="panel panel-default">
      <div class="panel-body">

        <h3 class="text-color-tertiary"><?php print $title; ?></h3>

        <small>
          <?php print $published_date; ?>
        </small>

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
