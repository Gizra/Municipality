<?php
/**
 * @file
 * hedley_topic.features.taxonomy.inc
 */

/**
 * Implements hook_taxonomy_default_vocabularies().
 */
function hedley_topic_taxonomy_default_vocabularies() {
  return array(
    'topics' => array(
      'name' => 'Topics',
      'machine_name' => 'topics',
      'description' => '',
      'hierarchy' => 0,
      'module' => 'taxonomy',
      'weight' => 0,
      'language' => 'und',
      'i18n_mode' => 32768,
    ),
  );
}
