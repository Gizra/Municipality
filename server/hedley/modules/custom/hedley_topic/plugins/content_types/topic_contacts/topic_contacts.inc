<?php

/**
 * @file
 * Plugin definition.
 */

$plugin = [
  'title' => t('Topic contacts'),
  'description' => t('Contacts for the topic page.'),
  'category' => t('Hedley'),
  'hook theme' => 'hedley_topic_topic_contacts_content_type_theme',
  'required context' => new ctools_context_required(t('Topic'), 'taxonomy_term'),
  'defaults' => [],
];

/**
 * Render callback.
 */
function hedley_topic_topic_contacts_content_type_render($subtype, $conf, $args, $context) {
  global $language;
  if (empty($context->data)) {
    return NULL;
  }
  $topic_wrapper = entity_metadata_wrapper('taxonomy_term', $context->data);

  $nodes = hedley_municipality_get_nodes_by_user_type('contact', 10, hedley_municipality_get_current_group(), FALSE, $topic_wrapper->getIdentifier());
  if (!$nodes) {
    // No contacts found.
    return NULL;
  }
  $contacts = [];
  foreach ($nodes as $node) {
    $wrapper = entity_metadata_wrapper('node', $node);
    $wrapper->language($language->language);
    // Ignore contacts without a name in the current language.
    if (!$wrapper->field_last_name->value()) {
      continue;
    }

    $image = $wrapper->field_image->value();

    $contact = [
      'image_url' => $image ? image_style_url('thumbnail', $image['uri']) : '',
      'phone' => check_plain($wrapper->field_phone->value()),
      'fax' => check_plain($wrapper->field_fax->value()),
      'email' => check_plain($wrapper->field_email->value()),
      'address' => check_plain($wrapper->field_address->value()),
      'reception_hours' => hedley_contact_get_reception_hours($node),
    ];

    // Set the contact title as name and job title.
    $name = check_plain($wrapper->field_first_name->value()) . ' ' . check_plain($wrapper->field_last_name->value());
    $contact['title'] = implode(' - ', [$name, check_plain($wrapper->field_job_title->value())]);

    $contacts[] = $contact;
  }

  $block = new stdClass();
  $block->module = 'hedley_topic';
  $block->content = theme('hedley_topic_topic_contacts', ['contacts' => $contacts]);

  return $block;
}

/**
 * Edit form.
 */
function hedley_topic_topic_contacts_content_type_edit_form($form, &$form_state) {
  return $form;
}

/**
 * Submit handler.
 */
function hedley_topic_topic_contacts_content_type_edit_form_submit($form, &$form_state) {
  // Copy submitted form values according to the defined defaults.
  foreach (array_keys($form_state['plugin']['defaults']) as $key) {
    $form_state['conf'][$key] = $form_state['values'][$key];
  }
}

/**
 * Delegated hook_theme().
 */
function hedley_topic_topic_contacts_content_type_theme(&$theme, $plugin) {
  $theme['hedley_topic_topic_contacts'] = [
    'variables' => [
      'contacts' => NULL,
    ],
    'path' => $plugin['path'],
    'template' => 'topic-contacts',
  ];
}
