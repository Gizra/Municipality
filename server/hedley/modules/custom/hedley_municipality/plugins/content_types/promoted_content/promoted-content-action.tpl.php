<?php

/**
 * @file
 * Actions promoted-content template.
 */
?>
<?php foreach ($items as $item): ?>
  <div class="item action homepage-teaser">
    <div class="content">
      <h3 class="header"><?php print $item['title']; ?></h3>
      <div class="description"></div>
    </div>
  </div>
<?php endforeach; ?>
