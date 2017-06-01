<?php

/**
 * @file
 * Contains \HedleyMigrateAudiences.
 */

/**
 * Class HedleyMigrateAudiences.
 */
class HedleyMigrateAudiences extends HedleyMigrateBase {

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

  /**
   * HedleyMigrateAudiences constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->dependencies[] = 'HedleyMigrateMunicipalities';

    $this
      ->addFieldMapping(OG_AUDIENCE_FIELD, 'municipality')
      ->sourceMigration('HedleyMigrateMunicipalities');
  }

}
