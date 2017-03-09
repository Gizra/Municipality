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
    'municipality',
    'field_question_ar',
    'field_question_en',
    'field_question_he',
    'field_answer_ar',
    'field_answer_en',
    'field_answer_he',
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
      ->addFieldMapping(OG_AUDIENCE_FIELD, 'municipality')
      ->sourceMigration('HedleyMigrateMunicipalities');

    $this
      ->addFieldMapping('field_profile_types', 'field_profile_types')
      ->separator('|');

  }

}
