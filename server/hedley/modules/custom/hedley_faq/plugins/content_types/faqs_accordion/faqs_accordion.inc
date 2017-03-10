<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('FAQs accordion'),
  'description' => t('Promoted municipality\'s FAQs as an accordion.'),
  'category' => t('Hedley'),
  'hook theme' => 'hedley_faq_faqs_accordion_content_type_theme',
  'required context' => new ctools_context_required(t('Municipality'), 'node'),
];

/**
 * Render callback.
 */
function hedley_faq_faqs_accordion_content_type_render($subtype, $conf, $args, $context) {
  global $language;
  if (empty($context->data->nid)) {
    return NULL;
  }
  $group_nid = $context->data->nid;

  // Get promoted FAQ nodes of the viewed municipality.
  $query = new EntityFieldQuery();
  $results = $query
    ->entityCondition('entity_type', 'node')
    ->entityCondition('bundle', 'faq')
    ->propertyCondition('status', NODE_PUBLISHED)
    ->propertyCondition('promote', NODE_PROMOTED)
    ->fieldCondition(OG_AUDIENCE_FIELD, 'target_id', $group_nid)
    ->execute();

  if (empty($results['node'])) {
    return NULL;
  }

  // Extract the questions and answers from the FAQ nodes.
  $faqs = [];
  foreach (node_load_multiple(array_keys($results['node'])) as $node) {
    $wrapper = entity_metadata_wrapper('node', $node);
    $wrapper->language($language->language);

    $faqs[] = [
      'question' => $wrapper->field_question->value(),
      'answer' => $wrapper->field_answer->value->value(),
    ];
  }

  $block = new stdClass();
  $block->module = 'hedley_faq';
  $block->title = t('Frequently asked questions');
  $block->content = theme('hedley_faq_faqs_accordion', ['faqs' => $faqs]);

  return $block;
}

/**
 * Delegated hook_theme().
 */
function hedley_faq_faqs_accordion_content_type_theme(&$theme, $plugin) {
  $theme['hedley_faq_faqs_accordion'] = [
    'variables' => [
      'faqs' => [],
    ],
    'path' => $plugin['path'],
    'template' => 'faqs-accordion',
  ];
}
