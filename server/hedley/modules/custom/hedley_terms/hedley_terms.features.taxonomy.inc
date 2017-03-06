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
    'profile_types' => array(
      'name' => 'Profile types',
      'machine_name' => 'profile_types',
      'description' => '',
      'hierarchy' => 0,
      'module' => 'taxonomy',
      'weight' => 0,
    ),
  );
}
