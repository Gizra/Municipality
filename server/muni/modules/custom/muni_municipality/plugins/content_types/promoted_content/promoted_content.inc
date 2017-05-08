<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('Promoted municipality content'),
  'description' => t("Promoted municipality's content."),
  'category' => t('Muni'),
  'hook theme' => 'muni_municipality_promoted_content_content_type_theme',
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
function muni_municipality_promoted_content_content_type_render($subtype, $conf, $args, $context) {
  if (empty($context->data->nid)) {
    return NULL;
  }
  $municipality_node = $context->data;
  $wrapper = entity_metadata_wrapper('node', $municipality_node);

  // Get promoted FAQ nodes of the viewed municipality.
  if (!$nodes = muni_municipality_get_nodes($conf['bundle'], 10, $municipality_node, TRUE)) {
    return NULL;
  }

  $nodes = node_view_multiple($nodes, 'homepage_teaser');
  $variables = [
    'nodes' => $nodes,
    'items_class' => $conf['items_class'],
  ];

  $block = new stdClass();
  $block->module = 'muni_municipality';
  // Ignoring the "Only string literals should be passed to t()" validation,
  // because it doesn't make sense in this case.
  // @codingStandardsIgnoreStart
  $block->title = t($conf['title'], ['@municipality' => $wrapper->label()]);
  // @codingStandardsIgnoreEnd

  // Add the "View all nodes" link.
  if ($conf['all_nodes_title']) {
    // @codingStandardsIgnoreStart
    $variables['all_nodes_link'] = l(t($conf['all_nodes_title']), $conf['all_nodes_url'], ['attributes' => ['class' => ['ui basic button']]]);
    // @codingStandardsIgnoreEnd
  }
  $block->content = theme('muni_municipality_promoted_content', $variables);

  return $block;
}

/**
 * Edit form.
 */
function muni_municipality_promoted_content_content_type_edit_form($form, &$form_state) {
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
function muni_municipality_promoted_content_content_type_edit_form_submit($form, &$form_state) {
  // Copy submitted form values according to the defined defaults.
  foreach (array_keys($form_state['plugin']['defaults']) as $key) {
    $form_state['conf'][$key] = $form_state['values'][$key];
  }
}

/**
 * Delegated hook_theme().
 */
function muni_municipality_promoted_content_content_type_theme(&$theme, $plugin) {
  $theme['muni_municipality_promoted_content'] = [
    'variables' => [
      'nodes' => NULL,
      'all_nodes_link' => NULL,
    ],
    'path' => $plugin['path'],
    'template' => 'promoted-content',
  ];
}
