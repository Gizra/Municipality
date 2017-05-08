<?php

/**
 * @file
 * Contains \MuniMigrateHardcopyForms.
 */

/**
 * Class MuniMigrateHardcopyForms.
 */
class MuniMigrateHardcopyForms extends MuniMigrateBase {

  protected $entityType = 'node';
  protected $bundle = 'hardcopy_form';
  protected $csvColumns = [
    'id',
    'municipality',
    'title_field_ar',
    'title_field_en',
    'title_field_he',
    'field_topics',
    'field_profile_types',
    'field_file',
  ];
  protected $simpleMappings = [
    'title_field',
  ];
  protected $simpleMultipleMappings = [
    'field_topics',
    'field_profile_types',
  ];

  /**
   * MuniMigrateHardcopyForms constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->dependencies[] = 'MuniMigrateMunicipalities';
    $this->dependencies[] = 'MuniMigrateProfileTypes';
    $this->dependencies[] = 'MuniMigrateTopics';

    $this
      ->addFieldMapping(OG_AUDIENCE_FIELD, 'municipality')
      ->sourceMigration('MuniMigrateMunicipalities');
  }

}
