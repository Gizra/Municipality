<?php

/**
 * @file
 * Contains \MuniMigrateAudiences.
 */

/**
 * Class MuniMigrateAudiences.
 */
class MuniMigrateAudiences extends MuniMigrateBase {

  protected $entityType = 'taxonomy_term';
  protected $bundle = 'audiences';
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
