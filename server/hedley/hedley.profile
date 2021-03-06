<?php
/**
 * @file
 * Hedley profile.
 */

/**
 * Implements hook_form_FORM_ID_alter().
 *
 * Allows the profile to alter the site configuration form.
 */
function hedley_form_install_configure_form_alter(&$form, $form_state) {
  // Pre-populate the site name with the server name.
  $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
}

/**
 * Implements hook_install_tasks().
 */
function hedley_install_tasks() {
  $tasks = array();

  $tasks['hedley_setup_variables'] = array(
    'display_name' => st('Set Variables'),
    'display' => FALSE,
  );

  // Run this as the last task!
  $tasks['hedley_setup_rebuild_permissions'] = array(
    'display_name' => st('Rebuild permissions'),
    'display' => FALSE,
  );

  $tasks['hedley_setup_og_permissions'] = array(
    'display_name' => st('Set OG permissions'),
    'display' => FALSE,
  );

  return $tasks;
}

/**
 * Task callback; Set variables.
 */
function hedley_setup_variables() {
  $variables = array(
    // Features default export path.
    'features_default_export_path' => 'profiles/hedley/modules/custom',
    // Mime-mail.
    'mimemail_format' => 'full_html',
    'mimemail_sitestyle' => FALSE,
    'mimemail_name' => 'Hedley',
    'mimemail_mail' => 'info@hedley.com',
    // jQuery versions.
    'jquery_update_jquery_version' => '1.10',
    'jquery_update_jquery_admin_version' => '1.5',
    // Enable restful files upload.
    'restful_file_upload' => 1,
    // Files settings.
    'file_default_scheme' => 'public',
  );

  foreach ($variables as $key => $value) {
    variable_set($key, $value);
  }
}

/**
 * Task callback; Setup blocks.
 */
function hedley_setup_blocks() {
  $default_theme = variable_get('theme_default', 'bartik');

  $blocks = array(
    array(
      'module' => 'system',
      'delta' => 'user-menu',
      'theme' => $default_theme,
      'status' => 1,
      'weight' => 0,
      'region' => 'header',
      'pages' => '',
      'title' => '<none>',
      'cache' => DRUPAL_NO_CACHE,
    ),
  );

  drupal_static_reset();
  _block_rehash($default_theme);
  foreach ($blocks as $record) {
    $module = array_shift($record);
    $delta = array_shift($record);
    $theme = array_shift($record);
    db_update('block')
      ->fields($record)
      ->condition('module', $module)
      ->condition('delta', $delta)
      ->condition('theme', $theme)
      ->execute();
  }
}

/**
 * Task callback; Rebuild permissions (node access).
 *
 * Setting up the platform triggers the need to rebuild the permissions.
 * We do this here so no manual rebuild is necessary when we finished the
 * installation.
 */
function hedley_setup_rebuild_permissions() {
  node_access_rebuild();
}

/**
 * Task callback; Setup OG permissions.
 *
 * We do this here, late enough to make sure all group-content were
 * created.
 */
function hedley_setup_og_permissions() {
  // Create a default role for content editor, with all the permissions needed.
  $og_editor = og_role_create('editor', 'node', 0, 'municipality');
  og_role_save($og_editor);

  $og_roles = og_roles('node', 'municipality');
  $rid = array_search('editor', $og_roles);

  $permissions = [
    'update group' => TRUE,
    'administer nodes' => TRUE,
    'administer taxonomy' => TRUE,
    'delete terms' => TRUE,
    'edit terms' => TRUE,
  ];
  // Get all group content bundles and unset the ones that an editor should not
  // manage.
  $types = og_get_all_group_content_bundle();
  unset($types['node']['hardcopy_form']);
  foreach (array_keys($types['node']) as $type) {
    $permissions["create $type content"] = TRUE;
    $permissions["update own $type content"] = TRUE;
    $permissions["update any $type content"] = TRUE;
    $permissions["delete own $type content"] = TRUE;
    $permissions["delete any $type content"] = TRUE;
  }
  og_role_change_permissions($rid, $permissions);
}
