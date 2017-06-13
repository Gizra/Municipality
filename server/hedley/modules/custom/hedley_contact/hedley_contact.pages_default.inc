<?php
/**
 * @file
 * hedley_contact.pages_default.inc
 */

/**
 * Implements hook_default_page_manager_pages().
 */
function hedley_contact_default_page_manager_pages() {
  $page = new stdClass();
  $page->disabled = FALSE; /* Edit this to true to make a default page disabled initially */
  $page->api_version = 1;
  $page->name = 'contacts';
  $page->task = 'page';
  $page->admin_title = 'Contacts';
  $page->admin_description = '';
  $page->path = 'contacts';
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
  $handler->name = 'page_contacts__panel';
  $handler->task = 'page';
  $handler->subtask = 'contacts';
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
  $display->layout = 'onecol';
  $display->layout_settings = array();
  $display->panel_settings = array(
    'style_settings' => array(
      'default' => NULL,
      'middle' => NULL,
    ),
  );
  $display->cache = array();
  $display->title = '';
  $display->uuid = '30b5c7e4-76f9-4618-9146-42850801e3a5';
  $display->storage_type = 'page_manager';
  $display->storage_id = 'page_contacts__panel';
  $display->content = array();
  $display->panels = array();
  $pane = new stdClass();
  $pane->pid = 'new-f3a8512e-4b73-4aa7-9e23-ab09a71a1bf5';
  $pane->panel = 'middle';
  $pane->type = 'elm';
  $pane->subtype = 'elm';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'page' => 'contacts',
    'override_title' => 0,
    'override_title_text' => '',
    'override_title_heading' => 'h2',
    'show_as_block' => 0,
  );
  $pane->cache = array();
  $pane->style = array(
    'settings' => NULL,
  );
  $pane->css = array();
  $pane->extras = array();
  $pane->position = 0;
  $pane->locks = array();
  $pane->uuid = 'f3a8512e-4b73-4aa7-9e23-ab09a71a1bf5';
  $display->content['new-f3a8512e-4b73-4aa7-9e23-ab09a71a1bf5'] = $pane;
  $display->panels['middle'][0] = 'new-f3a8512e-4b73-4aa7-9e23-ab09a71a1bf5';
  $display->hide_title = PANELS_TITLE_FIXED;
  $display->title_pane = '0';
  $handler->conf['display'] = $display;
  $page->default_handlers[$handler->name] = $handler;
  $pages['contacts'] = $page;

  return $pages;

}
