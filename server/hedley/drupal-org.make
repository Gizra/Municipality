core = 7.x
api = 2

; Modules
projects[admin_menu][subdir] = "contrib"
projects[admin_menu][version] = "3.x-dev"
projects[admin_menu][download][url] = "git://git.drupal.org/project/admin_menu.git"
projects[admin_menu][download][revision] = "67abd3a2e42c28167551b5d0e753ca322bc592ce"
; Fix notice, https://www.drupal.org/node/2502695
projects[admin_menu][patch][] = "https://www.drupal.org/files/issues/admin_menu-issetmapfix-2502695-3.patch"

projects[admin_views][subdir] = "contrib"
projects[admin_views][version] = "1.6"

projects[auto_entitylabel][subdir] = "contrib"
projects[auto_entitylabel][version] = "1.4"

projects[ckeditor][subdir] = "contrib"
projects[ckeditor][version] = "1.18"

projects[coffee][subdir] = "contrib"
projects[coffee][version] = "2.3"

projects[ctools][subdir] = "contrib"
projects[ctools][version] = "1.12"
projects[ctools][patch][] = "https://www.drupal.org/files/issues/2067997-reload-plugins-class-7.patch"

projects[composer_manager][subdir] = "contrib"
projects[composer_manager][version] = "1.8"

projects[date][subdir] = "contrib"
projects[date][version] = "2.10"
; Fix notice in php7, https://www.drupal.org/node/2843367
projects[date][patch][] = "https://www.drupal.org/files/issues/2843367-php71-string-offset-26.patch"

projects[diff][subdir] = "contrib"
projects[diff][version] = "3.3"

projects[email][subdir] = "contrib"
projects[email][version] = "1.3"

projects[entity][subdir] = "contrib"
projects[entity][version] = "1.8"
projects[entity][patch][] = "https://www.drupal.org/files/issues/2086225-entity-access-check-node-create-3.patch"

projects[entitycache][subdir] = "contrib"
projects[entitycache][version] = "1.2"

projects[entityreference][subdir] = "contrib"
projects[entityreference][version] = "1.5"

projects[entity_translation][subdir] = "contrib"
projects[entity_translation][version] = "1.0-beta7"

projects[entity_validator][subdir] = "contrib"
projects[entity_validator][version] = "1.2"

projects[facetapi][subdir] = "contrib"
projects[facetapi][version] = "1.5"

projects[features][subdir] = "contrib"
projects[features][version] = "2.10"

projects[i18n][subdir] = "contrib"
projects[i18n][version] = "1.18"

projects[imce][subdir] = "contrib"
projects[imce][version] = "1.11"

projects[jquery_update][subdir] = "contrib"
projects[jquery_update][version] = "2.7"

projects[libraries][subdir] = "contrib"
projects[libraries][version] = "2.3"

projects[link][subdir] = "contrib"
projects[link][version] = "1.4"

projects[mailsystem][subdir] = "contrib"
projects[mailsystem][version] = "2.34"

projects[message][subdir] = "contrib"
projects[message][version] = "1.12"

projects[message_notify][subdir] = "contrib"
projects[message_notify][version] = "2.5"

projects[mimemail][subdir] = "contrib"
projects[mimemail][version] = "1.0-beta3"

projects[module_filter][subdir] = "contrib"
projects[module_filter][version] = "2.1"

projects[multifield][subdir] = "contrib"
projects[multifield][version] = "1.0-alpha4"
projects[multifield][patch][] = "https://www.drupal.org/files/issues/2041531-23-entity-api-support.patch"

projects[og][subdir] = "contrib"
projects[og][version] = "2.9"

projects[og_purl][subdir] = "contrib"
projects[og_purl][version] = "1.2"

projects[og_vocab][subdir] = "contrib"
projects[og_vocab][version] = "1.2"

projects[panels][subdir] = "contrib"
projects[panels][version] = "3.9"

projects[purl][subdir] = "contrib"
projects[purl][version] = "1.0-beta1"

projects[restful][subdir] = "contrib"
projects[restful][version] = "1.8"

projects[search_api][subdir] = "contrib"
projects[search_api][version] = "1.12"

projects[search_api_solr][subdir] = "contrib"
projects[search_api_solr][version] = "1.5"

projects[strongarm][subdir] = "contrib"
projects[strongarm][version] = "2.0"

projects[title][subdir] = "contrib"
projects[title][version] = "1.0-alpha9"

projects[token][subdir] = "contrib"
projects[token][version] = "1.7"

projects[variable][subdir] = "contrib"
projects[variable][version] = "2.5"

projects[views][subdir] = "contrib"
projects[views][version] = "3.18"

projects[views_bulk_operations][subdir] = "contrib"
projects[views_bulk_operations][version] = "3.4"

; Development
projects[devel][subdir] = "development"
projects[devel][version] = "1.5"

projects[migrate][subdir] = "development"
projects[migrate][version] = "2.8"

projects[migrate_extras][subdir] = "development"
projects[migrate_extras][version] = "2.5"
