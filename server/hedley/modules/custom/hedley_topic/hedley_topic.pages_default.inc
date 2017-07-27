<?php
/**
 * @file
 * hedley_topic.pages_default.inc
 */

/**
 * Implements hook_default_page_manager_handlers().
 */
function hedley_topic_default_page_manager_handlers() {
  $export = array();

  $handler = new stdClass();
  $handler->disabled = FALSE; /* Edit this to true to make a default handler disabled initially */
  $handler->api_version = 1;
  $handler->name = 'term_view__panel_context_87916a7c-c92c-4818-a626-a9f865d52863';
  $handler->task = 'term_view';
  $handler->subtask = '';
  $handler->handler = 'panel_context';
  $handler->weight = 0;
  $handler->conf = array(
    'title' => 'Topic',
    'no_blocks' => 0,
    'pipeline' => 'standard',
    'body_classes_to_remove' => '',
    'body_classes_to_add' => '',
    'css_id' => '',
    'css' => '',
    'contexts' => array(),
    'relationships' => array(),
    'name' => '',
    'access' => array(
      'plugins' => array(
        0 => array(
          'name' => 'entity_bundle:taxonomy_term',
          'settings' => array(
            'type' => array(
              'audiences' => 'audiences',
              'departments' => 'departments',
              'user_types' => 'user_types',
            ),
          ),
          'context' => 'argument_term_1',
          'not' => TRUE,
        ),
        1 => array(
          'name' => 'og_context',
          'settings' => NULL,
          'not' => FALSE,
        ),
      ),
      'logic' => 'and',
    ),
  );
  $display = new panels_display();
  $display->layout = 'stackable';
  $display->layout_settings = array();
  $display->panel_settings = array(
    'style_settings' => array(
      'default' => NULL,
      'main' => NULL,
      '1st_row' => NULL,
      '2nd_row' => NULL,
      '3rd_row' => NULL,
    ),
  );
  $display->cache = array();
  $display->title = '%term:name_field';
  $display->uuid = 'd593c23a-4078-4556-80cc-678efafd5c94';
  $display->storage_type = 'page_manager';
  $display->storage_id = 'term_view__panel_context_87916a7c-c92c-4818-a626-a9f865d52863';
  $display->content = array();
  $display->panels = array();
  $pane = new stdClass();
  $pane->pid = 'new-81be03ab-dce8-49ed-8c3b-786209806cbd';
  $pane->panel = '1st_row';
  $pane->type = 'term_title';
  $pane->subtype = 'term_title';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'context' => 'argument_term_1',
    'override_title' => 0,
    'override_title_text' => '',
    'override_title_heading' => 'h2',
  );
  $pane->cache = array();
  $pane->style = array(
    'settings' => NULL,
  );
  $pane->css = array(
    'css_id' => '',
    'css_class' => 'center',
  );
  $pane->extras = array();
  $pane->position = 0;
  $pane->locks = array();
  $pane->uuid = '81be03ab-dce8-49ed-8c3b-786209806cbd';
  $display->content['new-81be03ab-dce8-49ed-8c3b-786209806cbd'] = $pane;
  $display->panels['1st_row'][0] = 'new-81be03ab-dce8-49ed-8c3b-786209806cbd';
  $pane = new stdClass();
  $pane->pid = 'new-ac55fd81-995d-4556-aa7e-13a1171cd322';
  $pane->panel = '2nd_row';
  $pane->type = 'topic_news';
  $pane->subtype = 'topic_news';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'context' => 'argument_term_1',
    'override_title' => 0,
    'override_title_text' => '',
    'override_title_heading' => 'h2',
  );
  $pane->cache = array();
  $pane->style = array(
    'settings' => NULL,
  );
  $pane->css = array();
  $pane->extras = array();
  $pane->position = 0;
  $pane->locks = array();
  $pane->uuid = 'ac55fd81-995d-4556-aa7e-13a1171cd322';
  $display->content['new-ac55fd81-995d-4556-aa7e-13a1171cd322'] = $pane;
  $display->panels['2nd_row'][0] = 'new-ac55fd81-995d-4556-aa7e-13a1171cd322';
  $pane = new stdClass();
  $pane->pid = 'new-779c4a2d-3046-42db-a647-17fd7dece40f';
  $pane->panel = '2nd_row';
  $pane->type = 'faqs_accordion';
  $pane->subtype = 'faqs_accordion';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'promoted_only' => 0,
    'context' => array(
      0 => 'empty',
      1 => 'argument_term_1',
    ),
    'override_title' => 0,
    'override_title_text' => '',
    'override_title_heading' => 'h2',
  );
  $pane->cache = array();
  $pane->style = array(
    'settings' => NULL,
  );
  $pane->css = array();
  $pane->extras = array();
  $pane->position = 1;
  $pane->locks = array();
  $pane->uuid = '779c4a2d-3046-42db-a647-17fd7dece40f';
  $display->content['new-779c4a2d-3046-42db-a647-17fd7dece40f'] = $pane;
  $display->panels['2nd_row'][1] = 'new-779c4a2d-3046-42db-a647-17fd7dece40f';
  $pane = new stdClass();
  $pane->pid = 'new-0efdc859-570f-4a0b-aa79-7c2ea5aac9ae';
  $pane->panel = '2nd_row';
  $pane->type = 'topic_actions';
  $pane->subtype = 'topic_actions';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'context' => 'argument_term_1',
    'override_title' => 0,
    'override_title_text' => '',
    'override_title_heading' => 'h2',
  );
  $pane->cache = array();
  $pane->style = array(
    'settings' => NULL,
  );
  $pane->css = array();
  $pane->extras = array();
  $pane->position = 2;
  $pane->locks = array();
  $pane->uuid = '0efdc859-570f-4a0b-aa79-7c2ea5aac9ae';
  $display->content['new-0efdc859-570f-4a0b-aa79-7c2ea5aac9ae'] = $pane;
  $display->panels['2nd_row'][2] = 'new-0efdc859-570f-4a0b-aa79-7c2ea5aac9ae';
  $pane = new stdClass();
  $pane->pid = 'new-e4caa021-5a19-4359-8063-1b7b6601c880';
  $pane->panel = '2nd_row';
  $pane->type = 'topic_hardcopy_forms';
  $pane->subtype = 'topic_hardcopy_forms';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'context' => 'argument_term_1',
    'override_title' => 0,
    'override_title_text' => '',
    'override_title_heading' => 'h2',
  );
  $pane->cache = array();
  $pane->style = array(
    'settings' => NULL,
  );
  $pane->css = array();
  $pane->extras = array();
  $pane->position = 3;
  $pane->locks = array();
  $pane->uuid = 'e4caa021-5a19-4359-8063-1b7b6601c880';
  $display->content['new-e4caa021-5a19-4359-8063-1b7b6601c880'] = $pane;
  $display->panels['2nd_row'][3] = 'new-e4caa021-5a19-4359-8063-1b7b6601c880';
  $pane = new stdClass();
  $pane->pid = 'new-16aaf48d-a28a-4683-9210-7c663f1bb8ab';
  $pane->panel = '3rd_row';
  $pane->type = 'elm';
  $pane->subtype = 'elm';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'page' => 'events',
    'show_as_block' => 1,
    'override_title' => 0,
    'override_title_text' => '',
    'override_title_heading' => 'h2',
    'context' => 'argument_term_1',
    'promoted_only' => 0,
  );
  $pane->cache = array();
  $pane->style = array(
    'settings' => NULL,
  );
  $pane->css = array();
  $pane->extras = array();
  $pane->position = 0;
  $pane->locks = array();
  $pane->uuid = '16aaf48d-a28a-4683-9210-7c663f1bb8ab';
  $display->content['new-16aaf48d-a28a-4683-9210-7c663f1bb8ab'] = $pane;
  $display->panels['3rd_row'][0] = 'new-16aaf48d-a28a-4683-9210-7c663f1bb8ab';
  $pane = new stdClass();
  $pane->pid = 'new-aef38d85-0bbc-4084-a782-62b8afe70861';
  $pane->panel = '3rd_row';
  $pane->type = 'elm';
  $pane->subtype = 'elm';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'page' => 'contacts',
    'show_as_block' => 1,
    'promoted_only' => 0,
    'context' => 'argument_term_1',
    'override_title' => 0,
    'override_title_text' => '',
    'override_title_heading' => 'h2',
  );
  $pane->cache = array();
  $pane->style = array(
    'settings' => NULL,
  );
  $pane->css = array();
  $pane->extras = array();
  $pane->position = 1;
  $pane->locks = array();
  $pane->uuid = 'aef38d85-0bbc-4084-a782-62b8afe70861';
  $display->content['new-aef38d85-0bbc-4084-a782-62b8afe70861'] = $pane;
  $display->panels['3rd_row'][1] = 'new-aef38d85-0bbc-4084-a782-62b8afe70861';
  $display->hide_title = PANELS_TITLE_FIXED;
  $display->title_pane = '0';
  $handler->conf['display'] = $display;
  $export['term_view__panel_context_87916a7c-c92c-4818-a626-a9f865d52863'] = $handler;

  return $export;
}
