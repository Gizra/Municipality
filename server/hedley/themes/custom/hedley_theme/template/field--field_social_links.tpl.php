<?php

/**
 * @file
 * Social links field template.
 */
?>
<ul class="social-icons">
  <?php foreach ($items as $item): ?>
    <li class="social-icons-<?php if(!empty($item['#element']['attributes']['class'])): ?><?php print $item['#element']['attributes']['class']; ?><?php endif; ?>">
      <a
        class="ui circular button "
        title="<?php print $item['#element']['title']; ?>"
        href="<?php print $item['#element']['url']; ?>"
      >
        <i class="fa fa-<?php if(!empty($item['#element']['attributes']['class'])): ?><?php print $item['#element']['attributes']['class']; ?><?php endif; ?>"></i>
      </a>
    </li>
  <?php endforeach; ?>
</ul>
