<?php

/**
 * @file
 * Contains \HedleyMigrateTopics.
 */

/**
 * Class HedleyMigrateTopics.
 */
class HedleyMigrateTopics extends HedleyMigrateBase {

  protected $entityType = 'taxonomy_term';
  protected $bundle = 'topics';
  protected $csvColumns = [
    'id',
    'name_field_ar',
    'name_field_en',
    'name_field_he',
  ];
  protected $simpleMappings = [
    'name_field',
  ];

}
