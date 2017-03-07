<?php

/**
 * @file
 * Contains \HedleyMigrateNews.
 */

/**
 * Class HedleyMigrateNews.
 */
class HedleyMigrateNews extends HedleyMigrateBase {

  protected $entityType = 'node';
  protected $bundle = 'news';
  protected $csvColumns = [
    'id',
    'municipality',
    'title',
    'field_subtitle',
    'body',
    'field_topics',
    'profile_types',
    'field_image',
  ];
  protected $simpleMappings = [
    'title',
    'field_subtitle',
    'body',
  ];

  /**
   * HedleyMigrateNews constructor.
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
