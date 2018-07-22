<?php

/**
 * @file
 * Restful plugin.
 */

$plugin = array(
  'label' => t('Search'),
  'resource' => 'search',
  'name' => 'search',
  'entity_type' => 'node',
  'description' => t('Search endpoint for municipality content.'),
  'class' => 'HedleyRestfulSearch',
  'authentication_types' => TRUE,
);