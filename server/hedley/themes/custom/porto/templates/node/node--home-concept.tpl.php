<?php 

$image_slide = "";

if ($items = field_get_items('node', $node, 'field_circle_4_images')) {
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

<div class="home-concept">
	<div class="container">

		<div class="row center">
			<span class="sun"></span>
			<span class="cloud"></span>
			
			<?php if (render($content['field_circle_1_image'])): ?>
			<div class="col-md-2 col-md-offset-1">
				<div class="process-image" data-appear-animation="bounceIn">
				  <a href="<?php print strip_tags(render($content['field_circle_1_url'])); ?>">
					  <img src="<?php echo file_create_url($node->field_circle_1_image['und'][0]['uri']); ?>" alt="item">
				  </a>
					<strong><?php print strip_tags(render($content['field_circle_1_caption'])); ?></strong>
				</div>
			</div>
			<?php endif; ?>
			
			<?php if (render($content['field_circle_2_image'])): ?>
			<div class="col-md-2">
				<div class="process-image" data-appear-animation="bounceIn" data-appear-animation-delay="200">
					 <a href="<?php print strip_tags(render($content['field_circle_2_url'])); ?>">
					  <img src="<?php echo file_create_url($node->field_circle_2_image['und'][0]['uri']); ?>" alt="item">
				  </a>
					<strong><?php print strip_tags(render($content['field_circle_2_caption'])); ?></strong>
				</div>
			</div>
			<?php endif; ?>
			
			<?php if (render($content['field_circle_3_image'])): ?>
			<div class="col-md-2">
				<div class="process-image" data-appear-animation="bounceIn" data-appear-animation-delay="400">
					 <a href="<?php print strip_tags(render($content['field_circle_3_url'])); ?>">
					  <img src="<?php echo file_create_url($node->field_circle_3_image['und'][0]['uri']); ?>" alt="item">
				  </a>
					<strong><?php print strip_tags(render($content['field_circle_3_caption'])); ?></strong>
				</div>
			</div>
			<?php endif; ?>
			
			<?php if (render($content['field_circle_4_images'])): ?>
			<div class="col-md-4 col-md-offset-1">
				<div class="project-image">
				  <?php if ( ($image_slide == 'true') ): ?>
					<div id="fcSlideshow" class="fc-slideshow">
						<ul class="fc-slides">
						  <?php while ($img_count < $counter) { ?>
						    <li>
						      <a href="<?php print strip_tags(render($content['field_circle_4_url'])); ?>">
							      <img src="<?php echo file_create_url($node->field_circle_4_images['und'][$img_count]['uri']); ?>" alt="" >
						      </a>
						    </li>  
							<?php $img_count++; } ?>		  
						</ul>
					</div>
					<?php endif ?>
					<?php if ($image_slide == 'false'): ?>
					<a href="<?php print strip_tags(render($content['field_circle_4_url'])); ?>">
					  <img class="project-image-single" src="<?php echo file_create_url($node->field_circle_4_images['und'][0]['uri']); ?>" alt="item">
				  </a>
					<?php endif ?>
					<strong class="our-work"><?php print strip_tags(render($content['field_circle_4_caption'])); ?></strong>
				</div>
			</div>
			<?php endif; ?>
			
		</div>

	</div>
</div>