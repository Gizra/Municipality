<?php

/**
 * @file
 * FAQs accordion template.
 */
?>
<div class="featured-box featured-box-primary">
  <div class="box-content">
    <h2><?php print t('Frequently asked questions'); ?></h2>
    <div class="panel-group" id="accordion">
      <?php foreach ($faqs as $index => $faq): ?>
      <div class="panel panel-default thumb-info">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse-<?php print $index; ?>">
              <?php print $faq['question']; ?>
            </a>
          </h4>
        </div>
        <div id="collapse-<?php print $index; ?>" class="accordion-body collapse">
          <div class="panel-body">
            <?php print $faq['answer']; ?>
          </div>
        </div>
        <?php if ($faq['edit_url']): ?>
          <span class="thumb-info-action">
            <span class="thumb-info-action-icon"><a href="<?php print $faq['edit_url']; ?>" class="btn btn-primary btn-xs"><?php print t('Edit'); ?></a></span>
          </span>
        <?php endif; ?>
      </div>
      <?php endforeach; ?>
    </div>
  </div>
</div>
