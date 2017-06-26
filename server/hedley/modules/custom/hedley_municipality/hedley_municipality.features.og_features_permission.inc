<?php
/**
 * @file
 * hedley_municipality.features.og_features_permission.inc
 */

/**
 * Implements hook_og_features_default_permissions().
 */
function hedley_municipality_og_features_default_permissions() {
  $permissions = array();

  // Exported og permission: 'node:municipality:add user'
  $permissions['node:municipality:add user'] = array(
    'roles' => array(
      'Admin' => 'Admin',
    ),
  );

  // Exported og permission: 'node:municipality:administer group'
  $permissions['node:municipality:administer group'] = array(
    'roles' => array(
      'Admin' => 'Admin',
    ),
  );

  // Exported og permission: 'node:municipality:administer taxonomy'
  $permissions['node:municipality:administer taxonomy'] = array(
    'roles' => array(
      'Admin' => 'Admin',
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:approve and deny subscription'
  $permissions['node:municipality:approve and deny subscription'] = array(
    'roles' => array(
      'Admin' => 'Admin',
    ),
  );

  // Exported og permission: 'node:municipality:create action content'
  $permissions['node:municipality:create action content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:create contact content'
  $permissions['node:municipality:create contact content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:create event content'
  $permissions['node:municipality:create event content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:create faq content'
  $permissions['node:municipality:create faq content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:create freedom_of_information content'
  $permissions['node:municipality:create freedom_of_information content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:create hardcopy_form content'
  $permissions['node:municipality:create hardcopy_form content'] = array(
    'roles' => array(),
  );

  // Exported og permission: 'node:municipality:create news content'
  $permissions['node:municipality:create news content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:create page content'
  $permissions['node:municipality:create page content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:create tender content'
  $permissions['node:municipality:create tender content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:delete any action content'
  $permissions['node:municipality:delete any action content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:delete any contact content'
  $permissions['node:municipality:delete any contact content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:delete any event content'
  $permissions['node:municipality:delete any event content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:delete any faq content'
  $permissions['node:municipality:delete any faq content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:delete any freedom_of_information content'
  $permissions['node:municipality:delete any freedom_of_information content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:delete any hardcopy_form content'
  $permissions['node:municipality:delete any hardcopy_form content'] = array(
    'roles' => array(),
  );

  // Exported og permission: 'node:municipality:delete any news content'
  $permissions['node:municipality:delete any news content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:delete any page content'
  $permissions['node:municipality:delete any page content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:delete any tender content'
  $permissions['node:municipality:delete any tender content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:delete own action content'
  $permissions['node:municipality:delete own action content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:delete own contact content'
  $permissions['node:municipality:delete own contact content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:delete own event content'
  $permissions['node:municipality:delete own event content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:delete own faq content'
  $permissions['node:municipality:delete own faq content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:delete own freedom_of_information content'
  $permissions['node:municipality:delete own freedom_of_information content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:delete own hardcopy_form content'
  $permissions['node:municipality:delete own hardcopy_form content'] = array(
    'roles' => array(),
  );

  // Exported og permission: 'node:municipality:delete own news content'
  $permissions['node:municipality:delete own news content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:delete own page content'
  $permissions['node:municipality:delete own page content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:delete own tender content'
  $permissions['node:municipality:delete own tender content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:delete terms'
  $permissions['node:municipality:delete terms'] = array(
    'roles' => array(
      'Admin' => 'Admin',
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:edit terms'
  $permissions['node:municipality:edit terms'] = array(
    'roles' => array(
      'Admin' => 'Admin',
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:manage members'
  $permissions['node:municipality:manage members'] = array(
    'roles' => array(
      'Admin' => 'Admin',
    ),
  );

  // Exported og permission: 'node:municipality:manage permissions'
  $permissions['node:municipality:manage permissions'] = array(
    'roles' => array(
      'Admin' => 'Admin',
    ),
  );

  // Exported og permission: 'node:municipality:manage roles'
  $permissions['node:municipality:manage roles'] = array(
    'roles' => array(
      'Admin' => 'Admin',
    ),
  );

  // Exported og permission: 'node:municipality:subscribe'
  $permissions['node:municipality:subscribe'] = array(
    'roles' => array(
      'non-member' => 'non-member',
    ),
  );

  // Exported og permission: 'node:municipality:subscribe without approval'
  $permissions['node:municipality:subscribe without approval'] = array(
    'roles' => array(),
  );

  // Exported og permission: 'node:municipality:unsubscribe'
  $permissions['node:municipality:unsubscribe'] = array(
    'roles' => array(
      'member' => 'member',
    ),
  );

  // Exported og permission: 'node:municipality:update any action content'
  $permissions['node:municipality:update any action content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:update any contact content'
  $permissions['node:municipality:update any contact content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:update any event content'
  $permissions['node:municipality:update any event content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:update any faq content'
  $permissions['node:municipality:update any faq content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:update any freedom_of_information content'
  $permissions['node:municipality:update any freedom_of_information content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:update any hardcopy_form content'
  $permissions['node:municipality:update any hardcopy_form content'] = array(
    'roles' => array(),
  );

  // Exported og permission: 'node:municipality:update any news content'
  $permissions['node:municipality:update any news content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:update any page content'
  $permissions['node:municipality:update any page content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:update any tender content'
  $permissions['node:municipality:update any tender content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:update group'
  $permissions['node:municipality:update group'] = array(
    'roles' => array(
      'Admin' => 'Admin',
    ),
  );

  // Exported og permission: 'node:municipality:update own action content'
  $permissions['node:municipality:update own action content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:update own contact content'
  $permissions['node:municipality:update own contact content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:update own event content'
  $permissions['node:municipality:update own event content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:update own faq content'
  $permissions['node:municipality:update own faq content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:update own freedom_of_information content'
  $permissions['node:municipality:update own freedom_of_information content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:update own hardcopy_form content'
  $permissions['node:municipality:update own hardcopy_form content'] = array(
    'roles' => array(),
  );

  // Exported og permission: 'node:municipality:update own news content'
  $permissions['node:municipality:update own news content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:update own page content'
  $permissions['node:municipality:update own page content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  // Exported og permission: 'node:municipality:update own tender content'
  $permissions['node:municipality:update own tender content'] = array(
    'roles' => array(
      'Editor' => 'Editor',
    ),
  );

  return $permissions;
}
