<?php
/**
 * @file
 * hedley_homepage.pages_default.inc
 */

/**
 * Implements hook_default_page_manager_pages().
 */
function hedley_homepage_default_page_manager_pages() {
  $page = new stdClass();
  $page->disabled = FALSE; /* Edit this to true to make a default page disabled initially */
  $page->api_version = 1;
  $page->name = 'home_page';
  $page->task = 'page';
  $page->admin_title = 'Home page';
  $page->admin_description = 'The home page of the municipality platform.';
  $page->path = 'home';
  $page->access = array();
  $page->menu = array();
  $page->arguments = array();
  $page->conf = array(
    'admin_paths' => FALSE,
  );
  $page->default_handlers = array();
  $handler = new stdClass();
  $handler->disabled = FALSE; /* Edit this to true to make a default handler disabled initially */
  $handler->api_version = 1;
  $handler->name = 'page_home_page__panel';
  $handler->task = 'page';
  $handler->subtask = 'home_page';
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
  $display->layout = 'flexible';
  $display->layout_settings = array();
  $display->panel_settings = array(
    'style_settings' => array(
      'default' => NULL,
      'center' => NULL,
    ),
  );
  $display->cache = array();
  $display->title = 'Municipalities';
  $display->uuid = '08e4ac28-3897-4d61-b870-790cbc922236';
  $display->storage_type = 'page_manager';
  $display->storage_id = 'page_home_page__panel';
  $display->content = array();
  $display->panels = array();
  $pane = new stdClass();
  $pane->pid = 'new-5ab34562-59a1-4c98-ac3a-c7f54f51a597';
  $pane->panel = 'center';
  $pane->type = 'block';
  $pane->subtype = 'views-municipalities-block_1';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'override_title' => 1,
    'override_title_text' => 'This is a list of our currently available municipalities',
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
  $pane->uuid = '5ab34562-59a1-4c98-ac3a-c7f54f51a597';
  $display->content['new-5ab34562-59a1-4c98-ac3a-c7f54f51a597'] = $pane;
  $display->panels['center'][0] = 'new-5ab34562-59a1-4c98-ac3a-c7f54f51a597';
  $display->hide_title = PANELS_TITLE_FIXED;
  $display->title_pane = 'new-5ab34562-59a1-4c98-ac3a-c7f54f51a597';
  $handler->conf['display'] = $display;
  $page->default_handlers[$handler->name] = $handler;
  $pages['home_page'] = $page;

  return $pages;

}
