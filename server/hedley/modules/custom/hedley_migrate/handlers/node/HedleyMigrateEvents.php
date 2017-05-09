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
    'field_profile_types',
  ];
  protected $simpleMappings = [
    'title_field',
    'body',
    'field_recurring_weekly',
    'field_audience',
    'field_date',
    'field_date:to',
    'field_ticket_price',
  ];
  protected $simpleMultipleMappings = [
    'field_topics',
    'field_profile_types',
  ];

  /**
   * HedleyMigrateEvents constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->dependencies[] = 'HedleyMigrateMunicipalities';
    $this->dependencies[] = 'HedleyMigrateAudiences';
    $this->dependencies[] = 'HedleyMigrateProfileTypes';
    $this->dependencies[] = 'HedleyMigrateTopics';

    $this
      ->addFieldMapping(OG_AUDIENCE_FIELD, 'municipality')
      ->sourceMigration('HedleyMigrateMunicipalities');
  }

}