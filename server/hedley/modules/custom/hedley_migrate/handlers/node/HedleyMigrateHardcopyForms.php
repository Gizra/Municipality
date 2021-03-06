<?php

/**
 * @file
 * Contains \HedleyMigrateHardcopyForms.
 */

/**
 * Class HedleyMigrateHardcopyForms.
 */
class HedleyMigrateHardcopyForms extends HedleyMigrateBase {

  protected $entityType = 'node';
  protected $bundle = 'hardcopy_form';
  protected $csvColumns = [
    'id',
    'municipality',
    'title_field_ar',
    'title_field_en',
    'title_field_he',
    'field_topics',
    'field_user_types',
    'field_file',
  ];
  protected $simpleMappings = [
    'title_field',
  ];
  protected $simpleMultipleMappings = [
    'field_user_types',
  ];

  /**
   * HedleyMigrateHardcopyForms constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->dependencies[] = 'HedleyMigrateMunicipalities';
    $this->dependencies[] = 'HedleyMigrateUserTypes';

    $this
      ->addFieldMapping(OG_AUDIENCE_FIELD, 'municipality')
      ->sourceMigration('HedleyMigrateMunicipalities');
  }

}
