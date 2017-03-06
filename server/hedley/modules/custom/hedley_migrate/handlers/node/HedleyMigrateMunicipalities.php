<?php

/**
 * @file
 * Contains \HedleyMigrateMunicipalities.
 */

/**
 * Class HedleyMigrateMunicipalities.
 */
class HedleyMigrateMunicipalities extends HedleyMigrateBase {

  protected $entityType = 'node';

  protected $bundle = 'municipality';

  protected $csvColumns = [
    'title',
  ];

  protected $simpleMappings = [
    'title',
  ];

}