<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('Municipality action content'),
  'description' => t('Municipality action content.'),
  'category' => t('Hedley'),
  'render callback' => 'hedley_action_content_type_render',
  'hook theme' => 'hedley_action_content_content_type_theme',
  'required context' => new ctools_context_required(t('Action'), 'node'),
  'defaults' => [],
];

/**
 * Render callback.
 */
function hedley_action_content_type_render($subtype, $conf, $args, $context) {
  if (empty($context->data)) {
    return NULL;
  }

  global $language;

  $wrapper = entity_metadata_wrapper('node', $context->data);

  // Validate the current content type is 'action'.
  if ($wrapper->getBundle() != 'action') {
    throw new Exception('This plugin can be use with "action" content type only.');
  }

  $wrapper->language($language->language);

  $sections = [];
  foreach ($wrapper->field_action_sections as $section) {
    // Calling the value directly on the wrapper doesn't get the custom style
    // added by the content editor.
    $description = $section->field_section_description->value();
    $sections[] = [
      'title' => filter_xss($section->field_section_title->value()),
      'icon' => hedley_action_get_section_icon_class($section->field_section_icon->value()),
      'description' => !empty($description) ? $description['value'] : '',
    ];
  }

  $body = $wrapper->body->value();
  $variables = [
    'title' => filter_xss($wrapper->label()),
    'sections' => $sections,
    'body' => !empty($body) ? $body['value'] : '',
  ];

  $block = new stdClass();
  $block->module = 'hedley_action';
  $block->content = theme('hedley_municipality_action_content', $variables);

  return $block;
}

/**
 * Delegated hook_theme().
 */
function hedley_action_content_content_type_theme(&$theme, $plugin) {
  $theme['hedley_municipality_action_content'] = [
    'variables' => [
      'title' => NULL,
      'sections' => NULL,
    ],
    'path' => $plugin['path'],
    'template' => 'action-content',
  ];
}
