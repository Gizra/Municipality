<div class="col-md-6">
    <div class="recent-posts mt-xl">
        <article class="post">
            <div class="date">
                <span class="day"><?php print format_date($node->created,'custom','d');?></span>
                <span class="month background-color-secondary"><?php print format_date($node->created,'custom','M');?></span>
            </div>
            <h4><a class="text-light" href="<?php print $node_url;?>"><?php print $title;?></a></h4>
            <?php if(isset($content['body'])):?>
            <p><?php print render($content['body']);?></p>
            <?php endif;?>
            <a href="<?php print $node_url;?>" class="btn btn-secondary mt-md mb-xl"><?php print t('Read More');?></a>
        </article>
    </div>
</div>