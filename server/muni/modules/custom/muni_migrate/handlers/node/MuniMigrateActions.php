<?php

/**
 * @file
 * Contains \MuniMigrateActions.
 */

/**
 * Class MuniMigrateActions.
 */
class MuniMigrateActions extends MuniMigrateBase {

  protected $entityType = 'node';
  protected $bundle = 'action';
  protected $csvColumns = [
    'id',
    'municipality',
    'title_field_ar',
    'title_field_en',
    'title_field_he',
    'field_topics',
    'field_profile_types',
    'field_link',
  ];
  protected $simpleMappings = [
    'title_field',
    'field_link',
  ];
  protected $simpleMultipleMappings = [
    'field_topics',
    'field_profile_types',
  ];

  /**
   * MuniMigrateFaqs constructor.
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
