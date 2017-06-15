<?php 
	$tid = array();
	if(!empty($row->field_field_portfolio_category)){
		$tid = $row->field_field_portfolio_category;
	}
	$image = array();
	if(isset($fields['field_image']->content)){
		$image = explode(',',$fields['field_image']->content);

	}
?>
<li class="isotope-item <?php foreach($tid as $value): print ('term'.$value['raw']['tid']).' '; endforeach?>">
    <div class="portfolio-item">
        <a href="<?php echo drupal_lookup_path('alias',"node/".$row->nid); ?>">
			<span class="thumb-info thumb-info-lighten thumb-info-no-zoom">
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
