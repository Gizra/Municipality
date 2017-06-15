<?php $footer_color = theme_get_setting('footer_color');?>
<footer id="footer" class="<?php if($footer_color == 'primary'): print 'color color-primary'; elseif($footer_color == 'secondary'): print 'color color-secondary'; elseif($footer_color == 'tertiary'): print 'color color-tertiary'; elseif($footer_color == 'quaternary'): print 'color-quaternary'; elseif($footer_color == 'light'): print 'light narrow'; endif;?>">
    <?php if (render($page['footer_11']) || render($page['footer_12']) || render($page['footer_13']) || render($page['footer_14'])) : ?>
        <div class="container main-footer">
            <div class="row">

                <?php if (theme_get_setting('ribbon') == '1'): ?>
                    <div class="footer-ribbon">
                        <span><?php echo t("%string", array('%string' => theme_get_setting('ribbon_text')) );?></span>
                    </div>
                <?php endif; ?>

                <?php if (render($page['footer_11'])) : ?>
                    <div class="col-md-3">
                        <?php print render($page['footer_11']); ?>
                    </div>
                <?php endif; ?>

                <?php if (render($page['footer_12'])) : ?>
                    <div class="col-md-3">
                        <?php print render($page['footer_12']); ?>
                    </div>
                <?php endif; ?>

                <?php if (render($page['footer_13'])) : ?>
                    <div class="col-md-4">
                        <?php print render($page['footer_13']); ?>
                    </div>
                <?php endif; ?>

                <?php if (render($page['footer_14'])) : ?>
                    <div class="col-md-2">
                        <?php print render($page['footer_14']); ?>
                    </div>
                <?php endif; ?>

            </div>
        </div>
    <?php endif; ?>
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