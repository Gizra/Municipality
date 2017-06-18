<?php
$thumbnail = '';
if(!empty($node->field_thumbnail['und'])){
    $thumbnail = file_create_url($node->field_thumbnail['und'][0]['uri']);
}
?>
<li class="isotope-item">
    <div class="image-gallery-item mb-none">
        <a href="<?php print $node_url;?>">
            <span class="thumb-info thumb-info-centered-info thumb-info-no-borders">
                <span class="thumb-info-wrapper">
                    <?php if(isset($thumbnail)):?>
                        <img src="<?php print $thumbnail;?>" class="img-responsive" alt="">
                    <?php endif?>
                    <span class="thumb-info-title">
                        <span class="thumb-info-inner"><?php print $title;?></span>
                        <span class="thumb-info-type">Project Type</span>
                    </span>
                    <span class="thumb-info-action">
                        <span class="thumb-info-action-icon"><i class="fa fa-link"></i></span>
                    </span>
                </span>
            </span>
        </a>
    </div>
</li>