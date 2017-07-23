<?php
/**
 * @file
 * hedley_municipality.pages_default.inc
 */

/**
 * Implements hook_default_page_manager_handlers().
 */
function hedley_municipality_default_page_manager_handlers() {
  $export = array();

  $handler = new stdClass();
  $handler->disabled = FALSE; /* Edit this to true to make a default handler disabled initially */
  $handler->api_version = 1;
  $handler->name = 'node_view__panel_context_70d5fb2a-fcbd-4c6c-8620-b04f8f6cbece';
  $handler->task = 'node_view';
  $handler->subtask = '';
  $handler->handler = 'panel_context';
  $handler->weight = 0;
  $handler->conf = array(
    'title' => 'Municipality',
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
              'municipality' => 'municipality',
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
      'left' => NULL,
      'right' => NULL,
      'middle' => NULL,
      'main' => NULL,
      '1st_row' => NULL,
      '2nd_row' => NULL,
      '3rd_row' => NULL,
    ),
  );
  $display->cache = array();
  $display->title = '%node:title-field';
  $display->uuid = '5586907c-eba1-4c92-b1e7-039572886227';
  $display->storage_type = 'page_manager';
  $display->storage_id = 'node_view__panel_context_70d5fb2a-fcbd-4c6c-8620-b04f8f6cbece';
  $display->content = array();
  $display->panels = array();
  $pane = new stdClass();
  $pane->pid = 'new-6ef15911-3eb9-49dd-b116-d7d5323d0f81';
  $pane->panel = '1st_row';
  $pane->type = 'faqs_accordion';
  $pane->subtype = 'faqs_accordion';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'promoted_only' => 1,
    'context' => array(
      0 => 'argument_entity_id:node_1',
      1 => 'empty',
    ),
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
    'css_class' => 'col-md-6',
  );
  $pane->extras = array();
  $pane->position = 0;
  $pane->locks = array();
  $pane->uuid = '6ef15911-3eb9-49dd-b116-d7d5323d0f81';
  $display->content['new-6ef15911-3eb9-49dd-b116-d7d5323d0f81'] = $pane;
  $display->panels['1st_row'][0] = 'new-6ef15911-3eb9-49dd-b116-d7d5323d0f81';
  $pane = new stdClass();
  $pane->pid = 'new-540011bb-31a7-4326-98c0-09da62a7775f';
  $pane->panel = '1st_row';
  $pane->type = 'promoted_content';
  $pane->subtype = 'promoted_content';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'all_nodes_title' => '',
    'all_nodes_url' => '',
    'bundle' => 'action',
    'items_class' => 'list',
    'title' => 'Do now',
    'context' => 'argument_entity_id:node_1',
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
    'css_class' => 'col-md-6',
  );
  $pane->extras = array();
  $pane->position = 1;
  $pane->locks = array();
  $pane->uuid = '540011bb-31a7-4326-98c0-09da62a7775f';
  $display->content['new-540011bb-31a7-4326-98c0-09da62a7775f'] = $pane;
  $display->panels['1st_row'][1] = 'new-540011bb-31a7-4326-98c0-09da62a7775f';
  $pane = new stdClass();
  $pane->pid = 'new-d2c90c6f-5b90-4934-b299-d5d81c6e5eae';
  $pane->panel = '2nd_row';
  $pane->type = 'promoted_content';
  $pane->subtype = 'promoted_content';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'all_nodes_title' => 'See all news',
    'all_nodes_url' => 'news',
    'bundle' => 'news',
    'items_class' => 'items',
    'title' => 'What\'s happening in @municipality?',
    'context' => 'argument_entity_id:node_1',
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
    'css_class' => 'col-md-6 news-box',
  );
  $pane->extras = array();
  $pane->position = 0;
  $pane->locks = array();
  $pane->uuid = 'd2c90c6f-5b90-4934-b299-d5d81c6e5eae';
  $display->content['new-d2c90c6f-5b90-4934-b299-d5d81c6e5eae'] = $pane;
  $display->panels['2nd_row'][0] = 'new-d2c90c6f-5b90-4934-b299-d5d81c6e5eae';
  $pane = new stdClass();
  $pane->pid = 'new-f8795f8f-2ebf-4cc9-bd28-4ee7c75f4d1a';
  $pane->panel = '2nd_row';
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
    'promoted_only' => 1,
    'context' => 'empty',
  );
  $pane->cache = array();
  $pane->style = array(
    'settings' => NULL,
  );
  $pane->css = array(
    'css_id' => '',
    'css_class' => 'col-md-6',
  );
  $pane->extras = array();
  $pane->position = 1;
  $pane->locks = array();
  $pane->uuid = 'f8795f8f-2ebf-4cc9-bd28-4ee7c75f4d1a';
  $display->content['new-f8795f8f-2ebf-4cc9-bd28-4ee7c75f4d1a'] = $pane;
  $display->panels['2nd_row'][1] = 'new-f8795f8f-2ebf-4cc9-bd28-4ee7c75f4d1a';
  $pane = new stdClass();
  $pane->pid = 'new-c29a0964-4685-40a7-b7ac-2dbd9841a364';
  $pane->panel = '3rd_row';
  $pane->type = 'topics_list';
  $pane->subtype = 'topics_list';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'title' => NULL,
    'topics' => NULL,
    'context' => 'argument_entity_id:node_1',
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
  $pane->uuid = 'c29a0964-4685-40a7-b7ac-2dbd9841a364';
  $display->content['new-c29a0964-4685-40a7-b7ac-2dbd9841a364'] = $pane;
  $display->panels['3rd_row'][0] = 'new-c29a0964-4685-40a7-b7ac-2dbd9841a364';
  $display->hide_title = PANELS_TITLE_FIXED;
  $display->title_pane = '0';
  $handler->conf['display'] = $display;
  $export['node_view__panel_context_70d5fb2a-fcbd-4c6c-8620-b04f8f6cbece'] = $handler;

  return $export;
}

/**
 * Implements hook_default_page_manager_pages().
 */
function hedley_municipality_default_page_manager_pages() {
  $page = new stdClass();
  $page->disabled = FALSE; /* Edit this to true to make a default page disabled initially */
  $page->api_version = 1;
  $page->name = 'home_page';
  $page->task = 'page';
  $page->admin_title = 'Home page';
  $page->admin_description = 'The home page of the municipality platform.';
  $page->path = 'home';
  $page->access = array(
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
