<?php
/**
 * @file
 * Porto's HTML template.
 */
global $theme_root;
$header_layout = theme_get_setting('header_layout');
?>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="ie ie6 <?php if (theme_get_setting('background_color') == 'dark') {print "dark";} ?>" lang="<?php print $language->language; ?>" dir="<?php print $language->dir; ?><?php if ($language->dir == 'rtl'){ echo " rtl"; } ?>"> <![endif]-->
<!--[if IE 7]>    <html class="ie ie7 <?php if (theme_get_setting('background_color') == 'dark') {print "dark";} ?>" lang="<?php print $language->language; ?>" dir="<?php print $language->dir; ?><?php if ($language->dir == 'rtl'){ echo " rtl"; } ?>"> <![endif]-->
<!--[if IE 8]>    <html class="ie ie8 <?php if (theme_get_setting('background_color') == 'dark') {print "dark";} ?>" lang="<?php print $language->language; ?>" dir="<?php print $language->dir; ?><?php if ($language->dir == 'rtl'){ echo " rtl"; } ?>"> <![endif]-->
<!--[if gt IE 8]> <!--> <html class="<?php if(arg(0)== 'index-header-side-header-left' || $header_layout == 'h_side_header_left'): print 'side-header'; elseif(arg(0)== 'index-header-side-header-right' || $header_layout == 'h_side_header_right'): print 'side-header side-header-right'; endif;?> <?php if (theme_get_setting('background_color') == 'dark') {print "dark ";} if(theme_get_setting('site_layout') == 'boxed'){ echo "boxed"; } ?>" lang="<?php print $language->language; ?>" dir="<?php print $language->dir; ?><?php if ($language->dir == 'rtl'){ echo " rtl"; } ?>"> <!--<![endif]-->
<head>
<?php print $head; ?>
<title><?php print $head_title; ?></title>
<!-- Call bootstrap.css before $scripts to resolve @import conflict with respond.js -->
<link rel="stylesheet" href="<?php print base_path() . drupal_get_path('theme', 'porto'); ?>/vendor/bootstrap/css/bootstrap.min.css">
<?php if ($language->dir == 'rtl'): ?>
<link rel="stylesheet" href="<?php print base_path() . drupal_get_path('theme', 'porto'); ?>/vendor/bootstrap-rtl/bootstrap-rtl.css">
<?php endif; ?>

<?php print $styles; ?>
    <?php if(arg(0) == 'index-corporate-3'):?>
        <link rel='stylesheet' href='<?php print $theme_root;?>/css/skins/skin-corporate-3.css' type='text/css' media='all' />
    <?php elseif(arg(0) == 'index-corporate-4'):?>
        <link rel='stylesheet' href='<?php print $theme_root;?>/css/skins/skin-corporate-4.css' type='text/css' media='all' />
    <?php elseif(arg(0) == 'index-corporate-5'):?>
        <link rel='stylesheet' href='<?php print $theme_root;?>/css/skins/skin-corporate-5.css' type='text/css' media='all' />
    <?php elseif(arg(0) == 'index-corporate-6'):?>
        <link rel='stylesheet' href='<?php print $theme_root;?>/css/skins/skin-corporate-6.css' type='text/css' media='all' />
    <?php elseif(arg(0) == 'index-corporate-7'):?>
        <link rel='stylesheet' href='<?php print $theme_root;?>/css/skins/skin-corporate-7.css' type='text/css' media='all' />
    <?php elseif(arg(0) == 'index-corporate-8'):?>
        <link rel='stylesheet' href='<?php print $theme_root;?>/css/skins/skin-corporate-8.css' type='text/css' media='all' />
    <?php elseif(arg(0) == 'index-corporate-hosting'):?>
        <link rel='stylesheet' href='<?php print $theme_root;?>/css/skins/skin-corporate-hosting.css' type='text/css' media='all' />
    <?php endif?>
<?php print $scripts; ?>
<!-- IE Fix for HTML5 Tags -->
<!--[if lt IE 9]>
<![endif]-->

<!--[if IE]>
  <link rel="stylesheet" href="<?php global $parent_root; echo $parent_root; ?>/css/ie.css">
<![endif]-->

<!--[if lte IE 8]>
  <script src="<?php global $parent_root; echo $parent_root; ?>/vendor/respond.js"></script>
<![endif]-->

<!-- Web Fonts  -->
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800&subset=latin,latin-ext" type="text/css" rel="stylesheet">
<link href='//fonts.googleapis.com/css?family=Shadows+Into+Light' rel='stylesheet' type='text/css'>

<?php porto_user_css();?>  
</head>
<body class="<?php print $classes; ?>"<?php print $attributes;?> <?php if(arg(0) == 'one-page'):?> class="one-page" <?php endif; ?> data-target="<?php if(arg(0) == 'index-corporate-hosting'):?> #navSecondary<?php else: ?>#header<?php endif; ?>" data-spy="scroll" data-offset="100">
<?php print $page_top; ?>
<?php print $page; ?>
<?php print $page_bottom; ?>

<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC7Pjsikj52mFixaUDjcMvd0pV3khU8qDo"></script>



</body>

</html>