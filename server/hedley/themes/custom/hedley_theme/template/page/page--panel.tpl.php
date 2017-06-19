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
	  
	  <?php print render($page['before_content']); ?>
	  <div id="content" class="content full">
      <?php if (isset($background_image_url)): ?>
        <section class="parallax section section-parallax section-center" data-plugin-parallax data-plugin-options="{'speed': 1.5}" data-image-src="<?php print $background_image_url; ?>" style="height: 300px; position: relative; overflow: hidden;">
          <div class="container"></div>
        </section>
      <?php endif; ?>
      <div class="container">
        <div class="row">
          <?php if ($user_type_links): ?>
            <div class="col-md-3">
              <?php print $user_type_links; ?>
            </div>
          <?php endif; ?>

          <div class="col-md-6">
            <?php print render($social_links); ?>
          </div>

          <div class="col-md-3">
            <?php if ($language_switch_links) : ?>
              <div class="languages btn-group" role="group">
                <?php foreach ($language_switch_links as $link): ?>
                  <?php print $link; ?>
                <?php endforeach; ?>
              </div>
            <?php endif; ?>
          </div>
        </div>
        <div class="divider"></div>
      </div>
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