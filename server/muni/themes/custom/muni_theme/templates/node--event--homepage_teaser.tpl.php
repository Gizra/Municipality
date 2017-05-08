<?php

/**
 * @file
 * Event node homepage-teaser template.
 */
?>
<div class="item event homepage-teaser">
  <div class="ui tiny image">
    <?php print render($content['field_image']); ?>
  </div>
  <div class="middle aligned content">
    <?php print render($content['title_field']); ?>
    <?php print render($content['field_date']); ?>
  </div>
</div>