<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('Topic actions'),
  'description' => t('Actions for the topic page.'),
  'category' => t('Hedley'),
  'hook theme' => 'hedley_topic_topic_actions_content_type_theme',
  'required context' => new ctools_context_required(t('Topic'), 'taxonomy_term'),
  'defaults' => [],
];

/**
 * Render callback.
 */
function hedley_topic_topic_actions_content_type_render($subtype, $conf, $args, $context) {
  global $language;
  if (empty($context->data)) {
    return NULL;
  }
  $topic_wrapper = entity_metadata_wrapper('taxonomy_term', $context->data);
  if (!$municipality_node = hedley_municipality_get_current_group()) {
    // Don't display actions without municipality context.
    return NULL;
  }

  $nodes = hedley_municipality_get_nodes_by_current_user_type('action', 10, $municipality_node, FALSE, $topic_wrapper->getIdentifier());
  if (!$nodes) {
    // No actions found.
    return NULL;
  }

  // Get the actions titles.
  $actions = [];
  foreach ($nodes as $node) {
    $wrapper = entity_metadata_wrapper('node', $node);
    $wrapper->language($language->language);

    // Ignore nodes without titles in the current language.
    if (!$wrapper->label()) {
      continue;
    }

    $actions[] = [
      'title' => hedley_action_get_action_title_link($wrapper, ['btn btn-borders btn-primary mr-xs mb-sm']),
    ];
  }

  $block = new stdClass();
  $block->module = 'hedley_topic';

  $block->content = theme('hedley_topic_topic_actions', ['actions' => $actions]);

  return $block;
}

/**
 * Edit form.
 */
function hedley_topic_topic_actions_content_type_edit_form($form, &$form_state) {
  return $form;
}

/**
 * Submit handler.
 */
function hedley_topic_topic_actions_content_type_edit_form_submit($form, &$form_state) {
  // Copy submitted form values according to the defined defaults.
  foreach (array_keys($form_state['plugin']['defaults']) as $key) {
    $form_state['conf'][$key] = $form_state['values'][$key];
  }
}

/**
 * Delegated hook_theme().
 */
function hedley_topic_topic_actions_content_type_theme(&$theme, $plugin) {
  $theme['hedley_topic_topic_actions'] = [
    'variables' => [
      'actions' => NULL,
    ],
    'path' => $plugin['path'],
    'template' => 'topic-actions',
  ];
}
