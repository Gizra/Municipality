<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('Topic news'),
  'description' => t('News for the topic page.'),
  'category' => t('Hedley'),
  'hook theme' => 'hedley_topic_topic_news_content_type_theme',
  'required context' => new ctools_context_required(t('Topic'), 'taxonomy_term'),
  'defaults' => [],
];

/**
 * Render callback.
 */
function hedley_topic_topic_news_content_type_render($subtype, $conf, $args, $context) {
  global $language;
  if (empty($context->data)) {
    return NULL;
  }
  $topic_wrapper = entity_metadata_wrapper('taxonomy_term', $context->data);

  $query = new EntityFieldQuery();
  $query
    ->entityCondition('entity_type', 'node')
    ->entityCondition('bundle', 'news')
    ->propertyCondition('status', NODE_PUBLISHED)
    ->propertyOrderBy('created', 'DESC')
    // Filter by the current topic.
    ->fieldCondition('field_topics', 'tid', $topic_wrapper->getIdentifier())
    // Filter by the current profile type.
    ->fieldCondition('field_profile_types', 'tid', hedley_terms_get_current_profile_type_tid())
    ->range(0, 10);

  // When in municipality context, filter by it.
  $municipality_node = hedley_municipality_get_current();
  if ($municipality_node) {
    $query->fieldCondition(OG_AUDIENCE_FIELD, 'target_id', $municipality_node->nid);
  }

  $result = $query->execute();
  if (empty($result['node'])) {
    // No news found.
    return NULL;
  }

  // Get the news titles.
  $news_items = [];
  foreach (node_load_multiple(array_keys($result['node'])) as $node) {
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
      'read_more' => $wrapper->body->value() ? l(t('Read more'), 'node/' . $node->nid) : '',
    ];
  }

  $block = new stdClass();
  $block->module = 'hedley_topic';

  $variables = [
    'title' => $topic_wrapper->label(),
    'news_items' => $news_items,
  ];
  $block->content = theme('hedley_topic_topic_news', $variables);

  return $block;
}

/**
 * Edit form.
 */
function hedley_topic_topic_news_content_type_edit_form($form, &$form_state) {
  return $form;
}

/**
 * Submit handler.
 */
function hedley_topic_topic_news_content_type_edit_form_submit($form, &$form_state) {
  // Copy submitted form values according to the defined defaults.
  foreach (array_keys($form_state['plugin']['defaults']) as $key) {
    $form_state['conf'][$key] = $form_state['values'][$key];
  }
}

/**
 * Delegated hook_theme().
 */
function hedley_topic_topic_news_content_type_theme(&$theme, $plugin) {
  $theme['hedley_topic_topic_news'] = [
    'variables' => [
      'title' => NULL,
      'news_items' => NULL,
    ],
    'path' => $plugin['path'],
    'template' => 'topic-news',
  ];
}
