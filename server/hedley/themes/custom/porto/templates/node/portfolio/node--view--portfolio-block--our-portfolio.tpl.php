<?php
$thumbnail = '';
if(!empty($node->field_thumbnail['und'])){
    $thumbnail = file_create_url($node->field_thumbnail['und'][0]['uri']);
}
?>
<div>
    <a href="<?php print $node_url;?>">
        <img src="<?php print $thumbnail;?>" class="img-responsive" alt="">
    </a>
</div>
