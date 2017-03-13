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

/**
 * Theme override.
 *
 * Remove the default panel separators.
 */
function hedley_theme_panels_default_style_render_region($variables) {
  return implode('', $variables['panes']);
}

/**
 * Preprocess page.
 */
function hedley_theme_preprocess_page(&$variables) {
  if (!$node = hedley_municipality_get_current()) {
    return;
  }
  $wrapper = entity_metadata_wrapper('node', $node);

  // Override the site name with the municipality's name.
  $variables['site_name'] = $wrapper->label();

  // Replace the default logo with the municipality's logo.
  if ($wrapper->field_logo->value()) {
    $variables['logo'] = image_style_url('thumbnail', $wrapper->field_logo->value()['uri']);
  }

  dpm($variables);
}
