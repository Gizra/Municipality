<?php

/**
 * @file
 * Contains \HedleyMigrateAudiences.
 */

/**
 * Class HedleyMigrateAudiences.
 */
class HedleyMigrateAudiences extends HedleyMigrateBase {

  protected $entityType = 'taxonomy_term';
  protected $bundle = 'audiences';
  protected $csvColumns = [
    'id',
    'name',
  ];
  protected $simpleMappings = [
    'name',
  ];

}
