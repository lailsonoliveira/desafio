<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'actionlabs' );

/** Database username */
define( 'DB_USER', 'root' );

/** Database password */
define( 'DB_PASSWORD', '' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '@FnYB.:Zl{M}]|s?q6J6r|Go]!tZ-&z$EV0]hUzj4SW=mV#OR7nV4^NM>q1=LyId' );
define( 'SECURE_AUTH_KEY',  '@cbUF%I/m#6H;YESH,Z@O#2d{);(yL/yu6OCQLG7V1^8!+@fdK~Cpe85<;nj{9NN' );
define( 'LOGGED_IN_KEY',    'r2[m5NI36(x]Cl#u(joKz,|?:fKW2Qr6=f^SH-vF0[;!f-;ygYQqW,w:m2T:`<Cx' );
define( 'NONCE_KEY',        'x51ySHKS<CXt.sm*ros>b*m[,BAH-kHZ:6qtfT]cvxeD8,4#k S[.wX][x|_nG.4' );
define( 'AUTH_SALT',        ' p2CSvahA8-2h8~?wPfP+C :2pWwirQBx?D|~7l]j-&97AT3SFYD(Q5u:(KhSNi(' );
define( 'SECURE_AUTH_SALT', '//j)R)!!p/EzqiT[#0.:!.NM.E~{_s`;y{S@hHEztK*}c8s|C[D(Hj3{rL0LoiN?' );
define( 'LOGGED_IN_SALT',   'VlkL!;s*xT6FV>vLaogIQj>)&Tw)yKAzVVKdhNmNXX ]`~x=o~)mbUs{j5fPy=3o' );
define( 'NONCE_SALT',       'K$lzcDUw99+VtTm_[b44ie~GuA?~$.exA8AcpnQk;i@,JWeOFo=#nKL>B{BJcmOt' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'actl_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
