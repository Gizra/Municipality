<?php

/**
 * @file
 * Contains \HedleyMigrateDepartments.
 */

/**
 * Class HedleyMigrateDepartments.
 */
class HedleyMigrateDepartments extends HedleyMigrateBase {

  protected $entityType = 'taxonomy_term';
  protected $bundle = 'departments';
  protected $csvColumns = [
    'id',
    'name_field_ar',
    'name_field_en',
    'name_field_he',
    'municipality',
  ];

  /**
   * HedleyMigrateDepartments constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->dependencies[] = 'HedleyMigrateMunicipalities';

    $this
      ->addFieldMapping(OG_AUDIENCE_FIELD, 'municipality')
      ->sourceMigration('HedleyMigrateMunicipalities');
  }

}
