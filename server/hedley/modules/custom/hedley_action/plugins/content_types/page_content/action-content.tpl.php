<?php

/**
 * @file
 * Action content template.
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

<div class="panel panel-default">
  <div class="panel-body">
    <?php foreach ($sections as $section): ?>
      <div class="row">
        <div class="col-xs-12">
          <i class="fa fa-<?php print $section['icon']; ?>"></i>
          <?php print $section['title']; ?>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-12">
          <?php print $section['description']; ?>
        </div>
      </div>
      <hr>
    <?php endforeach; ?>
  </div>
</div>
