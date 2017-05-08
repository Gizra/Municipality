<?php

/**
 * @file
 * Topic hardcopy forms.
 */
?>
<div class="ui aligned column">
  <h3 class="ui purple centered header"><?php print t('Download forms'); ?></h3>
  <div class="ui basic primary buttons">
    <?php foreach ($hardcopy_forms as $form): ?>
      <a
        class="ui button" target="_blank"
        href="<?php print $form['file_url']; ?>"
        download="<?php print $form['filename']; ?>"
      >
        <i class="file icon"></i>
        <?php print $form['title']; ?>
      </a>
    <?php endforeach; ?>
  </div>
</div>
