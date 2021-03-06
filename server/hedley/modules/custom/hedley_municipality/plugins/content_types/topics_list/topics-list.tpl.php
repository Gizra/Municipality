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

<div class="col-md-12">
  <h2 class="center"><?php print $title; ?></h2>
  <p>
    <?php foreach ($topics as $topic): ?>
      <a href="<?php print $topic['link']; ?>" title="<?php print $topic['label']; ?>" class="btn btn-borders btn-<?php print $topic['color']; ?> mr-xs mb-sm">
        <?php print $topic['label']; ?>
      </a>
    <?php endforeach; ?>
    <?php if ($add_term_url): ?>
      <a href="<?php print $add_term_url; ?>" title="<?php print t('Add a new topic'); ?>" class="pull-right btn btn-primary btn-xs mb-sm"">
        <?php print t('Add a new topic'); ?>
      </a>
    <?php endif; ?>
  </p>
</div>
