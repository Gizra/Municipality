<?php


/**
 * Plugin definition
 */
$plugin = array(
  'title' => t('OG context'),
  'description' => t('Determine if OG context exists.'),
  'callback' => 'hedley_municipality_og_context__access_check',
);


/**
 * Check for access.
 */
function hedley_municipality_og_context__access_check($conf, $context) {
  return (bool)og_context();
}

