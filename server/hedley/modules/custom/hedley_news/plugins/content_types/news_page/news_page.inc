<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('News overview page'),
  'description' => t('All the news in the Municipality.'),
  'category' => t('Hedley'),
  'hook theme' => 'hedley_news_news_page_content_type_theme',
  'defaults' => [],
];

/**
 * Render callback.
 */
function hedley_news_news_page_content_type_render($subtype, $conf, $args, $context) {
  global $language, $user;

  if (!$municipality_node = hedley_municipality_get_current_group()) {
    // Don't display news without municipality context.
    return NULL;
  }

  $nodes = hedley_municipality_get_nodes('news', 50, $municipality_node, FALSE);
  if (!$nodes) {
    // No news found.
    return NULL;
  }

  // Get the news titles.
  $news_items = [];
  foreach ($nodes as $node) {
    $wrapper = entity_metadata_wrapper('node', $node);
    // Explicitly set the wrapper language to the current language.
    // Otherwise $wrapper->body->value() returns the default language instead of
    // the current language.
    $wrapper->language($language->language);

    // Ignore nodes without titles in the current language.
    if (!$wrapper->label()) {
      continue;
    }

    $news_items[] = [
      'title' => $wrapper->label(),
      // Add a read more link when the news has a body.
      'read_more' => $wrapper->body->value() ? l(t('Read more'), 'node/' . $node->nid, ['attributes' => ['class' => 'btn btn-lg btn-quaternary']]) : '',
      'edit_url' => og_node_access($node, 'update', $user) == NODE_ACCESS_ALLOW ? url("node/$node->nid/edit", ['absolute' => TRUE]) : '',
    ];
  }

  $block = new stdClass();
  $block->module = 'hedley_news';

  $variables = [
    'news_items' => $news_items,
  ];
  $block->content = theme('hedley_news_news_page', $variables);

  return $block;
}

/**
 * Delegated hook_theme().
 */
function hedley_news_news_page_content_type_theme(&$theme, $plugin) {
  $theme['hedley_news_news_page'] = [
    'variables' => [
      'news_items' => NULL,
    ],
    'path' => $plugin['path'],
    'template' => 'news-page',
  ];
}
