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
    'title_ar',
    'title_en',
    'title_he',
    'field_department',
    'field_publish_date',
    'field_deadline',
    'field_tender_extension',
    'field_tender_requirements',
    'field_tinder_requirement_payment',
  ];
  protected $simpleMappings = [
    'id',
    'municipality',
    'title_ar',
    'title_en',
    'title_he',
    'field_department',
    'field_publish_date',
    'field_deadline',
    'field_tender_extension',
    'field_tender_requirements',
    'field_tinder_requirement_payment',
  ];

  /**
   * HedleyMigrateEvents constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->dependencies[] = 'HedleyMigrateMunicipalities';
    $this->dependencies[] = 'HedleyMigrateDepartments';

    $this
      ->addFieldMapping(OG_AUDIENCE_FIELD, 'municipality')
      ->sourceMigration('HedleyMigrateMunicipalities');

    $this
      ->addFieldMapping('field_department', 'field_department')
      ->sourceMigration('HedleyMigrateDepartments');
  }

}
