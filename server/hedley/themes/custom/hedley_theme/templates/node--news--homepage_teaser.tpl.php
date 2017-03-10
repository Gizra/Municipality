<?php

/**
 * @file
 * News node homepage-teaser template.
 */
?>
<div class="item news homepage-teaser">
  <div class="ui tiny image">
    <?php print render($content['field_image']); ?>
  </div>
  <div class="content">
    <div class="header">
      <?php print render($content['title_field']); ?>
    </div>
  </div>
</div>
