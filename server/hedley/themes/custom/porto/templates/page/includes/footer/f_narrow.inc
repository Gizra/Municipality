<?php $footer_color = theme_get_setting('footer_color');?>
<footer id="footer" class="narrow <?php if($footer_color == 'primary'): print 'color color-primary'; elseif($footer_color == 'secondary'): print 'color color-secondary'; elseif($footer_color == 'tertiary'): print 'color color-tertiary'; elseif($footer_color == 'quaternary'): print 'color-quaternary'; elseif($footer_color == 'light'): print 'light narrow'; endif;?>">
    <div class="container">
        <div class="row">
            <?php if($page['footer_61']):?>
            <div class="col-md-9">
                <?php print render($page['footer_61']);?>
            </div>
            <?php endif;?>
            <?php if($page['footer_62']):?>
            <div class="col-md-3">
                <?php print render($page['footer_62']);?>
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