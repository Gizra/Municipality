<?php

/**
 * @file
 * Contains \HedleyMigrateMunicipalities.
 */

/**
 * Class HedleyMigrateMunicipalities.
 */
class HedleyMigrateMunicipalities extends HedleyMigrateBase {

  protected $entityType = 'node';
  protected $bundle = 'municipality';
  protected $csvColumns = [
    'id',
    'title_field_ar',
    'title_field_en',
    'title_field_he',
    'field_logo',
  ];
  protected $simpleMappings = [
    'title_field',
    'field_logo',
  ];

}
