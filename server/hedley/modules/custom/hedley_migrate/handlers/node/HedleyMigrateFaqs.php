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
    'field_topics',
    'field_user_types',
  ];
  protected $simpleMappings = [
    'field_question',
    'field_answer',
  ];
  protected $simpleMultipleMappings = [
    'field_user_types',
  ];

  /**
   * HedleyMigrateFaqs constructor.
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
