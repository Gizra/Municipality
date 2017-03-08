<?php

/**
 * @file
 * Contains \HedleyMigrateActionSections.
 */

/**
 * Class HedleyMigrateActionSections
 */
class HedleyMigrateActionSections extends HedleyMigrateBase {

  protected $dependencies = ['HedleyMigrateActions'];
  protected $entityType = 'multifield';
  protected $bundle = 'field_action_sections';
  protected $csvColumns = [
    'id',
    'host',
    'field_section_title',
    'field_section_icon',
    'field_section_description',
  ];
  protected $simpleMappings = [
    'field_section_title',
    'field_section_icon',
    'field_section_description',
  ];


  /**
   * HedleyMigrateActionSections constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    // 'host' is the node on which the multifield will be added.
    $this->addFieldMapping('host', 'host')
      ->sourceMigration('HedleyMigrateActions');
  }
}
