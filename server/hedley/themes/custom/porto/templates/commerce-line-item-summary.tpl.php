<?php
/**
 * @file commerce-line-item-summary.tpl.php
 *
 * Available variables:
 * - $quantity_raw: The number of items in the cart.
 * - $quantity_label: The quantity appropriate label to use for the number of
 *   items in the shopping cart; "item" or "items" by default.
 * - $quantity: A single string containing the number and label.
 * - $total_raw: The raw numeric value of the total value of items in the cart.
 * - $total_label: A text label for the total value; "Total:" by default.
 * - $total: The currency formatted total value of items in the cart.
 * - $links: A rendered links array with cart and checkout links.
 *
 * Helper variables:
 * - $view: The View the line item summary is attached to.
 *
 * @see template_preprocess()
 * @see template_process()
 */
?>
<div class="line-item-summary">
  <a href="<?php global $base_url; echo $base_url; ?>/cart" class="greytext">
  <span class="cart-head">
  <?php if ($quantity_raw): ?>
  <?php print $quantity_raw; ?> <?php print $quantity_label; ?>:
   <?php endif; ?>
  <?php if ($total): ?>
  <span class="cart-total-wrap"><?php print $total_label; ?></span> <?php print $total; ?>
  </span>
  </a>
  <?php endif; ?>
  <?php print $links; ?>
</div>