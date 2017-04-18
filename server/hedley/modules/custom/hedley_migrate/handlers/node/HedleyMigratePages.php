<?php

/**
 * @file
 * Contains \HedleyMigratePages.
 */

/**
 * Class HedleyMigratePages.
 */
class HedleyMigratePages extends HedleyMigrateBase {

  protected $entityType = 'node';
  protected $bundle = 'page';
  protected $csvColumns = [
    'id',
    'municipality',
    'title_field_ar',
    'title_field_en',
    'title_field_he',
    'body_ar',
    'body_en',
    'body_he',
    'field_topics',
    'field_profile_types',
  ];
  protected $simpleMappings = [
    'title_field',
    'body',
  ];
  protected $simpleMultipleMappings = [
    'field_topics',
    'field_profile_types',
  ];

  /**
   * HedleyMigratePages constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->dependencies[] = 'HedleyMigrateMunicipalities';
    $this->dependencies[] = 'HedleyMigrateProfileTypes';
    $this->dependencies[] = 'HedleyMigrateTopics';

    $this
      ->addFieldMapping(OG_AUDIENCE_FIELD, 'municipality')
      ->sourceMigration('HedleyMigrateMunicipalities');
  }

}
