<?php

/**
 * @file
 * Contains \HedleyMigrateUserTypes.
 */

/**
 * Class HedleyMigrateUserTypes.
 */
class HedleyMigrateUserTypes extends HedleyMigrateBase {

  protected $entityType = 'taxonomy_term';
  protected $bundle = 'user_types';
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
