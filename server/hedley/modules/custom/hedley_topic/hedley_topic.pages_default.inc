<?php
/**
 * @file
 * hedley_topic.pages_default.inc
 */

/**
 * Implements hook_default_page_manager_handlers().
 */
function hedley_topic_default_page_manager_handlers() {
  $export = array();

  $handler = new stdClass();
  $handler->disabled = FALSE; /* Edit this to true to make a default handler disabled initially */
  $handler->api_version = 1;
  $handler->name = 'term_view__panel_context_87916a7c-c92c-4818-a626-a9f865d52863';
  $handler->task = 'term_view';
  $handler->subtask = '';
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
    'name' => '',
    'access' => array(
      'plugins' => array(
        0 => array(
          'name' => 'entity_bundle:taxonomy_term',
          'settings' => array(
            'type' => array(
              'topics' => 'topics',
            ),
          ),
          'context' => 'argument_term_1',
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
  $display->title = '%term:name_field';
  $display->uuid = 'd593c23a-4078-4556-80cc-678efafd5c94';
  $display->storage_type = 'page_manager';
  $display->storage_id = 'term_view__panel_context_87916a7c-c92c-4818-a626-a9f865d52863';
  $display->content = array();
  $display->panels = array();
  $pane = new stdClass();
  $pane->pid = 'new-2078aacd-02a1-4738-9745-5483cd6b6b12';
  $pane->panel = 'main';
  $pane->type = 'term_title';
  $pane->subtype = 'term_title';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'context' => 'argument_term_1',
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
    'css_class' => 'ui segment centered row',
  );
  $pane->extras = array();
  $pane->position = 0;
  $pane->locks = array();
  $pane->uuid = '2078aacd-02a1-4738-9745-5483cd6b6b12';
  $display->content['new-2078aacd-02a1-4738-9745-5483cd6b6b12'] = $pane;
  $display->panels['main'][0] = 'new-2078aacd-02a1-4738-9745-5483cd6b6b12';
  $pane = new stdClass();
  $pane->pid = 'new-98797ebd-9983-4297-abcd-9b0f2f9b2617';
  $pane->panel = 'main';
  $pane->type = 'topic_news';
  $pane->subtype = 'topic_news';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'context' => 'argument_term_1',
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
    'css_class' => 'ui segment row',
  );
  $pane->extras = array();
  $pane->position = 1;
  $pane->locks = array();
  $pane->uuid = '98797ebd-9983-4297-abcd-9b0f2f9b2617';
  $display->content['new-98797ebd-9983-4297-abcd-9b0f2f9b2617'] = $pane;
  $display->panels['main'][1] = 'new-98797ebd-9983-4297-abcd-9b0f2f9b2617';
  $pane = new stdClass();
  $pane->pid = 'new-421793cb-36dd-4b1a-8a60-1c32b0c25dc7';
  $pane->panel = 'main';
  $pane->type = 'faqs_accordion';
  $pane->subtype = 'faqs_accordion';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'promoted_only' => 0,
    'context' => array(
      0 => 'empty',
      1 => 'argument_term_1',
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
    'css_class' => 'ui segment row',
  );
  $pane->extras = array();
  $pane->position = 2;
  $pane->locks = array();
  $pane->uuid = '421793cb-36dd-4b1a-8a60-1c32b0c25dc7';
  $display->content['new-421793cb-36dd-4b1a-8a60-1c32b0c25dc7'] = $pane;
  $display->panels['main'][2] = 'new-421793cb-36dd-4b1a-8a60-1c32b0c25dc7';
  $pane = new stdClass();
  $pane->pid = 'new-654f021f-86d9-471d-9b4f-b82bbc565da0';
  $pane->panel = 'main';
  $pane->type = 'topic_actions';
  $pane->subtype = 'topic_actions';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'context' => 'argument_term_1',
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
    'css_class' => 'ui segment row',
  );
  $pane->extras = array();
  $pane->position = 3;
  $pane->locks = array();
  $pane->uuid = '654f021f-86d9-471d-9b4f-b82bbc565da0';
  $display->content['new-654f021f-86d9-471d-9b4f-b82bbc565da0'] = $pane;
  $display->panels['main'][3] = 'new-654f021f-86d9-471d-9b4f-b82bbc565da0';
  $pane = new stdClass();
  $pane->pid = 'new-3a41ba08-e729-4f83-8273-e739b928e5a5';
  $pane->panel = 'main';
  $pane->type = 'topic_hardcopy_forms';
  $pane->subtype = 'topic_hardcopy_forms';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'context' => 'argument_term_1',
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
    'css_class' => 'ui segment row',
  );
  $pane->extras = array();
  $pane->position = 4;
  $pane->locks = array();
  $pane->uuid = '3a41ba08-e729-4f83-8273-e739b928e5a5';
  $display->content['new-3a41ba08-e729-4f83-8273-e739b928e5a5'] = $pane;
  $display->panels['main'][4] = 'new-3a41ba08-e729-4f83-8273-e739b928e5a5';
  $pane = new stdClass();
  $pane->pid = 'new-babebd25-9028-439f-8c3c-10f559efaf1b';
  $pane->panel = 'main';
  $pane->type = 'topic_contacts';
  $pane->subtype = 'topic_contacts';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'context' => 'argument_term_1',
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
    'css_class' => 'ui segment row',
  );
  $pane->extras = array();
  $pane->position = 5;
  $pane->locks = array();
  $pane->uuid = 'babebd25-9028-439f-8c3c-10f559efaf1b';
  $display->content['new-babebd25-9028-439f-8c3c-10f559efaf1b'] = $pane;
  $display->panels['main'][5] = 'new-babebd25-9028-439f-8c3c-10f559efaf1b';
  $pane = new stdClass();
  $pane->pid = 'new-462ee088-5038-46e2-906b-52523d9cae45';
  $pane->panel = 'main';
  $pane->type = 'topic_events';
  $pane->subtype = 'topic_events';
  $pane->shown = TRUE;
  $pane->access = array();
  $pane->configuration = array(
    'context' => 'argument_term_1',
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
    'css_class' => 'ui segment row',
  );
  $pane->extras = array();
  $pane->position = 6;
  $pane->locks = array();
  $pane->uuid = '462ee088-5038-46e2-906b-52523d9cae45';
  $display->content['new-462ee088-5038-46e2-906b-52523d9cae45'] = $pane;
  $display->panels['main'][6] = 'new-462ee088-5038-46e2-906b-52523d9cae45';
  $display->hide_title = PANELS_TITLE_FIXED;
  $display->title_pane = '0';
  $handler->conf['display'] = $display;
  $export['term_view__panel_context_87916a7c-c92c-4818-a626-a9f865d52863'] = $handler;

  return $export;
}
