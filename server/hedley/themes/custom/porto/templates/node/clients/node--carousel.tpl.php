<?php

$image_slide = "";

if ($items = field_get_items('node', $node, 'field_image')) {
  if (count($items) == 1) {
    $image_slide = 'false';
  }
  elseif (count($items) > 1) {
    $image_slide = 'true';
  }
}

$img_count = 0;
$counter = count($items);

?>

<?php if ( ($image_slide == 'true') ): ?>
  <?php while ($img_count < $counter) { ?>
    <div>
      <img class="img-responsive" src="<?php echo file_create_url($node->field_image['und'][$img_count]['uri']); ?>" alt="item">
   </div> 
  <?php $img_count++; } ?>		   
<?php endif; ?>
		
<?php if ($image_slide == 'false'): ?>
  <?php print render($content['field_image']); ?>
<?php endif; ?>

