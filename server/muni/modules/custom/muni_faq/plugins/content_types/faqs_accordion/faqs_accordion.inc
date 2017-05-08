<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('FAQs accordion'),
  'description' => t("Promoted municipality's FAQs as an accordion."),
  'category' => t('Muni'),
  'hook theme' => 'muni_faq_faqs_accordion_content_type_theme',
  'required context' => [
    new ctools_context_optional(t('Municipality'), 'node'),
    new ctools_context_optional(t('Topic'), 'taxonomy_term'),
  ],
  'defaults' => [
    'promoted_only' => FALSE,
  ],
];

/**
 * Render callback.
 */
function muni_faq_faqs_accordion_content_type_render($subtype, $conf, $args, $context) {
  global $language;

  $municipality_node = !empty($context[0]->data->nid) ? $context[0]->data : muni_municipality_get_current();
  $topic_tid = !empty($context[1]->data->tid) ? $context[1]->data->tid : 0;

  $nodes = muni_municipality_get_nodes('faq', 10, $municipality_node, $conf['promoted_only'], $topic_tid);
  if (!$nodes) {
    return NULL;
  }

  // Extract the questions and answers from the FAQ nodes.
  $faqs = [];
  foreach ($nodes as $node) {
    $wrapper = entity_metadata_wrapper('node', $node);
    // Set the wrapper to the current language.
    $wrapper->language($language->language);
    // Ignore items that are not translated to the current language.
    if (!$wrapper->field_answer->value() || !$wrapper->label()) {
      continue;
    }

    $faqs[] = [
      'question' => $wrapper->field_question->value(),
      'answer' => $wrapper->field_answer->value->value(),
    ];
  }

  $block = new stdClass();
  $block->module = 'muni_faq';
  $block->title = t('Frequently asked questions');
  $block->content = theme('muni_faq_faqs_accordion', ['faqs' => $faqs]);

  return $block;
}

/**
 * Edit form.
 */
function muni_faq_faqs_accordion_content_type_edit_form($form, &$form_state) {
  $conf = $form_state['conf'];

  $form['promoted_only'] = [
    '#type' => 'checkbox',
    '#title' => t('Only promoted FAQs'),
    '#default_value' => $conf['promoted_only'],
  ];

  return $form;
}

/**
 * Submit handler.
 */
function muni_faq_faqs_accordion_content_type_edit_form_submit($form, &$form_state) {
  // Copy submitted form values according to the defined defaults.
  foreach (array_keys($form_state['plugin']['defaults']) as $key) {
    $form_state['conf'][$key] = $form_state['values'][$key];
  }
}

/**
 * Delegated hook_theme().
 */
function muni_faq_faqs_accordion_content_type_theme(&$theme, $plugin) {
  $theme['muni_faq_faqs_accordion'] = [
    'variables' => [
      'faqs' => [],
    ],
    'path' => $plugin['path'],
    'template' => 'faqs-accordion',
  ];
}