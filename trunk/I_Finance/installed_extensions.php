<?php

/* List of installed additional extensions. If extensions are added to the list manually
	make sure they have unique and so far never used extension_ids as a keys,
	and $next_extension_id is also updated. More about format of this file yo will find in 
	FA extension system documentation.
*/

$next_extension_id = 7; // unique id for next installed extension

$installed_extensions = array (
  0 => 
  array (
    'name' => 'Arabic Egypt 8 digits COA - GAAP',
    'package' => 'chart_ar_EG-GAAP',
    'version' => '2.3.11-2',
    'type' => 'chart',
    'active' => false,
    'path' => 'sql',
    'sql' => 'ar_EG-8digits.sql',
  ),
  1 => 
  array (
    'name' => 'Arabic Egypt 8 digits COA - GAAP (English version)',
    'package' => 'chart_ar_EG-english',
    'version' => '2.3.11-2',
    'type' => 'chart',
    'active' => false,
    'path' => 'sql',
    'sql' => 'ar_EG-8digists-eng.sql',
  ),
  2 => 
  array (
    'name' => 'Arabic Egypt COA',
    'package' => 'chart_ar_EG-general',
    'version' => '2.3.5-1',
    'type' => 'chart',
    'active' => false,
    'path' => 'sql',
    'sql' => 'ar_EG-general.sql',
  ),
  3 => 
  array (
    'name' => 'Theme Dashboard',
    'package' => 'dashboard_theme',
    'version' => '2.3.15-1',
    'type' => 'theme',
    'active' => false,
    'path' => 'themes/dashboard',
  ),
  4 => 
  array (
    'name' => 'Theme Dynamic',
    'package' => 'dynamic',
    'version' => '2.3.10-2',
    'type' => 'theme',
    'active' => false,
    'path' => 'themes/dynamic',
  ),
  5 => 
  array (
    'name' => 'Theme Modern',
    'package' => 'modern',
    'version' => '2.3.0-3',
    'type' => 'theme',
    'active' => false,
    'path' => 'themes/modern',
  ),
  6 => 
  array (
    'name' => 'Theme Studio',
    'package' => 'studio',
    'version' => '2.3.0-3',
    'type' => 'theme',
    'active' => false,
    'path' => 'themes/studio',
  ),
);
?>