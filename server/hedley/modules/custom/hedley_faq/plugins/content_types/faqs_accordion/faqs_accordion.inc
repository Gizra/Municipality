<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('FAQs accordion'),
  'description' => t("Promoted municipality's FAQs as an accordion."),
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

  // Get promoted FAQ nodes of the viewed municipality.
  if (!$nodes = hedley_municipality_get_group_promoted_nodes($context->data->nid, 'faq', 10)) {
    return NULL;
  }

  // Extract the questions and answers from the FAQ nodes.
  $faqs = [];
  foreach ($nodes as $node) {
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
