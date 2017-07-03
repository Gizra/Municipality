<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('Elm app'),
  'category' => t('Hedley'),
  'hook theme' => 'hedley_elm_elm_content_type_theme',
  'required context' => new ctools_context_optional(t('Topic'), 'taxonomy_term'),
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
  if (!empty($context->data) && isset($context->data->tid)) {
    $topic_tid = $context->data->tid;
  }

  // Add application.
  drupal_add_js(drupal_get_path('module', 'hedley_elm') . '/Main.js');
  drupal_add_js(drupal_get_path('module', 'hedley_elm') . '/elm.js');

  $page = $conf['page'];
  $show_as_block = (bool) $conf['show_as_block'];
  $promoted_only = (bool) $conf['promoted_only'];

  if (!$node = hedley_municipality_get_current_group()) {
    // Don't display the elm app if not in the context of a municipality group.
    return FALSE;
  }

  $values = [];
  switch ($page) {
    case 'contacts':
      $values = hedley_contact_get_contacts_by_group($node, $language->language, $show_as_block, $promoted_only, $topic_tid);
      break;

    case 'events':
      $values = hedley_event_get_events_by_group($node, $language->language, $show_as_block, $promoted_only, $topic_tid);
      break;
  }

  // Don't display anything if list is empty on blocks.
  if (empty($values) && $show_as_block) {
    return FALSE;
  }

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
    'title' => $page == 'events' ? t('Upcoming events') : t('People who can help you'),
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
    '#options' => drupal_map_assoc(['contacts', 'events']),
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
