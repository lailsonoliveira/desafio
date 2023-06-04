-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 04-Jun-2023 às 23:01
-- Versão do servidor: 8.0.31
-- versão do PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `actionlabs`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `actl_commentmeta`
--

DROP TABLE IF EXISTS `actl_commentmeta`;
CREATE TABLE IF NOT EXISTS `actl_commentmeta` (
  `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `actl_comments`
--

DROP TABLE IF EXISTS `actl_comments`;
CREATE TABLE IF NOT EXISTS `actl_comments` (
  `comment_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `actl_links`
--

DROP TABLE IF EXISTS `actl_links`;
CREATE TABLE IF NOT EXISTS `actl_links` (
  `link_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `actl_options`
--

DROP TABLE IF EXISTS `actl_options`;
CREATE TABLE IF NOT EXISTS `actl_options` (
  `option_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=MyISAM AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Extraindo dados da tabela `actl_options`
--

INSERT INTO `actl_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost:8081/actionlabs', 'yes'),
(2, 'home', 'http://localhost:8081/actionlabs', 'yes'),
(3, 'blogname', 'Actions Labs', 'yes'),
(4, 'blogdescription', '', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'lailsonwd@gmail.com', 'yes'),
(7, 'start_of_week', '0', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j \\d\\e F \\d\\e Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'j \\d\\e F \\d\\e Y, H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:91:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:48:\"categoria/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:43:\"categoria/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:24:\"categoria/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:36:\"categoria/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:18:\"categoria/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:0;s:33:\"classic-editor/classic-editor.php\";i:1;s:27:\"updraftplus/updraftplus.php\";}', 'yes'),
(34, 'category_base', '/categoria', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'actionlabs', 'yes'),
(41, 'stylesheet', 'actionlabs', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '53496', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'posts', 'yes'),
(52, 'tag_base', '/tag', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:0:{}', 'yes'),
(77, 'widget_text', 'a:0:{}', 'yes'),
(78, 'widget_rss', 'a:0:{}', 'yes'),
(79, 'uninstall_plugins', 'a:0:{}', 'no'),
(80, 'timezone_string', 'America/Sao_Paulo', 'yes'),
(81, 'page_for_posts', '0', 'yes'),
(82, 'page_on_front', '0', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '0', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1701365779', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'wp_force_deactivated_plugins', 'a:0:{}', 'yes'),
(99, 'initial_db_version', '53496', 'yes'),
(100, 'actl_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(101, 'fresh_site', '0', 'yes'),
(102, 'WPLANG', 'pt_BR', 'yes'),
(103, 'user_count', '1', 'no'),
(104, 'widget_block', 'a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:156:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Posts recentes</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:224:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Comentários</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Arquivos</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categorias</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'sidebars_widgets', 'a:2:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:13:\"array_version\";i:3;}', 'yes'),
(106, 'cron', 'a:8:{i:1685921780;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1685943380;a:4:{s:18:\"wp_https_detection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1685943391;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1685986580;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1685986591;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1685986594;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1686504980;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'yes'),
(107, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'widget_recent-posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(117, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(118, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(119, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(120, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(122, 'recovery_keys', 'a:0:{}', 'yes'),
(123, 'https_detection_errors', 'a:1:{s:20:\"https_request_failed\";a:1:{i:0;s:26:\"Requisição HTTPS falhou.\";}}', 'yes'),
(218, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/pt_BR/wordpress-6.2.2.zip\";s:6:\"locale\";s:5:\"pt_BR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/pt_BR/wordpress-6.2.2.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.2.2\";s:7:\"version\";s:5:\"6.2.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"6.1\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1685912390;s:15:\"version_checked\";s:5:\"6.2.2\";s:12:\"translations\";a:0:{}}', 'no'),
(219, '_site_transient_update_plugins', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1685912390;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:2:{s:33:\"classic-editor/classic-editor.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:28:\"w.org/plugins/classic-editor\";s:4:\"slug\";s:14:\"classic-editor\";s:6:\"plugin\";s:33:\"classic-editor/classic-editor.php\";s:11:\"new_version\";s:5:\"1.6.3\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/classic-editor/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/classic-editor.1.6.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-256x256.png?rev=1998671\";s:2:\"1x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-128x128.png?rev=1998671\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/classic-editor/assets/banner-1544x500.png?rev=1998671\";s:2:\"1x\";s:69:\"https://ps.w.org/classic-editor/assets/banner-772x250.png?rev=1998676\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.9\";}s:27:\"updraftplus/updraftplus.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/updraftplus\";s:4:\"slug\";s:11:\"updraftplus\";s:6:\"plugin\";s:27:\"updraftplus/updraftplus.php\";s:11:\"new_version\";s:6:\"1.23.4\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/updraftplus/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/updraftplus.1.23.4.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/updraftplus/assets/icon-256x256.jpg?rev=1686200\";s:2:\"1x\";s:64:\"https://ps.w.org/updraftplus/assets/icon-128x128.jpg?rev=1686200\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/updraftplus/assets/banner-1544x500.png?rev=1686200\";s:2:\"1x\";s:66:\"https://ps.w.org/updraftplus/assets/banner-772x250.png?rev=1686200\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.2\";}}}', 'no'),
(221, 'updraft_updraftvault', 'a:2:{s:7:\"version\";i:1;s:8:\"settings\";a:1:{s:34:\"s-9173b6661ac5309a5ad63b36ae278830\";a:3:{s:5:\"token\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"quota\";i:-1;}}}', 'yes'),
(222, 'updraft_dropbox', 'a:2:{s:7:\"version\";i:1;s:8:\"settings\";a:1:{s:34:\"s-9e41fd1ab68ab33f760155ff7efae8a0\";a:4:{s:6:\"appkey\";s:0:\"\";s:6:\"secret\";s:0:\"\";s:6:\"folder\";s:0:\"\";s:15:\"tk_access_token\";s:0:\"\";}}}', 'yes'),
(226, 'updraft_onedrive', 'a:2:{s:7:\"version\";i:1;s:8:\"settings\";a:1:{s:34:\"s-469ff9a00ebe6a8ea8b4ed81240d82ae\";a:5:{s:8:\"clientid\";s:0:\"\";s:6:\"secret\";s:0:\"\";s:3:\"url\";s:0:\"\";s:6:\"folder\";s:0:\"\";s:12:\"endpoint_tld\";s:3:\"com\";}}}', 'yes'),
(175, 'recently_activated', 'a:1:{s:30:\"advanced-custom-fields/acf.php\";i:1685814945;}', 'yes'),
(176, 'acf_version', '6.1.6', 'yes'),
(129, 'theme_mods_twentytwentythree', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1685814144;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}', 'yes'),
(165, 'current_theme', 'Portal do Cliente', 'yes'),
(166, 'theme_mods_actionlabs', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(167, 'theme_switched', '', 'yes'),
(168, 'recovery_mode_email_last_sent', '1685814145', 'yes'),
(220, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1685912391;s:7:\"checked\";a:1:{s:10:\"actionlabs\";s:5:\"1.0.0\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(223, 'updraft_s3', 'a:2:{s:7:\"version\";i:1;s:8:\"settings\";a:1:{s:34:\"s-1740184e9a774080e9ad4e687ccdb092\";a:5:{s:9:\"accesskey\";s:0:\"\";s:9:\"secretkey\";s:0:\"\";s:4:\"path\";s:0:\"\";s:3:\"rrs\";s:0:\"\";s:22:\"server_side_encryption\";s:0:\"\";}}}', 'yes'),
(224, 'updraft_cloudfiles', 'a:2:{s:7:\"version\";i:1;s:8:\"settings\";a:1:{s:34:\"s-a50b9d2a9dd27548d6e879a4bebb1ff2\";a:5:{s:4:\"user\";s:0:\"\";s:7:\"authurl\";s:35:\"https://auth.api.rackspacecloud.com\";s:6:\"apikey\";s:0:\"\";s:4:\"path\";s:0:\"\";s:6:\"region\";N;}}}', 'yes'),
(251, '_site_transient_timeout_theme_roots', '1685914190', 'no'),
(252, '_site_transient_theme_roots', 'a:1:{s:10:\"actionlabs\";s:7:\"/themes\";}', 'no'),
(164, 'finished_updating_comment_type', '1', 'yes'),
(161, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:19:\"lailsonwd@gmail.com\";s:7:\"version\";s:5:\"6.2.2\";s:9:\"timestamp\";i:1685813846;}', 'no'),
(140, '_site_transient_timeout_browser_c2e8770a57bb05f02fa99fc10237a511', '1686418593', 'no'),
(141, '_site_transient_browser_c2e8770a57bb05f02fa99fc10237a511', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:9:\"113.0.0.0\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(142, '_site_transient_timeout_php_check_990bfacb848fa087bcfc06850f5e4447', '1686418594', 'no'),
(143, '_site_transient_php_check_990bfacb848fa087bcfc06850f5e4447', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(146, 'can_compress_scripts', '1', 'no'),
(184, 'wp_calendar_block_has_published_posts', '1', 'yes'),
(192, 'category_children', 'a:0:{}', 'yes'),
(225, 'updraft_googledrive', 'a:2:{s:7:\"version\";i:1;s:8:\"settings\";a:1:{s:34:\"s-a22d86b6c8c428663273daaa0d4733f0\";a:3:{s:8:\"clientid\";s:0:\"\";s:6:\"secret\";s:0:\"\";s:5:\"token\";s:0:\"\";}}}', 'yes'),
(227, 'updraft_ftp', 'a:2:{s:7:\"version\";i:1;s:8:\"settings\";a:1:{s:34:\"s-0a4f68a54ce372a0796e654c703ca49a\";a:5:{s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:4:\"pass\";s:0:\"\";s:4:\"path\";s:0:\"\";s:7:\"passive\";i:1;}}}', 'yes'),
(228, 'updraft_azure', 'a:2:{s:7:\"version\";i:1;s:8:\"settings\";a:1:{s:34:\"s-d70ff63bfb7bb7cf102fcc299586de84\";a:4:{s:12:\"account_name\";s:0:\"\";s:3:\"key\";s:0:\"\";s:9:\"container\";s:0:\"\";s:8:\"endpoint\";s:21:\"blob.core.windows.net\";}}}', 'yes'),
(229, 'updraft_sftp', 'a:2:{s:7:\"version\";i:1;s:8:\"settings\";a:1:{s:34:\"s-546d8796bae7a0223788546f4f2aa296\";a:7:{s:4:\"host\";s:0:\"\";s:4:\"port\";s:2:\"22\";s:4:\"user\";s:0:\"\";s:4:\"pass\";s:0:\"\";s:3:\"key\";s:0:\"\";s:4:\"path\";s:0:\"\";s:3:\"scp\";i:0;}}}', 'yes'),
(230, 'updraft_googlecloud', 'a:2:{s:7:\"version\";i:1;s:8:\"settings\";a:1:{s:34:\"s-a408fa95944a3e5835d23b90a2a415ed\";a:6:{s:8:\"clientid\";s:0:\"\";s:6:\"secret\";s:0:\"\";s:10:\"project_id\";s:0:\"\";s:11:\"bucket_path\";s:0:\"\";s:13:\"storage_class\";s:0:\"\";s:15:\"bucket_location\";s:0:\"\";}}}', 'yes'),
(231, 'updraft_backblaze', 'a:2:{s:7:\"version\";i:1;s:8:\"settings\";a:1:{s:34:\"s-a5ef64e9ec21f03b70d138af6a9093b6\";a:5:{s:10:\"account_id\";s:0:\"\";s:3:\"key\";s:0:\"\";s:11:\"bucket_name\";s:0:\"\";s:11:\"backup_path\";s:0:\"\";s:20:\"single_bucket_key_id\";s:0:\"\";}}}', 'yes'),
(232, 'updraft_webdav', 'a:2:{s:7:\"version\";i:1;s:8:\"settings\";a:1:{s:34:\"s-1f69ad27fc786e1a5675f67c21495f48\";a:1:{s:3:\"url\";s:0:\"\";}}}', 'yes'),
(233, 'updraft_s3generic', 'a:2:{s:7:\"version\";i:1;s:8:\"settings\";a:1:{s:34:\"s-a703cfa97eb9b3448ce984b783c949cf\";a:4:{s:9:\"accesskey\";s:0:\"\";s:9:\"secretkey\";s:0:\"\";s:4:\"path\";s:0:\"\";s:8:\"endpoint\";s:0:\"\";}}}', 'yes'),
(234, 'updraft_openstack', 'a:2:{s:7:\"version\";i:1;s:8:\"settings\";a:1:{s:34:\"s-b42f308d105f5280f09674f24f635cd6\";a:6:{s:4:\"user\";s:0:\"\";s:7:\"authurl\";s:0:\"\";s:8:\"password\";s:0:\"\";s:6:\"tenant\";s:0:\"\";s:4:\"path\";s:0:\"\";s:6:\"region\";s:0:\"\";}}}', 'yes'),
(235, 'updraft_dreamobjects', 'a:2:{s:7:\"version\";i:1;s:8:\"settings\";a:1:{s:34:\"s-9cbd925cdbd9e987a8f995165d5325e7\";a:3:{s:9:\"accesskey\";s:0:\"\";s:9:\"secretkey\";s:0:\"\";s:4:\"path\";s:0:\"\";}}}', 'yes'),
(236, 'updraftplus_tour_cancelled_on', 'intro', 'yes'),
(237, 'updraftplus_version', '2.16.20.24', 'yes'),
(238, 'updraftplus-addons_siteid', 'ffc5389a50af349599d500c48119af49', 'no'),
(241, 'updraft_lastmessage', 'O backup aparentemente foi bem sucedido e está completo agora. (jun 03 19:47:12)', 'yes'),
(242, 'updraftplus_unlocked_fd', '1', 'no'),
(243, 'updraftplus_last_lock_time_fd', '2023-06-03 22:47:07', 'no'),
(244, 'updraftplus_semaphore_fd', '0', 'no'),
(245, 'updraft_last_scheduled_fd', '1685832427', 'yes'),
(247, 'updraft_backup_history', 'a:1:{i:1685832427;a:19:{s:7:\"plugins\";a:1:{i:0;s:60:\"backup_2023-06-03-1947_Actions_Labs_020978a5d6ed-plugins.zip\";}s:12:\"plugins-size\";i:4816030;s:6:\"themes\";a:1:{i:0;s:59:\"backup_2023-06-03-1947_Actions_Labs_020978a5d6ed-themes.zip\";}s:11:\"themes-size\";i:3680686;s:7:\"uploads\";a:1:{i:0;s:60:\"backup_2023-06-03-1947_Actions_Labs_020978a5d6ed-uploads.zip\";}s:12:\"uploads-size\";i:2612700;s:6:\"others\";a:1:{i:0;s:59:\"backup_2023-06-03-1947_Actions_Labs_020978a5d6ed-others.zip\";}s:11:\"others-size\";i:965249;s:2:\"db\";s:54:\"backup_2023-06-03-1947_Actions_Labs_020978a5d6ed-db.gz\";s:7:\"db-size\";i:359353;s:9:\"checksums\";a:2:{s:4:\"sha1\";a:5:{s:8:\"plugins0\";s:40:\"8967217bd9a06307825835ceab240289a36f1650\";s:7:\"themes0\";s:40:\"c7d7ea38325e501cf5773871190dc4e22f252c0c\";s:8:\"uploads0\";s:40:\"d397bcae135e70acae21eb418cb434c65be39403\";s:7:\"others0\";s:40:\"1f3d9c0d5da7b349f74e60edd5f545392a9b34dc\";s:3:\"db0\";s:40:\"e66fe57507c80268067f06a1a8aaa4a942218188\";}s:6:\"sha256\";a:5:{s:8:\"plugins0\";s:64:\"9e438f87e8a59def1b7f0874080b7ed3d2135356a1996c1b491900023409d99b\";s:7:\"themes0\";s:64:\"13f0dcf1dc652b8516d9e782fc51f22f0ce6be81e4375102281a1f6551ac4c9e\";s:8:\"uploads0\";s:64:\"c4c936b31fdb4fa7eb58070d95b5584f04a83622739a1de2462140b12fd3f30b\";s:7:\"others0\";s:64:\"7ecb7b6479b3cd85a3e73efa0e64c5e8777dfd84f8fcd10e6f0f4976246a1956\";s:3:\"db0\";s:64:\"98ce45d70e8d0f0e26a55cb374acf1d81a872dd259a30487a55139b9ef13eba6\";}}s:5:\"nonce\";s:12:\"020978a5d6ed\";s:7:\"service\";a:1:{i:0;s:4:\"none\";}s:20:\"service_instance_ids\";a:0:{}s:11:\"always_keep\";b:0;s:19:\"files_enumerated_at\";a:4:{s:7:\"plugins\";i:1685832427;s:6:\"themes\";i:1685832430;s:7:\"uploads\";i:1685832430;s:6:\"others\";i:1685832430;}s:18:\"created_by_version\";s:10:\"2.16.20.24\";s:21:\"last_saved_by_version\";s:10:\"2.16.20.24\";s:12:\"is_multisite\";b:0;}}', 'no'),
(248, 'updraft_last_backup', 'a:5:{s:11:\"backup_time\";i:1685832427;s:12:\"backup_array\";a:11:{s:7:\"plugins\";a:1:{i:0;s:60:\"backup_2023-06-03-1947_Actions_Labs_020978a5d6ed-plugins.zip\";}s:12:\"plugins-size\";i:4816030;s:6:\"themes\";a:1:{i:0;s:59:\"backup_2023-06-03-1947_Actions_Labs_020978a5d6ed-themes.zip\";}s:11:\"themes-size\";i:3680686;s:7:\"uploads\";a:1:{i:0;s:60:\"backup_2023-06-03-1947_Actions_Labs_020978a5d6ed-uploads.zip\";}s:12:\"uploads-size\";i:2612700;s:6:\"others\";a:1:{i:0;s:59:\"backup_2023-06-03-1947_Actions_Labs_020978a5d6ed-others.zip\";}s:11:\"others-size\";i:965249;s:2:\"db\";s:54:\"backup_2023-06-03-1947_Actions_Labs_020978a5d6ed-db.gz\";s:7:\"db-size\";i:359353;s:9:\"checksums\";a:2:{s:4:\"sha1\";a:5:{s:8:\"plugins0\";s:40:\"8967217bd9a06307825835ceab240289a36f1650\";s:7:\"themes0\";s:40:\"c7d7ea38325e501cf5773871190dc4e22f252c0c\";s:8:\"uploads0\";s:40:\"d397bcae135e70acae21eb418cb434c65be39403\";s:7:\"others0\";s:40:\"1f3d9c0d5da7b349f74e60edd5f545392a9b34dc\";s:3:\"db0\";s:40:\"e66fe57507c80268067f06a1a8aaa4a942218188\";}s:6:\"sha256\";a:5:{s:8:\"plugins0\";s:64:\"9e438f87e8a59def1b7f0874080b7ed3d2135356a1996c1b491900023409d99b\";s:7:\"themes0\";s:64:\"13f0dcf1dc652b8516d9e782fc51f22f0ce6be81e4375102281a1f6551ac4c9e\";s:8:\"uploads0\";s:64:\"c4c936b31fdb4fa7eb58070d95b5584f04a83622739a1de2462140b12fd3f30b\";s:7:\"others0\";s:64:\"7ecb7b6479b3cd85a3e73efa0e64c5e8777dfd84f8fcd10e6f0f4976246a1956\";s:3:\"db0\";s:64:\"98ce45d70e8d0f0e26a55cb374acf1d81a872dd259a30487a55139b9ef13eba6\";}}}s:7:\"success\";i:1;s:6:\"errors\";a:0:{}s:12:\"backup_nonce\";s:12:\"020978a5d6ed\";}', 'yes'),
(253, '_transient_health-check-site-status-result', '{\"good\":16,\"recommended\":4,\"critical\":1}', 'yes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `actl_postmeta`
--

DROP TABLE IF EXISTS `actl_postmeta`;
CREATE TABLE IF NOT EXISTS `actl_postmeta` (
  `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Extraindo dados da tabela `actl_postmeta`
--

INSERT INTO `actl_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(67, 31, '_edit_lock', '1685919437:1'),
(3, 5, '_edit_last', '1'),
(4, 5, '_edit_lock', '1685814328:1'),
(9, 8, '_edit_lock', '1685819743:1'),
(12, 10, '_wp_attached_file', '2023/06/unsplash_ndN00KmbJ1c.png'),
(13, 10, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:370;s:6:\"height\";i:277;s:4:\"file\";s:32:\"2023/06/unsplash_ndN00KmbJ1c.png\";s:8:\"filesize\";i:130250;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:32:\"unsplash_ndN00KmbJ1c-300x225.png\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:85561;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:32:\"unsplash_ndN00KmbJ1c-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:33628;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(17, 11, '_edit_lock', '1685819818:1'),
(16, 8, '_thumbnail_id', '10'),
(18, 12, '_wp_attached_file', '2023/06/unsplash_ndN00KmbJ1c-1.png'),
(19, 12, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:370;s:6:\"height\";i:277;s:4:\"file\";s:34:\"2023/06/unsplash_ndN00KmbJ1c-1.png\";s:8:\"filesize\";i:189689;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:34:\"unsplash_ndN00KmbJ1c-1-300x225.png\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:122819;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:34:\"unsplash_ndN00KmbJ1c-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:43616;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(23, 14, '_edit_lock', '1685820043:1'),
(22, 11, '_thumbnail_id', '12'),
(24, 15, '_wp_attached_file', '2023/06/unsplash_ndN00KmbJ1c-2.png'),
(25, 15, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:370;s:6:\"height\";i:277;s:4:\"file\";s:34:\"2023/06/unsplash_ndN00KmbJ1c-2.png\";s:8:\"filesize\";i:168857;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:34:\"unsplash_ndN00KmbJ1c-2-300x225.png\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:111028;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:34:\"unsplash_ndN00KmbJ1c-2-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:42119;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(29, 17, '_edit_lock', '1685820177:1'),
(28, 14, '_thumbnail_id', '15'),
(30, 18, '_wp_attached_file', '2023/06/image-2.png'),
(31, 18, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:692;s:6:\"height\";i:407;s:4:\"file\";s:19:\"2023/06/image-2.png\";s:8:\"filesize\";i:416689;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:19:\"image-2-300x176.png\";s:5:\"width\";i:300;s:6:\"height\";i:176;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:97810;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:19:\"image-2-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:46085;}s:15:\"imagem-loopblog\";a:5:{s:4:\"file\";s:19:\"image-2-370x277.png\";s:5:\"width\";i:370;s:6:\"height\";i:277;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:171055;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(32, 19, '_wp_attached_file', '2023/06/unsplash_ndN00KmbJ1c-5.png'),
(33, 19, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:370;s:6:\"height\";i:277;s:4:\"file\";s:34:\"2023/06/unsplash_ndN00KmbJ1c-5.png\";s:8:\"filesize\";i:197315;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:34:\"unsplash_ndN00KmbJ1c-5-300x225.png\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:126806;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:34:\"unsplash_ndN00KmbJ1c-5-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:46386;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(34, 20, '_wp_attached_file', '2023/06/unsplash_ndN00KmbJ1c-4.png'),
(35, 20, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:370;s:6:\"height\";i:277;s:4:\"file\";s:34:\"2023/06/unsplash_ndN00KmbJ1c-4.png\";s:8:\"filesize\";i:177322;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:34:\"unsplash_ndN00KmbJ1c-4-300x225.png\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:116939;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:34:\"unsplash_ndN00KmbJ1c-4-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:45008;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(36, 21, '_wp_attached_file', '2023/06/unsplash_ndN00KmbJ1c-3.png'),
(37, 21, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:370;s:6:\"height\";i:277;s:4:\"file\";s:34:\"2023/06/unsplash_ndN00KmbJ1c-3.png\";s:8:\"filesize\";i:120964;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:34:\"unsplash_ndN00KmbJ1c-3-300x225.png\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:83174;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:34:\"unsplash_ndN00KmbJ1c-3-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:35720;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(41, 23, '_edit_lock', '1685832164:1'),
(40, 17, '_thumbnail_id', '21'),
(45, 25, '_edit_lock', '1685823052:1'),
(44, 23, '_thumbnail_id', '18'),
(49, 23, '_edit_last', '1'),
(48, 25, '_thumbnail_id', '19'),
(66, 31, '_edit_last', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `actl_posts`
--

DROP TABLE IF EXISTS `actl_posts`;
CREATE TABLE IF NOT EXISTS `actl_posts` (
  `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` bigint UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Extraindo dados da tabela `actl_posts`
--

INSERT INTO `actl_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(34, 1, '2023-06-03 20:04:50', '2023-06-03 23:04:50', '<h2>Norem ipsum dolor sit amet, consectetur adipiscing elit.</h2>\n&nbsp;\n<p style=\"text-align: left;\">Com a Síndrome de Burnout acometendo cerca de 30% da população brasileira, tornou-se imprescindível falar e conscientizar as pessoas acerca da importância de um ambiente corporativo saudável. No entanto, a felicidade no trabalho é uma das questões que precisam de mais visibilidade e atenção das empresas.\nNo que diz respeito à gestão de pessoas, é esperado que a jornada do funcionário em todo o tempo de empresa seja o mais benéfica possível, levando em consideração seus pontos fortes, e também suas fragilidades. Porém, na prática, isso não acontece sempre.</p>\nHoras extras, falta de feedbacks e demandas excessivas podem desencadear uma série de problemas emocionais nos colaboradores. Logo, tais elementos podem aumentar a carga de estresse no indivíduo e evoluir para o esgotamento físico e mental. Dessa forma, para sanar este problema, precisamos falar sobre a felicidade no trabalho e sua importância.\n<h3>OS EFEITOS DA FELICIDADE NO CORPO HUMANO</h3>\nA felicidade é um sentimento intenso de alegria e que se torna um estado de espírito quando contemplada com frequência. No entanto, essa emoção é desencadeada pela produção da serotonina, uma substância importante para o bem-estar.\nA serotonina, por sua vez, é considerada um neurotransmissor . Ela possibilita a comunicação entre os neurônios, liberando assim, sensações de prazer e alegria no indivíduo. Dessa forma, quando praticamos atividades que gostamos, fazemos exercícios físicos e nos alimentamos de forma saudável, incentivamos a produção deste importante elemento.\nProduzindo serotonina nos sentimos felizes e, nos sentindo felizes, temos prazer em realizar nossos afazeres. Todavia, estar feliz nos deixa alegre, sorridentes e com o poder de contagiar também quem está ao nosso redor.', 'Sobre nós', '', 'inherit', 'closed', 'closed', '', '31-autosave-v1', '', '', '2023-06-03 20:04:50', '2023-06-03 23:04:50', '', 31, 'http://localhost:8081/actionlabs/?p=34', 0, 'revision', '', 0),
(35, 1, '2023-06-03 20:05:21', '2023-06-03 23:05:21', '<h2>Norem ipsum dolor sit amet, consectetur adipiscing elit.</h2>\r\n&nbsp;\r\n<p style=\"text-align: left;\">Com a Síndrome de Burnout acometendo cerca de 30% da população brasileira, tornou-se imprescindível falar e conscientizar as pessoas acerca da importância de um ambiente corporativo saudável. No entanto, a felicidade no trabalho é uma das questões que precisam de mais visibilidade e atenção das empresas.\r\nNo que diz respeito à gestão de pessoas, é esperado que a jornada do funcionário em todo o tempo de empresa seja o mais benéfica possível, levando em consideração seus pontos fortes, e também suas fragilidades. Porém, na prática, isso não acontece sempre.</p>\r\nHoras extras, falta de feedbacks e demandas excessivas podem desencadear uma série de problemas emocionais nos colaboradores. Logo, tais elementos podem aumentar a carga de estresse no indivíduo e evoluir para o esgotamento físico e mental. Dessa forma, para sanar este problema, precisamos falar sobre a felicidade no trabalho e sua importância.\r\n<h3>OS EFEITOS DA FELICIDADE NO CORPO HUMANO</h3>\r\nA felicidade é um sentimento intenso de alegria e que se torna um estado de espírito quando contemplada com frequência. No entanto, essa emoção é desencadeada pela produção da serotonina, uma substância importante para o bem-estar.\r\nA serotonina, por sua vez, é considerada um neurotransmissor . Ela possibilita a comunicação entre os neurônios, liberando assim, sensações de prazer e alegria no indivíduo. Dessa forma, quando praticamos atividades que gostamos, fazemos exercícios físicos e nos alimentamos de forma saudável, incentivamos a produção deste importante elemento.\r\nProduzindo serotonina nos sentimos felizes e, nos sentindo felizes, temos prazer em realizar nossos afazeres. Todavia, estar feliz nos deixa alegre, sorridentes e com o poder de contagiar também quem está ao nosso redor.', 'Sobre nós', '', 'inherit', 'closed', 'closed', '', '31-revision-v1', '', '', '2023-06-03 20:05:21', '2023-06-03 23:05:21', '', 31, 'http://localhost:8081/actionlabs/?p=35', 0, 'revision', '', 0),
(4, 1, '2023-06-03 14:36:34', '0000-00-00 00:00:00', '', 'Rascunho automático', '', 'auto-draft', 'open', 'open', '', '', '', '', '2023-06-03 14:36:34', '0000-00-00 00:00:00', '', 0, 'http://localhost:8081/actionlabs/?p=4', 0, 'post', '', 0),
(5, 1, '2023-06-03 14:45:19', '2023-06-03 17:45:19', 'a:8:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"post\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"show_in_rest\";i:0;}', 'Opções do Tema', 'opcoes-do-tema', 'publish', 'closed', 'closed', '', 'group_647b7c00cdbea', '', '', '2023-06-03 14:45:19', '2023-06-03 17:45:19', '', 0, 'http://localhost:8081/actionlabs/?post_type=acf-field-group&#038;p=5', 0, 'acf-field-group', '', 0),
(6, 1, '2023-06-03 14:45:19', '2023-06-03 17:45:19', 'a:16:{s:10:\"aria-label\";s:0:\"\";s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:12:\"preview_size\";s:6:\"medium\";}', 'Logo', 'logo', 'publish', 'closed', 'closed', '', 'field_647b7c01a87a7', '', '', '2023-06-03 14:45:19', '2023-06-03 17:45:19', '', 5, 'http://localhost:8081/actionlabs/?post_type=acf-field&p=6', 0, 'acf-field', '', 0),
(8, 1, '2023-06-03 16:06:07', '2023-06-03 19:06:07', '<!-- wp:paragraph -->\n<p>The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are</p>\n<!-- /wp:paragraph -->', 'A busca pelo autoconhecimento', '', 'publish', 'open', 'open', '', 'a-busca-pelo-autoconhecimento', '', '', '2023-06-03 16:11:53', '2023-06-03 19:11:53', '', 0, 'http://localhost:8081/actionlabs/?p=8', 0, 'post', '', 0),
(9, 1, '2023-06-03 16:06:07', '2023-06-03 19:06:07', '<!-- wp:paragraph -->\n<p>The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are</p>\n<!-- /wp:paragraph -->', 'A busca pelo autoconhecimento', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2023-06-03 16:06:07', '2023-06-03 19:06:07', '', 8, 'http://localhost:8081/actionlabs/?p=9', 0, 'revision', '', 0),
(10, 1, '2023-06-03 16:11:50', '2023-06-03 19:11:50', '', 'unsplash_ndN00KmbJ1c', '', 'inherit', 'open', 'closed', '', 'unsplash_ndn00kmbj1c', '', '', '2023-06-03 16:11:50', '2023-06-03 19:11:50', '', 8, 'http://localhost:8081/actionlabs/wp-content/uploads/2023/06/unsplash_ndN00KmbJ1c.png', 0, 'attachment', 'image/png', 0),
(11, 1, '2023-06-03 16:17:01', '2023-06-03 19:17:01', '<!-- wp:paragraph -->\n<p>The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are</p>\n<!-- /wp:paragraph -->', 'Como controlar o estresse no trabalho', '', 'publish', 'open', 'open', '', 'como-controlar-o-estresse-no-trabalho', '', '', '2023-06-03 16:17:01', '2023-06-03 19:17:01', '', 0, 'http://localhost:8081/actionlabs/?p=11', 0, 'post', '', 0),
(12, 1, '2023-06-03 16:16:24', '2023-06-03 19:16:24', '', 'unsplash_ndN00KmbJ1c (1)', '', 'inherit', 'open', 'closed', '', 'unsplash_ndn00kmbj1c-1', '', '', '2023-06-03 16:16:24', '2023-06-03 19:16:24', '', 11, 'http://localhost:8081/actionlabs/wp-content/uploads/2023/06/unsplash_ndN00KmbJ1c-1.png', 0, 'attachment', 'image/png', 0),
(13, 1, '2023-06-03 16:17:01', '2023-06-03 19:17:01', '<!-- wp:paragraph -->\n<p>The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are</p>\n<!-- /wp:paragraph -->', 'Como controlar o estresse no trabalho', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2023-06-03 16:17:01', '2023-06-03 19:17:01', '', 11, 'http://localhost:8081/actionlabs/?p=13', 0, 'revision', '', 0),
(14, 1, '2023-06-03 16:18:15', '2023-06-03 19:18:15', '<!-- wp:paragraph -->\n<p>The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are</p>\n<!-- /wp:paragraph -->', '5 doenças pulmonares que causam o ronco e por quê', '', 'publish', 'open', 'open', '', '5-doencas-pulmonares-que-causam-o-ronco-e-por-que', '', '', '2023-06-03 16:18:15', '2023-06-03 19:18:15', '', 0, 'http://localhost:8081/actionlabs/?p=14', 0, 'post', '', 0),
(15, 1, '2023-06-03 16:18:10', '2023-06-03 19:18:10', '', 'unsplash_ndN00KmbJ1c (2)', '', 'inherit', 'open', 'closed', '', 'unsplash_ndn00kmbj1c-2', '', '', '2023-06-03 16:18:10', '2023-06-03 19:18:10', '', 14, 'http://localhost:8081/actionlabs/wp-content/uploads/2023/06/unsplash_ndN00KmbJ1c-2.png', 0, 'attachment', 'image/png', 0),
(16, 1, '2023-06-03 16:18:15', '2023-06-03 19:18:15', '<!-- wp:paragraph -->\n<p>The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are</p>\n<!-- /wp:paragraph -->', '5 doenças pulmonares que causam o ronco e por quê', '', 'inherit', 'closed', 'closed', '', '14-revision-v1', '', '', '2023-06-03 16:18:15', '2023-06-03 19:18:15', '', 14, 'http://localhost:8081/actionlabs/?p=16', 0, 'revision', '', 0),
(17, 1, '2023-06-03 16:22:46', '2023-06-03 19:22:46', '<!-- wp:paragraph -->\n<p>The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are</p>\n<!-- /wp:paragraph -->', 'Benefícios do aleitamento materno', '', 'publish', 'open', 'open', '', 'beneficios-do-aleitamento-materno', '', '', '2023-06-03 16:22:46', '2023-06-03 19:22:46', '', 0, 'http://localhost:8081/actionlabs/?p=17', 0, 'post', '', 0),
(18, 1, '2023-06-03 16:22:35', '2023-06-03 19:22:35', '', 'image 2', '', 'inherit', 'open', 'closed', '', 'image-2', '', '', '2023-06-03 16:22:35', '2023-06-03 19:22:35', '', 17, 'http://localhost:8081/actionlabs/wp-content/uploads/2023/06/image-2.png', 0, 'attachment', 'image/png', 0),
(19, 1, '2023-06-03 16:22:36', '2023-06-03 19:22:36', '', 'unsplash_ndN00KmbJ1c (5)', '', 'inherit', 'open', 'closed', '', 'unsplash_ndn00kmbj1c-5', '', '', '2023-06-03 16:22:36', '2023-06-03 19:22:36', '', 17, 'http://localhost:8081/actionlabs/wp-content/uploads/2023/06/unsplash_ndN00KmbJ1c-5.png', 0, 'attachment', 'image/png', 0),
(20, 1, '2023-06-03 16:22:36', '2023-06-03 19:22:36', '', 'unsplash_ndN00KmbJ1c (4)', '', 'inherit', 'open', 'closed', '', 'unsplash_ndn00kmbj1c-4', '', '', '2023-06-03 16:22:36', '2023-06-03 19:22:36', '', 17, 'http://localhost:8081/actionlabs/wp-content/uploads/2023/06/unsplash_ndN00KmbJ1c-4.png', 0, 'attachment', 'image/png', 0),
(21, 1, '2023-06-03 16:22:36', '2023-06-03 19:22:36', '', 'unsplash_ndN00KmbJ1c (3)', '', 'inherit', 'open', 'closed', '', 'unsplash_ndn00kmbj1c-3', '', '', '2023-06-03 16:22:36', '2023-06-03 19:22:36', '', 17, 'http://localhost:8081/actionlabs/wp-content/uploads/2023/06/unsplash_ndN00KmbJ1c-3.png', 0, 'attachment', 'image/png', 0),
(22, 1, '2023-06-03 16:22:46', '2023-06-03 19:22:46', '<!-- wp:paragraph -->\n<p>The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are</p>\n<!-- /wp:paragraph -->', 'Benefícios do aleitamento materno', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2023-06-03 16:22:46', '2023-06-03 19:22:46', '', 17, 'http://localhost:8081/actionlabs/?p=22', 0, 'revision', '', 0),
(23, 1, '2023-06-03 16:23:44', '2023-06-03 19:23:44', '<!-- wp:paragraph -->\r\n<p>Com a Síndrome de Burnout acometendo cerca de 30% da população brasileira, tornou-se imprescindível falar e conscientizar as pessoas acerca da importância de um ambiente corporativo saudável. No entanto, a felicidade no trabalho é uma das questões que precisam de mais visibilidade e atenção das empresas.<br />No que diz respeito à gestão de pessoas, é esperado que a jornada do funcionário em todo o tempo de empresa seja o mais benéfica possível, levando em consideração seus pontos fortes, e também suas fragilidades. Porém, na prática, isso não acontece sempre.</p>\r\n<p>Horas extras, falta de feedbacks e demandas excessivas podem desencadear uma série de problemas emocionais nos colaboradores. Logo, tais elementos podem aumentar a carga de estresse no indivíduo e evoluir para o esgotamento físico e mental. Dessa forma, para sanar este problema, precisamos falar sobre a felicidade no trabalho e sua importância.</p>\r\n<h2><br />OS EFEITOS DA FELICIDADE NO CORPO HUMANO</h2>\r\n<p>A felicidade é um sentimento intenso de alegria e que se torna um estado de espírito quando contemplada com frequência. No entanto, essa emoção é desencadeada pela produção da serotonina, uma substância importante para o bem-estar.<br />A serotonina, por sua vez, é considerada um neurotransmissor . Ela possibilita a comunicação entre os neurônios, liberando assim, sensações de prazer e alegria no indivíduo. Dessa forma, quando praticamos atividades que gostamos, fazemos exercícios físicos e nos alimentamos de forma saudável, incentivamos a produção deste importante elemento.<br />Produzindo serotonina nos sentimos felizes e, nos sentindo felizes, temos prazer em realizar nossos afazeres. Todavia, estar feliz nos deixa alegre, sorridentes e com o poder de contagiar também quem está ao nosso redor.</p>\r\n<!-- /wp:paragraph -->', 'Os efeitos da felicidade no corpo humano', '', 'publish', 'open', 'open', '', 'os-efeitos-da-felicidade-no-corpo-humano', '', '', '2023-06-03 18:26:02', '2023-06-03 21:26:02', '', 0, 'http://localhost:8081/actionlabs/?p=23', 0, 'post', '', 0),
(24, 1, '2023-06-03 16:23:44', '2023-06-03 19:23:44', '<!-- wp:paragraph -->\n<p>The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are  The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are</p>\n<!-- /wp:paragraph -->', 'Os efeitos da felicidade no corpo humano', '', 'inherit', 'closed', 'closed', '', '23-revision-v1', '', '', '2023-06-03 16:23:44', '2023-06-03 19:23:44', '', 23, 'http://localhost:8081/actionlabs/?p=24', 0, 'revision', '', 0),
(25, 1, '2023-06-03 16:24:32', '2023-06-03 19:24:32', '<!-- wp:paragraph -->\n<p>The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are</p>\n<!-- /wp:paragraph -->', 'Pasta de amendoim: mocinha ou vilã?', '', 'publish', 'open', 'open', '', 'pasta-de-amendoim-mocinha-ou-vila', '', '', '2023-06-03 16:24:32', '2023-06-03 19:24:32', '', 0, 'http://localhost:8081/actionlabs/?p=25', 0, 'post', '', 0),
(26, 1, '2023-06-03 16:24:32', '2023-06-03 19:24:32', '<!-- wp:paragraph -->\n<p>The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are The purpose of this HTML is to help determine what default settings are with CSS and to make sure that all possible HTML Elements are</p>\n<!-- /wp:paragraph -->', 'Pasta de amendoim: mocinha ou vilã?', '', 'inherit', 'closed', 'closed', '', '25-revision-v1', '', '', '2023-06-03 16:24:32', '2023-06-03 19:24:32', '', 25, 'http://localhost:8081/actionlabs/?p=26', 0, 'revision', '', 0),
(27, 1, '2023-06-03 18:26:02', '2023-06-03 21:26:02', '<!-- wp:paragraph -->\r\n<p>Com a Síndrome de Burnout acometendo cerca de 30% da população brasileira, tornou-se imprescindível falar e conscientizar as pessoas acerca da importância de um ambiente corporativo saudável. No entanto, a felicidade no trabalho é uma das questões que precisam de mais visibilidade e atenção das empresas.<br />No que diz respeito à gestão de pessoas, é esperado que a jornada do funcionário em todo o tempo de empresa seja o mais benéfica possível, levando em consideração seus pontos fortes, e também suas fragilidades. Porém, na prática, isso não acontece sempre.</p>\r\n<p>Horas extras, falta de feedbacks e demandas excessivas podem desencadear uma série de problemas emocionais nos colaboradores. Logo, tais elementos podem aumentar a carga de estresse no indivíduo e evoluir para o esgotamento físico e mental. Dessa forma, para sanar este problema, precisamos falar sobre a felicidade no trabalho e sua importância.</p>\r\n<h2><br />OS EFEITOS DA FELICIDADE NO CORPO HUMANO</h2>\r\n<p>A felicidade é um sentimento intenso de alegria e que se torna um estado de espírito quando contemplada com frequência. No entanto, essa emoção é desencadeada pela produção da serotonina, uma substância importante para o bem-estar.<br />A serotonina, por sua vez, é considerada um neurotransmissor . Ela possibilita a comunicação entre os neurônios, liberando assim, sensações de prazer e alegria no indivíduo. Dessa forma, quando praticamos atividades que gostamos, fazemos exercícios físicos e nos alimentamos de forma saudável, incentivamos a produção deste importante elemento.<br />Produzindo serotonina nos sentimos felizes e, nos sentindo felizes, temos prazer em realizar nossos afazeres. Todavia, estar feliz nos deixa alegre, sorridentes e com o poder de contagiar também quem está ao nosso redor.</p>\r\n<!-- /wp:paragraph -->', 'Os efeitos da felicidade no corpo humano', '', 'inherit', 'closed', 'closed', '', '23-revision-v1', '', '', '2023-06-03 18:26:02', '2023-06-03 21:26:02', '', 23, 'http://localhost:8081/actionlabs/?p=27', 0, 'revision', '', 0),
(31, 1, '2023-06-03 19:59:12', '2023-06-03 22:59:12', '<h2>Norem ipsum dolor sit amet, consectetur adipiscing elit.</h2>\r\n&nbsp;\r\n<p style=\"text-align: left;\">Com a Síndrome de Burnout acometendo cerca de 30% da população brasileira, tornou-se imprescindível falar e conscientizar as pessoas acerca da importância de um ambiente corporativo saudável. No entanto, a felicidade no trabalho é uma das questões que precisam de mais visibilidade e atenção das empresas.\r\nNo que diz respeito à gestão de pessoas, é esperado que a jornada do funcionário em todo o tempo de empresa seja o mais benéfica possível, levando em consideração seus pontos fortes, e também suas fragilidades. Porém, na prática, isso não acontece sempre.</p>\r\nHoras extras, falta de feedbacks e demandas excessivas podem desencadear uma série de problemas emocionais nos colaboradores. Logo, tais elementos podem aumentar a carga de estresse no indivíduo e evoluir para o esgotamento físico e mental. Dessa forma, para sanar este problema, precisamos falar sobre a felicidade no trabalho e sua importância.\r\n<h3>OS EFEITOS DA FELICIDADE NO CORPO HUMANO</h3>\r\nA felicidade é um sentimento intenso de alegria e que se torna um estado de espírito quando contemplada com frequência. No entanto, essa emoção é desencadeada pela produção da serotonina, uma substância importante para o bem-estar.\r\nA serotonina, por sua vez, é considerada um neurotransmissor . Ela possibilita a comunicação entre os neurônios, liberando assim, sensações de prazer e alegria no indivíduo. Dessa forma, quando praticamos atividades que gostamos, fazemos exercícios físicos e nos alimentamos de forma saudável, incentivamos a produção deste importante elemento.\r\nProduzindo serotonina nos sentimos felizes e, nos sentindo felizes, temos prazer em realizar nossos afazeres. Todavia, estar feliz nos deixa alegre, sorridentes e com o poder de contagiar também quem está ao nosso redor.', 'Sobre nós', '', 'publish', 'closed', 'closed', '', 'sobre-nos', '', '', '2023-06-03 20:05:21', '2023-06-03 23:05:21', '', 0, 'http://localhost:8081/actionlabs/?page_id=31', 0, 'page', '', 0),
(32, 1, '2023-06-03 19:59:12', '2023-06-03 22:59:12', '<h2>Norem ipsum dolor sit amet, consectetur adipiscing elit.</h2>\r\n&nbsp;\r\n<p style=\"text-align: left;\">Com a Síndrome de Burnout acometendo cerca de 30% da população brasileira, tornou-se imprescindível falar e conscientizar as pessoas acerca da importância de um ambiente corporativo saudável. No entanto, a felicidade no trabalho é uma das questões que precisam de mais visibilidade e atenção das empresas.\r\nNo que diz respeito à gestão de pessoas, é esperado que a jornada do funcionário em todo o tempo de empresa seja o mais benéfica possível, levando em consideração seus pontos fortes, e também suas fragilidades. Porém, na prática, isso não acontece sempre.\r\n\r\nHoras extras, falta de feedbacks e demandas excessivas podem desencadear uma série de problemas emocionais nos colaboradores. Logo, tais elementos podem aumentar a carga de estresse no indivíduo e evoluir para o esgotamento físico e mental. Dessa forma, para sanar este problema, precisamos falar sobre a felicidade no trabalho e sua importância.\r\n\r\n\r\nOS EFEITOS DA FELICIDADE NO CORPO HUMANO\r\n\r\nA felicidade é um sentimento intenso de alegria e que se torna um estado de espírito quando contemplada com frequência. No entanto, essa emoção é desencadeada pela produção da serotonina, uma substância importante para o bem-estar.\r\nA serotonina, por sua vez, é considerada um neurotransmissor . Ela possibilita a comunicação entre os neurônios, liberando assim, sensações de prazer e alegria no indivíduo. Dessa forma, quando praticamos atividades que gostamos, fazemos exercícios físicos e nos alimentamos de forma saudável, incentivamos a produção deste importante elemento.\r\nProduzindo serotonina nos sentimos felizes e, nos sentindo felizes, temos prazer em realizar nossos afazeres. Todavia, estar feliz nos deixa alegre, sorridentes e com o poder de contagiar também quem está ao nosso redor.</p>', 'Sobre nós', '', 'inherit', 'closed', 'closed', '', '31-revision-v1', '', '', '2023-06-03 19:59:12', '2023-06-03 22:59:12', '', 31, 'http://localhost:8081/actionlabs/?p=32', 0, 'revision', '', 0),
(33, 1, '2023-06-03 19:59:37', '2023-06-03 22:59:37', '<h2>Norem ipsum dolor sit amet, consectetur adipiscing elit.</h2>\r\n&nbsp;\r\n<p style=\"text-align: left;\">Com a Síndrome de Burnout acometendo cerca de 30% da população brasileira, tornou-se imprescindível falar e conscientizar as pessoas acerca da importância de um ambiente corporativo saudável. No entanto, a felicidade no trabalho é uma das questões que precisam de mais visibilidade e atenção das empresas.\r\nNo que diz respeito à gestão de pessoas, é esperado que a jornada do funcionário em todo o tempo de empresa seja o mais benéfica possível, levando em consideração seus pontos fortes, e também suas fragilidades. Porém, na prática, isso não acontece sempre.</p>\r\nHoras extras, falta de feedbacks e demandas excessivas podem desencadear uma série de problemas emocionais nos colaboradores. Logo, tais elementos podem aumentar a carga de estresse no indivíduo e evoluir para o esgotamento físico e mental. Dessa forma, para sanar este problema, precisamos falar sobre a felicidade no trabalho e sua importância.\r\n\r\nOS EFEITOS DA FELICIDADE NO CORPO HUMANO\r\n\r\nA felicidade é um sentimento intenso de alegria e que se torna um estado de espírito quando contemplada com frequência. No entanto, essa emoção é desencadeada pela produção da serotonina, uma substância importante para o bem-estar.\r\nA serotonina, por sua vez, é considerada um neurotransmissor . Ela possibilita a comunicação entre os neurônios, liberando assim, sensações de prazer e alegria no indivíduo. Dessa forma, quando praticamos atividades que gostamos, fazemos exercícios físicos e nos alimentamos de forma saudável, incentivamos a produção deste importante elemento.\r\nProduzindo serotonina nos sentimos felizes e, nos sentindo felizes, temos prazer em realizar nossos afazeres. Todavia, estar feliz nos deixa alegre, sorridentes e com o poder de contagiar também quem está ao nosso redor.', 'Sobre nós', '', 'inherit', 'closed', 'closed', '', '31-revision-v1', '', '', '2023-06-03 19:59:37', '2023-06-03 22:59:37', '', 31, 'http://localhost:8081/actionlabs/?p=33', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `actl_termmeta`
--

DROP TABLE IF EXISTS `actl_termmeta`;
CREATE TABLE IF NOT EXISTS `actl_termmeta` (
  `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `actl_terms`
--

DROP TABLE IF EXISTS `actl_terms`;
CREATE TABLE IF NOT EXISTS `actl_terms` (
  `term_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Extraindo dados da tabela `actl_terms`
--

INSERT INTO `actl_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Conteúdos', 'conteudos', 0),
(2, 'Benefícios', 'beneficios', 0),
(3, 'Ansiedade', 'ansiedade', 0),
(4, 'Depressão e Estresse', 'depressao-e-estresse', 0),
(5, 'teste', 'teste', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `actl_term_relationships`
--

DROP TABLE IF EXISTS `actl_term_relationships`;
CREATE TABLE IF NOT EXISTS `actl_term_relationships` (
  `object_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Extraindo dados da tabela `actl_term_relationships`
--

INSERT INTO `actl_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(8, 1, 0),
(11, 1, 0),
(14, 1, 0),
(17, 1, 0),
(23, 3, 0),
(23, 2, 0),
(25, 2, 0),
(23, 4, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `actl_term_taxonomy`
--

DROP TABLE IF EXISTS `actl_term_taxonomy`;
CREATE TABLE IF NOT EXISTS `actl_term_taxonomy` (
  `term_taxonomy_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Extraindo dados da tabela `actl_term_taxonomy`
--

INSERT INTO `actl_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 4),
(2, 2, 'category', '', 0, 2),
(3, 3, 'post_tag', '', 0, 1),
(4, 4, 'post_tag', '', 0, 1),
(5, 5, 'post_tag', '', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `actl_usermeta`
--

DROP TABLE IF EXISTS `actl_usermeta`;
CREATE TABLE IF NOT EXISTS `actl_usermeta` (
  `umeta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Extraindo dados da tabela `actl_usermeta`
--

INSERT INTO `actl_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'lailson'),
(2, 1, 'first_name', 'John'),
(3, 1, 'last_name', 'Smith'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'actl_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'actl_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:\"1321a3e236c845b59db85e9ca6059cfcac475542c50c58e5e0325522e48cfa49\";a:4:{s:10:\"expiration\";i:1685986590;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36\";s:5:\"login\";i:1685813790;}}'),
(17, 1, 'actl_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'actl_persisted_preferences', 'a:2:{s:14:\"core/edit-post\";a:3:{s:26:\"isComplementaryAreaVisible\";b:1;s:12:\"welcomeGuide\";b:0;s:10:\"openPanels\";a:4:{i:0;s:11:\"post-status\";i:1;s:23:\"taxonomy-panel-category\";i:2;s:14:\"featured-image\";i:3;s:12:\"post-excerpt\";}}s:9:\"_modified\";s:24:\"2023-06-03T19:16:46.927Z\";}'),
(19, 1, 'actl_user-settings', 'libraryContent=browse'),
(20, 1, 'actl_user-settings-time', '1685819749');

-- --------------------------------------------------------

--
-- Estrutura da tabela `actl_users`
--

DROP TABLE IF EXISTS `actl_users`;
CREATE TABLE IF NOT EXISTS `actl_users` (
  `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Extraindo dados da tabela `actl_users`
--

INSERT INTO `actl_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'lailson', '$P$BDz7hWqiSVcqCE7yT5/RhO/gotv81X1', 'lailson', 'lailsonwd@gmail.com', 'http://localhost:8081/actionlabs', '2023-06-03 17:36:19', '', 0, 'John Smith');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
