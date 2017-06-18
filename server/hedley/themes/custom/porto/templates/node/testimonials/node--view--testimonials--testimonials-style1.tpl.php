<?php

/**
 * @file node--testimonials.tpl.php
 * Porto's node template for the Testimonials content type.
 */
?>
<div>
    <div class="col-md-12">
        <div class="testimonial testimonial-style-6 testimonial-with-quotes mb-none">
            <?php if(isset($content['field_testimonial_content'])):?>
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