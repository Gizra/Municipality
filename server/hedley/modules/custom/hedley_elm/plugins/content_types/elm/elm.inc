<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('Elm app'),
  'category' => t('Hedley'),
  'hook theme' => 'hedley_elm_elm_content_type_theme',
  'defaults' => [
    'page' => 'contact',
    'show_as_block' => FALSE,
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

  // Add application.
  drupal_add_js(drupal_get_path('module', 'hedley_elm') . '/Main.js');
  drupal_add_js(drupal_get_path('module', 'hedley_elm') . '/elm.js');

  $page = $conf['page'];

  if (!$node = hedley_municipality_get_current_group()) {
    // Don't display the elm app if not in the context of a municipality group.
    return FALSE;
  }

  $values = [];
  switch ($page) {
    case 'contacts':
      $values = hedley_contact_get_contacts_by_group($node, $language->language);
      break;

    case 'events':
      $values = hedley_event_get_events_by_group($node, $language->language);
      break;
  }

  // Getting a unique ID for the app.
  $app_id = drupal_html_id('elm-app');

  // Add settings.
  $settings = [
    'elm' => [
      $app_id => [
        'page' => $page,
        'language' => $language->language,
        'showAsBlock' => (bool) $conf['show_as_block'],
        'values' => $values,
      ],
    ],
  ];
  drupal_add_js($settings, 'setting');

  // Inject the unique ID.
  $block->content = '<div id="' . $app_id . '"></div>';

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
