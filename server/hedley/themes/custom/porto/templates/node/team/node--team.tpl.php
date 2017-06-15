<div class="row">
	<div class="col-md-4">
	  <div class="team-item thumbnail">
	    <?php print render ($content['field_image']); ?>
	  </div>
	</div>
	
	<div class="col-md-8">
	
		<h2 class="shorter"><?php print $title; ?></h2>
		<h4><?php print str_replace('-', ' ', strip_tags(render($content['field_team_category']))); ?></h4>
	
		<span class="thumb-info-social-icons">
				
		  <?php if ( render ($content['field_facebook_link']) ): ?>
			<a rel="tooltip" data-placement="bottom" target="_blank" href="<?php print render ($content['field_facebook_link']); ?>" data-original-title="Facebook"><i class="icon icon-facebook"></i><span>Facebook</span></a>
			<?php endif; ?>
			
			<?php if ( render ($content['field_twitter_link']) ): ?>
			<a rel="tooltip" data-placement="bottom" href="<?php print render ($content['field_twitter_link']); ?>" data-original-title="Twitter"><i class="icon icon-twitter"></i><span>Twitter</span></a>
			<?php endif; ?>
			
			<?php if ( render ($content['field_linkedin_link']) ): ?>
			<a rel="tooltip" data-placement="bottom" href="<?php print render ($content['field_linkedin_link']); ?>" data-original-title="Linkedin"><i class="icon icon-linkedin"></i><span>Linkedin</span></a>
			<?php endif; ?>
				
		</span>
	
		<?php print render($content['body']); ?>
	
	</div>
</div>