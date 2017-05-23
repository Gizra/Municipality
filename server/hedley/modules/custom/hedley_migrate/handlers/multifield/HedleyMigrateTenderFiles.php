<?php

/**
 * @file
 * Contains \HedleyMigrateTenderFiles.
 */

/**
 * Class HedleyMigrateTenderFiles.
 */
class HedleyMigrateTenderFiles extends HedleyMigrateBase {

  protected $dependencies = ['HedleyMigrateTenders'];
  protected $entityType = 'multifield';
  protected $bundle = 'field_tender_files';
  protected $csvColumns = [
    'id',
    'host',
    'title_field',
    'field_file',
  ];
  protected $simpleMappings = [
    'title_field',
    'field_file',
  ];

  /**
   * HedleyMigrateReceptionHours constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->addFieldMapping('host', 'host')
      ->sourceMigration('HedleyMigrateTenders');
  }

}
