<li class="isotope-item <?php print str_replace('&amp;', 'and', str_replace(',-', ' ', str_replace(' ', '-',strip_tags(render($content['field_portfolio_category']))))); ?>">
	<div class="portfolio-item img-thumbnail">
		<a href="<?php print $node_url; ?>" class="thumb-info secundary">
			<img alt="<?php print $title;?>" class="img-responsive" src="<?php echo file_create_url($node->field_image['und'][0]['uri']); ?>">
			<span class="thumb-info-title">
				<span class="thumb-info-inner"><?php print $title; ?></span>
				<span class="thumb-info-type"><?php print str_replace('-', ' ', strip_tags(render($content['field_portfolio_category']))); ?></span>
			</span>
			<span class="thumb-info-action">
				<span title="Universal" class="thumb-info-action-icon"><i class="icon icon-link"></i></span>
			</span>
		</a>
	</div>
</li>