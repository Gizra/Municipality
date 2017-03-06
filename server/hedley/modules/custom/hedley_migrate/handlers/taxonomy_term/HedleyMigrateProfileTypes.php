<?php

/**
 * @file
 * Contains \HedleyMigrateProfileTypes.
 */

/**
 * Class HedleyMigrateProfileTypes.
 */
class HedleyMigrateProfileTypes extends HedleyMigrateBase {

  protected $entityType = 'taxonomy_term';

  protected $bundle = 'profile_types';

  protected $csvColumns = [
    'name',
  ];

  protected $simpleMappings = [
    'name',
  ];

}