<?php
/**
 * @file
 * hedley_faq.views_default.inc
 */

/**
 * Implements hook_views_default_views().
 */
function hedley_faq_views_default_views() {
  $export = array();

  $view = new view();
  $view->name = 'faqs';
  $view->description = '';
  $view->tag = 'default';
  $view->base_table = 'node';
  $view->human_name = 'FAQs';
  $view->core = 7;
  $view->api_version = '3.0';
  $view->disabled = FALSE; /* Edit this to true to make a default view disabled initially */

  /* Display: Master */
  $handler = $view->new_display('default', 'Master', 'default');
  $handler->display->display_options['title'] = 'FAQs';
  $handler->display->display_options['use_more_always'] = FALSE;
  $handler->display->display_options['access']['type'] = 'perm';
  $handler->display->display_options['access']['perm'] = 'administer nodes';
  $handler->display->display_options['cache']['type'] = 'none';
  $handler->display->display_options['query']['type'] = 'views_query';
  $handler->display->display_options['exposed_form']['type'] = 'basic';
  $handler->display->display_options['pager']['type'] = 'full';
  $handler->display->display_options['pager']['options']['items_per_page'] = '25';
  $handler->display->display_options['style_plugin'] = 'table';
  $handler->display->display_options['style_options']['columns'] = array(
    'og_group_ref' => 'og_group_ref',
    'title' => 'title',
    'field_question' => 'field_question',
    'field_answer' => 'field_answer',
    'field_user_types' => 'field_user_types',
    'field_topics' => 'field_topics',
  );
  $handler->display->display_options['style_options']['default'] = '-1';
  $handler->display->display_options['style_options']['info'] = array(
    'og_group_ref' => array(
      'align' => '',
      'separator' => '',
      'empty_column' => 0,
    ),
    'title' => array(
      'sortable' => 1,
      'default_sort_order' => 'asc',
      'align' => '',
      'separator' => '',
      'empty_column' => 0,
    ),
    'field_question' => array(
      'sortable' => 1,
      'default_sort_order' => 'asc',
      'align' => '',
      'separator' => '',
      'empty_column' => 0,
    ),
    'field_answer' => array(
      'sortable' => 1,
      'default_sort_order' => 'asc',
      'align' => '',
      'separator' => '',
      'empty_column' => 0,
    ),
    'field_user_types' => array(
      'align' => '',
      'separator' => '',
      'empty_column' => 0,
    ),
    'field_topics' => array(
      'align' => '',
      'separator' => '',
      'empty_column' => 0,
    ),
  );
  /* Field: Content: Groups audience */
  $handler->display->display_options['fields']['og_group_ref']['id'] = 'og_group_ref';
  $handler->display->display_options['fields']['og_group_ref']['table'] = 'og_membership';
  $handler->display->display_options['fields']['og_group_ref']['field'] = 'og_group_ref';
  $handler->display->display_options['fields']['og_group_ref']['settings'] = array(
    'link' => 0,
  );
  $handler->display->display_options['fields']['og_group_ref']['delta_offset'] = '0';
  /* Field: Content: Title */
  $handler->display->display_options['fields']['title']['id'] = 'title';
  $handler->display->display_options['fields']['title']['table'] = 'node';
  $handler->display->display_options['fields']['title']['field'] = 'title';
  $handler->display->display_options['fields']['title']['alter']['word_boundary'] = FALSE;
  $handler->display->display_options['fields']['title']['alter']['ellipsis'] = FALSE;
  /* Field: Content: Question */
  $handler->display->display_options['fields']['field_question']['id'] = 'field_question';
  $handler->display->display_options['fields']['field_question']['table'] = 'field_data_field_question';
  $handler->display->display_options['fields']['field_question']['field'] = 'field_question';
  /* Field: Content: Answer */
  $handler->display->display_options['fields']['field_answer']['id'] = 'field_answer';
  $handler->display->display_options['fields']['field_answer']['table'] = 'field_data_field_answer';
  $handler->display->display_options['fields']['field_answer']['field'] = 'field_answer';
  /* Field: Content: User types */
  $handler->display->display_options['fields']['field_user_types']['id'] = 'field_user_types';
  $handler->display->display_options['fields']['field_user_types']['table'] = 'field_data_field_user_types';
  $handler->display->display_options['fields']['field_user_types']['field'] = 'field_user_types';
  $handler->display->display_options['fields']['field_user_types']['delta_offset'] = '0';
  /* Field: Content: Edit link */
  $handler->display->display_options['fields']['edit_node']['id'] = 'edit_node';
  $handler->display->display_options['fields']['edit_node']['table'] = 'views_entity_node';
  $handler->display->display_options['fields']['edit_node']['field'] = 'edit_node';
  /* Field: Content: OG vocabulary */
  $handler->display->display_options['fields']['og_vocabulary']['id'] = 'og_vocabulary';
  $handler->display->display_options['fields']['og_vocabulary']['table'] = 'field_data_og_vocabulary';
  $handler->display->display_options['fields']['og_vocabulary']['field'] = 'og_vocabulary';
  $handler->display->display_options['fields']['og_vocabulary']['label'] = 'Topics';
  $handler->display->display_options['fields']['og_vocabulary']['settings'] = array(
    'link' => 0,
  );
  $handler->display->display_options['fields']['og_vocabulary']['delta_offset'] = '0';
  /* Sort criterion: Content: Post date */
  $handler->display->display_options['sorts']['created']['id'] = 'created';
  $handler->display->display_options['sorts']['created']['table'] = 'node';
  $handler->display->display_options['sorts']['created']['field'] = 'created';
  $handler->display->display_options['sorts']['created']['order'] = 'DESC';
  /* Filter criterion: Content: Published */
  $handler->display->display_options['filters']['status']['id'] = 'status';
  $handler->display->display_options['filters']['status']['table'] = 'node';
  $handler->display->display_options['filters']['status']['field'] = 'status';
  $handler->display->display_options['filters']['status']['value'] = 1;
  $handler->display->display_options['filters']['status']['group'] = 1;
  $handler->display->display_options['filters']['status']['expose']['operator'] = FALSE;
  /* Filter criterion: Content: Type */
  $handler->display->display_options['filters']['type']['id'] = 'type';
  $handler->display->display_options['filters']['type']['table'] = 'node';
  $handler->display->display_options['filters']['type']['field'] = 'type';
  $handler->display->display_options['filters']['type']['value'] = array(
    'faq' => 'faq',
  );
  /* Filter criterion: Content: Groups audience (og_group_ref) */
  $handler->display->display_options['filters']['og_group_ref_target_id']['id'] = 'og_group_ref_target_id';
  $handler->display->display_options['filters']['og_group_ref_target_id']['table'] = 'og_membership';
  $handler->display->display_options['filters']['og_group_ref_target_id']['field'] = 'og_group_ref_target_id';
  $handler->display->display_options['filters']['og_group_ref_target_id']['exposed'] = TRUE;
  $handler->display->display_options['filters']['og_group_ref_target_id']['expose']['operator_id'] = 'og_group_ref_target_id_op';
  $handler->display->display_options['filters']['og_group_ref_target_id']['expose']['label'] = 'Groups audience (og_group_ref)';
  $handler->display->display_options['filters']['og_group_ref_target_id']['expose']['operator'] = 'og_group_ref_target_id_op';
  $handler->display->display_options['filters']['og_group_ref_target_id']['expose']['identifier'] = 'og_group_ref_target_id';
  $handler->display->display_options['filters']['og_group_ref_target_id']['expose']['remember_roles'] = array(
    2 => '2',
    1 => 0,
    3 => 0,
  );
  /* Filter criterion: Content: User types (field_user_types) */
  $handler->display->display_options['filters']['field_user_types_tid']['id'] = 'field_user_types_tid';
  $handler->display->display_options['filters']['field_user_types_tid']['table'] = 'field_data_field_user_types';
  $handler->display->display_options['filters']['field_user_types_tid']['field'] = 'field_user_types_tid';
  $handler->display->display_options['filters']['field_user_types_tid']['exposed'] = TRUE;
  $handler->display->display_options['filters']['field_user_types_tid']['expose']['operator_id'] = 'field_user_types_tid_op';
  $handler->display->display_options['filters']['field_user_types_tid']['expose']['label'] = 'User types (field_user_types)';
  $handler->display->display_options['filters']['field_user_types_tid']['expose']['operator'] = 'field_user_types_tid_op';
  $handler->display->display_options['filters']['field_user_types_tid']['expose']['identifier'] = 'field_user_types_tid';
  $handler->display->display_options['filters']['field_user_types_tid']['expose']['remember_roles'] = array(
    2 => '2',
    1 => 0,
    3 => 0,
  );
  $handler->display->display_options['filters']['field_user_types_tid']['type'] = 'select';
  $handler->display->display_options['filters']['field_user_types_tid']['vocabulary'] = 'user_types';
  /* Filter criterion: Content: OG vocabulary (og_vocabulary) */
  $handler->display->display_options['filters']['og_vocabulary_target_id']['id'] = 'og_vocabulary_target_id';
  $handler->display->display_options['filters']['og_vocabulary_target_id']['table'] = 'field_data_og_vocabulary';
  $handler->display->display_options['filters']['og_vocabulary_target_id']['field'] = 'og_vocabulary_target_id';
  $handler->display->display_options['filters']['og_vocabulary_target_id']['exposed'] = TRUE;
  $handler->display->display_options['filters']['og_vocabulary_target_id']['expose']['operator_id'] = 'og_vocabulary_target_id_op';
  $handler->display->display_options['filters']['og_vocabulary_target_id']['expose']['label'] = 'Topics';
  $handler->display->display_options['filters']['og_vocabulary_target_id']['expose']['operator'] = 'og_vocabulary_target_id_op';
  $handler->display->display_options['filters']['og_vocabulary_target_id']['expose']['identifier'] = 'og_vocabulary_target_id';
  $handler->display->display_options['filters']['og_vocabulary_target_id']['expose']['remember_roles'] = array(
    2 => '2',
    1 => 0,
    3 => 0,
  );

  /* Display: Page */
  $handler = $view->new_display('page', 'Page', 'page');
  $handler->display->display_options['path'] = 'admin/content/faqs';
  $handler->display->display_options['menu']['type'] = 'tab';
  $handler->display->display_options['menu']['title'] = 'FAQs';
  $handler->display->display_options['menu']['weight'] = '0';
  $handler->display->display_options['menu']['context'] = 0;
  $handler->display->display_options['menu']['context_only_inline'] = 0;
  $handler->display->display_options['tab_options']['weight'] = '0';
  $translatables['faqs'] = array(
    t('Master'),
    t('FAQs'),
    t('more'),
    t('Apply'),
    t('Reset'),
    t('Sort by'),
    t('Asc'),
    t('Desc'),
    t('Items per page'),
    t('- All -'),
    t('Offset'),
    t('« first'),
    t('‹ previous'),
    t('next ›'),
    t('last »'),
    t('Groups audience'),
    t('Title'),
    t('Question'),
    t('Answer'),
    t('User types'),
    t('Edit link'),
    t('Topics'),
    t('Groups audience (og_group_ref)'),
    t('User types (field_user_types)'),
    t('Page'),
  );
  $export['faqs'] = $view;

  return $export;
}
