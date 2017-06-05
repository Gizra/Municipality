<?php

/**
 * @file
 * News promoted-content template.
 */
?>
<?php foreach ($items as $item): ?>
  <div class="item news homepage-teaser">
    <div class="ui tiny image">
      <img class="ui image thumbnail" src="<?php print $item['image_url']; ?>">
    </div>
    <div class="content">
      <h3 class="header"><?php print $item['title']; ?></h3>
    </div>
  </div>
<?php endforeach; ?>
