<?php
/**
 * @file
 * hedley_i18n.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function hedley_i18n_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}
