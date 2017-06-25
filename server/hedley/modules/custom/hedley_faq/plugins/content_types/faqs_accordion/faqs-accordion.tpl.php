<?php

/**
 * @file
 * FAQs accordion template.
 */
?>
<div class="featured-box featured-box-primary">
  <div class="box-content">
    <h2><?php print t('Frequently asked questions'); ?></h2>
    <div class="toggle toggle-primary" data-plugin-toggle>
      <?php foreach ($faqs as $faq): ?>
        <section class="toggle">
          <label>
            <?php print $faq['question']; ?>
          </label>
          <?php print $faq['answer']; ?>
        </section>
      <?php endforeach; ?>
    </div>
  </div>
</div>
