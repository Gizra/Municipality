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
  $pane->css = array();
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
    'css_class' => 'ui segment seven wide column',
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
    'css_class' => 'ui segment nine wide column',
  );
  $pane->extras = array();
  $pane->position = 2;
  $pane->locks = array();
  $pane->uuid = 'fb1c6e5e-f7b3-4fcc-821d-23a173bc173c';
  $display->content['new-fb1c6e5e-f7b3-4fcc-821d-23a173bc173c'] = $pane;
  $display->panels['main'][2] = 'new-fb1c6e5e-f7b3-4fcc-821d-23a173bc173c';
  $pane = new stdClass();
  $pane->pid = 'new-bff022db-6e50-4f7e-954b-3d694b9ef8d1';
  $pane->panel = 'main';
  $pane->type = 'promoted_content';
  $pane->subtype = 'promoted_content';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'all_nodes_title' => 'See all events',
    'all_nodes_url' => '',
    'bundle' => 'event',
    'items_class' => 'ui divided items',
    'title' => 'Upcoming events',
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
    'css_class' => 'ui segment seven wide column',
  );
  $pane->extras = array();
  $pane->position = 3;
  $pane->locks = array();
  $pane->uuid = 'bff022db-6e50-4f7e-954b-3d694b9ef8d1';
  $display->content['new-bff022db-6e50-4f7e-954b-3d694b9ef8d1'] = $pane;
  $display->panels['main'][3] = 'new-bff022db-6e50-4f7e-954b-3d694b9ef8d1';
  $display->hide_title = PANELS_TITLE_FIXED;
  $display->title_pane = '0';
  $handler->conf['display'] = $display;
  $export['node_view__panel_context_70d5fb2a-fcbd-4c6c-8620-b04f8f6cbece'] = $handler;

  return $export;
}
