<?php
/**
 * @file
 * Porto's theme implementation to display a single Drupal page.
 */
?>

<div class="body">
  <?php include_once('includes/header/header.inc');?>

	<div role="main" class="main">
    <?php include_once('includes/breadcrumb.inc');?>

    <?php if (isset($background_image_url)): ?>
      <div id="revolutionSlider" class="slider-container slider rev_slider revslider-initialised tp-simpleresponsive" data-plugin-revolution-slider="" data-plugin-options="{'delay': 9000, 'gridwidth': 1170, 'gridheight': 500, 'disableProgressBar': 'on'}" style="margin-top: -35px;">
        <div class="tp-bgimg defaultimg" style="background-repeat: no-repeat; background-image: url(<?php print $background_image_url; ?>); background-size: cover; background-position: center center; width: 100%; height: 100%; opacity: 1; visibility: inherit; z-index: 20;" src="<?php print $background_image_url; ?>"></div>
      </div>
      <div class="divider"></div>
    <?php endif; ?>

    <?php print render($page['before_content']); ?>
	  <div id="content" class="content full">
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

      <div class="<?php if ( ($page['sidebar_right']) AND ($page['sidebar_left']) ) { echo "col-md-6";} elseif ( ($page['sidebar_right']) OR ($page['sidebar_left']) ) {  echo "col-md-9"; }  else { echo ""; } ?>">

        <div class="container">
          <?php if ($tabs = render($tabs)): ?>
            <div id="drupal_tabs" class="tabs">
              <?php print render($tabs); ?>
            </div>
          <?php endif; ?>
          <?php print render($page['help']); ?>
          <?php if ($action_links): ?>
            <ul class="action-links">
              <?php print render($action_links); ?>
            </ul>
          <?php endif; ?>
        </div>

        <?php if (isset($page['content'])) { print render($page['content']); } ?>

      </div>

      <?php if ( ($page['sidebar_right']) ) : ?>
      <div class="<?php if ($page['sidebar_left']) { echo "col-md-3";} else { echo "col-md-3"; } ?>">
        <?php print render($page['sidebar_right']); ?>
      </div>
      <?php endif; ?>
	  </div>
	  
	</div>

  <?php print render($page['after_content']); ?>

    <?php include_once('includes/footer/footer.inc');?>
	
</div>	