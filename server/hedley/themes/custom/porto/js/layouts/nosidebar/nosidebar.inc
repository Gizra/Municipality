<?php

/**
 * implementation of hook_panels_layouts()
 */
// Plugin definition
$plugin = array(
  'title' => t('No Sidebar'),
  'category' => t('Porto'),
  'icon' => 'nosidebar.png',
  'theme' => 'panels_nosidebar',
  'css' => 'nosidebar.css',
  'regions' => array( 'before_content' => t('Before Content'), 'content' => t('Content'), 'after_content' => t('After Content') ),
);
