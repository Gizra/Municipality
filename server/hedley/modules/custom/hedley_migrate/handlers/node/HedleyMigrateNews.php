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
    'title_field_ar',
    'title_field_en',
    'title_field_he',
    'field_subtitle_ar',
    'field_subtitle_en',
    'field_subtitle_he',
    'body_ar',
    'body_en',
    'body_he',
    'field_topics',
    'field_profile_types',
    'field_image',
  ];
  protected $simpleMappings = [
    'title_field',
    'field_subtitle',
    'body',
  ];
  protected $simpleMultipleMappings = [
    'field_topics',
    'field_profile_types',
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
  }

}
