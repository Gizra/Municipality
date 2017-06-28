<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('Topics list'),
  'description' => t("The municipality's topics displayed in colored buttons"),
  'category' => t('Hedley'),
  'hook theme' => 'hedley_municipality_topics_list_content_type_theme',
  'required context' => new ctools_context_required(t('Municipality'), 'node'),
];

/**
 * Render callback.
 */
function hedley_municipality_topics_list_content_type_render($subtype, $conf, $args, $context) {
  global $language;
  if (empty($context->data->nid)) {
    return NULL;
  }

  // Load topics.
  $municipality_node = $context->data;
  $vocabulary = taxonomy_vocabulary_machine_name_load("topics_$municipality_node->nid");
  $terms = taxonomy_get_tree($vocabulary->vid);

  $topics = [];
  foreach ($terms as $term) {
    $wrapper = entity_metadata_wrapper('taxonomy_term', $term->tid);
    $wrapper->language($language->language);
    // Ignore any term that isn't translated to the current language. In
    // such case, the term's label would be empty.
    if (!$wrapper->label()) {
      continue;
    }

    $topics[] = [
      'label' => $wrapper->label(),
      'link' => url('taxonomy/term/' . $wrapper->getIdentifier()),
      'color' => $wrapper->field_color->value(),
    ];
  }

  $variables = [
    'title' => t('Topics in the site'),
    'topics' => $topics,
  ];

  $block = new stdClass();
  $block->module = 'hedley_municipality';
  $block->title = '';

  $block->content = theme('hedley_municipality_topics_list', $variables);

  return $block;
}

/**
 * Edit form.
 */
function hedley_municipality_topics_list_content_type_edit_form($form, &$form_state) {
  return $form;
}

/**
 * Delegated hook_theme().
 */
function hedley_municipality_topics_list_content_type_theme(&$theme, $plugin) {
  $theme['hedley_municipality_topics_list'] = [
    'variables' => [
      'title' => NULL,
      'topics' => NULL,
    ],
    'path' => $plugin['path'],
    'template' => 'topics-list',
  ];
}
