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

  // Add two default buttons which leads to contacts & events pages.
  $topics = [
    [
      'label' => t('Contacts'),
      'link' => url('contacts'),
      'color' => HEDLEY_MUNICIPALITY_DEFAULT_COLOR,
    ],
    [
      'label' => t('Events'),
      'link' => url('events'),
      'color' => HEDLEY_MUNICIPALITY_PRIMARY_COLOR,
    ],
  ];
  foreach ($terms as $term) {
    $wrapper = entity_metadata_wrapper('taxonomy_term', $term->tid);
    $wrapper->language($language->language);
    // Ignore any term that isn't translated to the current language. In
    // such case, the term's label would be empty.
    if (!$wrapper->label()) {
      continue;
    }

    $topics[] = [
      'label' => filter_xss($wrapper->label()),
      'link' => url('taxonomy/term/' . $wrapper->getIdentifier()),
      'color' => $wrapper->field_color->value(),
    ];
  }

  // Get user roles to check if they have editor role.
  $roles = og_get_user_roles('node', $municipality_node->nid);
  $add_term_path = "group/node/$municipality_node->nid/admin/taxonomy/$vocabulary->machine_name/add";

  $variables = [
    'title' => t('Topics in the site'),
    'topics' => $topics,
    'add_term_url' => in_array('editor', $roles) ? url($add_term_path, ['absolute' => TRUE]) : '',
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
      'add_term_url' => NULL,
    ],
    'path' => $plugin['path'],
    'template' => 'topics-list',
  ];
}
