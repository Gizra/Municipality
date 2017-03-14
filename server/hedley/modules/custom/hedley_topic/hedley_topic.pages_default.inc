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
    'title' => 'Panel',
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
              'topics' => 'topics',
            ),
          ),
          'context' => 'argument_term_1',
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
  $pane->pid = 'new-6154e3c1-3a97-404b-ad53-542e599a4521';
  $pane->panel = 'main';
  $pane->type = 'entity_view';
  $pane->subtype = 'taxonomy_term';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'view_mode' => 'full',
    'context' => 'argument_term_1',
    'override_title' => 1,
    'override_title_text' => '%term:name_field',
    'override_title_heading' => 'h1',
  );
  $pane->cache = array();
  $pane->style = array(
    'settings' => NULL,
  );
  $pane->css = array();
  $pane->extras = array();
  $pane->position = 0;
  $pane->locks = array();
  $pane->uuid = '6154e3c1-3a97-404b-ad53-542e599a4521';
  $display->content['new-6154e3c1-3a97-404b-ad53-542e599a4521'] = $pane;
  $display->panels['main'][0] = 'new-6154e3c1-3a97-404b-ad53-542e599a4521';
  $display->hide_title = PANELS_TITLE_FIXED;
  $display->title_pane = '0';
  $handler->conf['display'] = $display;
  $export['term_view__panel_context_87916a7c-c92c-4818-a626-a9f865d52863'] = $handler;

  return $export;
}
