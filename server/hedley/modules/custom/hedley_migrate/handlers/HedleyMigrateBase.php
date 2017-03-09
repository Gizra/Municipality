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
  protected $translatableFields = ['body', 'title_field'];

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

    $destination_classes = [
      'node' => 'MigrateDestinationNode',
      'taxonomy_term' => 'MigrateDestinationTerm',
      'multifield' => 'HedleyMigrateDestinationMultifield',
    ];
    // Add default settings, only for nodes, terms and multifields.
    if (empty($destination_classes[$this->entityType])) {
      return;
    }

    $this->description = t('Import @bundle.', ['@bundle' => $this->bundle]);

    $source_file = $this->getMigrateDirectory() . '/csv/' . $this->bundle . '.csv';

    $columns = [];
    foreach ($this->csvColumns as $column_name) {
      $columns[] = [$column_name, $column_name];
    }
    $this->source = new MigrateSourceCSV($source_file, $columns, ['header_rows' => 1]);

    $destination_class = $destination_classes[$this->entityType];
    $this->destination = new $destination_class($this->bundle);

    $key = [
      'id' => [
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

      // Map translatable fields languages lists.
      foreach ($this->translatableFields as $translated_field) {
        if (in_array($translated_field, $this->simpleMappings)) {
          $this->addFieldMapping($translated_field . ':language', $translated_field . '_languages');
        }
      }

      // Map the translated title field to the default title.
      $default_title_column = 'title_field_' . language_default('language');
      if (in_array($default_title_column, $this->csvColumns)) {
        $this->addFieldMapping('title', $default_title_column);
      }
    }

    // Map image field.
    if (in_array('field_image', $this->csvColumns)) {
      $this->addFieldMapping('field_image', 'field_image');
      $this->addFieldMapping('field_image:file_replace')
        ->defaultValue(FILE_EXISTS_REPLACE);

      $this->addFieldMapping('field_image:source_dir')
        ->defaultValue($this->getMigrateDirectory() . '/images/');
    }

    if (in_array($this->entityType, ['node', 'taxonomy_term'])) {
      // Set the default language as the entity language.
      $this
        ->addFieldMapping('language')
        ->defaultValue(language_default('language'));
    }

  }

  /**
   * Merge translatable fields' columns into arrays.
   */
  public function prepareRow($row) {
    foreach ($this->translatableFields as $translated_field) {
      $this->mergeTranslatedColumns($row, $translated_field);
    }

  }

  /**
   * Merge translated fields columns into arrays.
   *
   * @param object $row
   *   The row being migrated.
   * @param string $field
   *   The translatable field.
   */
  private function mergeTranslatedColumns($row, $field) {
    if (!in_array($field, $this->simpleMappings)) {
      return;
    }

    // Combine the translated columns into this array.
    $row->$field = [];
    $field_languages_column = $field . '_languages';
    // Lists the actual translation languages.
    $row->$field_languages_column = [];

    foreach (array_keys(language_list('language')) as $language) {
      $column = $field . '_' . $language;
      if (empty($row->$column)) {
        // Ignore non translated languages.
        continue;
      }

      $row->{$field}[] = $row->$column;
      $row->{$field_languages_column}[] = $language;
    }

  }

}
