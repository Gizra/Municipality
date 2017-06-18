<?php

$page_header_option = theme_get_setting('page_header_option');
$page_header_color_option = theme_get_setting('page_header_color_option');
global $theme_root;
$path = current_path();
$arg = drupal_lookup_path('alias',$path);
?>
<?php if($title && $breadcrumb && !drupal_is_front_page()): ?>
<!--breadcrumbs-->
<?php if (theme_get_setting('breadcrumbs') == '1'): ?>
<?php if($page_header_option == 'none'):?>
    <?php if($arg == 'index-page-header-light'):?>
    <section class="page-header page-header-light page-header-more-padding ">
    <?php elseif($arg == 'index-page-header-light-reverse'):?>
    <section class="page-header page-header-light page-header-reverse page-header-more-padding">
    <?php elseif($arg == 'index-page-header-parallax'):?>
    <section class="page-header page-header-custom-background parallax" data-plugin-parallax data-plugin-options='{"speed": 1.5}' data-image-src="<?php print $theme_root;?>/img/parallax.jpg">
    <?php elseif($arg == 'index-page-header-center'):?>
    <section class="page-header page-header-center page-header-more-padding page-header-no-title-border">
    <?php elseif($arg == 'index-page-header-color-primary'):?>
    <section class="page-header page-header-color page-header-primary page-header-more-padding">
    <?php elseif($arg == 'index-page-header-color-quaternary'):?>
    <section class="page-header page-header-color page-header-quaternary page-header-more-padding">
    <?php elseif($arg == 'index-page-header-color-secondary'):?>
    <section class="page-header page-header-color page-header-secondary page-header-more-padding">
    <?php elseif($arg == 'index-page-header-color-tertinary'):?>
    <section class="page-header page-header-color page-header-tertiary page-header-more-padding">
    <?php else :?>
    <section class="page-header">
    <?php endif ;?>
<?php else :?>
    <?php if($page_header_option == 'ph_light'):?>
    <section class="page-header page-header-light page-header-more-padding ">
    <?php elseif($page_header_option == 'ph_light_reverse'):?>
    <section class="page-header page-header-light page-header-reverse page-header-more-padding">
    <?php elseif($page_header_option == 'ph_parallax'):?>
    <section class="page-header page-header-custom-background parallax" data-plugin-parallax data-plugin-options='{"speed": 1.5}' data-image-src="<?php print $theme_root;?>/img/parallax.jpg">
    <?php elseif($page_header_option == 'ph_center'):?>
    <section class="page-header page-header-center page-header-more-padding page-header-no-title-border">
    <?php else :?>
    <section class="page-header <?php if(isset($page_header_color_option) && $page_header_color_option != 'none'):?> page-header-color <?php echo $page_header_color_option ;?><?php endif ;?>">
    <?php endif ;?>
<?php endif ;?>

    <div class="container">
    <?php if($page_header_option == 'ph_light' or $arg == 'index-page-header-light' or $page_header_option == 'ph_parallax' or $arg == 'index-page-header-parallax' or $page_header_option == 'ph_center' or $arg == 'index-page-header-center' or $arg == 'index-page-header-color-primary' or $arg == 'index-page-header-color-quaternary' or $arg == 'index-page-header-color-secondary' or $arg == 'index-page-header-color-tertinary'): ?>
        <div class="row">
            <div class="col-md-12">
                <?php print $breadcrumb; ?>
            </div>
        </div>
      <?php else :?>
        <div class="row">
            <div class="col-md-12">
                <?php print $breadcrumb; ?>
            </div>
        </div>
      <?php endif;?>
        </div>
    </section>
<?php endif;?>
<?php endif;?>