<?php

/**
 * @file node--testimonials.tpl.php
 * Porto's node template for the Testimonials content type.
 */
$image = '';
if(!empty($node->field_image['und'])){}
$image = file_create_url($node->field_image['und'][0]['uri']);
?>
<div>
    <div class="col-md-12">
        <div class="testimonial testimonial-style-2 testimonial-with-quotes mb-none">
            <?php if(isset($image)):?>
            <div class="testimonial-author">
                <img src="<?php print $image;?>" class="img-responsive img-circle" alt="">
            </div>
            <?php endif;?>
            <?php if($content['field_testimonial_content']):?>
                <blockquote>
                    <p><?php print render($content['field_testimonial_content']);?></p>
                </blockquote>
            <?php endif;?>
            <div class="testimonial-author">
                <p><strong><?php print $title;?></strong><span><?php print render($content['field_testimonial_info']);?></span></p>
            </div>
        </div>
    </div>
</div>


