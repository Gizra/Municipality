<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('Topic events'),
  'description' => t('Events for the topic page.'),
  'category' => t('Hedley'),
  'hook theme' => 'hedley_topic_topic_events_content_type_theme',
  'required context' => new ctools_context_required(t('Topic'), 'taxonomy_term'),
  'defaults' => [],
];

/**
 * Render callback.
 */
function hedley_topic_topic_events_content_type_render($subtype, $conf, $args, $context) {
  if (empty($context->data)) {
    return NULL;
  }
  $topic_wrapper = entity_metadata_wrapper('taxonomy_term', $context->data);

  $nodes = hedley_municipality_get_nodes('event', 10, hedley_municipality_get_current_group(), FALSE, $topic_wrapper->getIdentifier());
  if (!$nodes) {
    // No events found.
    return NULL;
  }
  $events = [];
  foreach ($nodes as $node) {
    $wrapper = entity_metadata_wrapper('node', $node);

    $image = $wrapper->field_image->value();
    $date = $wrapper->field_date->value();

    $event = [
      'title' => check_plain($wrapper->label()),
      'image_url' => $image ? image_style_url('thumbnail', $image['uri']) : '',
      'date_start' => $date['value'] ? date('d/m/Y H:i', $date['value']) : '',
      'date_end' => $date['value2'] ? date('d/m/Y H:i', $date['value2']) : '',
    ];

    $events[] = $event;
  }

  $block = new stdClass();
  $block->module = 'hedley_topic';
  $block->content = theme('hedley_topic_topic_events', ['events' => $events]);

  return $block;
}

/**
 * Edit form.
 */
function hedley_topic_topic_events_content_type_edit_form($form, &$form_state) {
  return $form;
}

/**
 * Submit handler.
 */
function hedley_topic_topic_events_content_type_edit_form_submit($form, &$form_state) {
  // Copy submitted form values according to the defined defaults.
  foreach (array_keys($form_state['plugin']['defaults']) as $key) {
    $form_state['conf'][$key] = $form_state['values'][$key];
  }
}

/**
 * Delegated hook_theme().
 */
function hedley_topic_topic_events_content_type_theme(&$theme, $plugin) {
  $theme['hedley_topic_topic_events'] = [
    'variables' => [
      'events' => NULL,
    ],
    'path' => $plugin['path'],
    'template' => 'topic-events',
  ];
}
