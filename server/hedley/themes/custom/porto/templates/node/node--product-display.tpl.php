
<div class="row <?php if (!$teaser) { print "shop"; } ?>">
	<div class="col-md-6 product-image">
		<?php print render($content['product:field_image']); ?>
	</div>

	<div class="col-md-6">
		<div class="summary entry-summary">
			<?php if ($teaser): ?>
			<a href="<?php print $node_url; ?>">
			<?php endif; ?>	
			<h2 class="mb-none"><strong><?php print $title; ?></strong></h2>
			<?php if ($teaser): ?>
			</a>
			<?php endif; ?>
			
			<?php print render($content['field_product_rating']); ?>

			<p class="price">
				<span class="amount">
				
					<?php if (isset($content['product:field_commerce_saleprice'][0])): ?><strike><?php endif; ?>
				  <?php print porto_original_price($content['field_product_variations']['#items'][0]['product_id']); ?>
				  <?php if (isset($content['product:field_commerce_saleprice'][0])): ?></strike><?php endif; ?>
				  <?php print strip_tags(render($content['product:field_commerce_saleprice'])); ?>
				
			
			  </span>
			</p>

			<?php
	      // Hide comments, tags, and links now so that we can render them later.
	      hide($content['field_product_variations']);
	      hide($content['comments']);
	      hide($content['links']);
	      hide($content['field_product_description']);
	      hide($content['field_image']);
	      hide($content['field_product_categories']);
	      hide($content['field_product_tags']);
	      hide($content['product:commerce_price']);
	      hide($content['product:field_commerce_saleprice']);
	      hide($content['product:field_commerce_saleprice_on_sale']);
	      print render($content);
	    ?>

			<?php print render($content['field_product_variations']); ?>

			<div class="product_meta">
				<span class="posted_in"><?php print render($content['field_product_categories']); ?></span>
				<span class="posted_in"><?php print render($content['field_product_tags']); ?></span>
			</div>
			
		</div>
	</div>

</div>

<?php if ($teaser): ?>
	<hr class="tall">
<?php endif; ?>

<?php if (!$teaser): ?>
<div class="row">
	<div class="col-md-12">
		<div class="tabs tabs-product">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#productDescription" data-toggle="tab"><?php print t('Description');?></a></li>
				<li><a href="#productReviews" data-toggle="tab"><?php print t('Comments');?> (<?php print $comment_count; ?>)</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="productDescription">
					<?php print render($content['field_product_description']); ?>
				</div>
				
				<div class="tab-pane" id="productReviews">
					
				<?php print render($content['comments']); ?>				
				</div>
			</div>
		</div>
	</div>
</div>
<?php endif; ?>