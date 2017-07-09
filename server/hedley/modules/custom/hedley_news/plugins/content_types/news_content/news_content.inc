<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('Municipality news content'),
  'description' => t('Municipality news content.'),
  'category' => t('Hedley'),
  'render callback' => 'hedley_news_content_type_render',
  'hook theme' => 'hedley_news_content_content_type_theme',
  'required context' => new ctools_context_required(t('News'), 'node'),
  'defaults' => [],
];

/**
 * Render callback.
 */
function hedley_news_content_type_render($subtype, $conf, $args, $context) {
  if (empty($context->data)) {
    return NULL;
  }

  global $language;

  $wrapper = entity_metadata_wrapper('node', $context->data);

  // Validate the current content type is 'news'.
  if ($wrapper->getBundle() != 'news') {
    throw new Exception('This plugin can be use with "news" content type only.');
  }

  $wrapper->language($language->language);

  // Calling the value directly on the wrapper doesn't get the custom style
  // added by the content editor.
  $body = $wrapper->body->value();
  $variables = [
    'title' => filter_xss($wrapper->label()),
    'published_date' => format_date($wrapper->changed->value(), 'custom', 'd.m.y'),
    'body' => !empty($body) ? $body['value'] : '',
  ];

  $block = new stdClass();
  $block->module = 'hedley_news';
  $block->content = theme('hedley_municipality_news_content', $variables);

  return $block;
}

/**
 * Delegated hook_theme().
 */
function hedley_news_content_content_type_theme(&$theme, $plugin) {
  $theme['hedley_municipality_news_content'] = [
    'variables' => [
      'title' => NULL,
      'published_date' => NULL,
      'body' => NULL,
    ],
    'path' => $plugin['path'],
    'template' => 'news-content',
  ];
}
