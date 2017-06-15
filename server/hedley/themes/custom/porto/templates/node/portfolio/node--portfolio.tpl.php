<div class="portfolio-title">
	<div class="row">
	  <?php if (!$teaser): ?>
		<div class="portfolio-nav-all col-md-1">
			<a href="./" rel="tooltip" data-original-title="<?php print t('Back to list');?>"><i class="fa fa-th"></i></a>
		</div>
		<?php endif; ?>
		<div class="<?php if(!$teaser) { echo "col-md-10"; } else { echo "col-md-12"; } ?> center">
		  <?php if (!$teaser): ?>
			  <h2 class="shorter"><?php print $title; ?></h2>
			<?php endif; ?>
			<?php if ($teaser): ?>
			  <h2 class="shorter"><a href="<?php print $node_url; ?>"><?php print $title; ?></a></h2>
			<?php endif; ?>
		</div>
		<?php if (!$teaser && $node->status == '1'): ?>
		<div class="portfolio-nav col-md-1">
		  <?php if ( porto_node_pagination($node, 'p') != NULL ) : ?>
			<a href="<?php print url('node/' . porto_node_pagination($node, 'p'), array('absolute' => TRUE)); ?>" class="portfolio-nav-prev" rel="tooltip" data-original-title="<?php print t('Previous');?>"><i class="fa fa-chevron-left"></i></a>
			<?php endif; ?>
			<?php if ( porto_node_pagination($node, 'n') != NULL ) : ?>
			<a href="<?php print url('node/' . porto_node_pagination($node, 'n'), array('absolute' => TRUE)); ?>" class="portfolio-nav-next" rel="tooltip" data-original-title="<?php print t('Next');?>"><i class="fa fa-chevron-right"></i></a>
			<?php endif; ?>
		</div>
		<?php endif; ?>
	</div>
</div>
<hr class="tall">
<div class="row portfolio-wrap">
	<div class="col-md-4">
	  <?php if (isset($content['field_image']) && count($content['field_image']['#items']) == 1): ?>
		  <?php print render ($content['field_image']); ?>
		<?php endif; ?>
		<?php if (isset($content['field_image']) && count($content['field_image']['#items']) > 1): ?>
		<div class="owl-carousel" data-plugin-options='{"items": 1, "autoHeight": true}'>
		  <?php print render ($content['field_image']); ?>
		</div>
		<?php endif; ?>
	</div>
	<div class="col-md-8">
		<div class="portfolio-info">
			<div class="row">
				<div class="col-md-12 center">
					<ul>
						<li>
							<i class="fa fa-calendar"></i> <?php print format_date($node->created, 'custom', 'd M, Y'); ?>
						</li>
						<li>
							<i class="fa fa-tags"></i> <?php print render($content['field_portfolio_category']); ?>
						</li>
					</ul>
				</div>
			</div>
		</div>

	<?php if (render($content['field_portfolio_description'])): ?>
	  <h4><?php print t('Project'); ?> <strong><?php print t('Description'); ?></strong></h4>
	  <?php print render($content['field_portfolio_description']); ?>
	<?php endif; ?>

	<?php if (render($content['field_portfolio_link'])): ?>
	  <a href="<?php print strip_tags(render($content['field_portfolio_link'])); ?>" class="btn btn-primary btn-icon" target="_blank"><i class="fa fa-external-link"></i><?php print  t('Live Preview'); ?></a> <span class="arrow hlb" data-appear-animation="rotateInUpLeft" data-appear-animation-delay="800"></span>
	<?php endif; ?>

	<ul class="portfolio-details">
	  <?php if (render($content['field_portfolio_skills'])): ?>
		<li>
            <h5 class="mt-sm mb-xs"><?php print t('Skills'); ?></h5>
			<ul class="list list-inline list-icons">
			  <?php print render($content['field_portfolio_skills']); ?>
			</ul>

		</li>
		<?php endif; ?>
		<?php if (render($content['field_portfolio_client'])): ?>
		<li>
            <h5 class="mt-sm mb-xs"><?php print t('Client'); ?></h5>
			<?php print render($content['field_portfolio_client']); ?>
		</li>
		<?php endif; ?>
	</ul>

	<?php
	  hide($content['field_portfolio_slider']);
	  hide($content['field_portfolio_skills']);
	  hide($content['field_portfolio_client']);
	  hide($content['field_portfolio_link']);
	  hide($content['field_portfolio_description']);
	  hide($content['field_image']);
	  hide($content['links']);
	  hide($content['field_portfolio_category']);
	  hide($content['field_thumbnail']);
	  print render($content);
  ?>
	</div>
</div>