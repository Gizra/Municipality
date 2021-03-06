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
    'body_ar',
    'body_en',
    'body_he',
    'field_topics',
    'field_user_types',
    'field_image',
    'field_expiration_date',
  ];
  protected $simpleMappings = [
    'title_field',
    'body',
    'field_expiration_date',
  ];
  protected $simpleMultipleMappings = [
    'field_user_types',
  ];

  /**
   * HedleyMigrateNews constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->dependencies[] = 'HedleyMigrateMunicipalities';
    $this->dependencies[] = 'HedleyMigrateTopics';
    $this->dependencies[] = 'HedleyMigrateUserTypes';

    $this
      ->addFieldMapping(OG_AUDIENCE_FIELD, 'municipality')
      ->sourceMigration('HedleyMigrateMunicipalities');

    $this
      ->addFieldMapping(OG_VOCAB_FIELD, 'field_topics')
      ->separator('|')
      ->sourceMigration('HedleyMigrateTopics');
  }

}
