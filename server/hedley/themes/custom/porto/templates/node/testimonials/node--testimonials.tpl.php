<?php

/**
 * @file node--testimonials.tpl.php
 * Porto's node template for the Testimonials content type.
 */
?>

<div class="col-md-12">
	<div class="testimonial testimonial-primary">
		<blockquote>
		  <p><?php print render($content['field_testimonial_content']); ?></p>
		</blockquote>
		<div class="testimonial-arrow-down"></div>
		<div class="testimonial-author">
		  <?php if (render($content['field_image'])): ?>
			<div class="testimonial-author-thumbnail img-thumbnail">
				<img src="<?php echo file_create_url($node->field_image['und'][0]['uri']); ?>" alt="">
			</div>
			<?php endif;?>
			<p><strong><?php print render($content['field_testimonial_name']); ?></strong><span><?php print render($content['field_testimonial_info']); ?></span></p>
		</div>
	</div>
</div>