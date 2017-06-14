<?php $footer_color = theme_get_setting('footer_color');?>
<footer class="short <?php if($footer_color == 'primary'): print 'color color-primary'; elseif($footer_color == 'secondary'): print 'color color-secondary'; elseif($footer_color == 'tertiary'): print 'color color-tertiary'; elseif($footer_color == 'quaternary'): print 'color-quaternary'; elseif($footer_color == 'light'): print 'light narrow'; endif;?>" id="footer">
    <div class="container">
        <div class="row">
            <?php if($page['footer_top']):?>
            <div class="col-md-8">
                <?php print render($page['footer_top']);?>
                <hr class="light">
            </div>
            <?php endif;?>
            <?php if($page['footer_31']):?>
            <div class="col-md-3 col-md-offset-1">
                <?php print render($page['footer_31']);?>
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