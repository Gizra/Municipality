<?php

/**
 * @file
 * Contains \HedleyMigrateFaqs.
 */

/**
 * Class HedleyMigrateFaqs.
 */
class HedleyMigrateFaqs extends HedleyMigrateBase {

  protected $entityType = 'node';
  protected $bundle = 'faq';
  protected $csvColumns = [
    'id',
    OG_AUDIENCE_FIELD,
    'field_question',
    'field_answer',
    'field_topic',
    'field_profile_types',
  ];
  protected $simpleMappings = [
    'field_question',
    'field_answer',
    'field_topic',
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
      ->addFieldMapping(OG_AUDIENCE_FIELD, OG_AUDIENCE_FIELD)
      ->sourceMigration('HedleyMigrateMunicipalities');

    $this
      ->addFieldMapping('field_profile_types', 'field_profile_types')
      ->separator('|');

  }

}
