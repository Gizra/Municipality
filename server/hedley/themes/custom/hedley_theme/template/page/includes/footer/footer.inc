<?php $footer_color = theme_get_setting('footer_color');?>
<footer class="short <?php if($footer_color == 'primary'): print 'color color-primary'; elseif($footer_color == 'secondary'): print 'color color-secondary'; elseif($footer_color == 'tertiary'): print 'color color-tertiary'; elseif($footer_color == 'quaternary'): print 'color-quaternary'; elseif($footer_color == 'light'): print 'light narrow'; endif;?>" id="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
              <?php if($page['footer_top']):?>
                <?php print render($page['footer_top']);?>
              <?php endif;?>
                <hr class="light">
                <div class="row">
                  <?php if($page['footer_21']):?>
                      <div class="col-md-3">
                        <?php print render($page['footer_21']);?>
                      </div>
                  <?php endif;?>
                  <?php if($page['footer_22']):?>
                      <div class="col-md-3">
                        <?php print render($page['footer_22']);?>
                      </div>
                  <?php endif;?>
                  <?php if($page['footer_23']):?>
                      <div class="col-md-3">
                        <?php print render($page['footer_23']);?>
                      </div>
                  <?php endif;?>
                  <?php if($page['footer_24']):?>
                      <div class="col-md-3">
                        <?php print render($page['footer_24']);?>
                      </div>
                  <?php endif;?>
                </div>
            </div>
          <?php if($page['footer_25']):?>
              <div class="col-md-3">
                <?php print render($page['footer_25']);?>
              </div>
          <?php endif;?>
        </div>
    </div>
  <?php if($page['footer_bottom']):?>
      <div class="footer-copyright">
          <div class="container">
              <div class="row">
                <?php print render($page['footer_bottom']);?>
              </div>
          </div>
      </div>
  <?php endif;?>
</footer>