<?php

/**
 * @file
 * Social links field template.
 */
?>
<ul class="social-icons">
  <?php foreach ($items as $item): ?>
    <li class="social-icons-<?php if(!empty($item['#element']['title'])): ?><?php print strtolower($item['#element']['title']); ?><?php endif; ?>">
      <a title="<?php if(!empty($item['#element']['title'])): ?><?php print $item['#element']['title']; ?><?php endif; ?>" href="<?php print $item['#element']['url']; ?>">
        <i class="fa fa-<?php if(!empty($item['#element']['title'])): ?><?php print strtolower($item['#element']['title']); ?><?php endif; ?>"></i>
      </a>
    </li>
  <?php endforeach; ?>
</ul>
