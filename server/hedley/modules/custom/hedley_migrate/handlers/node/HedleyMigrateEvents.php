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
    'title',
    'body',
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
    'title',
    'body',
    'field_recurring_weekly',
    'field_audience',
    'field_date',
    'field_date:to',
    'field_ticket_price',
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

    $this
      ->addFieldMapping('field_topics', 'field_topics')
      ->separator('|');

    $this
      ->addFieldMapping('field_profile_types', 'field_profile_types')
      ->separator('|');

  }

}
