<?php
	if (module_exists('profile2')) {  
    $profile = profile2_load_by_user($uid, 'main');
  }
?>

<?php if ($teaser && theme_get_setting('blog_image') == 'medium'): ?>
<article id="node-<?php print $node->nid; ?>" class="<?php print $classes; ?>  post post-medium"<?php print $attributes; ?>>
  <div class="row">
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
  </div>
		
  <div class="row">
		<div class="col-md-12">  
		  
	   <?php if (!$page && $teaser && $display_submitted): ?>
	  
	     <div class="post-meta">
		    <span class="post-meta-date"><i class="fa fa-calendar"></i><?php print format_date($node->created, 'custom', 'F d, Y'); ?></span>
				<span class="post-meta-user"><i class="fa fa-user"></i> <?php print t('By'); ?> <?php print $name; ?> </span>
				<?php if (render($content['field_tags'])): ?> 
				  <span class="post-meta-tag"><i class="fa fa-tag"></i> <?php print render($content['field_tags']); ?> </span>
				<?php endif; ?> 
				<?php if (module_exists('comment')):?>
				<span class="post-meta-comments"><i class="fa fa-comments"></i> <a href="<?php print $node_url;?>/#comments"><?php print $comment_count; ?> <?php print t('Comment'); ?><?php if ($comment_count != "1" ) { echo "s"; } ?></a></span>
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
				<span class="post-meta-user"><i class="fa fa-user"></i> <?php print t('By'); ?> <?php print $name; ?> </span>
				<?php if (render($content['field_tags'])): ?> 
				  <span class="post-meta-tag"><i class="fa fa-tag"></i> <?php print render($content['field_tags']); ?> </span>
				<?php endif; ?> 
				<?php if (module_exists('comment')):?>
				<span class="post-meta-comments"><i class="fa fa-comments"></i> <a href="<?php print $node_url;?>/#comments"><?php print $comment_count; ?> <?php print t('Comment'); ?><?php if ($comment_count != "1" ) { echo "s"; } ?></a></span>
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
			<span class="post-meta-user"><i class="fa fa-user"></i> <?php print t('By'); ?> <?php print $name; ?> </span>
			<?php if (render($content['field_tags'])): ?> 
			  <span class="post-meta-tag"><i class="fa fa-tag"></i> <?php print render($content['field_tags']); ?> </span>
			<?php endif; ?> 
			<span class="post-meta-comments"><i class="fa fa-comments"></i> <a href="<?php print $node_url;?>/#comments"><?php print $comment_count; ?> <?php print t('Comment'); ?><?php if ($comment_count != "1" ) { echo "s"; } ?></a></span>
			<a href="<?php print $node_url; ?>" class="btn btn-xs btn-primary pull-right"><?php echo t('Read more...'); ?></a>
		</div>
	  <?php endif; ?>
	    
	</div>
  
</article>
<?php endif; ?>

<?php if (!$teaser): ?>
<article id="node-<?php print $node->nid; ?>" class="<?php print $classes; ?>  post post-large"<?php print $attributes; ?>>

  <?php if (render($content['field_image'])) : ?> 
	  <?php print render($content['field_image']); ?>
  <?php endif; ?>
  
  <?php if ($display_submitted): ?>
    <div class="post-date">
			<span class="day"><?php print format_date($node->created, 'custom', 'd'); ?></span>
			<span class="month"><?php print t(format_date($node->created, 'custom', 'M')); ?></span>
		</div>
	<?php endif; ?>	
	
	<div class="post-content">

	  <?php print render($title_prefix); ?>
	    <h2 <?php print $title_attributes; ?>><a href="<?php print $node_url; ?>"><?php print $title; ?></a></h2>
	  <?php print render($title_suffix); ?>
	    
	  <?php if ($display_submitted): ?>
	  
	    <div class="post-meta">
				<span class="post-meta-user"><i class="fa fa-user"></i> <?php print t('By'); ?> <?php print $name; ?> </span>
				<?php if (render($content['field_tags'])): ?> 
				  <span class="post-meta-tag"><i class="fa fa-tag"></i> <?php print render($content['field_tags']); ?> </span>
				<?php endif; ?> 
				<?php if (module_exists('comment')):?>
				<span class="post-meta-comments"><i class="fa fa-comments"></i> <a href="<?php print $node_url;?>/#comments"><?php print $comment_count; ?> <?php print t('Comment'); ?><?php if ($comment_count != "1" ) { echo "s"; } ?></a></span>
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
			  <a href="<?php print $node_url; ?>" class="btn btn-mini btn-primary pull-right"><?php echo t('Read more...'); ?></a>
			</div>

	  <?php endif; ?>
	  
	  <?php if(!$teaser && theme_get_setting('blog_share') == '1'): ?>
	  <div class="post-block post-share">
			<h3 class="heading-primary"><i class="fa fa-share"></i><?php print t('Share this post');?></h3>
			<!-- AddThis Button BEGIN -->
			<div class="addthis_toolbox addthis_default_style ">
				<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
				<a class="addthis_button_tweet"></a>
				<a class="addthis_button_pinterest_pinit"></a>
				<a class="addthis_counter addthis_pill_style"></a>
			</div>
			<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=xa-50faf75173aadc53"></script>
			<!-- AddThis Button END -->
		</div>
	  <?php endif; ?>  
	  
	  <?php if(!$teaser && (isset(user_load($uid)->field_author_bio) || module_exists('profile2'))): ?>
	  <div class="post-block post-author clearfix">
			<h3 class="heading-primary"><i class="fa fa-user"></i><?php print t('Author'); ?></h3>
			<div class="img-thumbnail">
			 <?php print $user_picture; ?>
			</div>
			<p><strong class="name"><?php print $name; ?> </strong></p>
			<?php if (module_exists('profile2') && isset($profile->field_bio['und'][0]['value'])): ?>
			  <p><?php print ($profile->field_bio['und'][0]['value']); ?></p>
			<?php endif; ?>
			<?php if(isset(user_load($uid)->field_author_bio['und'][0])): ?>
        <p><?php print user_load($uid)->field_author_bio['und'][0]['value']; ?></p>
	    <?php endif; ?>  
		</div>
		<?php endif; ?>  
  
	</div>
	
	<?php
    // Remove the "Add new comment" link on the teaser page or if the comment
    // form is being displayed on the same page.
    if ($teaser || !empty($content['comments']['comment_form'])) {
      unset($content['links']['comment']['#links']['comment-add']);
    }
    // Only display the wrapper div if there are links.
    $links = render($content['links']);
    if ($links):
  ?>
    <?php if (!$teaser): ?>
	    <div class="link-wrapper">
	      <?php print $links; ?>
	    </div>
	  <?php endif; ?>  
  <?php endif; ?>
  
  <?php print render($content['comments']); ?>

</article>
<?php endif; ?>