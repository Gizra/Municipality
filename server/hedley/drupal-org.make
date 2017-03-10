core = 7.x
api = 2

; Modules
projects[admin_menu][subdir] = "contrib"
projects[admin_menu][version] = "3.0-rc5"

projects[admin_views][subdir] = "contrib"
projects[admin_views][version] = "1.6"

projects[auto_entitylabel][subdir] = "contrib"
projects[auto_entitylabel][version] = "1.3"

projects[ctools][subdir] = "contrib"
projects[ctools][version] = "1.12"

projects[composer_manager][subdir] = "contrib"
projects[composer_manager][version] = "1.8"

projects[date][subdir] = "contrib"
projects[date][version] = "2.9"

projects[diff][subdir] = "contrib"
projects[diff][version] = "3.2"

projects[email][subdir] = "contrib"
projects[email][version] = "1.3"

projects[entity][subdir] = "contrib"
projects[entity][version] = "1.8"
projects[entity][patch][] = "https://www.drupal.org/files/issues/2086225-entity-access-check-node-create-3.patch"

projects[entitycache][subdir] = "contrib"
projects[entitycache][version] = "1.2"

projects[entityreference][subdir] = "contrib"
projects[entityreference][version] = "1.2"

projects[entity_translation][subdir] = "contrib"
projects[entity_translation][version] = "1.0-beta6"

projects[entity_validator][subdir] = "contrib"
projects[entity_validator][version] = "1.x"

projects[facetapi][subdir] = "contrib"
projects[facetapi][version] = "1.5"

projects[features][subdir] = "contrib"
projects[features][version] = "2.10"

projects[i18n][subdir] = "contrib"
projects[i18n][version] = "1.15"

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
projects[module_filter][version] = "2.0"

projects[multifield][subdir] = "contrib"
projects[multifield][version] = "1.0-alpha4"

projects[og][subdir] = "contrib"
projects[og][version] = "2.9"

projects[restful][subdir] = "contrib"
projects[restful][version] = "1.8"

projects[search_api][subdir] = "contrib"
projects[search_api][version] = "1.12"

projects[search_api_solr][subdir] = "contrib"
projects[search_api_solr][version] = "1.5"

projects[semanticui][subdir] = "contrib"
; Using 1.x-dev due to no stable release.
projects[semanticui][version] = "1.x-dev"
; https://www.drupal.org/node/2859537 .
projects[semanticui][patch][] = "https://www.drupal.org/files/issues/use-semantic-library-as-is-2859537-1.patch"

projects[strongarm][subdir] = "contrib"
projects[strongarm][version] = "2.0"

projects[title][subdir] = "contrib"
projects[title][version] = "1.0-alpha9"

projects[token][subdir] = "contrib"
projects[token][version] = "1.7"

projects[variable][subdir] = "contrib"
projects[variable][version] = "2.5"

projects[views][subdir] = "contrib"
projects[views][version] = "3.15"

projects[views_bulk_operations][subdir] = "contrib"
projects[views_bulk_operations][version] = "3.4"

; Libraries
libraries[semanticui][type] = "libraries"
libraries[semanticui][download][type] = "get"
libraries[semanticui][download][url] = "https://github.com/Semantic-Org/Semantic-UI/archive/master.zip"

; Development
projects[devel][subdir] = "development"
projects[devel][version] = "1.5"

projects[migrate][subdir] = "development"
projects[migrate][version] = "2.8"

projects[migrate_extras][subdir] = "development"
projects[migrate_extras][version] = "2.5"