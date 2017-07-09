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
    'field_default_language',
    'field_footer_text',
    'field_background_images',
    'field_user_types',
  ];
  protected $simpleMappings = [
    'title_field',
    'field_default_language',
    'field_footer_text',
  ];
  protected $simpleMultipleMappings = [
    'field_user_types',
    'field_social_links',
    'field_social_links:title',
  ];

  /**
   * HedleyMigrateMunicipalities constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->dependencies[] = 'HedleyMigrateUserTypes';

    $this
      ->addFieldMapping('field_background_images', 'field_background_images')
      ->separator('|');
    $this
      ->addFieldMapping('field_background_images:file_replace')
      ->defaultValue(FILE_EXISTS_REPLACE);

    $this
      ->addFieldMapping('field_background_images:source_dir')
      ->defaultValue($this->getMigrateDirectory() . '/files/');
  }

}
