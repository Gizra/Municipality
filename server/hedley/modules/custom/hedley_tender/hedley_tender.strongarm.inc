<?php
/**
 * @file
 * hedley_tender.strongarm.inc
 */

/**
 * Implements hook_strongarm().
 */
function hedley_tender_strongarm() {
  $export = array();

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'diff_enable_revisions_page_node_tinder';
  $strongarm->value = 1;
  $export['diff_enable_revisions_page_node_tinder'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'diff_show_preview_changes_node_tinder';
  $strongarm->value = 1;
  $export['diff_show_preview_changes_node_tinder'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'diff_view_mode_preview_node_tinder';
  $strongarm->value = 'full';
  $export['diff_view_mode_preview_node_tinder'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'language_content_type_tinder';
  $strongarm->value = '0';
  $export['language_content_type_tinder'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'menu_options_tinder';
  $strongarm->value = array(
    0 => 'main-menu',
  );
  $export['menu_options_tinder'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'menu_parent_tinder';
  $strongarm->value = 'main-menu:0';
  $export['menu_parent_tinder'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_options_tinder';
  $strongarm->value = array(
    0 => 'status',
    1 => 'promote',
  );
  $export['node_options_tinder'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_preview_tinder';
  $strongarm->value = '1';
  $export['node_preview_tinder'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_submitted_tinder';
  $strongarm->value = 1;
  $export['node_submitted_tinder'] = $strongarm;

  return $export;
}
