<?php

/**
 * @file
 * Contains \MuniMigrateContacts.
 */

/**
 * Class MuniMigrateContacts.
 */
class MuniMigrateContacts extends MuniMigrateBase {

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
    'field_profile_types',
  ];
  protected $simpleMappings = [
    'field_first_name',
    'field_last_name',
    'field_job_title',
    'field_email',
    'field_phone',
    'field_fax',
    'field_address',
  ];
  protected $simpleMultipleMappings = [
    'field_topics',
    'field_profile_types',
  ];

  /**
   * MuniMigrateContacts constructor.
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
