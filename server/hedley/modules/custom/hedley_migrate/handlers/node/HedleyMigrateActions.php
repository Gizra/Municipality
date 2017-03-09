<?php

/**
 * @file
 * Contains \HedleyMigrateActions.
 */

/**
 * Class HedleyMigrateActions.
 */
class HedleyMigrateActions extends HedleyMigrateBase {

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

  /**
   * HedleyMigrateFaqs constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->dependencies[] = 'HedleyMigrateMunicipalities';
    $this->dependencies[] = 'HedleyMigrateProfileTypes';
    $this->dependencies[] = 'HedleyMigrateTopics';

    $this
      ->addFieldMapping(OG_AUDIENCE_FIELD, 'municipality')
      ->sourceMigration('HedleyMigrateMunicipalities');

    $this
      ->addFieldMapping('field_topics', 'field_topics')
      ->separator('|');

    $this
      ->addFieldMapping('field_profile_types', 'field_profile_types')
      ->separator('|');

  }

}
