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
  ],
];

/**
 * Render callback.
 */
function hedley_elm_elm_content_type_render($subtype, $conf, $args, $context) {
  $block = new stdClass();
  $block->module = 'hedley_elm';
  $block->title = '';

  $output = [];
  $output['temp'] = ['#markup' => 'Elm app will be here'];
  $output['#attached']['js'] = [drupal_get_path('module', 'hedley_elm') . '/Main.js'];

  $block->content = $output;

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
    '#options' => drupal_map_assoc(['contact']),
    '#default_value' => $conf['page'],
    '#required' => TRUE,
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
    ],
    'path' => $plugin['path'],
    'template' => 'elm',
  ];
}

