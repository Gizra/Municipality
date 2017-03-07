<?php

/**
 * @file
 * Contains \HedleyMigrateItems.
 */

/**
 * Class HedleyMigrateItems.
 */
class HedleyMigrateItems extends HedleyMigrateBase {

  protected $entityType = 'node';
  protected $bundle = 'item';
  protected $csvColumns = [
    'id',
    'title',
    'field_image',
  ];
  protected $simpleMappings = [
    'title',
  ];

}
