<div class="col-md-6">
    <div class="recent-posts">
        <article class="post">
            <div class="date">
                <span class="day"><?php print format_date($node->created,'custom','d');?></span>
                <span class="month"><?php print format_date($node->created,'custom','M');?></span>
            </div>
            <h4 class="heading-primary"><a href="<?php print $node_url;?>"><?php print $title;?></a></h4>
            <p><?php print render($content['body']);?> <a href="<?php print $node_url;?>" class="read-more"><?php print t('read more');?> <i class="fa fa-angle-right"></i></a></p>
        </article>
    </div>
</div>

