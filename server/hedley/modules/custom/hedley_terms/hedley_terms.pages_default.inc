<?php
/**
 * @file
 * hedley_terms.pages_default.inc
 */

/**
 * Implements hook_default_page_manager_handlers().
 */
function hedley_terms_default_page_manager_handlers() {
  $export = array();

  $handler = new stdClass();
  $handler->disabled = FALSE; /* Edit this to true to make a default handler disabled initially */
  $handler->api_version = 1;
  $handler->name = 'term_view__http_response_ab7f39a7-b1e7-4db3-8feb-625056ab821f';
  $handler->task = 'term_view';
  $handler->subtask = '';
  $handler->handler = 'http_response';
  $handler->weight = 1;
  $handler->conf = array(
    'title' => 'Access denied',
    'contexts' => array(),
    'relationships' => array(),
    'code' => '403',
    'destination' => '',
    'name' => '',
    'access' => array(
      'plugins' => array(
        0 => array(
          'name' => 'og_context',
          'settings' => NULL,
          'not' => TRUE,
        ),
      ),
      'logic' => 'and',
    ),
  );
  $export['term_view__http_response_ab7f39a7-b1e7-4db3-8feb-625056ab821f'] = $handler;

  return $export;
}
