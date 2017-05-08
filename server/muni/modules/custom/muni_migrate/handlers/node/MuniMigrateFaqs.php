<?php

/**
 * @file
 * Contains \MuniMigrateFaqs.
 */

/**
 * Class MuniMigrateFaqs.
 */
class MuniMigrateFaqs extends MuniMigrateBase {

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
    'field_profile_types',
  ];
  protected $simpleMappings = [
    'field_question',
    'field_answer',
  ];
  protected $simpleMultipleMappings = [
    'field_topics',
    'field_profile_types',
  ];

  /**
   * MuniMigrateFaqs constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->dependencies[] = 'MuniMigrateMunicipalities';
    $this->dependencies[] = 'MuniMigrateProfileTypes';
    $this->dependencies[] = 'MuniMigrateTopics';

    $this
      ->addFieldMapping(OG_AUDIENCE_FIELD, 'municipality')
      ->sourceMigration('MuniMigrateMunicipalities');
  }

}
