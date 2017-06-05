<?php

/**
 * @file
 * Actions promoted-content template.
 */
?>
<?php foreach ($items as $item): ?>
  <div class="item action homepage-teaser">
    <div class="header">
      <h3><?php print $item['title']; ?></h3>
    </div>
    <div class="description"></div>
  </div>
<?php endforeach; ?>
