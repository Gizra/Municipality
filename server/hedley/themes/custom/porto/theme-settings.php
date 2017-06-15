<?php
/**
 * Implements hook_form_system_theme_settings_alter()
 */
function porto_form_system_theme_settings_alter(&$form, &$form_state) {
  
  // Main settings wrapper
  $form['options'] = array(
    '#type' => 'vertical_tabs',
    '#default_tab' => 'defaults',
    '#weight' => '-10',
    '#attached' => array(
      'css' => array(drupal_get_path('theme', 'porto') . '/css/theme-settings.css'),
    ),
  );
  
  // Default Drupal Settings    
  $form['options']['drupal_default_settings'] = array(
		'#type' => 'fieldset',
		'#title' => t('Drupal Core Settings'),
	);
	
	  // "Toggle Display" 
		$form['options']['drupal_default_settings']['theme_settings'] = $form['theme_settings'];
		
		// "Unset default Toggle Display settings" 
		unset($form['theme_settings']);
		
		// "Logo Image Settings" 
		$form['options']['drupal_default_settings']['logo'] = $form['logo'];
		
		// "Unset default Logo Image Settings" 
		unset($form['logo']);
		
		// "Shortcut Icon Settings" 
		$form['options']['drupal_default_settings']['favicon'] = $form['favicon'];   
		
		// "Unset default Shortcut Icon Settings" 
		unset($form['favicon']);
  
  // General
  $form['options']['general'] = array(
    '#type' => 'fieldset',
    '#title' => t('General'),
  );
        
    // Breadcrumbs
    $form['options']['general']['breadcrumbs'] = array(
      '#type' => 'checkbox',
      '#title' => t('Breadcrumbs'),
      '#default_value' => theme_get_setting('breadcrumbs'),
    );
    
    // Sticky Header
    $form['options']['general']['sticky_header'] = array(
      '#type' => 'checkbox',
      '#title' => t('Sticky Header'),
      '#default_value' => theme_get_setting('sticky_header'),
    );
    
    // Logo Height
      $form['options']['general']['logo_height'] = array(
        '#type' => 'textfield',
        '#title' => t('Logo Height'),
        '#default_value' => theme_get_setting('logo_height'),
      );   
      
    // Sticky Logo Height
      $form['options']['general']['sticky_logo_height'] = array(
        '#type' => 'textfield',
        '#title' => t('Sticky Header Logo Height'),
        '#default_value' => theme_get_setting('sticky_logo_height'),
        '#states' => array (
          'invisible' => array(
            'input[name="sticky_header"]' => array('checked' => FALSE)
          )
        )
      );

    // About us
    $form['options']['general']['about_us'] = array(
        '#type' => 'textfield',
        '#title' => t('Title About us'),
        '#default_value' => theme_get_setting('about_us'),
    );
    $form['options']['general']['about_us_link'] = array(
        '#type' => 'textfield',
        '#title' => t('Link About us'),
        '#default_value' => theme_get_setting('about_us_link'),
    );
    // Contact us
    $form['options']['general']['contact_us'] = array(
        '#type' => 'textfield',
        '#title' => t('Title Contact us'),
        '#default_value' => theme_get_setting('contact_us'),
    );
    $form['options']['general']['contact_us_link'] = array(
        '#type' => 'textfield',
        '#title' => t('Link Contact us'),
        '#default_value' => theme_get_setting('contact_us_link'),
    );
    // Phone Number
    $form['options']['general']['phone_number'] = array(
        '#type' => 'textfield',
        '#title' => t('Phone Number'),
        '#default_value' => theme_get_setting('phone_number'),
    );
    // Email
    $form['options']['general']['email'] = array(
        '#type' => 'textfield',
        '#title' => t('Email'),
        '#default_value' => theme_get_setting('email'),
    );

    $form['options']['general']['send_email'] = array(
        '#type' => 'textfield',
        '#title' => t('Text Email'),
        '#default_value' => theme_get_setting('send_email'),
    );

    $form['options']['general']['email_link'] = array(
        '#type' => 'textfield',
        '#title' => t('Email Link'),
        '#default_value' => theme_get_setting('email_link'),
    );
    // Get in touch
    $form['options']['general']['get_in_touch'] = array(
        '#type' => 'textfield',
        '#title' => t('Get in touch header'),
        '#default_value' => theme_get_setting('get_in_touch'),
    );

    // Blog
  $form['options']['blog'] = array(
    '#type' => 'fieldset',
    '#title' => t('Blog'),
  );       
  
	  // Blog Image Size
    $form['options']['blog']['blog_image'] = array(
      '#type' => 'select',
      '#title' => t('Blog Teaser Image Size'),
      '#default_value' => theme_get_setting('blog_image'),
      '#options' => array(
        'full' => t('Full (default)'),
        'medium' => t('Medium'),
      ),
    );
    
    // Blog Image Slider
    $form['options']['blog']['blog_image_slider'] = array(
      '#type' => 'checkbox',
      '#title' => t('Blog Image Slider'),
      '#default_value' => theme_get_setting('blog_image_slider'),
    );
    
    // Post Share
    $form['options']['blog']['blog_share'] = array(
      '#type' => 'checkbox',
      '#title' => t('Blog Post Sharing'),
      '#default_value' => theme_get_setting('blog_share'),
    );
     
    
  // Color
  $form['options']['color'] = array(
    '#type' => 'fieldset',
    '#title' => t('Color'),
  );  
  
    // Primary Color
    $form['options']['color']['skin_color'] =array(
      '#type' => 'jquery_colorpicker',
	    '#title' => t('Primary Color'),
	    '#default_value' => theme_get_setting('skin_color'),
    ); 
    
    // Secondary Color
    $form['options']['color']['secondary_color'] =array(
      '#type' => 'jquery_colorpicker',
	    '#title' => t('Secondary Color'),
	    '#default_value' => theme_get_setting('secondary_color'),
    ); 
    
    // Tertiary Color
    $form['options']['color']['tertiary_color'] =array(
      '#type' => 'jquery_colorpicker',
	    '#title' => t('Tertiary Color'),
	    '#default_value' => theme_get_setting('tertiary_color'),
    ); 
    
    // Quaternary Color
    $form['options']['color']['quaternary_color'] =array(
      '#type' => 'jquery_colorpicker',
	    '#title' => t('Quaternary Color'),
	    '#default_value' => theme_get_setting('quaternary_color'),
    ); 
        
    // Background Color
    $form['options']['color']['background_color'] = array(
      '#type' => 'select',
      '#title' => t('Background Color'),
      '#default_value' => theme_get_setting('background_color'),
      '#options' => array(
        'light' => t('Light (default)'),
        'dark' => t('Dark'),
      ),
    );
    
  // Layout
  $form['options']['layout'] = array(
    '#type' => 'fieldset',
    '#title' => t('Layout'),
  );  
  
    // Site Layout
    $form['options']['layout']['site_layout'] = array(
      '#type' => 'select',
      '#title' => t('Body Layout'),
      '#default_value' => theme_get_setting('site_layout'),
      '#options' => array(
        'wide' => t('Wide (default)'),
        'boxed' => t('Boxed'),
      ),
    );
    
  //Background
    $form['options']['layout']['background'] = array(
      '#type' => 'fieldset',
      '#title' => '<h3 class="options_heading">Background</h3>',
      '#states' => array (
          'visible' => array(
            'select[name=site_layout]' => array('value' => 'boxed')
          )
        )
    );
    
    // Body Background 
    $form['options']['layout']['background']['body_background'] = array(
      '#type' => 'select',
      '#title' => t('Body Background'),
      '#default_value' => theme_get_setting('body_background'),
      '#options' => array(
        'porto_backgrounds' => t('Background Image (default)'),
        'custom_background_color' => t('Background Color'),
      ),
    );
    
    // Porto Background Choices
    $form['options']['layout']['background']['background_select'] = array(
      '#type' => 'radios',
      '#title' => t('Select a background pattern:'),
      '#default_value' => theme_get_setting('background_select'),
      '#options' => array(
        'az_subtle' => 'item',
        'blizzard' => 'item',
        'bright_squares' => 'item',
        'denim' => 'item',
        'fancy_deboss' => 'item',
        'gray_jean' => 'item',
        'honey_im_subtle' => 'item',
        'linen' => 'item',
        'pw_maze_white' => 'item',
        'random_grey_variations' => 'item',
        'skin_side_up' => 'item',
        'stitched_wool' => 'item',
        'straws' => 'item',
        'subtle_grunge' => 'item',
        'textured_stripes' => 'item',
        'wild_oliva' => 'item',
        'worn_dots' => 'item',
      ),
      '#states' => array (
          'visible' => array(
            'select[name=body_background]' => array('value' => 'porto_backgrounds')
          )
        )
      );  
    
      // Custom Background Color
      $form['options']['layout']['background']['body_background_color'] =array(
        '#type' => 'jquery_colorpicker',
		    '#title' => t('Body Background Color'),
		    '#default_value' => theme_get_setting('body_background_color'),
	      '#states' => array (
	        'visible' => array(
	          'select[name=body_background]' => array('value' => 'custom_background_color')
	        )
        )
      );   
      
      // Portfolio Columns
      $form['options']['layout']['portfolio_columns'] = array(
        '#type' => 'select',
        '#title' => t('Portfolio Columns (Legacy Setting)'),
        '#default_value' => theme_get_setting('portfolio_columns'),
        '#options' => array(
          'col-md-6' => 'Two',
          'col-md-4' => 'Three',
          'col-md-3' => 'Four (default)',
        ),
      ); 
    
  // CSS
  $form['options']['css'] = array(
    '#type' => 'fieldset',
    '#title' => t('CSS'),
  );
  
    // User CSS
      $form['options']['css']['user_css'] = array(
        '#type' => 'textarea',
        '#title' => t('Add your own CSS'),
        '#default_value' => theme_get_setting('user_css'),
      );
  // Header
    $form['options']['header'] = array(
        '#type' => 'fieldset',
        '#title' => t('Header'),
    );
    $form['options']['header']['header_layout'] = array(
        '#type' => 'select',
        '#title' => t('Header Layout'),
        '#default_value' => theme_get_setting('header_layout'),
        '#options' => array(
            'none' => 'None',
            'h_default' => 'Default',
            'h_language_dropdown' => 'Default + Language Dropdown',
            'h_flat' => 'Flat',
            'h_flat_topbar' => 'Flat + Top Bar',
            'h_flat_topbar_color' => 'Flat + Colored Top Bar',
            'h_flat_topbar_search' => 'Flat + Top Bar with Search',
            'h_transparent' => 'Transparent',
            'h_transparent_border_bottom' => 'Transparent - Bottom Border',
            'h_transparent_semi' => 'Semi Transparent',
            'h_transparent_semi_light' => 'Semi Transparent - Light',
            'h_center' => 'Center',
            'h_narrow' => 'Narrow',
            'h_fullwidth' => 'Full-Width',
            'h_navbar' => 'Navbar',
            'h_navbar_extra_info' => 'Navbar + Extra Info',
            'h_side_header_left' => 'Side Header Left',
            'h_side_header_right' => 'Side Header Right',
        ),
    );
  // Footer
  $form['options']['footer'] = array(
    '#type' => 'fieldset',
    '#title' => t('Footer'),
  );
  
    // Footer Ribbon
    $form['options']['footer']['ribbon'] = array(
      '#type' => 'checkbox',
      '#title' => t('Footer Ribbon'),
      '#default_value' => theme_get_setting('ribbon'),
    );
  
// Footer Ribbon Text
  $form['options']['footer']['ribbon_text'] = array(
    '#type' => 'textfield',
    '#title' => t('Footer Ribbon Text'),
    '#default_value' => theme_get_setting('ribbon_text'),
  );

  $form['options']['footer']['footer_layout'] = array(
      '#type' => 'select',
      '#title' => t('Footer Layout'),
      '#default_value' => theme_get_setting('footer_layout'),
      '#options' => array(
          'none' => 'None',
          'f_default' => 'Default',
          'f_advanced' => 'Advanced',
          'f_simple' => 'Simple',
          'f_latest_work' => 'Latest Work',
          'f_contact_form' => 'Contact Form',
          'f_narrow' => 'Narrow',
      ),
  );

    $form['options']['footer']['footer_color'] = array(
        '#type' => 'select',
        '#title' => t('Footer Color'),
        '#default_value' => theme_get_setting('footer_color'),
        '#options' => array(
            'none' => 'None',
            'primary' => 'Primary',
            'secondary' => 'Secondary',
            'tertiary' => 'Tertiary',
            'quaternary' => 'Quaternary',
            'light' => 'Light',
        ),
    );

    // Page Header
    $form['options']['design']['page_header'] = array(
        '#type' => 'fieldset',
        '#title' => '<div class="plus"></div><h3 class="options_heading">Page Header Style</h3>',
    );
    $form['options']['design']['page_header']['page_header_option'] = array(
        '#type' => 'select',
        '#title' => 'Select a header style option:',
        '#default_value' => theme_get_setting('page_header_option'),
        '#options' => array(
            'none' => 'None',
            'ph_default' => 'Default',
            'ph_light' => 'Light',
            'ph_light_reverse' => 'Light - Reverse',
            'ph_parallax' => 'Parallax',
            'ph_center' => 'Center',
        ),
    );
    // Page Header
    $form['options']['design']['page_header']['page_header_color']['page_header_color_option'] = array(
        '#type' => 'select',
        '#title' => 'Select a header style option:',
        '#default_value' => theme_get_setting('page_header_color_option'),
        '#options' => array(
            'none' => 'None',
            'page-header-primary' => 'Primary Color',
            'page-header-secondary' => 'Secondary Color',
            'page-header-tertiary' => 'Tertiary Color',
            'page-header-quaternary' => 'Quaternary Color',
        ),

        '#states' => array (
            'visible' => array(
                'select[name = page_header_option]' => array('value' => 'ph_default')
            )
        )
    );

}
?>