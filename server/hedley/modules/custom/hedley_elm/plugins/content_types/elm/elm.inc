<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('Elm app'),
  'category' => t('Hedley'),
  'hook theme' => 'hedley_elm_elm_content_type_theme',
  'required context' => [
    new ctools_context_optional(t('Topic'), 'taxonomy_term'),
    new ctools_context_optional(t('Node'), 'node'),
  ],
  'defaults' => [
    'page' => 'contact',
    'show_as_block' => FALSE,
    'promoted_only' => FALSE,
  ],
];

/**
 * Render callback.
 */
function hedley_elm_elm_content_type_render($subtype, $conf, $args, $context) {
  global $language;
  $block = new stdClass();
  $block->module = 'hedley_elm';
  $block->title = '';

  // Get the topic ID if there's a topic context.
  $topic_tid = 0;
  if (!empty($context[0]) && isset($context[0]->data->tid)) {
    $topic_tid = $context[0]->data->tid;
  }

  $page = $conf['page'];

  // Expected node pages.
  $node_pages = [
    'contact',
    'event',
  ];
  $node_nid = 0;
  if (in_array($page, $node_pages)) {
    if (empty($context[1]) || !isset($context[1]->data->nid)) {
      // Don't continue if we are in a node page and we don't have a node ID.
      return FALSE;
    }
    $node_nid = $context[1]->data->nid;
  }

  $show_as_block = (bool) $conf['show_as_block'];
  $promoted_only = (bool) $conf['promoted_only'];

  if (!$node = hedley_municipality_get_current_group()) {
    // Don't display the elm app if not in the context of a municipality group.
    return FALSE;
  }

  $values = [];
  $title = '';
  switch ($page) {
    case 'contact':
      $values = hedley_contact_get_contacts_by_group($node, $language->language, $show_as_block, $promoted_only, $topic_tid);
      break;

    case 'contacts':
      $title = t('People who can help you');
      $values = hedley_contact_get_contacts_by_group($node, $language->language, $show_as_block, $promoted_only, $topic_tid);
      break;

    case 'event':
      $values = hedley_event_get_event_item(node_load($node_nid), $language->language);
      break;

    case 'events':
      $title = t('Upcoming events');
      $values = hedley_event_get_events_by_group($node, $language->language, $show_as_block, $promoted_only, $topic_tid);
      break;
  }

  // Don't display anything if there's no values on a block.
  if (empty($values) && $show_as_block) {
    return FALSE;
  }

  // Add application only when there's values.
  drupal_add_js(drupal_get_path('module', 'hedley_elm') . '/Main.js');
  drupal_add_js(drupal_get_path('module', 'hedley_elm') . '/elm.js');

  // Getting a unique ID for the app.
  $app_id = drupal_html_id('elm-app');

  // Getting a parsed URL for the app.
  $parsed_url = drupal_parse_url(url('', ['absolute' => TRUE]));
  // Imploding query for the app.
  $parsed_url['query'] = isset($parsed_url['query']) ? drupal_http_build_query($parsed_url['query']) : '';

  // Add settings.
  $settings = [
    'elm' => [
      $app_id => [
        'page' => $page,
        'language' => $language->language,
        'showAsBlock' => $show_as_block,
        'values' => $values,
        'baseUrl' => $parsed_url,
      ],
    ],
  ];
  drupal_add_js($settings, 'setting');

  // Inject the unique ID.
  $block->content = theme('hedley_elm_elm', [
    'show_as_block' => $show_as_block,
    'title' => $title,
    'app_id' => $app_id,
  ]);

  return $block;
}

/**
 * Edit form.
 */
function hedley_elm_elm_content_type_edit_form($form, &$form_state) {
  $conf = $form_state['conf'];

  $form['page'] = [
    '#type' => 'select',
    '#title' => t('Page'),
    '#description' => t('The bundle of the displayed content.'),
    '#options' => drupal_map_assoc(['contact', 'contacts', 'event', 'events']),
    '#default_value' => $conf['page'],
    '#required' => TRUE,
  ];

  $form['show_as_block'] = [
    '#type' => 'checkbox',
    '#title' => t('Show as block'),
    '#description' => t('Show the selected page, but as a block.'),
    '#default_value' => $conf['show_as_block'],
  ];

  $form['promoted_only'] = [
    '#type' => 'checkbox',
    '#title' => t('Only promoted content'),
    '#description' => t('Show only the promoted to front-page content.'),
    '#default_value' => $conf['promoted_only'],
  ];

  return $form;
}

/**
 * Submit handler.
 */
function hedley_elm_elm_content_type_edit_form_submit($form, &$form_state) {
  // Copy submitted form values according to the defined defaults.
  foreach (array_keys($form_state['plugin']['defaults']) as $key) {
    $form_state['conf'][$key] = $form_state['values'][$key];
  }
}

/**
 * Delegated hook_theme().
 */
function hedley_elm_elm_content_type_theme(&$theme, $plugin) {
  $theme['hedley_elm_elm'] = [
    'variables' => [
      'show_as_block' => NULL,
      'title' => NULL,
      'app_id' => NULL,
    ],
    'path' => $plugin['path'],
    'template' => 'elm',
  ];
}
