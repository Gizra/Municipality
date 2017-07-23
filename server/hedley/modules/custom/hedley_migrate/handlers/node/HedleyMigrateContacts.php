<?php

/**
 * @file
 * Contains \HedleyMigrateContacts.
 */

/**
 * Class HedleyMigrateContacts.
 */
class HedleyMigrateContacts extends HedleyMigrateBase {

  protected $entityType = 'node';
  protected $bundle = 'contact';
  protected $csvColumns = [
    'id',
    'municipality',
    'field_first_name_ar',
    'field_first_name_en',
    'field_first_name_he',
    'field_last_name_ar',
    'field_last_name_en',
    'field_last_name_he',
    'field_job_title_ar',
    'field_job_title_en',
    'field_job_title_he',
    'field_image',
    'field_email',
    'field_phone',
    'field_fax',
    'field_address',
    'field_topics',
    'field_user_types',
    'field_department',
  ];
  protected $simpleMappings = [
    'field_first_name',
    'field_last_name',
    'field_job_title',
    'field_email',
    'field_phone',
    'field_fax',
    'field_address',
    'field_department',
  ];
  protected $simpleMultipleMappings = [
    'field_user_types',
  ];

  /**
   * HedleyMigrateContacts constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->dependencies[] = 'HedleyMigrateDepartments';
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
