<?php

/**
 * @file
 * Contains \MuniMigrateProfileTypes.
 */

/**
 * Class MuniMigrateProfileTypes.
 */
class MuniMigrateProfileTypes extends MuniMigrateBase {

  protected $entityType = 'taxonomy_term';
  protected $bundle = 'profile_types';
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
