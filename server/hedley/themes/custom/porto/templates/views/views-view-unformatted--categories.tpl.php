<?php

/**
 * @file views-view-unformatted--Porto-view.tpl.php
 * Porto's custom view unformatted template for all views tagged with "Porto Views".
 *
 * @ingroup views_templates
 */
?>

<?php foreach ($rows as $id => $row): ?>
  <li><?php print $row; ?></li>
<?php endforeach; ?>