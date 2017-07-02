<?php

/**
 * @file
 * Social links field template.
 */
?>
<ul class="header-social-icons social-icons">
  <?php foreach ($items as $item): ?>
    <li class="social-icons-<?php if(!empty($item['#element']['title'])): ?><?php print strtolower($item['#element']['title']); ?><?php endif; ?>">
      <a
        title="<?php print $item['#element']['title']; ?>"
        class="ui circular button "
        href="<?php print $item['#element']['url']; ?>"
      >
        <i class="fa fa-<?php if(!empty($item['#element']['title'])): ?><?php print strtolower($item['#element']['title']); ?><?php endif; ?>"></i>
      </a>
    </li>
  <?php endforeach; ?>
</ul>
