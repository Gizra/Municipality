<?php

/**
 * @file
 * OG context CTools access plugin.
 */

/**
 * Plugin definition
 */
$plugin = [
  'title' => t('OG context'),
  'description' => t('Determine if OG context exists.'),
  'callback' => 'hedley_municipality_og_context__access_check',
];

/**
 * Check for access.
 */
function hedley_municipality_og_context__access_check($conf, $context) {
  return (bool)hedley_municipality_get_current_group();
}

