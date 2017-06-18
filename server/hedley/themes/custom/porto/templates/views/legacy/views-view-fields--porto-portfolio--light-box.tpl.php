<?php
$tid = array();
if(!empty($row->field_field_portfolio_category)){
    $tid = $row->field_field_portfolio_category;
}
$image = array();
if(isset($fields['field_thumbnail']->content)){
    $image = explode(',',$fields['field_thumbnail']->content);

}
?>

<div class="portfolio-item">
    <a href="#popup<?php print $row->nid;?>" data-portfolio-on-modal>
        <span class="thumb-info thumb-info-lighten">
            <span class="thumb-info-wrapper">
                <span class="owl-carousel owl-theme nav-inside m-none" data-plugin-options='{"items": 1, "margin": 10, "animateOut": "fadeOut", "autoplay": true, "autoplayTimeout": 3000}'>
                <?php foreach($image as $key => $value):?>
                    <span>
                        <img src="<?php print file_create_url($value);?>" class="img-responsive" alt="">
                    </span>
                <?php endforeach?>
                </span>

                <span class="thumb-info-title">
                     <?php if(isset($fields['title'])):?>
                         <span class="thumb-info-inner"><?php echo $fields['title']->content;?></span>
                     <?php endif;?>
                    <?php if(isset($fields['field_portfolio_category'])):?>
                        <span class="thumb-info-type"><?php echo $fields['field_portfolio_category']->content;?></span>
                    <?php endif;?>
                </span>
                <span class="thumb-info-action">
                    <span class="thumb-info-action-icon"><i class="fa fa-plus-square"></i></span>
                </span>
            </span>
        </span>
    </a>
    <!-- Popup Project - Start -->
    <div id="popup<?php print $row->nid;?>" class="popup-inline-content">
        <div class="row">
            <div class="col-md-12">
                <div class="portfolio-title">
                    <div class="row">
                        <div class="portfolio-nav-all col-md-1">
                            <a href="#" data-portfolio-close><i class="fa fa-th"></i></a>
                        </div>
                        <div class="col-md-10 center">
                            <h2 class="mb-none"><?php print $fields['title']->content;?></h2>
                        </div>
                        <div class="portfolio-nav col-md-1">
                            <a href="#" data-portfolio-prev class="portfolio-nav-prev"><i class="fa fa-chevron-left"></i></a>
                            <a href="#" data-portfolio-next class="portfolio-nav-next"><i class="fa fa-chevron-right"></i></a>
                        </div>
                    </div>
                </div>

                <hr class="tall">
            </div>
        </div>

        <div class="row mb-xl">
            <div class="col-md-4">
                 <span class="owl-carousel owl-theme nav-inside m-none" data-plugin-options='{"items": 1, "margin": 10, "animateOut": "fadeOut", "autoplay": true, "autoplayTimeout": 3000}'>
                <?php foreach($image as $key => $value):?>
                    <span class="img-thumbnail">
                        <img src="<?php print file_create_url($value);?>" class="img-responsive" alt="">
                    </span>
                <?php endforeach?>
                </span>

            </div>
            <div class="col-md-8">
                <div class="portfolio-info">
                    <div class="row">
                        <div class="col-md-12 center">
                            <ul>
                                <?php if(isset($fields['created'])):?>
                                    <li>
                                        <i class="fa fa-calendar"></i> <?php print $fields['created']->content;?>
                                    </li>
                                <?php endif;?>
                                <?php if(isset($fields['field_portfolio_category'])):?>
                                    <li>
                                        <i class="fa fa-tags"></i> <?php print $fields['field_portfolio_category']->content;?>
                                    </li>
                                <?php endif;?>
                            </ul>
                        </div>
                    </div>
                </div>

                <h5 class="mt-sm"><?php print t('Project Description');?></h5>
                <?php if(isset($fields['field_portfolio_description'])):?>
                    <p class="mt-xlg"><?php print $fields['field_portfolio_description']->content;?></p>
                <?php endif;?>

                <a href="<?php print $fields['path']->content;?>" class="btn btn-primary btn-icon"><i class="fa fa-external-link"></i><?php print t('Live Preview')?></a>

                <ul class="portfolio-details">
                    <?php if(isset($fields['field_portfolio_skills'])):?>
                        <li>
                            <h5 class="mt-sm mb-xs"><?php print t('Skills');?></h5>

                            <ul class="list list-inline list-icons">
                                <?php print $fields['field_portfolio_skills']->content;?>
                            </ul>
                        </li>
                    <?php endif;?>
                    <?php if(isset($fields['field_portfolio_client'])):?>
                        <li>
                            <h5 class="mt-sm mb-xs"><?php print t('Client');?></h5>
                            <p><?php print $fields['field_portfolio_client']->content;?></p>
                        </li>
                    <?php endif;?>
                </ul>

            </div>
        </div>
    </div>
</div>
