<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('Promoted municipality content'),
  'description' => t("Promoted municipality's content."),
  'category' => t('Hedley'),
  'hook theme' => 'hedley_municipality_promoted_content_content_type_theme',
  'required context' => new ctools_context_required(t('Municipality'), 'node'),
  'defaults' => [
    'all_nodes_title' => NULL,
    'all_nodes_url' => NULL,
    'bundle' => NULL,
    'items_class' => NULL,
    'title' => NULL,
  ],
];

/**
 * Render callback.
 */
function hedley_municipality_promoted_content_content_type_render($subtype, $conf, $args, $context) {
  global $user, $language;

  if (empty($context->data->nid)) {
    return NULL;
  }
  $municipality_node = $context->data;
  $municipality_wrapper = entity_metadata_wrapper('node', $municipality_node);

  // Get promoted FAQ nodes of the viewed municipality.
  if (!$nodes = hedley_municipality_get_nodes_by_current_user_type($conf['bundle'], 10, $municipality_node, TRUE)) {
    return NULL;
  }

  $items = [];
  foreach ($nodes as $node) {
    $wrapper = entity_metadata_wrapper('node', $node);
    $wrapper->language($language->language);

    // Ignore nodes without titles in the current language.
    if (!$wrapper->label()) {
      continue;
    }

    switch ($node->type) {
      case 'action':
        $items[] = [
          'title' => hedley_action_get_action_title_link($wrapper),
          'edit_url' => og_node_access($node, 'update', $user) == NODE_ACCESS_ALLOW ? url("node/$node->nid/edit", ['absolute' => TRUE]) : '',
        ];

        break;

      case 'news':
        $image = $wrapper->field_image->value();

        $items[] = [
          'title' => l($wrapper->label(), url('node/' . $wrapper->getIdentifier(), ['absolute' => TRUE])),
          'image_alt' => filter_xss($wrapper->label()),
          'image_url' => !empty($image) ? image_style_url('square_thumbnail', $image['uri']) : NULL,
          'edit_url' => og_node_access($node, 'update', $user) == NODE_ACCESS_ALLOW ? url("node/$node->nid/edit", ['absolute' => TRUE]) : '',
        ];

        break;

      default:
        throw new \Exception(format_string('The selected bundle "@bundle" is not supported by the "Promoted municipality content" plugin.', ['@bundle' => $node->type]));
    }
  }

  // Declare the theme template and it's variables.
  $items_variables = [
    'items' => $items,
  ];
  $items_theme_template = 'hedley_municipality_promoted_content_' . $conf['bundle'];

  // Get the themed items.
  $content = theme($items_theme_template, $items_variables);

  // Now we render the wrapping template.
  $variables = [
    'content' => $content,
    'items_class' => $conf['items_class'],
  ];

  $block = new stdClass();
  $block->module = 'hedley_municipality';
  $block->title = '';
  // Ignoring the "Only string literals should be passed to t()" validation,
  // because it doesn't make sense in this case.
  // @codingStandardsIgnoreStart
  $variables['title'] = t($conf['title'], ['@municipality' => $municipality_wrapper->label()]);
  // @codingStandardsIgnoreEnd

  // Add the "View all nodes" link.
  if ($conf['all_nodes_title']) {
    // @codingStandardsIgnoreStart
    $variables['all_nodes_link'] = l(t($conf['all_nodes_title']), $conf['all_nodes_url'], ['attributes' => ['class' => ['btn btn-default btn-show-all']]]);
    // @codingStandardsIgnoreEnd
  }
  $block->content = theme('hedley_municipality_promoted_content_wrapper', $variables);

  return $block;
}

/**
 * Edit form.
 */
function hedley_municipality_promoted_content_content_type_edit_form($form, &$form_state) {
  $conf = $form_state['conf'];

  $form['bundle'] = [
    '#type' => 'select',
    '#title' => t('Bundle'),
    '#description' => t('The bundle of the displayed content.'),
    '#options' => drupal_map_assoc(array_keys(node_type_get_types())),
    '#default_value' => $conf['bundle'],
  ];

  $form['title'] = [
    '#type' => 'textfield',
    '#title' => t('Title'),
    '#description' => t('The block title.'),
    '#default_value' => $conf['title'],
  ];

  $form['items_class'] = [
    '#type' => 'textfield',
    '#title' => t('Items wrapper class'),
    '#description' => t('The items wrapping div class.'),
    '#default_value' => $conf['items_class'],
  ];

  $form['all_nodes_title'] = [
    '#type' => 'textfield',
    '#title' => t('All nodes link title'),
    '#default_value' => $conf['all_nodes_title'],
  ];

  $form['all_nodes_url'] = [
    '#type' => 'textfield',
    '#title' => t('All nodes url'),
    '#default_value' => $conf['all_nodes_url'],
  ];

  return $form;
}

/**
 * Submit handler.
 */
function hedley_municipality_promoted_content_content_type_edit_form_submit($form, &$form_state) {
  // Copy submitted form values according to the defined defaults.
  foreach (array_keys($form_state['plugin']['defaults']) as $key) {
    $form_state['conf'][$key] = $form_state['values'][$key];
  }
}

/**
 * Delegated hook_theme().
 */
function hedley_municipality_promoted_content_content_type_theme(&$theme, $plugin) {
  $theme['hedley_municipality_promoted_content_wrapper'] = [
    'variables' => [
      'title' => NULL,
      'content' => NULL,
      'all_nodes_link' => NULL,
    ],
    'path' => $plugin['path'],
    'template' => 'promoted-content-wrapper',
  ];
  $theme['hedley_municipality_promoted_content_action'] = [
    'variables' => [
      'items' => NULL,
    ],
    'path' => $plugin['path'],
    'template' => 'promoted-content-action',
  ];
  $theme['hedley_municipality_promoted_content_event'] = [
    'variables' => [
      'items' => NULL,
    ],
    'path' => $plugin['path'],
    'template' => 'promoted-content-event',
  ];
  $theme['hedley_municipality_promoted_content_news'] = [
    'variables' => [
      'items' => NULL,
    ],
    'path' => $plugin['path'],
    'template' => 'promoted-content-news',
  ];
}
