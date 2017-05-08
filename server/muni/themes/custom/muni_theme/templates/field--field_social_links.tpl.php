<?php

/**
 * @file
 * Social links field template.
 */
?>
<?php foreach ($items as $item): ?>
  <a
    class="ui circular button <?php if(!empty($item['#element']['attributes']['class'])): ?><?php print $item['#element']['attributes']['class']; ?><?php endif; ?>"
    title="<?php print $item['#element']['title']; ?>"
    href="<?php print $item['#element']['url']; ?>"
  >
    <?php if(!empty($item['#element']['attributes']['class'])): ?>
      <i class="<?php print $item['#element']['attributes']['class']; ?>"></i>
    <?php else: ?>
      <?php print $item['#element']['title']; ?>
    <?php endif; ?>
  </a>
<?php endforeach; ?>
