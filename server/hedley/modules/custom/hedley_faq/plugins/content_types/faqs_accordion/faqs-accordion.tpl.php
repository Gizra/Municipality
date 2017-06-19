<?php

/**
 * @file
 * FAQs accordion template.
 */
?>
<div class="featured-box featured-box-primary">
  <div class="box-content">
    <h2><?php print t('Frequently asked questions'); ?></h2>
    <div id="accordion" class="panel-group">
      <?php foreach ($faqs as $index => $faq): ?>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse-<?php print $index; ?>">
                <?php print $faq['question']; ?>
              </a>
            </h4>
          </div>
          <div id="collapse-<?php print $index; ?>" class="accordion-body collapse">
            <div class="panel-body">
              <p><?php print $faq['answer']; ?></p>
            </div>
          </div>
        </div>
      <?php endforeach; ?>
    </div>
  </div>
</div>
