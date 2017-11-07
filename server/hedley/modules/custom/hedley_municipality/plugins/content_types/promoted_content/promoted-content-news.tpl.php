<?php

/**
 * @file
 * News promoted-content template.
 */
?>
<?php foreach ($items as $item): ?>
  <div class="testimonial testimonial-primary thumb-info">
    <div class="testimonial-author">
      <?php if ($item['image_url']): ?>
        <div class="testimonial-author-thumbnail img-thumbnail">
          <img src="<?php print $item['image_url']; ?>">
        </div>
      <?php endif; ?>
      <h3 class="header"><?php print $item['title']; ?></h3>
      <?php if ($item['edit_url']): ?>
      <span class="thumb-info-action">
        <span class="thumb-info-action-icon"><a href="<?php print $item['edit_url']; ?>" class="btn btn-primary btn-xs btn-edit"><?php print t('Edit'); ?></a></span>
      </span>
      <?php endif; ?>
    </div>
  </div>
<?php endforeach; ?>
