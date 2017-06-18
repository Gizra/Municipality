<?php
/**
 * @file
 * Porto's theme implementation to display a single Drupal page.
 */
?>
<body class="<?php print $classes; ?> one-page" data-target="#header" data-spy="scroll" data-offset="100" <?php print $attributes;?>>
<div id="top" class="body">
    <?php include_once('includes/header/h_one_page.inc');?>
	
	<div role="main" class="main">
	
	  <?php if ( ($breadcrumb) AND (!drupal_is_front_page()) ): ?>
	  <section class="page-top breadcrumb-wrap">
		  <div class="container">
		    <?php if (theme_get_setting('breadcrumbs') == '1'): ?>
				<div class="row">
					<div class="span12">
						<div id="breadcrumbs"><?php print $breadcrumb; ?> </div>	
					</div>
				</div>
				<?php endif; ?>
				<div class="row">
					<div class="span12">
						<h2><?php print drupal_get_title(); ?></h2>
					</div>
				</div>
			</div>
		</section>
	  <?php endif; ?>
	  
	  <?php print render($page['before_content']); ?>
	  
	  <?php print render($page['one_page']); ?>
	  
	  <div id="content" class="content full">
	    <div class="container">
	      <div class="row">
	      
			    <?php if ( ($page['sidebar_left']) ) : ?>
				  <aside id="sidebar-left">
					  <div class="<?php if ($page['sidebar_right']) { echo "col-md-3";} else { echo "col-md-3"; } ?>">
					    <div id="sticky-sidebar">
					    <?php print render($page['sidebar_left']); ?>
					    </div>
					  </div>
				  </aside>
				  <?php endif; ?>
			
					<div class="<?php if ( ($page['sidebar_right']) AND ($page['sidebar_left']) ) { echo "col-md-6";} elseif ( ($page['sidebar_right']) OR ($page['sidebar_left']) ) {  echo "col-md-9"; }  else { echo "col-md-12"; } ?>">
					  
			     	<?php if ($tabs = render($tabs)): ?>
						  <div id="drupal_tabs" class="tabs ">
						    <?php print render($tabs); ?>
						  </div>
					  <?php endif; ?>
			      <?php print render($page['help']); ?>
			      <?php if ($action_links): ?>
			        <ul class="action-links">
			          <?php print render($action_links); ?>
			        </ul>
			      <?php endif; ?>
		
					  <?php if (isset($page['content'])) { print render($page['content']); } ?>
			      
					</div>
			  
				  <?php if ( ($page['sidebar_right']) ) : ?>
				  <div class="<?php if ($page['sidebar_left']) { echo "col-md-3";} else { echo "col-md-3"; } ?>">
				    <?php print render($page['sidebar_right']); ?>
				  </div>
				  <?php endif; ?>
			    
			  </div>
	    </div>  
	  </div>  
	  	  
	</div>

  <?php print render($page['after_content']); ?>

    <?php include_once('includes/footer/footer.inc');?>
<script type="text/javascript">
jQuery(document).ready(function ($) {

  $('header .nav-main li').removeClass("active");
	$('header .nav-main li:first-child').addClass("active");
	
	$("header .nav-main li a").click(function(){
    $("header .nav-main li a").parent().removeClass("active");
    $(this).parent().addClass("active");
  });
	
	$('header a').click(function(){
	    $('html, body').animate({
	        scrollTop: $(this.hash).offset().top -100
	    }, 800);
	    return false;
	});
	
});
</script>	
</div>	
</body>