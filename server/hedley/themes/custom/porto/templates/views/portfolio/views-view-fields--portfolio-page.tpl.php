<?php 
	$tid = array();
	if(!empty($row->field_field_portfolio_category)){
		$tid = $row->field_field_portfolio_category;
	}
	$image = array();
	if(isset($fields['field_image']->content)){
		$image = explode(',',$fields['field_image']->content);

	}
	$options = $view->style_options;
	$customClass = '';
	if($options['porto_views']['optionset'] == 'portfolio_one') {
		$customClass = 'col-sm-12 col-xs-12 col-md-12 col-lg-12';
	} elseif($options['porto_views']['optionset'] == 'portfolio_two') {
		$customClass = 'col-sm-6 col-xs-12';
	} elseif($options['porto_views']['optionset'] == 'portfolio_three') {
		$customClass = 'col-md-4 col-sm-6 col-xs-12';
	} elseif($options['porto_views']['optionset'] == 'portfolio_four') {
		$customClass = 'col-md-3 col-sm-6 col-xs-12';
	} elseif($options['porto_views']['optionset'] == 'portfolio_five') {
		$customClass = 'col-md-1-5';
	} elseif($options['porto_views']['optionset'] == 'portfolio_six') {
		$customClass = 'col-md-2 col-sm-6 col-xs-12';
	}
?>
<?php if($options['porto_views']['optionset'] == 'portfolio_list') : ?>
	<li class="col-md-12 isotope-item mt-xl <?php foreach($tid as $value): print ('term'.$value['raw']['tid']).' '; endforeach?>">
		<div class="row">
			<div class="col-md-6">
				<div class="portfolio-item">
					<a href="<?php echo drupal_lookup_path('alias',"node/".$row->nid); ?>">
						<span class="thumb-info thumb-info-no-zoom thumb-info-lighten">
							<span class="thumb-info-wrapper">
								<span class="owl-carousel owl-theme nav-inside m-none" data-plugin-options='{"items": 1, "margin": 10, "animateOut": "fadeOut", "autoplay": true, "autoplayTimeout": 3000}'>
									<?php foreach($image as $key => $value):?>
										<span>
											<img src="<?php print file_create_url($value);?>" class="img-responsive" alt="">
										</span>
									<?php endforeach?>
								</span>
								<span class="thumb-info-action">
									<span class="thumb-info-action-icon"><i class="fa fa-link"></i></span>
								</span>
							</span>
						</span>
					</a>
				</div>
			</div>
			<div class="col-md-6">
				<div class="portfolio-info">
					<div class="row">
						<div class="col-md-12 center">
							<ul>
								<li>
									<i class="fa fa-calendar"></i> <?php echo $fields['created']->content;?>
								</li>
								<li>
									<i class="fa fa-tags"></i> <?php echo $fields['field_portfolio_category']->content;?>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<?php if(isset($fields['title'])):?>
					<h4 class="heading-primary"><?php echo $fields['title']->content;?></h4>
				<?php endif;?>
							
				<p class="mt-xlg"><?php echo $fields['field_portfolio_description']->content;?></p>

				<a href="<?php echo drupal_lookup_path('alias',"node/".$row->nid); ?>" class="btn btn-primary"><?php echo t('Learn More'); ?></a>

				<ul class="portfolio-details">
					<li>
						<p><strong><?php echo t('Skills'); ?>:</strong></p>

						<?php if($fields['field_portfolio_skills']->content) :?>
							<?php $arraySkills = explode(',', $fields['field_portfolio_skills']->content); ?>
							<ul class="list list-inline list-icons">
								<?php foreach($arraySkills as $skill): ?>
									<li><i class="fa fa-check-circle"></i> <?php echo $skill; ?></li>
								<?php endforeach; ?>
							</ul>
						<?php endif; ?>
					</li>
				</ul>
			</div>
		</div>
	</li>
<?php elseif($options['porto_views']['optionset'] == 'portfolio_timeline') : ?>
	<div class="portfolio-item">
		<a href="<?php echo drupal_lookup_path('alias',"node/".$row->nid); ?>">
			<span class="thumb-info thumb-info-lighten thumb-info-no-borders m-none">
				<span class="thumb-info-wrapper">
					<span class="owl-carousel owl-theme nav-inside m-none" data-plugin-options='{"items": 1, "margin": 10, "animateOut": "fadeOut", "autoplay": true, "autoplayTimeout": 3000}'>
						<?php foreach($image as $key => $value):?>
							<span>
								<img src="<?php print file_create_url($value);?>" class="img-responsive" alt="">
							</span>
						<?php endforeach?>
					</span>					
					<span class="thumb-info-title">
						<span class="thumb-info-inner"><?php echo $fields['title']->content; ?></span>
						<?php if(isset($fields['field_portfolio_category'])):?>
							<span class="thumb-info-type"><?php echo $fields['field_portfolio_category']->content;?></span>
						<?php endif;?>
					</span>
					<span class="thumb-info-action">
						<span class="thumb-info-action-icon"><i class="fa fa-link"></i></span>
					</span>
				</span>
			</span>
		</a>
	</div>
<?php elseif($options['porto_views']['optionset'] == 'portfolio_lightbox') : ?>
	<li class="col-md-3 col-sm-6 col-xs-12 isotope-item <?php foreach($tid as $value): print ('term'.$value['raw']['tid']).' '; endforeach?>">
		<div class="portfolio-item">
			<span class="thumb-info thumb-info-lighten thumb-info-bottom-info thumb-info-centered-icons">
				<span class="thumb-info-wrapper">
					<span class="owl-carousel owl-theme nav-inside m-none" data-plugin-options='{"items": 1, "margin": 10, "animateOut": "fadeOut", "autoplay": true, "autoplayTimeout": 3000}'>
						<?php foreach($image as $key => $value):?>
							<span>
								<img src="<?php print file_create_url($value);?>" class="img-responsive" alt="">
							</span>
						<?php endforeach?>
					</span>
					<span class="thumb-info-title">
						<span class="thumb-info-inner"><?php echo $fields['title']->content; ?></span>
						<?php if(isset($fields['field_portfolio_category'])):?>
							<span class="thumb-info-type"><?php echo $fields['field_portfolio_category']->content;?></span>
						<?php endif;?>
					</span>
					<span class="thumb-info-action">
						<a href="<?php echo drupal_lookup_path('alias',"node/".$row->nid); ?>">
							<span class="thumb-info-action-icon thumb-info-action-icon-primary"><i class="fa fa-link"></i></span>
						</a>
						<?php foreach($image as $key => $value):?>
							<a href="<?php print file_create_url($value);?>" class="lightbox-portfolio">
								<span class="thumb-info-action-icon thumb-info-action-icon-light"><i class="fa fa-search-plus"></i></span>
							</a>
						<?php endforeach?>
					</span>
				</span>
			</span>
		</div>
	</li>
<?php else :?>
	<li class="isotope-item <?php echo $customClass; ?> <?php if($options['porto_views']['margin'] == 0) { echo 'm-none p-none'; } ?> <?php foreach($tid as $value): print ('term'.$value['raw']['tid']).' '; endforeach?>">
		<div class="portfolio-item <?php if($options['porto_views']['margin'] == 0) { echo 'm-none'; } ?>">
			<a href="<?php echo drupal_lookup_path('alias',"node/".$row->nid); ?>">
				<?php if($options['porto_views']['margin'] == 0) :?>
					<span class="thumb-info thumb-info-centered-info thumb-info-no-borders m-none">
				<?php elseif($options['porto_views']['style'] == 'grid') :?>
					<span class="thumb-info thumb-info-lighten thumb-info-no-zoom">
				<?php elseif($options['porto_views']['style'] == 'masonry') :?>
					<span class="thumb-info thumb-info-centered-info thumb-info-no-borders">
				<?php endif; ?>
					<span class="thumb-info-wrapper">
						<span class="owl-carousel owl-theme nav-inside m-none" data-plugin-options='{"items": 1, "margin": 10, "animateOut": "fadeOut", "autoplay": true, "autoplayTimeout": 3000}'>
							<?php foreach($image as $key => $value):?>
								<span>
									<img src="<?php print file_create_url($value);?>" class="img-responsive" alt="">
								</span>
							<?php endforeach?>
						</span>
						<span class="thumb-info-title">
							<?php if(isset($fields['title'])):?>
								<span class="thumb-info-inner"><?php echo $fields['title']->content;?></span>
							<?php endif;?>
							<?php if(isset($fields['field_portfolio_category'])):?>
								<span class="thumb-info-type"><?php echo $fields['field_portfolio_category']->content;?></span>
							<?php endif;?>
						</span>
						<span class="thumb-info-action">
							<span class="thumb-info-action-icon"><i class="fa fa-link"></i></span>
						</span>
					</span>
				</span>
			</a>
		</div>
	</li>
<?php endif; ?>