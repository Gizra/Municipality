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
  $pane->pid = 'new-8b672159-4aee-443e-aab2-629608f9fbaa';
  $pane->panel = 'main';
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
  $pane->uuid = '8b672159-4aee-443e-aab2-629608f9fbaa';
  $display->content['new-8b672159-4aee-443e-aab2-629608f9fbaa'] = $pane;
  $display->panels['main'][0] = 'new-8b672159-4aee-443e-aab2-629608f9fbaa';
  $pane = new stdClass();
  $pane->pid = 'new-75c69053-6f5d-435e-8769-370397d44d36';
  $pane->panel = 'main';
  $pane->type = 'promoted_content';
  $pane->subtype = 'promoted_content';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'bundle' => 'action',
    'title' => 'Do now',
    'all_nodes_title' => '',
    'all_nodes_url' => '',
    'context' => 'argument_entity_id:node_1',
    'override_title' => 0,
    'override_title_text' => '',
    'override_title_heading' => 'h2',
    'items_class' => 'ui relaxed divided list',
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
  $pane->uuid = '75c69053-6f5d-435e-8769-370397d44d36';
  $display->content['new-75c69053-6f5d-435e-8769-370397d44d36'] = $pane;
  $display->panels['main'][1] = 'new-75c69053-6f5d-435e-8769-370397d44d36';
  $pane = new stdClass();
  $pane->pid = 'new-fb1c6e5e-f7b3-4fcc-821d-23a173bc173c';
  $pane->panel = 'main';
  $pane->type = 'promoted_content';
  $pane->subtype = 'promoted_content';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'bundle' => 'news',
    'context' => 'argument_entity_id:node_1',
    'override_title' => 0,
    'override_title_text' => 'What happens in %title',
    'override_title_heading' => 'h2',
    'title' => 'What happens in @municipality?',
    'all_nodes_title' => 'See all news',
    'all_nodes_url' => '',
    'items_class' => 'ui link items',
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
  $pane->position = 2;
  $pane->locks = array();
  $pane->uuid = 'fb1c6e5e-f7b3-4fcc-821d-23a173bc173c';
  $display->content['new-fb1c6e5e-f7b3-4fcc-821d-23a173bc173c'] = $pane;
  $display->panels['main'][2] = 'new-fb1c6e5e-f7b3-4fcc-821d-23a173bc173c';
  $pane = new stdClass();
  $pane->pid = 'new-b2093586-b0a5-4a1f-9908-22f14c5d7d20';
  $pane->panel = 'main';
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
  );
  $pane->cache = array();
  $pane->style = array(
    'settings' => NULL,
  );
  $pane->css = array(
    'css_id' => 'elm-events-block',
    'css_class' => 'col-md-6',
  );
  $pane->extras = array();
  $pane->position = 3;
  $pane->locks = array();
  $pane->uuid = 'b2093586-b0a5-4a1f-9908-22f14c5d7d20';
  $display->content['new-b2093586-b0a5-4a1f-9908-22f14c5d7d20'] = $pane;
  $display->panels['main'][3] = 'new-b2093586-b0a5-4a1f-9908-22f14c5d7d20';
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
