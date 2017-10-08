<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('Municipality event page'),
  'description' => t('Municipality event page.'),
  'category' => t('Hedley'),
  'render callback' => 'hedley_event_event_page_content_type_render',
  'hook theme' => 'hedley_event_event_page_content_type_theme',
  'required context' => new ctools_context_required(t('Event'), 'node'),
  'defaults' => [],
];

/**
 * Render callback.
 */
function hedley_event_event_page_content_type_render($subtype, $conf, $args, $context) {
  if (empty($context->data)) {
    return NULL;
  }

  global $language;

  $wrapper = entity_metadata_wrapper('node', $context->data);

  // Validate the current content type is 'action'.
  if ($wrapper->getBundle() != 'event') {
    throw new Exception('This plugin can be use with "event" content type only.');
  }

  $wrapper->language($language->language);

  $body = $wrapper->body->value();
  $image = $wrapper->field_image->value();

  $variables = [
    'title' => filter_xss($wrapper->label()),
    'body' => !empty($body) ? $body['value'] : '',
    'image_url' => !empty($image) ? image_style_url('large', $image['uri']) : hedley_municipality_get_default_image($wrapper->getBundle()),
    'date' => NULL,
    'location' => NULL,
    'price' => NULL,
  ];

  $block = new stdClass();
  $block->module = 'hedley_event';
  $block->content = theme('hedley_event_event_page', $variables);

  return $block;
}

/**
 * Delegated hook_theme().
 */
function hedley_event_event_page_content_type_theme(&$theme, $plugin) {
  $theme['hedley_event_event_page'] = [
    'variables' => [
      'title' => NULL,
      'body' => NULL,
      'image_url' => NULL,
      'date' => NULL,
      'location' => NULL,
      'price' => NULL,
    ],
    'path' => $plugin['path'],
    'template' => 'event-page',
  ];
}
