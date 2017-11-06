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

/**
 * Implements hook_default_page_manager_pages().
 */
function hedley_news_default_page_manager_pages() {
  $page = new stdClass();
  $page->disabled = FALSE; /* Edit this to true to make a default page disabled initially */
  $page->api_version = 1;
  $page->name = 'news';
  $page->task = 'page';
  $page->admin_title = 'News';
  $page->admin_description = '';
  $page->path = 'news';
  $page->access = array(
    'plugins' => array(
      0 => array(
        'name' => 'og_context',
        'settings' => NULL,
        'not' => FALSE,
      ),
    ),
    'logic' => 'and',
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
  $handler->name = 'page_news__panel';
  $handler->task = 'page';
  $handler->subtask = 'news';
  $handler->handler = 'panel_context';
  $handler->weight = 0;
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
    'name' => 'panel',
  );
  $display = new panels_display();
  $display->layout = 'one-row-one-column';
  $display->layout_settings = array();
  $display->panel_settings = array(
    'style_settings' => array(
      'default' => NULL,
      'main_content' => NULL,
    ),
  );
  $display->cache = array();
  $display->title = 'News';
  $display->uuid = '714fb1b3-8cb4-4ebd-8cbc-31c3309c65de';
  $display->storage_type = 'page_manager';
  $display->storage_id = 'page_news__panel';
  $display->content = array();
  $display->panels = array();
  $pane = new stdClass();
  $pane->pid = 'new-aa27eea7-7aba-45f3-82ec-d1ea1dd26ef5';
  $pane->panel = 'main_content';
  $pane->type = 'news_page';
  $pane->subtype = 'news_page';
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
  $pane->uuid = 'aa27eea7-7aba-45f3-82ec-d1ea1dd26ef5';
  $display->content['new-aa27eea7-7aba-45f3-82ec-d1ea1dd26ef5'] = $pane;
  $display->panels['main_content'][0] = 'new-aa27eea7-7aba-45f3-82ec-d1ea1dd26ef5';
  $display->hide_title = PANELS_TITLE_FIXED;
  $display->title_pane = '0';
  $handler->conf['display'] = $display;
  $page->default_handlers[$handler->name] = $handler;
  $pages['news'] = $page;

  return $pages;

}
