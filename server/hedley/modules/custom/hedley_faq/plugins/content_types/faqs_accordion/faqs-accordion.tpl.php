<?php

/**
 * @file
 * FAQs accordion template.
 */

?>
<div class="ui styled fluid accordion">
  <?php foreach ($faqs as $faq): ?>
    <div class="title">
      <i class="dropdown icon"></i>
      <?php print $faq['question']; ?>
    </div>
    <div class="content">
      <?php print $faq['answer']; ?>
    </div>
  <?php endforeach; ?>
</div>