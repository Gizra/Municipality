<?php

/**
 * @file
 * Contains \HedleyMigrateBase.
 */

/**
 * Class HedleyMigrateBase.
 */
abstract class HedleyMigrateBase extends Migration {

  protected $entityType = NULL;
  protected $bundle = NULL;
  protected $csvColumns = [];
  protected $simpleMappings = [];

  /**
   * Returns the migrate directory.
   *
   * @return string
   *   The migrate directory.
   */
  protected function getMigrateDirectory() {
    return variable_get('hedley_migrate_directory', FALSE) ? variable_get('hedley_migrate_directory') : drupal_get_path('module', 'hedley_migrate');
  }

  /**
   * HedleyMigrateBase constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    // Add default settings, only for nodes and terms.
    if (!in_array($this->entityType, ['node', 'taxonomy_term'])) {
      return;
    }

    $this->description = t('Import @bundle.', ['@bundle' => $this->bundle]);

    $source_file = $this->getMigrateDirectory() . '/csv/' . $this->bundle . '.csv';

    $columns = [];
    foreach ($this->csvColumns as $column_name) {
      $columns[] = [$column_name, $column_name];
    }
    $this->source = new MigrateSourceCSV($source_file, $columns, ['header_rows' => 1]);

    $this->destination = $this->entityType == 'node' ? new MigrateDestinationNode($this->bundle) : new MigrateDestinationTerm($this->bundle);

    // Define key column; Title for nodes, name for terms.
    $key_column = $this->entityType == 'node' ? 'title' : 'name';
    $key = [
      $key_column => [
        'type' => 'varchar',
        'length' => 255,
        'not null' => TRUE,
      ],
    ];

    $this->map = new MigrateSQLMap($this->machineName, $key, $this->destination->getKeySchema($this->entityType));

    // Add simple mappings.
    if ($this->simpleMappings) {
      $this->addSimpleMappings(drupal_map_assoc($this->simpleMappings));
    }

    if ($this->entityType == 'node') {
      // Set the first user as the author.
      $this->dependencies = [
        'HedleyMigrateUsers',
      ];

      $this->addFieldMapping('uid', 'author')
        ->sourceMigration('HedleyMigrateUsers')
        ->defaultValue(1);
    }

  }

}
