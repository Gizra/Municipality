<?php
/**
 * @file
 * hedley_terms.features.taxonomy.inc
 */

/**
 * Implements hook_taxonomy_default_vocabularies().
 */
function hedley_terms_taxonomy_default_vocabularies() {
  return array(
    'audiences' => array(
      'name' => 'Audiences',
      'machine_name' => 'audiences',
      'description' => '',
      'hierarchy' => 0,
      'module' => 'taxonomy',
      'weight' => 0,
      'language' => 'und',
      'i18n_mode' => 32768,
    ),
    'user_types' => array(
      'name' => 'User types',
      'machine_name' => 'user_types',
      'description' => '',
      'hierarchy' => 0,
      'module' => 'taxonomy',
      'weight' => 0,
      'language' => 'und',
      'i18n_mode' => 32768,
    ),
  );
}
