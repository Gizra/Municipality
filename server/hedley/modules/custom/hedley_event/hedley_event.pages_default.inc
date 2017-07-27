<?php
/**
 * @file
 * hedley_event.pages_default.inc
 */

/**
 * Implements hook_default_page_manager_pages().
 */
function hedley_event_default_page_manager_pages() {
  $page = new stdClass();
  $page->disabled = FALSE; /* Edit this to true to make a default page disabled initially */
  $page->api_version = 1;
  $page->name = 'events';
  $page->task = 'page';
  $page->admin_title = 'Events';
  $page->admin_description = '';
  $page->path = 'events';
  $page->access = array(
    'plugins' => array(
      0 => array(
        'name' => 'og_context',
        'settings' => NULL,
        'not' => FALSE,
      ),
    ),
    'logic' => 'and',
    'type' => 'none',
    'settings' => NULL,
  );
  $page->menu = array();
  $page->arguments = array();
  $page->conf = array(
    'admin_paths' => FALSE,
  );
  $page->default_handlers = array();
  $handler = new stdClass();
  $handler->disabled = FALSE; /* Edit this to true to make a default handler disabled initially */
  $handler->api_version = 1;
  $handler->name = 'page_events__panel';
  $handler->task = 'page';
  $handler->subtask = 'events';
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
    'name' => 'panel',
  );
  $display = new panels_display();
  $display->layout = 'one-row-one-column';
  $display->layout_settings = array();
  $display->panel_settings = array(
    'style_settings' => array(
      'default' => NULL,
      'middle' => NULL,
    ),
  );
  $display->cache = array();
  $display->title = '';
  $display->uuid = 'a6678f2a-211c-406d-80d4-cd5753f9767d';
  $display->storage_type = 'page_manager';
  $display->storage_id = 'page_events__panel';
  $display->content = array();
  $display->panels = array();
  $pane = new stdClass();
  $pane->pid = 'new-daf16a4b-fe3d-4ea4-9376-dca466d59962';
  $pane->panel = 'main_content';
  $pane->type = 'elm';
  $pane->subtype = 'elm';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'page' => 'events',
    'override_title' => 0,
    'override_title_text' => '',
    'override_title_heading' => 'h2',
    'show_as_block' => 0,
    'promoted_only' => 0,
    'context' => 'empty',
  );
  $pane->cache = array();
  $pane->style = array(
    'settings' => NULL,
  );
  $pane->css = array();
  $pane->extras = array();
  $pane->position = 0;
  $pane->locks = array();
  $pane->uuid = 'daf16a4b-fe3d-4ea4-9376-dca466d59962';
  $display->content['new-daf16a4b-fe3d-4ea4-9376-dca466d59962'] = $pane;
  $display->panels['main_content'][0] = 'new-daf16a4b-fe3d-4ea4-9376-dca466d59962';
  $display->hide_title = PANELS_TITLE_FIXED;
  $display->title_pane = 'new-daf16a4b-fe3d-4ea4-9376-dca466d59962';
  $handler->conf['display'] = $display;
  $page->default_handlers[$handler->name] = $handler;
  $pages['events'] = $page;

  return $pages;

}
