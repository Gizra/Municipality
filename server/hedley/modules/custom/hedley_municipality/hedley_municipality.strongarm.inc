<?php
/**
 * @file
 * hedley_municipality.strongarm.inc
 */

/**
 * Implements hook_strongarm().
 */
function hedley_municipality_strongarm() {
  $export = array();

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'comment_anonymous_municipality';
  $strongarm->value = 0;
  $export['comment_anonymous_municipality'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'comment_default_mode_municipality';
  $strongarm->value = 1;
  $export['comment_default_mode_municipality'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'comment_default_per_page_municipality';
  $strongarm->value = '50';
  $export['comment_default_per_page_municipality'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'comment_form_location_municipality';
  $strongarm->value = 1;
  $export['comment_form_location_municipality'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'comment_municipality';
  $strongarm->value = '2';
  $export['comment_municipality'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'comment_preview_municipality';
  $strongarm->value = '1';
  $export['comment_preview_municipality'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'comment_subject_field_municipality';
  $strongarm->value = 1;
  $export['comment_subject_field_municipality'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'menu_options_municipality';
  $strongarm->value = array(
    0 => 'main-menu',
  );
  $export['menu_options_municipality'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'menu_parent_municipality';
  $strongarm->value = 'main-menu:0';
  $export['menu_parent_municipality'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_options_municipality';
  $strongarm->value = array(
    0 => 'status',
    1 => 'promote',
  );
  $export['node_options_municipality'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_preview_municipality';
  $strongarm->value = '1';
  $export['node_preview_municipality'] = $strongarm;

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'node_submitted_municipality';
  $strongarm->value = 1;
  $export['node_submitted_municipality'] = $strongarm;

  return $export;
}
