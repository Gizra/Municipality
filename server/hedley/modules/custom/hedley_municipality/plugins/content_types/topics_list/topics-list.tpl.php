<?php

/**
 * @file
 * Topics list template.
 */
?>
<div class="row">
  <div class="col-md-12">
    <div class="divider"></div>
  </div>
</div>
<div class="row">
  <div class="col-md-12">
    <h2 class="center"><?php print $title; ?></h2>
    <p>
      <?php foreach ($topics as $topic): ?>
        <a href="<?php print $topic['link']; ?>" title="<?php print $topic['title']; ?>">
          <button class="btn btn-borders btn-<?php print $topic['color']; ?> mr-xs mb-sm">
            <?php print $topic['title']; ?>
          </button>
        </a>
      <?php endforeach; ?>
    </p>
  </div>
</div>
