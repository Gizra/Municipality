<?php

/**
 * @file
 * Events promoted-content template.
 */
?>
<?php foreach ($items as $item): ?>
  <div class="item event homepage-teaser">
    <div class="ui tiny image">
      <img class="ui image thumbnail" src="<?php print $item['image_url']; ?>">
    </div>
    <div class="middle aligned content">
      <h3 class="header"><?php print $item['title']; ?></h3>
      <div class="description">
        <?php print $item['date']; ?>
      </div>
    </div>
  </div>
<?php endforeach; ?>
