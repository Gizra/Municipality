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
  if (empty($context->data)) {
    return NULL;
  }
  $wrapper = entity_metadata_wrapper('taxonomy_term', $context->data);

  $block = new stdClass();
  $block->module = 'hedley_municipality';
  $block->content = theme('hedley_topic_topic_news', ['title' => $wrapper->label()]);

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
    ],
    'path' => $plugin['path'],
    'template' => 'topic-news',
  ];
}
