<?php

/**
 * @file
 * Contains \HedleyMigrateTopics.
 */

/**
 * Class HedleyMigrateDepartment.
 */
class HedleyMigrateDepartment extends HedleyMigrateBase {

  protected $entityType = 'taxonomy_term';
  protected $bundle = 'departments';
  protected $csvColumns = [
    'id',
    'name_field_ar',
    'name_field_en',
    'name_field_he',
  ];

}
