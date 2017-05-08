<?php
/**
 * @file
 * muni_terms.features.taxonomy.inc
 */

/**
 * Implements hook_taxonomy_default_vocabularies().
 */
function muni_terms_taxonomy_default_vocabularies() {
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
    'profile_types' => array(
      'name' => 'Profile types',
      'machine_name' => 'profile_types',
      'description' => '',
      'hierarchy' => 0,
      'module' => 'taxonomy',
      'weight' => 0,
      'language' => 'und',
      'i18n_mode' => 32768,
    ),
  );
}
