<?php

/**
 * @file
 * Contains \HedleyMigrateTenders.
 */

/**
 * Class HedleyMigrateTenders.
 */
class HedleyMigrateTenders extends HedleyMigrateBase {

  protected $entityType = 'node';
  protected $bundle = 'tender';
  protected $csvColumns = [
    'id',
    'municipality',
    'title_field_ar',
    'title_field_en',
    'title_field_he',
    'field_department',
    'field_publish_date',
    'field_deadline',
    'field_tender_extension',
    'field_tender_requirements',
    'field_tender_payment',
    'field_files',
  ];
  protected $simpleMappings = [
    'id',
    'municipality',
    'title_field',
    'field_department',
    'field_publish_date',
    'field_deadline',
    'field_tender_extension',
    'field_tender_requirements',
    'field_tender_payment',
  ];

  /**
   * HedleyMigrateTenders constructor.
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
