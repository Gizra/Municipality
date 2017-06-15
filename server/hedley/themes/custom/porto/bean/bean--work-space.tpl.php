<?php
/**
 * @file
 * Default theme implementation for beans.
 *
 * Available variables:
 * - $content: An array of comment items. Use render($content) to print them all, or
 *   print a subset such as render($content['field_example']). Use
 *   hide($content['field_example']) to temporarily suppress the printing of a
 *   given element.
 * - $title: The (sanitized) entity label.
 * - $url: Direct url of the current entity if specified.
 * - $page: Flag for the full page state.
 * - $classes: String of classes that can be used to style contextually through
 *   CSS. It can be manipulated through the variable $classes_array from
 *   preprocess functions. By default the following classes are available, where
 *   the parts enclosed by {} are replaced by the appropriate values:
 *   - entity-{ENTITY_TYPE}
 *   - {ENTITY_TYPE}-{BUNDLE}
 *
 * Other variables:
 * - $classes_array: Array of html class attribute values. It is flattened
 *   into a string within the variable $classes.
 *
 * @see template_preprocess()
 * @see template_preprocess_entity()
 * @see template_process()
 */

$image = '';
if(isset($content['field_image'])) {
	$image = $content['field_image'];
}
//kpr($image);
?>
<?php if(empty($bean->field_body)):?>
<div data-plugin-lightbox data-plugin-options='{"delegate": "a", "type": "image", "gallery": {"enabled": true}}'>
    <div class="row">
        <?php foreach($image as $key => $value):?>
            <?php if(isset($key) && is_numeric($key)):?>
                <div class="col-md-4">
                    <a class="img-thumbnail mb-xl" href="<?php print file_create_url($value['#item']['uri']);?>" data-plugin-options='{"type":"image"}'>
                        <img class="img-responsive" src="<?php print file_create_url($value['#item']['uri']);?>" alt="Office">
                        <span class="zoom">
                            <i class="fa fa-search"></i>
                        </span>
                    </a>
                </div>
            <?php endif;?>
        <?php endforeach;?>
    </div>
</div>
<?php else:?>
<div class="container">

    <div class="row">
        <div class="col-md-7">
           <?php if(isset($content['field_body'])):?>
               <?php print render($content['field_body']);?>
           <?php endif;?>

            <div data-plugin-lightbox data-plugin-options='{"delegate": "a", "type": "image", "gallery": {"enabled": true}}'>
                <div class="row">
                    <?php foreach($image as $key => $value):?>
                        <?php if(isset($key) && is_numeric($key)):?>
                            <div class="col-md-4">
                                <a class="img-thumbnail mb-xl" href="<?php print file_create_url($value['#item']['uri']);?>" data-plugin-options='{"type":"image"}'>
                                    <img class="img-responsive" src="<?php print file_create_url($value['#item']['uri']);?>" alt="Office">
                                                    <span class="zoom">
                                                        <i class="fa fa-search"></i>
                                                    </span>
                                </a>
                            </div>
                        <?php endif;?>
                   <?php endforeach;?>
                </div>
            </div>

        </div>
        <?php if(isset($content['field_contact'])):?>
        <div class="col-md-5">
            <?php print render($content['field_contact']);?>
        </div>
        <?php endif;?>
    </div>

</div>
<?php endif;?>
