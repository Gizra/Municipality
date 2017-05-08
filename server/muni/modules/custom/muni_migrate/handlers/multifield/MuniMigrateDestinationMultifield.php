<?php

/**
 * @file
 * Contains \MuniMigrateDestinationMultifield.
 */

/**
 * Class MuniMigrateDestinationMultifield.
 */
class MuniMigrateDestinationMultifield extends MigrateDestination {

  private $bundle;

  /**
   * The key schema.
   */
  public static function getKeySchema() {
    return [
      'id' => [
        'type' => 'int',
        'unsigned' => TRUE,
      ],
    ];
  }

  /**
   * MuniMigrateDestinationMultifield constructor.
   */
  public function __construct($bundle) {
    $this->bundle = $bundle;
  }

  /**
   * The destination being migrated into as a string.
   */
  public function __toString() {
    return 'multifield';
  }

  /**
   * List of available destination fields.
   */
  public function fields() {
    return [];
  }

  /**
   * Rollback an imported multifield.
   */
  public function rollback($values) {
    $multifield_id = $values['destid1'];
    $multifield_name = $this->bundle;

    foreach (['field_data', 'field_revision'] as $field_type) {
      db_delete($field_type . '_' . $multifield_name)
        ->condition($multifield_name . '_id', $multifield_id)
        ->execute();
    }
  }

  /**
   * Import multifield.
   *
   * Currently it's assumed that the multifield is hosted on a node, and that
   * the field type is either from drupal core, or entityreference.
   */
  public function import(stdClass $object, stdClass $row) {
    // Require an host node mapping.
    if (empty($object->host)) {
      throw new Exception(format_string('Missing host for row @id.', ['@id' => $row->id]));
    }

    $node = node_load($object->host);
    unset($object->host);

    // Extract language.
    $multifield_language = LANGUAGE_NONE;
    if (!empty($object->language)) {
      $multifield_language = $object->language;
      unset($object->language);
    }

    $multifield_name = $this->bundle;

    // Add the custom multifield fields from the migration mapping.
    $multifield_columns = [];
    foreach ($object as $field => $value) {
      $column = 'value';

      // Set the value column according to the field type.
      switch (field_info_field($field)['type']) {
        case 'taxonomy_term_reference':
          $column = 'tid';
          break;

        case 'entityreference':
          $column = 'target_id';
          break;

        case 'datestamp':
          // Convert date string to timestamp.
          $date = new DateObject($value);
          $value = $date->getTimestamp();
          break;
      }

      // Extract reference destination value.
      if (!empty($value['destid1'])) {
        $value = $value['destid1'];
      }

      // Convert empty strings to NULLs, to allow empty numeric values.
      if ($value === '') {
        $value = NULL;
      }

      $multifield_columns[$multifield_name . '_' . $field . '_' . $column] = $value;
    }

    if (isset($row->migrate_map_destid1)) {
      // Updating a previously migrated multifield.
      $multifield_id = $row->migrate_map_destid1;

      db_update('field_data_' . $multifield_name)
        ->fields($multifield_columns)
        ->condition($multifield_name . '_id', $multifield_id)
        ->execute();

      $this->numUpdated++;

    }
    // Creating a new multifield.
    else {
      // Determine the multifield delta.
      $delta = !empty($node->{$multifield_name}[$multifield_language]) ? max(array_keys($node->{$multifield_name}[$multifield_language])) + 1 : 0;
      $multifield_id = multifield_get_next_id();

      // Common multifield columns.
      $multifield_base = [
        'entity_type' => 'node',
        'bundle' => $node->type,
        'deleted' => 0,
        'entity_id' => $node->nid,
        'revision_id' => $node->nid,
        'language' => $multifield_language,
        'delta' => $delta,
        $multifield_name . '_id' => $multifield_id,
      ];

      // Add the new multifield to the node.
      foreach (['field_data', 'field_revision'] as $field_type) {
        db_insert($field_type . '_' . $multifield_name)
          ->fields($multifield_base + $multifield_columns)
          ->execute();
      }

      variable_set('multifield_max_id', $multifield_id);

      $this->numCreated++;
    }

    // Clear the field cache for the current node.
    entity_get_controller('node')->resetCache([$node->nid]);
    cache_clear_all('field:node:' . $node->nid, 'cache_field');

    return [$multifield_id];
  }

}
