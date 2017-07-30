<?php

/**
 * @file
 * Contains \HedleyMigrateTopics.
 */

/**
 * Class HedleyMigrateTopics.
 */
class HedleyMigrateTopics extends HedleyMigrateBase {

  protected $entityType = 'taxonomy_term';
  protected $bundle = 'topics';
  protected $csvColumns = [
    'id',
    'name_field_ar',
    'name_field_en',
    'name_field_he',
    'field_color',
    'municipality',
    'description_field_en',
    'description_field_he',
    'description_field_ar',
  ];
  protected $simpleMappings = [
    'name_field',
    'description_field',
    'field_color',
    'municipality',
  ];

  /**
   * HedleyMigrateTopics constructor.
   */
  public function __construct($arguments) {
    parent::__construct($arguments);

    $this->dependencies[] = 'HedleyMigrateMunicipalities';
  }

  /**
   * Prepare rows before passing the data to the entity creation.
   *
   * Add the group identifier to the vocabulary name, and set OG-vocab
   * relation to the newly created vocabulary.
   *
   * @param object $row
   *   The row data.
   *
   * @return bool
   *   Success.
   */
  public function prepareRow($row) {
    parent::prepareRow($row);

    $mapped_id = $this->getMappedIds('HedleyMigrateMunicipalities', $row->municipality);

    if (!$mapped_id) {
      return FALSE;
    }

    // Change the bundle to the correct vocabulary ID.
    $this->bundle = 'topics_' . $mapped_id;
    // Create a new destination with the correct vocabulary ID.
    $this->destination = new MigrateDestinationTerm(
      $this->bundle,
      [
        'text_format' => 'plain_text',
        'entity_type' => 'taxonomy_term',
      ]
    );
    return TRUE;
  }

  /**
   * Helper method to retrieve mapped ids.
   *
   * @param string $source
   *   Migration Source (used to map source to destination).
   * @param string $row_field
   *   The field in our row to extract.
   *
   * @return array
   *   An array with destid1 and/or destid2.
   */
  protected function getMappedIds($source, $row_field) {
    return $this->handleSourceMigration($source, $row_field, NULL, $this);
  }

}
