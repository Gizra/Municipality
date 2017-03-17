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
function hedley_faq_faqs_accordion_content_type_render($subtype, $conf, $args, $context) {
  global $language;

  // Get promoted FAQ nodes of the viewed municipality.
  $query = new EntityFieldQuery();
  $query
    ->entityCondition('entity_type', 'node')
    ->entityCondition('bundle', 'faq')
    ->propertyCondition('status', NODE_PUBLISHED)
    ->propertyOrderBy('created', 'DESC')
    // Filter by current profile type.
    ->fieldCondition('field_profile_types', 'tid', hedley_terms_get_current_profile_type_tid())
    ->range(0, 10);
  // Fetch the municipality context from the ctools context or from the purl
  // context.
  $municipality_node = !empty($context[0]->data->nid) ? $context[0]->data : hedley_municipality_get_current();
  if ($municipality_node) {
    // Filter by current municipality.
    $query->fieldCondition(OG_AUDIENCE_FIELD, 'target_id', $municipality_node->nid);
  }
  // Filter by promoted nodes (Only on the municipality's homepage).
  if ($conf['promoted_only']) {
    $query->propertyCondition('promote', NODE_PROMOTED);
  }
  // Filter by current topic.
  if (!empty($context[1]->data->tid)) {
    $query->fieldCondition('field_topics', 'tid', $context[1]->data->tid);
  }
  $result = $query->execute();

  if (empty($result['node'])) {
    return NULL;
  }

  // Extract the questions and answers from the FAQ nodes.
  $faqs = [];
  foreach (node_load_multiple(array_keys($result['node'])) as $node) {
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
  $block->module = 'hedley_faq';
  $block->title = t('Frequently asked questions');
  $block->content = theme('hedley_faq_faqs_accordion', ['faqs' => $faqs]);

  return $block;
}

/**
 * Edit form.
 */
function hedley_faq_faqs_accordion_content_type_edit_form($form, &$form_state) {
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
function hedley_faq_faqs_accordion_content_type_edit_form_submit($form, &$form_state) {
  // Copy submitted form values according to the defined defaults.
  foreach (array_keys($form_state['plugin']['defaults']) as $key) {
    $form_state['conf'][$key] = $form_state['values'][$key];
  }
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
