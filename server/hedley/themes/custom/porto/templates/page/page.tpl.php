<?php
/**
 * @file
 * Porto's theme implementation to display a single Drupal page.
 */
?>

<div class="body">
  <?php include_once('includes/header/header.inc');?>

	<!-- end header --> 

	<div role="main" class="main">
      <?php include_once('includes/breadcrumb.inc');?>
	  
	  <?php print render($page['before_content']); ?>
	  <div id="content" class="content full">
	    <div class="container">
	      <div class="row">
		      <?php if ($messages): ?>  
			      <div class="col-md-12">
		          <?php print $messages; ?>
			      </div>
			    <?php endif; ?>  
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

	
</div>	