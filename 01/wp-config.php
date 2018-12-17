<?php

define('DB_NAME', 'wp_db');
define('DB_USER', 'wp_web');
define('DB_PASSWORD', 'mypassword');
define('DB_HOST', '192.168.50.51');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

define('AUTH_KEY',         'myuniquephrase');
define('SECURE_AUTH_KEY',  'myuniquephrase');
define('LOGGED_IN_KEY',    'myuniquephrase');
define('NONCE_KEY',        'myuniquephrase');
define('AUTH_SALT',        'myuniquephrase');
define('SECURE_AUTH_SALT', 'myuniquephrase');
define('LOGGED_IN_SALT',   'myuniquephrase');
define('NONCE_SALT',       'myuniquephrase');

$table_prefix  = 'wp_';
define('WP_DEBUG', false);
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');

