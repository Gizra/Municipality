<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('Topic hardcopy forms'),
  'description' => t('Hardcopy forms for the topic page.'),
  'category' => t('Hedley'),
  'hook theme' => 'hedley_topic_topic_hardcopy_forms_content_type_theme',
  'required context' => new ctools_context_required(t('Topic'), 'taxonomy_term'),
  'defaults' => [],
];

/**
 * Render callback.
 */
function hedley_topic_topic_hardcopy_forms_content_type_render($subtype, $conf, $args, $context) {
  global $language;
  if (empty($context->data)) {
    return NULL;
  }
  $topic_wrapper = entity_metadata_wrapper('taxonomy_term', $context->data);

  $nodes = hedley_municipality_get_nodes_by_user_type('hardcopy_form', 10, hedley_municipality_get_current_group(), FALSE, $topic_wrapper->getIdentifier());
  if (!$nodes) {
    // No hardcopy forms found.
    return NULL;
  }

  $hardcopy_forms = [];
  foreach ($nodes as $node) {
    $wrapper = entity_metadata_wrapper('node', $node);
    $wrapper->language($language->language);

    // Ignore nodes without titles in the current language.
    if (!$wrapper->label()) {
      continue;
    }
    $file = $wrapper->field_file->value();

    $hardcopy_forms[] = [
      'title' => $wrapper->label(),
      'file_url' => file_create_url($file['uri']),
      'filename' => $file['filename'],
    ];
  }

  $block = new stdClass();
  $block->module = 'hedley_topic';

  $variables = [
    'title' => $topic_wrapper->label(),
    'hardcopy_forms' => $hardcopy_forms,
  ];
  $block->content = theme('hedley_topic_topic_hardcopy_forms', $variables);

  return $block;
}

/**
 * Edit form.
 */
function hedley_topic_topic_hardcopy_forms_content_type_edit_form($form, &$form_state) {
  return $form;
}

/**
 * Submit handler.
 */
function hedley_topic_topic_hardcopy_forms_content_type_edit_form_submit($form, &$form_state) {
  // Copy submitted form values according to the defined defaults.
  foreach (array_keys($form_state['plugin']['defaults']) as $key) {
    $form_state['conf'][$key] = $form_state['values'][$key];
  }
}

/**
 * Delegated hook_theme().
 */
function hedley_topic_topic_hardcopy_forms_content_type_theme(&$theme, $plugin) {
  $theme['hedley_topic_topic_hardcopy_forms'] = [
    'variables' => [
      'title' => NULL,
      'hardcopy_forms' => NULL,
    ],
    'path' => $plugin['path'],
    'template' => 'topic-hardcopy-forms',
  ];
}
