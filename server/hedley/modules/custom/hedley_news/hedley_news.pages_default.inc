<?php
/**
 * @file
 * hedley_news.pages_default.inc
 */

/**
 * Implements hook_default_page_manager_handlers().
 */
function hedley_news_default_page_manager_handlers() {
  $export = array();

  $handler = new stdClass();
  $handler->disabled = FALSE; /* Edit this to true to make a default handler disabled initially */
  $handler->api_version = 1;
  $handler->name = 'node_view__panel_context_6b5b3bb6-5435-4f8c-9eba-50ff7c1ff8ed';
  $handler->task = 'node_view';
  $handler->subtask = '';
  $handler->handler = 'panel_context';
  $handler->weight = 1;
  $handler->conf = array(
    'title' => 'News',
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
              'news' => 'news',
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
  $display->layout = 'one-row-one-column';
  $display->layout_settings = array();
  $display->panel_settings = array(
    'style_settings' => array(
      'default' => NULL,
      'main' => NULL,
      'middle' => NULL,
    ),
  );
  $display->cache = array();
  $display->title = 'News and Updates';
  $display->uuid = '211bd3af-8825-47b3-be15-0c7ecc177801';
  $display->storage_type = 'page_manager';
  $display->storage_id = 'node_view__panel_context_6b5b3bb6-5435-4f8c-9eba-50ff7c1ff8ed';
  $display->content = array();
  $display->panels = array();
  $pane = new stdClass();
  $pane->pid = 'new-e5144316-604d-4cdc-80cf-0f4daf9ca485';
  $pane->panel = 'main_content';
  $pane->type = 'news_content';
  $pane->subtype = 'news_content';
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
  $pane->uuid = 'e5144316-604d-4cdc-80cf-0f4daf9ca485';
  $display->content['new-e5144316-604d-4cdc-80cf-0f4daf9ca485'] = $pane;
  $display->panels['main_content'][0] = 'new-e5144316-604d-4cdc-80cf-0f4daf9ca485';
  $display->hide_title = PANELS_TITLE_NONE;
  $display->title_pane = '0';
  $handler->conf['display'] = $display;
  $export['node_view__panel_context_6b5b3bb6-5435-4f8c-9eba-50ff7c1ff8ed'] = $handler;

  return $export;
}
