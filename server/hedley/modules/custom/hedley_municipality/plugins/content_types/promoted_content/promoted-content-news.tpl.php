<?php

/**
 * @file
 * News promoted-content template.
 */
?>
<?php foreach ($items as $item): ?>
  <div class="testimonial testimonial-primary">
    <div class="testimonial-author">
      <?php if ($item['image_url']): ?>
        <div class="testimonial-author-thumbnail img-thumbnail">
          <img src="<?php print $item['image_url']; ?>">
        </div>
      <?php endif; ?>
      <h3 class="header"><?php print $item['title']; ?></h3>
    </div>
  </div>
<?php endforeach; ?>
