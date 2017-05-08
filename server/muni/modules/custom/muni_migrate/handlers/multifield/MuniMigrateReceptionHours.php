<?php

/**
 * @file
 * Contains \MuniMigrateReceptionHours.
 */

/**
 * Class MuniMigrateReceptionHours.
 */
class MuniMigrateReceptionHours extends MuniMigrateBase {

  protected $dependencies = ['MuniMigrateContacts'];
  protected $entityType = 'multifield';
  protected $bundle = 'field_reception_hours';
  protected $csvColumns = [
    'id',
    'host',
    'field_weekday',
    'field_hours',
  ];
  protected $simpleMappings = [
    'field_weekday',
    'field_hours',
  ];

  /**
   * MuniMigrateReceptionHours constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->addFieldMapping('host', 'host')
      ->sourceMigration('MuniMigrateContacts');
  }

}
