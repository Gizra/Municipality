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
  // Add the language switch links.
  $variables['language_switch_links'] = hedley_i18n_language_switch_links();

  // Add user type links.
  $variables['user_type_links'] = hedley_terms_get_user_type_links();

  // Add municipality variables.
  if (!$node = hedley_municipality_get_current_group()) {
    return;
  }
  $wrapper = entity_metadata_wrapper('node', $node);

  // Override the site name with the municipality's name.
  $variables['site_name'] = $wrapper->label();
  // Replace the default logo with the municipality's logo.
  if ($wrapper->field_logo->value()) {
    $variables['logo'] = image_style_url('thumbnail', $wrapper->field_logo->value()['uri']);
  }
  // Add the municipality's social links for the header.
  if ($wrapper->field_social_links->value()) {
    $variables['social_links'] = field_view_field('node', $node, 'field_social_links');
  }
  // Accessibility page link.
  if ($wrapper->field_accessibility_page->value()) {
    $variables['accessibility_url'] = url('node/' . $wrapper->field_accessibility_page->getIdentifier());
  }
  // Terms page link.
  if ($wrapper->field_terms_page->value()) {
    $variables['terms_url'] = url('node/' . $wrapper->field_terms_page->getIdentifier());
  }
  // Last updated date.
  $variables['last_updated'] = format_date($wrapper->field_last_update->value(), 'short');
  // Footer text.
  $variables['footer_text'] = $wrapper->field_footer_text->value() ? $wrapper->field_footer_text->value->value() : NULL;
  // Get first background image.
  if ($wrapper->field_background_images->value()) {
    $background_image = $wrapper->field_background_images->get(0)->value();
    $variables['background_image_url'] = file_create_url($background_image['uri']);
  }
}

/**
 * Get a small number as a word, for semantic ui list classes.
 *
 * @param $number
 *   A number between 0 and 9.
 *
 * @return string
 *   The number as a word.
 */
function hedley_theme_number_as_word($number) {
  $numbers = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];
  return $numbers[$number];
}
