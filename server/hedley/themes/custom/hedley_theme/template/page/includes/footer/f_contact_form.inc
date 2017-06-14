<?php $footer_color = theme_get_setting('footer_color');?>

<footer class="short <?php if($footer_color == 'primary'): print 'color color-primary'; elseif($footer_color == 'secondary'): print 'color color-secondary'; elseif($footer_color == 'tertiary'): print 'color color-tertiary'; elseif($footer_color == 'quaternary'): print 'color-quaternary'; elseif($footer_color == 'light'): print 'light narrow'; endif;?>" id="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <?php if($page['footer_51']):?>
                    <?php print render($page['footer_51']);?>
                <?php endif;?>
                <?php if($page['footer_52']):?>
                    <hr class="light">
                    <?php print render($page['footer_52']);?>

                <?php endif;?>
            </div>
            <?php if($page['footer_53']):?>
            <div class="col-md-3">
                <?php print render($page['footer_53']);?>
            </div>
            <?php endif;?>
            <?php if($page['footer_54']):?>
            <div class="col-md-4">
                <?php print render($page['footer_54']);?>
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