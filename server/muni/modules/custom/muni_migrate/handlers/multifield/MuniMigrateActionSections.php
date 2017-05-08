<?php

/**
 * @file
 * Contains \MuniMigrateActionSections.
 */

/**
 * Class MuniMigrateActionSections.
 */
class MuniMigrateActionSections extends MuniMigrateBase {

  protected $dependencies = ['MuniMigrateActions'];
  protected $entityType = 'multifield';
  protected $bundle = 'field_action_sections';
  protected $csvColumns = [
    'id',
    'host',
    'language',
    'field_section_title',
    'field_section_icon',
    'field_section_description',
  ];
  protected $simpleMappings = [
    'language',
    'field_section_title',
    'field_section_icon',
    'field_section_description',
  ];

  /**
   * MuniMigrateActionSections constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    // 'host' is the node on which the multifield will be added.
    $this->addFieldMapping('host', 'host')
      ->sourceMigration('MuniMigrateActions');
  }

}
