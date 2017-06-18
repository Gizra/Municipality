<?php $thumbnail = '';
if(!empty($node->field_thumbnail['und'])){
    $thumbnail = file_create_url($node->field_thumbnail['und'][0]['uri']);
}
?>
<div class="col-md-3">
    <?php if(isset($thumbnail)):?>
    <img class="img-responsive" src="<?php print $thumbnail;?>" alt="Blog">
    <?php endif;?>
    <div class="recent-posts mt-md mb-lg">
        <article class="post">
            <h5><a class="text-dark" href="<?php print $node_url;?>"><?php print $title;?></a></h5>
            <?php if(isset($content['body'])):?>
            <p><?php print render($content['body']);?></p>
            <?php endif;?>
            <div class="post-meta">
                <span><i class="fa fa-calendar"></i> <?php print format_date($node->created,'custom','j F , Y');?> </span>
                <span><i class="fa fa-user"></i> <?php print t('By')?> <?php print $name;?></span>
                <span><i class="fa fa-tag"></i> <?php print render($content['field_tags']);?> </span>
                <span><i class="fa fa-comments"></i> <a href="#"><?php print $comment_count;?> <?php print t('Comments');?></a></span>
            </div>
        </article>
    </div>
</div>