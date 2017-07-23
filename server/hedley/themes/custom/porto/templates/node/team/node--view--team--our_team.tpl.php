<?php $thumbnail = '';
if(!empty($node->field_image['und'])){
    $thumbnail = file_create_url($node->field_image['und'][0]['uri']);
}
?>
<div class="col-md-2 col-xs-6 center mb-lg">
    <?php if(isset($thumbnail)):?>
        <img src="<?php print $thumbnail;?>" class="img-responsive" alt="">
    <?php endif;?>
    <h5 class="mt-sm mb-none"><?php print $title;?></h5>
    <?php if(isset($content['field_team_category'])):?>
        <p class="mb-none"><?php print render($content['field_team_category']);?></p>
    <?php endif;?>
</div>