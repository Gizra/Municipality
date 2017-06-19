<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('Municipality page content'),
  'description' => t('Municipality page content.'),
  'category' => t('Hedley'),
  'render callback' => 'hedley_page_content_type_render',
  'hook theme' => 'hedley_page_content_content_type_theme',
  'required context' => new ctools_context_required(t('Page'), 'node'),
  'defaults' => [],
];

/**
 * Render callback.
 */
function hedley_page_content_type_render($subtype, $conf, $args, $context) {
  if (empty($context->data)) {
    return NULL;
  }

  global $language;

  $wrapper = entity_metadata_wrapper('node', $context->data);

  // Validate the current content type is 'page'.
  if ($wrapper->getBundle() != 'page') {
    throw new Exception('This plugin can be use with "page" content type only.');
  }

  $wrapper->language($language->language);

  $variables = [
    'title' => filter_xss($wrapper->label()),
    'published_date' => format_date($wrapper->changed->value(), 'custom', 'd.m.y'),
    'body' => $wrapper->body->value() ? $wrapper->body->value->value() : '',
  ];

  $block = new stdClass();
  $block->module = 'hedley_page';
  $block->content = theme('hedley_municipality_page_content', $variables);

  return $block;
}

/**
 * Delegated hook_theme().
 */
function hedley_page_content_content_type_theme(&$theme, $plugin) {
  $theme['hedley_municipality_page_content'] = [
    'variables' => [
      'title' => NULL,
      'published_date' => NULL,
      'body' => NULL,
    ],
    'path' => $plugin['path'],
    'template' => 'page-content',
  ];
}
