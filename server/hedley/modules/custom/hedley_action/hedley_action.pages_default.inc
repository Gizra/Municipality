<?php
/**
 * @file
 * hedley_action.pages_default.inc
 */

/**
 * Implements hook_default_page_manager_handlers().
 */
function hedley_action_default_page_manager_handlers() {
  $export = array();

  $handler = new stdClass();
  $handler->disabled = FALSE; /* Edit this to true to make a default handler disabled initially */
  $handler->api_version = 1;
  $handler->name = 'node_view__panel_context_3278800b-39a0-4034-918d-7109e7fff6da';
  $handler->task = 'node_view';
  $handler->subtask = '';
  $handler->handler = 'panel_context';
  $handler->weight = 3;
  $handler->conf = array(
    'title' => 'Action',
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
          'name' => 'node_type',
          'settings' => array(
            'type' => array(
              'action' => 'action',
            ),
          ),
          'context' => 'argument_entity_id:node_1',
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
  $display->title = '';
  $display->uuid = '6f83d7ca-cd16-4bcc-92f4-6640c9f368bf';
  $display->storage_type = 'page_manager';
  $display->storage_id = 'node_view__panel_context_3278800b-39a0-4034-918d-7109e7fff6da';
  $display->content = array();
  $display->panels = array();
  $pane = new stdClass();
  $pane->pid = 'new-06005128-74cd-4f00-9c55-da9c69d6db21';
  $pane->panel = 'main';
  $pane->type = 'action_content';
  $pane->subtype = 'action_content';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array();
  $pane->cache = array();
  $pane->style = array(
    'settings' => NULL,
  );
  $pane->css = array();
  $pane->extras = array();
  $pane->position = 0;
  $pane->locks = array();
  $pane->uuid = '06005128-74cd-4f00-9c55-da9c69d6db21';
  $display->content['new-06005128-74cd-4f00-9c55-da9c69d6db21'] = $pane;
  $display->panels['main'][0] = 'new-06005128-74cd-4f00-9c55-da9c69d6db21';
  $display->hide_title = PANELS_TITLE_NONE;
  $display->title_pane = 'new-06005128-74cd-4f00-9c55-da9c69d6db21';
  $handler->conf['display'] = $display;
  $export['node_view__panel_context_3278800b-39a0-4034-918d-7109e7fff6da'] = $handler;

  return $export;
}
