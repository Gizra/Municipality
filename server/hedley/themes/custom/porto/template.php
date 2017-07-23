<?php 

/**
 * Define $root global variable.
 */
global $theme_root, $parent_root;
$theme_root = base_path() . path_to_theme();
$parent_root = base_path() . drupal_get_path('theme', 'porto');


/**
*  Implements theme_js_alter().
*/
function porto_js_alter(&$js) {
 global $user; 
 
}

/**
*  Implements theme_css_alter().
*/
function porto_css_alter(&$css) {
  global $language;
	if (isset($language->dir) && $language->dir == 'rtl') {
	  unset($css[drupal_get_path('theme', 'porto') . '/css/theme.css']);
	  unset($css[drupal_get_path('theme', 'porto') . '/css/theme-elements.css']);
	  unset($css[drupal_get_path('theme', 'porto') . '/css/theme-blog.css']);
	  unset($css[drupal_get_path('theme', 'porto') . '/css/theme-shop.css']);
	  unset($css[drupal_get_path('theme', 'porto') . '/css/ie.css']);
	}
}

/**
 * Implements hook_html_head_alter().
 */
function porto_html_head_alter(&$head_elements) {
	unset($head_elements['system_meta_generator']);
	foreach ($head_elements as $key => $element) {
		if (isset($element['#attributes']['rel']) && $element['#attributes']['rel'] == 'canonical') {
		  unset($head_elements[$key]);
		}
		if (isset($element['#attributes']['rel']) && $element['#attributes']['rel'] == 'shortlink') {
		  unset($head_elements[$key]);
		}
  }
}

/**
 * Add Bootstrap classes to button elements.
 */
function porto_button($variables) {

  $element = $variables['element'];
  $element['#attributes']['type'] = 'submit';
  element_set_attributes($element, array('id', 'name', 'value'));

  $element['#attributes']['class'][] = 'btn-primary btn form-' . $element['#button_type'];
  if (!empty($element['#attributes']['disabled'])) {
    $element['#attributes']['class'][] = 'form-button-disabled';
  }

  return '<input' . drupal_attributes($element['#attributes']) . ' />';
}

/**
 * Implements theme_menu_local_tasks().
 */
function porto_menu_local_tasks(&$variables) {
  $output = '';

  if (!empty($variables['primary'])) {
    $variables['primary']['#prefix'] = '<h2 class="element-invisible">' . t('Primary tabs') . '</h2>';
    $variables['primary']['#prefix'] .= '<ul class="nav nav-tabs">';
    $variables['primary']['#suffix'] = '</ul>';
    $output .= drupal_render($variables['primary']);
  }
  if (!empty($variables['secondary'])) {
    $variables['secondary']['#prefix'] = '<h2 class="element-invisible">' . t('Secondary tabs') . '</h2>';
    $variables['secondary']['#prefix'] .= '<ul class="nav nav-tabs">';
    $variables['secondary']['#suffix'] = '</ul>';
    $output .= drupal_render($variables['secondary']);
  }

  return $output;
}

/**
* Add several style-related elements into the <head> tag.
*/
function porto_preprocess_html(&$vars){
 global $parent_root;
 if ($vars['language']->dir == 'rtl') {
	 drupal_add_css(drupal_get_path('theme', 'porto') . '/css/rtl-theme.css', array('group' => CSS_DEFAULT, 'type' => 'file'));
	 drupal_add_css(drupal_get_path('theme', 'porto') . '/css/rtl-theme-elements.css', array('group' => CSS_DEFAULT, 'type' => 'file'));
	 drupal_add_css(drupal_get_path('theme', 'porto') . '/css/rtl-theme-blog.css', array('group' => CSS_DEFAULT, 'type' => 'file'));
	 drupal_add_css(drupal_get_path('theme', 'porto') . '/css/rtl-theme-shop.css', array('group' => CSS_DEFAULT, 'type' => 'file'));
	 drupal_add_css(drupal_get_path('theme', 'porto') . '/css/rtl-ie.css', array('group' => CSS_DEFAULT, 'type' => 'file'));
 }
 
 $viewport = array(
   '#type' => 'html_tag',
   '#tag' => 'meta',
   '#attributes' => array(
     'name' => 'viewport',
     'content' =>  'width=device-width, initial-scale=1',
   ),
   '#weight' => 1,
 );

  $background_image = array(
   '#type' => 'markup',
   '#markup' => "<style type='text/css'>body {background-image:url(".$parent_root."/img/patterns/".theme_get_setting('background_select').".png);}</style> ",
   '#weight' => 2,
 );

 $background_color = array(
   '#type' => 'markup',
   '#markup' => "<style type='text/css'>body {background-color: #".theme_get_setting('body_background_color')." !important;}</style> ",
   '#weight' => 3,
 );
 
 drupal_add_html_head( $viewport, 'viewport');

 if (theme_get_setting('body_background') == "porto_backgrounds" && theme_get_setting('site_layout') == "boxed") {
   drupal_add_html_head( $background_image, 'background_image');
 }

 if (theme_get_setting('body_background') == "custom_background_color") {
   drupal_add_html_head( $background_color, 'background_color');
 }
 // Add boxed class if layout is set that way.
 if (theme_get_setting('site_layout') == 'boxed'){
   $vars['classes_array'][] = 'boxed';
 }
 
}
function _is_panel_page() {
    $page = &drupal_static(__FUNCTION__);
    if (function_exists("page_manager_get_current_page")) {
        if (!isset($page)) {
            $page = page_manager_get_current_page();
        }
    }
    return $page ? $page : FALSE;
}
/**
 * Assign theme hook suggestions for custom templates and pass color theme setting
 * to skin.less file.
 */  
function porto_preprocess_page(&$vars, $hook) {
    if($panel_page = _is_panel_page()) {
        // Add a generic suggestion for all panel pages.
        $vars['theme_hook_suggestions'][] = 'page__panel';
        // Add the panel page machine name to the template suggestions.
        $vars['theme_hook_suggestions'][] = 'page__' . $panel_page['name'];
        // Add a body class for good measure.
        $body_classes[] = 'page-panel';
    }
  if (isset($vars['node'])) {
    $suggest = "page__node__{$vars['node']->type}";
    $vars['theme_hook_suggestions'][] = $suggest;
    $vars['node_type'] = $vars['node']->type;
  }
  
  if (arg(0) == 'taxonomy' && arg(1) == 'term' ){
    $term = taxonomy_term_load(arg(2));
    $vars['theme_hook_suggestions'][] = 'page--taxonomy--vocabulary--' . $term->vid;
  }
  $path = current_path();
  $arg = drupal_lookup_path('alias',$path);

  if(strpos($arg,'shortcodes') !== false){
      $vars['theme_hook_suggestions'][] = 'page__type__page';
  }
  if (request_path() == 'one-page') {
    $vars['theme_hook_suggestions'][] = 'page__onepage';
  }  
 	
	if (!module_exists('less')) {
	  drupal_add_css(drupal_get_path('theme', 'porto') .'/css/skins/default.css', array('group'=>CSS_THEME)); 
	}
	drupal_add_js(drupal_get_path('theme', 'porto') . '/js/theme.js',array('type' => 'file','scope' => 'footer'));
	drupal_add_js(drupal_get_path('theme', 'porto') . '/js/views/view.home.js',array('type' => 'file','scope' => 'footer'));
	drupal_add_js(drupal_get_path('theme', 'porto') . '/js/theme.init.js',array('type' => 'file','scope' => 'footer'));
	drupal_add_js(drupal_get_path('theme', 'porto') . '/js/examples/examples.portfolio.js',array('type' => 'file','scope' => 'footer'));

	 
}

if (module_exists('less')) {
	function porto_less_variables_alter(array &$less_variables, $system_name) {	
	  if ($system_name === 'porto') {
	    $less_variables['@color-primary'] = '#'.theme_get_setting('skin_color').'';
	    $less_variables['@color-secondary'] = '#'.theme_get_setting('secondary_color').'';
	    $less_variables['@color-tertiary'] = '#'.theme_get_setting('tertiary_color').'';
	    $less_variables['@color-quaternary'] = '#'.theme_get_setting('quaternary_color').'';
	  }
	}
}


/**
 * Define some variables for use in theme templates.
 */
function porto_process_page(&$variables) {	
  // Assign site name and slogan toggle theme settings to variables.
  $variables['disable_site_name']   = theme_get_setting('toggle_name') ? FALSE : TRUE;
  $variables['disable_site_slogan'] = theme_get_setting('toggle_slogan') ? FALSE : TRUE;
   // Assign site name/slogan defaults if there is no value.
  if ($variables['disable_site_name']) {
    $variables['site_name'] = filter_xss_admin(variable_get('site_name', 'Drupal'));
  }
  if ($variables['disable_site_slogan']) {
    $variables['site_slogan'] = filter_xss_admin(variable_get('site_slogan', ''));
  }
}	

/**
 * Add list classes for links in "Header Menu" region.
 */
function porto_menu_link__header_menu(array $variables) {
  $output = '';
  unset($variables['element']['#attributes']['class']);
  $element = $variables['element'];
  static $item_id = 0;
  $menu_name = $element['#original_link']['menu_name'];

  // set the global depth variable
  global $depth;
  $depth = $element['#original_link']['depth'];
  if ( ($element['#below']) && ($depth == "1") ) {
    $element['#attributes']['class'][] = 'dropdown '.$element['#original_link']['mlid'].'';
    $element['#localized_options']['attributes']['class'][] = 'dropdown-toggle disabled';
  }
  
  if ( ($element['#below']) && ($depth == "2") ) {
    $element['#attributes']['class'][] = 'dropdown-submenu';
  }
  if ( ($element['#below']) && ($depth == "3") ) {
    $element['#attributes']['class'][] = 'dropdown-submenu';
  }



    $sub_menu = $element['#below'] ? drupal_render($element['#below']) : '';
  $output .= l($element['#title'], $element['#href'], $element['#localized_options']);
  
  // if link class is active, make li class as active too
  if(strpos($output,"active")>0){
    $element['#attributes']['class'][] = "active";
  }
 
  return '<li' . drupal_attributes($element['#attributes']) . '>' . $output . $sub_menu . '</li>';
  
}

/**
 * Define class for first menu UL.
 */
function porto_menu_tree__header_menu($variables){
  return '<ul class="nav nav-pills nav-main" id="mainMenu">' . $variables['tree'] . '</ul>';
  
}

/**
 * Define class for all other menu ULs.
 */
function porto_menu_tree__header_menu_below($variables){
  return '<ul class="dropdown-menu">' . $variables['tree'] . '</ul>';
}

/**
 * Impelements theme_status_messages()
 */
function porto_status_messages($variables) {
  $display = $variables['display'];
  $output = '';

  $status_heading = array(
    'status' => t('Status message'),
    'error' => t('Error message'),
    'warning' => t('Warning message'),
  );
  foreach (drupal_get_messages($display) as $type => $messages) {
    switch ($type) {
	    case 'status':
	      $output .= "<div class=\"alert alert-success\">\n";
	    break;
	    case 'warning':
	      $output .= "<div class=\"alert alert-warning\">\n";
	    break;
	    case 'error':
	      $output .= "<div class=\"alert alert-danger\">\n";
	    break;
	    default: 
	      $output .= "<div class=\"messages $type\">\n";
	    break;
    }
    if (!empty($status_heading[$type])) {
      $output .= '<h2 class="element-invisible">' . $status_heading[$type] . "</h2>\n";
    }
    if (count($messages) > 1) {
      $output .= " <ul>\n";
      foreach ($messages as $message) {
        $output .= '  <li>' . $message . "</li>\n";
      }
      $output .= " </ul>\n";
    }
    else {
      $output .= $messages[0];
    }
    $output .= "</div>\n";
  }
  return $output;
}

function porto_preprocess_views_view_table(&$vars) {
  $vars['classes_array'][] = 'table';
}

/**
 * Helper function to display original product price.
 */
function porto_original_price($id){
	$product = commerce_product_load($id);
	$currency = $product->commerce_price['und'][0]['currency_code'];
	$orig_price = $product->commerce_price['und'][0]['original']['amount'];
	$price_display = commerce_currency_format($orig_price, $currency, $product);
	
	return $price_display;
}

/**
 * Themes the optional checkout review page data.
 */
function porto_commerce_checkout_review($variables) {
  $form = $variables['form'];

  // Turn the review data array into table rows.
  $rows = array();

  foreach ($form['#data'] as $pane_id => $data) {
    // First add a row for the title.
    $rows[] = array(
      'data' => array(
        array('data' => $data['title'], 'colspan' => 2),
      ),
      'class' => array('pane-title', 'odd'),
    );

    // Next, add the data for this particular section.
    if (is_array($data['data'])) {
      // If it's an array, treat each key / value pair as a 2 column row.
      foreach ($data['data'] as $key => $value) {
        $rows[] = array(
          'data' => array(
            array('data' => $key .':', 'class' => array('pane-data-key')),
            array('data' => $value, 'class' => array('pane-data-value')),
          ),
          'class' => array('pane-data', 'even'),
        );
      }
    }
    else {
      // Otherwise treat it as a block of text in its own row.
      $rows[] = array(
        'data' => array(
          array('data' => $data['data'], 'colspan' => 2, 'class' => array('pane-data-full')),
        ),
        'class' => array('pane-data', 'even'),
      );
    }
  }

  return theme('table', array('rows' => $rows, 'attributes' => array('class' => array('checkout-review table'))));
}


/**
 * Impelements hook_form_alter()
 */
function porto_form_alter(&$form, &$form_state, $form_id) {
  if ($form_id == 'search_block_form') {
    
    $form['search_block_form']['#title'] = t('Search...'); // Change the text on the label element
    $form['search_block_form']['#title_display'] = 'invisible'; // Toggle label visibilty
    $form['search_block_form']['#size'] = 40;  // define size of the textfield
    $form['search_block_form']['#title'] = t('Search'); // Change the text on the label element
    $form['search_block_form']['#title_display'] = 'invisible'; // Toggle label visibilty
    $form['search_block_form']['#attributes']['class'] = array('form-control', 'search');
    
    // Add/remove default text on input status.
    $form['search_block_form']['#attributes']['onblur'] = "if (this.value == '') {this.value = 'Search...';}";
    $form['search_block_form']['#attributes']['onfocus'] = "if (this.value == 'Search') {this.value = '';}";
    
     // Prevent user from searching the default text.
    $form['#attributes']['onsubmit'] = "if(this.search_block_form.value=='Search'){ alert('Please enter a search'); return false; }";
    
     // Alternative (HTML5) placeholder attribute instead of using the javascript
    $form['search_block_form']['#attributes']['placeholder'] = t('Search...');
       
    $form['actions']['submit'] =  array(
      '#type' => 'submit',
    	'#prefix' => '<span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search">',
    	'#suffix' => '</i></button></span>',
    	
    );
    
  }elseif(stristr($form_id,'webform_client_form_143')){
    $form['submitted']['your_name']['#prefix'] = '<div class="col-md-6">';
    $form['submitted']['your_name']['#suffix'] = '</div>';
    $form['submitted']['your_email_address']['#prefix'] = '<div class="col-md-6">';
    $form['submitted']['your_email_address']['#suffix']= '</div>';
    $form['#attributes']['class'][]= 'row';
    $form['submitted']['subject']['#prefix'] = '<div class="col-md-12">';
    $form['submitted']['subject']['#suffix'] = '</div>';
    $form['submitted']['checkboxes']['#prefix'] = '<div class="col-md-6">';
    $form['submitted']['checkboxes']['#suffix'] = '</div>';
    $form['submitted']['radios']['#prefix'] = '<div class="col-md-6">';
    $form['submitted']['radios']['#suffix'] = '</div>';
    $form['submitted']['message']['#prefix'] = '<div class="col-md-12">';
    $form['submitted']['message']['#suffix'] = '</div>';
  }elseif(stristr($form_id,'simplenews_block_form')){
    $form['mail']['#attributes']['placeholder'] = 'Email Address';
  }
} 

/**
 * Implements hook_block_view_alter().
 */
function porto_block_view_alter(&$data, $block) {

  if ( $block->region == 'header_search' && isset($data['content']) ) {
    // Unset some additional wrappers in the Header Search region.
  	unset($data['content']['search_block_form']['#theme_wrappers']);
    unset($data['content']['actions']['#theme_wrappers']);
    unset($data['content']['actions']['submit']['#theme_wrappers']);
  }

  if ( ($block->region == 'header_menu') && !isset($data['content']['#type']) ) {
    $data['content']['#theme_wrappers'] = array('menu_tree__header_menu');

    foreach($data['content'] as &$key):

      if (isset($key['#theme'])) {
        $key['#theme'] = 'menu_link__header_menu';
      }
      if (isset($key['#below']['#theme_wrappers'])) {
        $key['#below']['#theme_wrappers'] = array('menu_tree__header_menu_below');
      }
      if (isset($key['#below'])) {
        foreach($key['#below'] as &$key2):

           if (isset($key2['#theme'])) {
             $key2['#theme'] = 'menu_link__header_menu';
           }
           if (isset($key2['#below']['#theme_wrappers'])) {
             $key2['#below']['#theme_wrappers'] = array('menu_tree__header_menu_below');
           }
           if (isset($key2['#below'])) {
              foreach($key2['#below'] as &$key3):

                if (isset($key3['#theme'])) {
                  $key3['#theme'] = 'menu_link__header_menu';
                }
                  if (isset($key3['#below'])) {
                      if (isset($key3['#below']['#theme_wrappers'])) {
                          $key3['#below']['#theme_wrappers'] = array('menu_tree__header_menu_below');
                      }
                      foreach($key3['#below'] as &$key4):
                          if (isset($key4['#theme'])) {
                              $key4['#theme'] = 'menu_link__header_menu';
                          }

                      endforeach;
                  }
              endforeach;

           }
        endforeach;

      }
    endforeach;
  }
}

/**
 * Allow sub-menu links to display.
 */
function porto_links($variables) {
  if (array_key_exists('id', $variables['attributes']) && $variables['attributes']['id'] == 'main-menu-links') {
  	$pid = variable_get('menu_main_links_source', 'main-menu');
	$tree = menu_tree($pid);
	return drupal_render($tree);
  }
  return theme_links($variables);
}

/**
 * Put Breadcrumbs in a ul li structure and add descending z-index style to each <a href> tag.
 */
function porto_breadcrumb($variables) {
 $breadcrumb = $variables['breadcrumb'];
 $title = drupal_get_title();
 $crumbs = '';
 
 if (!empty($breadcrumb)) {
   $crumbs = '<ul class="breadcrumb">';
   foreach($breadcrumb as $value) {
     $crumbs .= '<li>'.$value.'</li> ';
   }
   
   $crumbs .= '</ul>';
    
 }
 return $crumbs;
}

/**
 * Preprocess variables for the username.
 */
function porto_preprocess_username(&$vars) {
  global $theme_key;
  $theme_name = $theme_key;
  
  // Add rel=author for SEO and supporting search engines
  if (isset($vars['link_path'])) {
    $vars['link_attributes']['rel'][] = 'author';
  }
  else {
    $vars['attributes_array']['rel'][] = 'author';
  }
}

/**
 * Theme node pagination function().
 */
function porto_node_pagination($node, $mode = 'n') {
  $query = new EntityFieldQuery();
	$query
    ->entityCondition('entity_type', 'node')
    ->propertyCondition('status', 1)
    ->entityCondition('bundle', $node->type);
  $result = $query->execute();
  $nids = array_keys($result['node']);
  
  while ($node->nid != current($nids)) {
    next($nids);
  }
  
  switch($mode) {
    case 'p':
      prev($nids);
    break;
		
    case 'n':
      next($nids);
    break;
		
    default:
    return NULL;
  }
  
  return current($nids);
}

/**
 * Overrides theme_item_list().
 */
function porto_item_list($variables) {
	
  $items = $variables['items'];
  $title = $variables['title'];
  $type = $variables['type'];
  $variables['attributes']['class'] = 'pagination pagination-lg pull-right';
  $attributes = $variables['attributes'];

  // Only output the list container and title, if there are any list items.
  // Check to see whether the block title exists before adding a header.
  // Empty headers are not semantic and present accessibility challenges.
  $output = '';
  if (isset($title) && $title !== '') {
    $output .= '<h3>' . $title . '</h3>';
  }

  if (!empty($items)) {
    $output .= "<$type" . drupal_attributes($attributes) . '>';
    $num_items = count($items);
    $i = 0;
    foreach ($items as $item) {
      $attributes = array();
      $children = array();
      $data = '';
      $i++;
      
      //if ( is_array($item) && in_array('pager-current', $item['class'])) {
      if ( isset($item['class']) && is_array($item) && in_array('pager-current', $item['class'])) {
        $item['class'] = array('active');
        $item['data'] = '<a href="#">' . $item['data'] . '</a>';
      }

      if (is_array($item)) {
        foreach ($item as $key => $value) {
          if ($key == 'data') {
            $data = $value;
          }
          elseif ($key == 'children') {
            $children = $value;
          }
          else {
            $attributes[$key] = $value;
          }
        }
      }
      else {
        $data = $item;
      }
      if (count($children) > 0) {
        // Render nested list.
        $data .= theme_item_list(array('items' => $children, 'title' => NULL, 'type' => $type, 'attributes' => $attributes));
      }
      
      $output .= '<li' . drupal_attributes($attributes) . '>' . $data . "</li>\n";
    }
    $output .= "</$type>";
  }
  
  return $output;

}

/**
 * Modify theme_field()
 */
function porto_field($variables) {
	
  $output = '';
  // Render the label, if it's not hidden.
  if (!$variables['label_hidden']) {
    $output .= '<div class="field-label"' . $variables['title_attributes'] . '>' . $variables['label'] . ':&nbsp;</div>';  
  }
  switch ($variables['element']['#field_name']) {
	  case 'field_tags':
	  case 'field_portfolio_category':
	  case 'field_product_categories':
	  case 'field_product_tags':
	  case 'field_team_category':
	  case 'field_testimonial_content':
	  case 'field_testimonial_name':
	  case 'field_testimonial_info':
	  case 'field_background_position':
	  case 'field_parallax_icon':
	  case 'field_big_caption':
	  case 'field_small_caption':
	  case 'field_text_color':
	  case 'field_team_bio':
    case 'field_twitter_link':
    case 'field_facebook_link':
    case 'field_linkedin_link':
    case 'field_active':
	    foreach ($variables['items'] as $delta => $item) {
	      $rendered_tags[] = drupal_render($item);
	    }
	    $output .= implode(', ', $rendered_tags);
	  break;
	  case 'field_image':
	    if ($variables['element']['#bundle'] =='article') {
		    if (count($variables['items']) >= 2 && theme_get_setting('blog_image_slider') == 1) {
			    $output .= '<div class="post-image"><div class="owl-carousel" data-plugin-options=\'{"items":1}\'>';
		      foreach ($variables['items'] as $delta => $item) {
		        $output .= '<div><div class="img-thumbnail">' . drupal_render($item) . '</div></div>';
		      }
		      $output .= '</div></div>';
		    }
		    else {
			    foreach ($variables['items'] as $delta => $item) {
		        $output .= '<div class="post-image single"><div class="img-thumbnail">' . drupal_render($item) . '</div></div>';
		      }
		    }
	    }
	    else if ($variables['element']['#entity_type'] =='commerce_product') {
		    if (count($variables['items']) >= 2) {
			    $output .= '<div class="owl-carousel" data-plugin-options=\'{"items":1}\'>';
		      foreach ($variables['items'] as $delta => $item) {
		        $output .= '<div>' . drupal_render($item) . '</div>';
		      }
		      $output .= '</div>';
		    }
		    else {
			    foreach ($variables['items'] as $delta => $item) {
		        $output .= '<div class="img-responsive">' . drupal_render($item) . '</div>';
		      }
		    }
		  }
	    else if ($variables['element']['#bundle'] =='portfolio') {
		    if ($variables['element']['#view_mode'] == 'teaser') {
			    $output .=  drupal_render($variables['items'][0]);
		    }
		    else {
		    foreach ($variables['items'] as $delta => $item) {
		      $output .= '<div class="thumbnail">' . drupal_render($item) . '</div>';
		    }
		    }
	    }
	    else {
		    $output .= '<div class="field-items"' . $variables['content_attributes'] . '>';
		    // Default rendering taken from theme_field().
		    foreach ($variables['items'] as $delta => $item) {
		      $classes = 'field-item ' . ($delta % 2 ? 'odd' : 'even');
		      $output .= '<div class="' . $classes . '"' . $variables['item_attributes'][$delta] . '>' . drupal_render($item) . '</div>';
		    }
		    $output .= '</div>';
	    }
	  break;
	  case 'field_portfolio_skills':
	    foreach ($variables['items'] as $delta => $item) {
	      $output .= '<li><i class="fa fa-check-circle"></i>' . drupal_render($item) . '</li>';
	    }	    
	  break;
	  default:
	    $output .= '<div class="field-items"' . $variables['content_attributes'] . '>';
	    // Default rendering taken from theme_field().
	    foreach ($variables['items'] as $delta => $item) {
	      $classes = 'field-item ' . ($delta % 2 ? 'odd' : 'even');
	      $output .= '<div class="' . $classes . '"' . $variables['item_attributes'][$delta] . '>' . drupal_render($item) . '</div>';
	    }
	    $output .= '</div>';
	    // Render the top-level DIV.
	    $output = '<div class="' . $variables['classes'] . '"' . $variables['attributes'] . '>' . $output . '</div>';
	  break;
  }
   
  return $output;
}

/**
 * User CSS function. Separate from porto_preprocess_html so function can be called directly before </head> tag.
 */
function porto_user_css() {
  if (theme_get_setting('user_css') != '') {
	  echo "<!-- User defined CSS -->";
	  echo "<style type='text/css'>";
	  echo theme_get_setting('user_css');
	  echo "</style>";
	  echo "<!-- End user defined CSS -->";	
  }
}
