<?php

/**
 * @file
 * Contains \HedleyMigrateReceptionHours.
 */

/**
 * Class HedleyMigrateReceptionHours.
 */
class HedleyMigrateReceptionHours extends HedleyMigrateBase {

  protected $dependencies = ['HedleyMigrateContacts'];
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
   * HedleyMigrateReceptionHours constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->addFieldMapping('host', 'host')
      ->sourceMigration('HedleyMigrateContacts');
  }

}
