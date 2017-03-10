<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('Promoted municipality content'),
  'description' => t("Promoted municipality's content."),
  'category' => t('Hedley'),
  'required context' => new ctools_context_required(t('Municipality'), 'node'),
  'defaults' => [
    'bundle' => NULL,
    'title' => NULL,
  ],
];

/**
 * Render callback.
 */
function hedley_municipality_promoted_content_content_type_render($subtype, $conf, $args, $context) {
  if (empty($context->data->nid)) {
    return NULL;
  }
  $group_nid = $context->data->nid;

  // Get promoted FAQ nodes of the viewed municipality.
  if (!$nodes = hedley_municipality_get_group_promoted_nodes($group_nid, $conf['bundle'], 10)) {
    return NULL;
  }

  $wrapper = entity_metadata_wrapper('node', $group_nid);
  $block = new stdClass();
  $block->module = 'hedley_municipality';
  // @codingStandardsIgnoreStart
  $block->title = t($conf['title'], ['@municipality' => $wrapper->label()]);
  // @codingStandardsIgnoreEnd
  $block->content = node_view_multiple($nodes, 'homepage_teaser');

  return $block;
}

/**
 * Edit form.
 */
function hedley_municipality_promoted_content_content_type_edit_form($form, &$form_state) {
  $conf = $form_state['conf'];

  $form['bundle'] = [
    '#type' => 'select',
    '#title' => t('Bundle'),
    '#description' => t('The bundle of the displayed content.'),
    '#options' => drupal_map_assoc(array_keys(node_type_get_types())),
    '#default_value' => $conf['bundle'],
  ];

  $form['title'] = [
    '#type' => 'textfield',
    '#title' => t('Title'),
    '#description' => t('The block title.'),
    '#default_value' => $conf['title'],
  ];

  return $form;
}

/**
 * Submit handler.
 */
function hedley_municipality_promoted_content_content_type_edit_form_submit($form, &$form_state) {
  // Copy submitted form values according to the defined defaults.
  foreach (array_keys($form_state['plugin']['defaults']) as $key) {
    $form_state['conf'][$key] = $form_state['values'][$key];
  }
}
