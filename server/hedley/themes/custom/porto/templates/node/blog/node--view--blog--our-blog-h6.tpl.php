<div class="col-md-4">
    <div class="recent-posts mt-xl">
        <article class="post">
            <div class="date">
                <span class="day"><?php print format_date($node->created,'custom','d');?></span>
                <span class="month"><?php print format_date($node->created,'custom','M');?></span>
            </div>
            <h4><a href="<?php print $node_url;?>"><?php print $title;?></a></h4>
            <p><?php print render($content['body']);?></p>
            <a href="<?php print $node_url;?>" class="btn btn-borders btn-dark mt-md mb-xl"><?php print t('Read More');?></a>
        </article>
    </div>
</div>