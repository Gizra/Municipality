<?php

/**
 * @file
 * Contains \HedleyMigrateFoi.
 */

/**
 * Class HedleyMigrateFoi.
 */
class HedleyMigrateFoi extends HedleyMigrateBase {

  protected $entityType = 'node';
  protected $bundle = 'freedom_of_information';
  protected $csvColumns = [
    'id',
    'municipality',
    'title_field_ar',
    'title_field_en',
    'title_field_he',
    'field_department',
    'field_publish_date',
    'field_file',
    'field_audio',
    'field_alternative_phrases',
    'field_document_type',
  ];
  protected $simpleMappings = [
    'id',
    'municipality',
    'title_field',
    'field_department',
    'field_publish_date',
    'field_document_type',
  ];
  protected $simpleMultipleMappings = [
    'field_alternative_phrases'
  ];

  /**
   * HedleyMigrateFoi constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->dependencies[] = 'HedleyMigrateMunicipalities';
    $this->dependencies[] = 'HedleyMigrateDepartments';

    $this
      ->addFieldMapping(OG_AUDIENCE_FIELD, 'municipality')
      ->sourceMigration('HedleyMigrateMunicipalities');
  }

}
