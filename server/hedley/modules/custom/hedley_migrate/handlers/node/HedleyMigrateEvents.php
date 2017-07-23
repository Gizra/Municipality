<?php

/**
 * @file
 * Contains \HedleyMigrateEvents.
 */

/**
 * Class HedleyMigrateEvents.
 */
class HedleyMigrateEvents extends HedleyMigrateBase {

  protected $entityType = 'node';
  protected $bundle = 'event';
  protected $csvColumns = [
    'id',
    'municipality',
    'title_field_ar',
    'title_field_en',
    'title_field_he',
    'body_ar',
    'body_en',
    'body_he',
    'field_image',
    'field_topics',
    'field_recurring_weekly',
    'field_audience',
    'field_date',
    'field_date:to',
    'field_ticket_price',
    'field_topics',
    'field_user_types',
    'field_location',
    'field_location:title',
  ];
  protected $simpleMappings = [
    'title_field',
    'body',
    'field_recurring_weekly',
    'field_audience',
    'field_date',
    'field_date:to',
    'field_ticket_price',
    'field_location',
    'field_location:title',
  ];
  protected $simpleMultipleMappings = [
    'field_user_types',
  ];

  /**
   * HedleyMigrateEvents constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->dependencies[] = 'HedleyMigrateAudiences';
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
