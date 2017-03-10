<?php

/**
 * @file
 * Hedley theme template file.
 */

/**
 * Preprocess node.
 *
 * Add a theme suggestion including the bundle and view mode.
 */
function hedley_theme_preprocess_node(&$variables) {
  $suggestion = 'node__' . $variables['type'] . '__' . $variables['view_mode'];
  // Prepend the template suggestion.
  array_unshift($variables['theme_hook_suggestions'], $suggestion);

  // Allow a custom preprocess function for this bundle and view mode.
  $preprocess_function = 'hedley_theme_preprocess_' . $suggestion;
  if (function_exists($preprocess_function)) {
    $preprocess_function($variables);
  }
}
