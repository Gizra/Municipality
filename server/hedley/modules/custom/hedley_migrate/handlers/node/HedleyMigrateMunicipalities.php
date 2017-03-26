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
    'field_social_links',
    'field_social_links:title',
    'field_social_links:attributes',
    'field_default_language',
  ];
  protected $simpleMappings = [
    'title_field',
    'field_default_language',
  ];
  protected $simpleMultipleMappings = [
    'field_social_links',
    'field_social_links:title',
    'field_social_links:attributes',
  ];

}
