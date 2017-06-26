<?php

/**
 * @file
 * Contains \HedleyMigrateUsers.
 */

/**
 * Class HedleyMigrateUsers.
 */
class HedleyMigrateUsers extends HedleyMigrateBase {

  /**
   * {@inheritdoc}
   */
  public function __construct($arguments) {
    parent::__construct($arguments);
    $this->description = t('Import users from the CSV.');

    $this->dependencies[] = 'HedleyMigrateMunicipalities';

    $columns = array(
      ['name', t('Username')],
      ['pass', t('User password')],
      ['email', t('User email')],
      ['role', t('User role')],
      ['municipality', t('User municipality')],
      ['avatar', t('User avatar')],
    );

    $source_file = $this->getMigrateDirectory() . '/csv/user.csv';
    $options = array('header_rows' => 1);
    $this->source = new MigrateSourceCSV($source_file, $columns, $options);

    $this->destination = new MigrateDestinationUser();

    $this->addFieldMapping('name', 'name');
    $this->addFieldMapping('mail', 'email');
    $this->addFieldMapping('pass', 'pass');
    $this->addFieldMapping('roles', 'role');

    $this
      ->addFieldMapping('og_user_node', 'municipality')
      ->sourceMigration('HedleyMigrateMunicipalities');

    $this->addFieldMapping('field_avatar', 'avatar');
    $this->addFieldMapping('field_avatar:file_replace')
      ->defaultValue(FILE_EXISTS_REPLACE);

    $this->addFieldMapping('field_avatar:source_dir')
      ->defaultValue($this->getMigrateDirectory() . '/images/');

    $this->addFieldMapping(('status'))
      ->defaultValue(1);

    $this->map = new MigrateSQLMap($this->machineName,
      array(
        'name' => array(
          'type' => 'varchar',
          'length' => 255,
          'not null' => TRUE,
        ),
      ),
      MigrateDestinationUser::getKeySchema()
    );
  }

  /**
   * Prepare rows before passing the data to the entity creation.
   *
   * Add the role id to the user from the role name and keep the name for the
   * OG role.
   *
   * @param object $row
   *   The row data.
   *
   * @return bool
   *   Success.
   */
  public function prepareRow($row) {
    // User role.
    $role = user_role_load_by_name($row->role);
    if (!$role) {
      return TRUE;
    }

    // Keep the role's name for OG.
    $row->og_role = $row->role;
    $row->role = $role->rid;
    return TRUE;
  }

  /**
   * Grant the appropriate OG roles to each user.
   *
   * @param object $entity
   *   The user entity object that was created.
   * @param object $row
   *   The CSV row we are manipulating.
   */
  public function complete($entity, $row) {
    if (!isset($row->og_role)) {
      // No OG role granted for the user.
      return;
    }

    $user_wrapper = entity_metadata_wrapper('user', $entity);
    $group = reset($user_wrapper->og_user_node->value());
    if (!$group) {
      // No role granting required if the user doesn't have a group.
      return;
    }
    $og_roles = og_roles('node', 'municipality', $group->nid);
    $rid = array_search($row->og_role, $og_roles);
    og_role_grant('node', $group->nid, $user_wrapper->getIdentifier(), $rid);

    // Add active status for migrated members.
    $og_membership = og_get_membership('node', $group->nid, 'user', $entity->uid);
    $og_membership->state = OG_STATE_ACTIVE;
    og_membership_save($og_membership);
  }

}
