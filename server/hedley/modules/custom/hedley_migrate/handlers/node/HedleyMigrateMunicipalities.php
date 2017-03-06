<?php

/**
 * @file
 * Contains \HedleyMigrateMunicipalities.
 */

/**
 * Class HedleyMigrateMunicipalities.
 */
class HedleyMigrateMunicipalities extends HedleyMigrateNodes {

  protected $bundle = 'municipality';

  protected $csvColumns = [
    'title',
  ];

  protected $simpleMappings = [
    'title',
  ];
}
