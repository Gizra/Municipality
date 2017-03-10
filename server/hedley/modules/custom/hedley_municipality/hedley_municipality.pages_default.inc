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
  $display->layout = 'onecol';
  $display->layout_settings = array();
  $display->panel_settings = array(
    'style_settings' => array(
      'default' => NULL,
      'left' => NULL,
      'right' => NULL,
      'middle' => NULL,
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
  $pane->pid = 'new-dd845d83-4f2d-4a69-b388-52151d09c6f8';
  $pane->panel = 'middle';
  $pane->type = 'faqs_accordion';
  $pane->subtype = 'faqs_accordion';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array();
  $pane->cache = array();
  $pane->style = array(
    'settings' => NULL,
  );
  $pane->css = array(
    'css_id' => '',
    'css_class' => 'ui nine wide column',
  );
  $pane->extras = array();
  $pane->position = 0;
  $pane->locks = array();
  $pane->uuid = 'dd845d83-4f2d-4a69-b388-52151d09c6f8';
  $display->content['new-dd845d83-4f2d-4a69-b388-52151d09c6f8'] = $pane;
  $display->panels['middle'][0] = 'new-dd845d83-4f2d-4a69-b388-52151d09c6f8';
  $pane = new stdClass();
  $pane->pid = 'new-fb1c6e5e-f7b3-4fcc-821d-23a173bc173c';
  $pane->panel = 'middle';
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
  );
  $pane->cache = array();
  $pane->style = array(
    'settings' => NULL,
  );
  $pane->css = array();
  $pane->extras = array();
  $pane->position = 1;
  $pane->locks = array();
  $pane->uuid = 'fb1c6e5e-f7b3-4fcc-821d-23a173bc173c';
  $display->content['new-fb1c6e5e-f7b3-4fcc-821d-23a173bc173c'] = $pane;
  $display->panels['middle'][1] = 'new-fb1c6e5e-f7b3-4fcc-821d-23a173bc173c';
  $display->hide_title = PANELS_TITLE_FIXED;
  $display->title_pane = '0';
  $handler->conf['display'] = $display;
  $export['node_view__panel_context_70d5fb2a-fcbd-4c6c-8620-b04f8f6cbece'] = $handler;

  return $export;
}
