
<?php $image = '';
if(!empty($node->field_image['und'])){
    $image = $node->field_image['und'];
}
?>

<?php foreach($image as $key => $value):?>
<?php if($key % 2 == 0):?>
<div class="row content-grid-row">
<?php endif;?>
<div class="content-grid-item col-md-6 center">
    <img class="img-responsive" src="<?php print file_create_url($value['uri']);?>" alt="">
</div>
<?php if($key % 2 != 0):?>
</div>
<?php endif;?>
<?php endforeach;?>


