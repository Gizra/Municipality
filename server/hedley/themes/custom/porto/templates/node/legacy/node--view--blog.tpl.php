<?php if ($teaser && theme_get_setting('blog_image') == 'medium'): ?>
<article id="node-<?php print $node->nid; ?>" class="<?php print $classes; ?>  post post-medium"<?php print $attributes; ?>>

  <?php if (render($content['field_image'])) : ?> 
    <div class="col-md-5">
	  <?php print render($content['field_image']); ?>
    </div>
  <?php endif; ?>

	<div class="col-md-7">
		<div class="post-content">
	
		  <?php print render($title_prefix); ?>
		    <h2 <?php print $title_attributes; ?>><a href="<?php print $node_url; ?>"><?php print $title; ?></a></h2>
		  <?php print render($title_suffix); ?>

		  <div class="article_content"<?php print $content_attributes; ?>>
		    <?php
		      // Hide comments, tags, and links now so that we can render them later.
		      hide($content['taxonomy_forums']);
		      hide($content['comments']);
		      hide($content['links']);
		      hide($content['field_tags']);
		      hide($content['field_image']);
		      hide($content['field_thumbnail']);
		      print render($content);
		    ?>
		  </div>
		</div>
  </div>		

		
  <div class="row">
		<div class="col-md-12">  
		  
	   <?php if (!$page && $teaser): ?>
	  
	     <div class="post-meta">
		    <span class="post-meta-date"><i class="icon icon-calendar"></i><?php print format_date($node->created, 'custom', 'F d, Y'); ?></span>
				<span class="post-meta-user"><i class="icon icon-user"></i> <?php print t('By'); ?> <?php print $name; ?> </span>
				<?php if (render($content['field_tags'])): ?> 
				  <span class="post-meta-tag"><i class="icon icon-tag"></i> <?php print render($content['field_tags']); ?> </span>
				<?php endif; ?> 
				<?php if (module_exists('comment')):?>
				<span class="post-meta-comments"><i class="icon icon-comments"></i> <a href="<?php print $node_url;?>/#comments"><?php print $comment_count; ?> <?php print t('Comment'); ?><?php if ($comment_count != "1" ) { echo "s"; } ?></a></span>
				<?php endif; ?>
				<a href="<?php print $node_url; ?>" class="btn btn-xs btn-primary pull-right"><?php echo t('Read more...'); ?></a>
			</div>
		
	  <?php endif; ?>
		</div>
	</div>
</article>
<?php endif; ?>

<?php if ($teaser && theme_get_setting('blog_image') == 'full'): ?>
<article id="node-<?php print $node->nid; ?>" class="<?php print $classes; ?> post post-large blog-single-post"<?php print $attributes; ?>>

  <?php if (render($content['field_image'])) : ?> 
	  <?php print render($content['field_image']); ?>
  <?php endif; ?>
  
  <?php if ($display_submitted): ?>
    <div class="post-date">
			<span class="day"><?php print format_date($node->created, 'custom', 'd'); ?></span>
			<span class="month"><?php print format_date($node->created, 'custom', 'M'); ?></span>
		</div>
	<?php endif; ?>	
	
	<div class="post-content">

	  <?php print render($title_prefix); ?>
	    <h2 <?php print $title_attributes; ?>><a href="<?php print $node_url; ?>"><?php print $title; ?></a></h2>
	  <?php print render($title_suffix); ?>
	    
	  <?php if ($display_submitted && !$teaser): ?>
	  
	    <div class="post-meta">
				<span class="post-meta-user"><i class="icon icon-user"></i> <?php print t('By'); ?> <?php print $name; ?> </span>
				<?php if (render($content['field_tags'])): ?> 
				  <span class="post-meta-tag"><i class="icon icon-tag"></i> <?php print render($content['field_tags']); ?> </span>
				<?php endif; ?> 
				<?php if (module_exists('comment')):?>
				<span class="post-meta-comments"><i class="icon icon-comments"></i> <a href="<?php print $node_url;?>/#comments"><?php print $comment_count; ?> <?php print t('Comment'); ?><?php if ($comment_count != "1" ) { echo "s"; } ?></a></span>
				<?php endif; ?>
			</div>
		
	  <?php endif; ?>
	   
	  <div class="article_content"<?php print $content_attributes; ?>>
	    <?php
	      // Hide comments, tags, and links now so that we can render them later.
	      hide($content['taxonomy_forums']);
	      hide($content['comments']);
	      hide($content['links']);
	      hide($content['field_tags']);
	      hide($content['field_image']);
	      hide($content['field_thumbnail']);
	      print render($content);
	    ?>
	  </div>
	  
		<?php if (!$page && $teaser): ?>
	  <div class="post-meta">
			<span class="post-meta-user"><i class="icon icon-user"></i> <?php print t('By'); ?> <?php print $name; ?> </span>
			<?php if (render($content['field_tags'])): ?> 
			  <span class="post-meta-tag"><i class="icon icon-tag"></i> <?php print render($content['field_tags']); ?> </span>
			<?php endif; ?> 
			<span class="post-meta-comments"><i class="icon icon-comments"></i> <a href="<?php print $node_url;?>/#comments"><?php print $comment_count; ?> <?php print t('Comment'); ?><?php if ($comment_count != "1" ) { echo "s"; } ?></a></span>
			<a href="<?php print $node_url; ?>" class="btn btn-xs btn-primary pull-right"><?php echo t('Read more...'); ?></a>
		</div>
	  <?php endif; ?>
	    
	</div>
  
</article>
<?php endif; ?>