<?php
/**
 * @file
 * hedley_page.pages_default.inc
 */

/**
 * Implements hook_default_page_manager_handlers().
 */
function hedley_page_default_page_manager_handlers() {
  $export = array();

  $handler = new stdClass();
  $handler->disabled = FALSE; /* Edit this to true to make a default handler disabled initially */
  $handler->api_version = 1;
  $handler->name = 'node_view__panel_context_9bad03f9-93b5-4f7f-943b-ba6e3b926c64';
  $handler->task = 'node_view';
  $handler->subtask = '';
  $handler->handler = 'panel_context';
  $handler->weight = 2;
  $handler->conf = array(
    'title' => 'Page',
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
              'page' => 'page',
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
  $display->uuid = '8aefc610-314e-4273-b621-345d23bc2e09';
  $display->storage_type = 'page_manager';
  $display->storage_id = 'node_view__panel_context_9bad03f9-93b5-4f7f-943b-ba6e3b926c64';
  $display->content = array();
  $display->panels = array();
  $pane = new stdClass();
  $pane->pid = 'new-32451e83-ae5b-413b-bff4-0ae2950d11b4';
  $pane->panel = 'main';
  $pane->type = 'page_content';
  $pane->subtype = 'page_content';
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
  $pane->uuid = '32451e83-ae5b-413b-bff4-0ae2950d11b4';
  $display->content['new-32451e83-ae5b-413b-bff4-0ae2950d11b4'] = $pane;
  $display->panels['main'][0] = 'new-32451e83-ae5b-413b-bff4-0ae2950d11b4';
  $display->hide_title = PANELS_TITLE_NONE;
  $display->title_pane = 'new-32451e83-ae5b-413b-bff4-0ae2950d11b4';
  $handler->conf['display'] = $display;
  $export['node_view__panel_context_9bad03f9-93b5-4f7f-943b-ba6e3b926c64'] = $handler;

  return $export;
}
