<?php
/**
 * @file
 * hedley_municipality.features.og_features_role.inc
 */

/**
 * Implements hook_og_features_default_roles().
 */
function hedley_municipality_og_features_default_roles() {
  $roles = array();

  // Exported OG Role: 'node:municipality:Admin'.
  $roles['node:municipality:Admin'] = array(
    'gid' => 0,
    'group_type' => 'node',
    'group_bundle' => 'municipality',
    'name' => 'Admin',
  );

  // Exported OG Role: 'node:municipality:Editor'.
  $roles['node:municipality:Editor'] = array(
    'gid' => 0,
    'group_type' => 'node',
    'group_bundle' => 'municipality',
    'name' => 'Editor',
  );

  return $roles;
}
