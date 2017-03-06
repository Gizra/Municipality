<?php

/**
 * @file
 * Contains \HedleyMigrateItems.
 */

/**
 * Class HedleyMigrateItems.
 */
class HedleyMigrateItems extends HedleyMigrateNodes {

  protected $bundle = 'item';

  protected $csvColumns = [
    'title',
    'field_image',
  ];

  protected $simpleMappings = [
    'title',
  ];

  /**
   * {@inheritdoc}
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->addFieldMapping('field_image', 'field_image');
    $this->addFieldMapping('field_image:file_replace')
      ->defaultValue(FILE_EXISTS_REPLACE);

    $this->addFieldMapping('field_image:source_dir')
      ->defaultValue($this->getMigrateDirectory() . '/images/');
  }

}
