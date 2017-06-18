<section class="video section section-text-light section-video section-center mt-none" data-vide-bg="mp4: <?php print file_create_url($node->field_mp4_video['und'][0]['uri']); ?>, ogv: <?php print file_create_url($node->field_ogg_video['und'][0]['uri']); ?>, poster: <?php print file_create_url($node->field_video_image['und'][0]['uri']); ?>" data-plugin-options='{"posterType": "jpg", "position": "50% 50%", "overlay": true}'>
	<div class="video-overlay"></div>
  <div class="container">
		<div class="row">
			<div class="col-md-6">
				<?php print render($content['body']); ?>

			</div>
		</div>
	</div>
</section>