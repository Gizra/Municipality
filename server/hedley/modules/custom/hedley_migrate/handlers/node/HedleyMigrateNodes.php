<?php

/**
 * @file
 * Contains \HedleyMigrateNodes.
 */

/**
 * Class HedleyMigrateNodes.
 */
abstract class HedleyMigrateNodes extends HedleyMigrateBase {

  protected $bundle = NULL;
  protected $entityType = 'node';
  protected $csvColumns = [];
  protected $simpleMappings = [];

  /**
   * {@inheritdoc}
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->dependencies = [
      'HedleyMigrateUsers',
    ];

    $this->description = t('Import @bundle nodes.', ['@bundle' => $this->bundle]);


    $source_file = $this->getMigrateDirectory() . '/csv/' . $this->bundle . '.csv';
    $this->source = new MigrateSourceCSV($source_file, drupal_map_assoc($this->csvColumns), ['header_rows' => 1]);
    $this->destination = new MigrateDestinationNode($this->bundle);

    $key = [
      'title' => [
        'type' => 'varchar',
        'length' => 255,
        'not null' => TRUE,
      ],
    ];
    $this->map = new MigrateSQLMap($this->machineName, $key, MigrateDestinationNode::getKeySchema());

    // Add simple mappings.
    if ($this->simpleMappings) {
      $this->addSimpleMappings(drupal_map_assoc($this->simpleMappings));
    }

    // Set the first user as the author.
    $this->addFieldMapping('uid', 'author')
      ->sourceMigration('HedleyMigrateUsers')
      ->defaultValue(1);
  }
}
