-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jun 2022 pada 12.00
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_chatroom`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `acceptance`
--

CREATE TABLE `acceptance` (
  `acceptance_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` enum('active','disable','reject') NOT NULL,
  `time` varchar(100) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `acceptance`
--

INSERT INTO `acceptance` (`acceptance_id`, `name`, `email`, `status`, `time`, `topic`, `user_id`, `student_id`) VALUES
(51, 'Student', 'student@gradit.com', 'active', '2022-06-25 16:54:00', 'php', 272, 273);

-- --------------------------------------------------------

--
-- Struktur dari tabel `availability`
--

CREATE TABLE `availability` (
  `availability_id` int(11) NOT NULL,
  `mentor_id` int(11) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `availability`
--

INSERT INTO `availability` (`availability_id`, `mentor_id`, `start_time`, `end_time`) VALUES
(27, 11, '2022-05-07 09:52:00', '2022-05-07 10:52:00'),
(28, 11, '2022-05-07 09:52:00', '2022-05-07 10:52:00'),
(29, 11, '2022-05-07 09:52:00', '2022-05-07 10:52:00'),
(30, 11, '2022-05-07 09:52:00', '2022-05-07 10:52:00'),
(31, 11, '2022-05-07 09:52:00', '2022-05-07 10:52:00'),
(32, 11, '2022-05-07 11:49:00', '2022-05-07 11:53:00'),
(33, 11, '2022-05-07 11:49:35', '2022-05-07 11:49:42'),
(34, 11, '2022-05-07 12:51:01', '2022-05-14 11:51:06'),
(35, 11, '2022-05-07 12:51:01', '2022-05-14 11:51:06'),
(36, 11, '2022-05-07 11:54:07', '2022-05-07 14:54:09'),
(37, 2, '2022-05-08 15:16:42', '2022-05-08 15:16:48'),
(38, 2, '2022-05-10 16:18:00', '2022-05-09 20:17:00'),
(39, 2, '2022-05-10 19:44:42', '2022-05-10 21:44:46'),
(40, 2, '2022-05-06 19:45:00', '2022-05-03 19:45:00'),
(41, 2, '2022-05-11 00:44:26', '2022-05-11 01:44:32'),
(42, 2, '2022-05-10 23:48:58', '2022-05-11 00:49:02'),
(43, 2, '2022-05-12 06:53:33', '2022-05-12 06:53:36'),
(44, 2, '2022-05-19 06:53:47', '2022-05-26 06:53:53'),
(45, 2, '2022-05-17 06:32:24', '2022-05-17 06:32:29'),
(46, 2, '2022-05-17 06:32:24', '2022-05-17 06:32:29'),
(47, 2, '2022-05-23 06:32:24', '2022-05-24 06:32:29'),
(48, 272, '2022-06-25 09:54:00', '2022-06-25 10:54:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `chats`
--

CREATE TABLE `chats` (
  `chat_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `chats`
--

INSERT INTO `chats` (`chat_id`, `user_id`, `message`, `created_at`, `group_id`) VALUES
(99, 272, 'tes', '2022-06-24 04:56:11', 38);

-- --------------------------------------------------------

--
-- Struktur dari tabel `directus_activity`
--

CREATE TABLE `directus_activity` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(45) NOT NULL,
  `user` char(36) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip` varchar(50) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `directus_activity`
--

INSERT INTO `directus_activity` (`id`, `action`, `user`, `timestamp`, `ip`, `user_agent`, `collection`, `item`, `comment`) VALUES
(1, 'login', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 06:29:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_users', 'fb379746-e721-4844-9bcf-a64196a999c6', NULL),
(2, 'create', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 06:47:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_fields', '1', NULL),
(3, 'create', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 06:47:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_fields', '2', NULL),
(4, 'create', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 06:47:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_fields', '3', NULL),
(5, 'create', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 06:47:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_fields', '4', NULL),
(6, 'create', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 06:47:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_collections', 'user', NULL),
(7, 'create', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 06:53:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_permissions', '1', NULL),
(8, 'create', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 06:56:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_collections', 'users', NULL),
(9, 'create', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 06:56:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_permissions', '2', NULL),
(10, 'create', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 07:22:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'user', '1', NULL),
(11, 'delete', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 07:22:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'user', '1', NULL),
(12, 'create', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 07:23:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_fields', '5', NULL),
(13, 'update', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 07:23:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_fields', '1', NULL),
(14, 'update', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 07:23:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_fields', '5', NULL),
(15, 'update', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 07:23:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_fields', '2', NULL),
(16, 'update', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 07:23:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_fields', '3', NULL),
(17, 'update', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 07:23:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_fields', '4', NULL),
(18, 'create', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 07:25:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'user', '2', NULL),
(19, 'create', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 07:25:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_permissions', '3', NULL),
(20, 'create', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 07:26:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_permissions', '4', NULL),
(21, 'create', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 07:26:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_permissions', '5', NULL),
(22, 'create', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 07:26:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_permissions', '6', NULL),
(23, 'create', NULL, '2022-04-19 07:45:32', '127.0.0.1', 'PostmanRuntime/7.28.4', 'user', '3', NULL),
(24, 'create', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-19 07:47:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 'directus_permissions', '7', NULL),
(25, 'create', NULL, '2022-04-19 07:48:57', '127.0.0.1', 'PostmanRuntime/7.28.4', 'user', '4', NULL),
(26, 'create', NULL, '2022-04-19 07:49:07', '127.0.0.1', 'PostmanRuntime/7.28.4', 'user', '5', NULL),
(27, 'create', NULL, '2022-04-19 07:49:52', '127.0.0.1', 'PostmanRuntime/7.28.4', 'user', '6', NULL),
(28, 'create', NULL, '2022-04-19 07:50:01', '127.0.0.1', 'PostmanRuntime/7.28.4', 'user', '7', NULL),
(29, 'create', NULL, '2022-04-19 07:58:51', '127.0.0.1', NULL, 'user', '8', NULL),
(30, 'create', NULL, '2022-04-19 07:59:29', '127.0.0.1', NULL, 'user', '9', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `directus_collections`
--

CREATE TABLE `directus_collections` (
  `collection` varchar(64) NOT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `display_template` varchar(255) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `singleton` tinyint(1) NOT NULL DEFAULT 0,
  `translations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`translations`)),
  `archive_field` varchar(64) DEFAULT NULL,
  `archive_app_filter` tinyint(1) NOT NULL DEFAULT 1,
  `archive_value` varchar(255) DEFAULT NULL,
  `unarchive_value` varchar(255) DEFAULT NULL,
  `sort_field` varchar(64) DEFAULT NULL,
  `accountability` varchar(255) DEFAULT 'all',
  `color` varchar(255) DEFAULT NULL,
  `item_duplication_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`item_duplication_fields`)),
  `sort` int(11) DEFAULT NULL,
  `group` varchar(64) DEFAULT NULL,
  `collapse` varchar(255) NOT NULL DEFAULT 'open'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `directus_collections`
--

INSERT INTO `directus_collections` (`collection`, `icon`, `note`, `display_template`, `hidden`, `singleton`, `translations`, `archive_field`, `archive_app_filter`, `archive_value`, `unarchive_value`, `sort_field`, `accountability`, `color`, `item_duplication_fields`, `sort`, `group`, `collapse`) VALUES
('user', NULL, NULL, NULL, 0, 0, NULL, 'status', 1, 'archived', 'draft', NULL, 'all', NULL, NULL, NULL, NULL, 'open'),
('users', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open');

-- --------------------------------------------------------

--
-- Struktur dari tabel `directus_dashboards`
--

CREATE TABLE `directus_dashboards` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(30) NOT NULL DEFAULT 'dashboard',
  `note` text DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `directus_fields`
--

CREATE TABLE `directus_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `collection` varchar(64) NOT NULL,
  `field` varchar(64) NOT NULL,
  `special` varchar(64) DEFAULT NULL,
  `interface` varchar(64) DEFAULT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `display` varchar(64) DEFAULT NULL,
  `display_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`display_options`)),
  `readonly` tinyint(1) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `sort` int(10) UNSIGNED DEFAULT NULL,
  `width` varchar(30) DEFAULT 'full',
  `translations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`translations`)),
  `note` text DEFAULT NULL,
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `required` tinyint(1) DEFAULT 0,
  `group` varchar(64) DEFAULT NULL,
  `validation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`validation`)),
  `validation_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `directus_fields`
--

INSERT INTO `directus_fields` (`id`, `collection`, `field`, `special`, `interface`, `options`, `display`, `display_options`, `readonly`, `hidden`, `sort`, `width`, `translations`, `note`, `conditions`, `required`, `group`, `validation`, `validation_message`) VALUES
(1, 'user', 'id', NULL, 'input', NULL, NULL, NULL, 1, 1, 1, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(2, 'user', 'status', NULL, 'select-dropdown', '{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}', 'labels', '{\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}', 0, 0, 3, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(3, 'user', 'user_created', 'user-created', 'select-dropdown-m2o', '{\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}', 'user', NULL, 1, 1, 4, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(4, 'user', 'date_created', 'date-created', 'datetime', NULL, 'datetime', '{\"relative\": true}', 1, 1, 5, 'half', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(5, 'user', 'namae', NULL, 'input', '{\"placeholder\": \"isikan nama anda\"}', NULL, NULL, 0, 0, 2, 'full', NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `directus_files`
--

CREATE TABLE `directus_files` (
  `id` char(36) NOT NULL,
  `storage` varchar(255) NOT NULL,
  `filename_disk` varchar(255) DEFAULT NULL,
  `filename_download` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `folder` char(36) DEFAULT NULL,
  `uploaded_by` char(36) DEFAULT NULL,
  `uploaded_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_by` char(36) DEFAULT NULL,
  `modified_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `charset` varchar(50) DEFAULT NULL,
  `filesize` bigint(20) DEFAULT NULL,
  `width` int(10) UNSIGNED DEFAULT NULL,
  `height` int(10) UNSIGNED DEFAULT NULL,
  `duration` int(10) UNSIGNED DEFAULT NULL,
  `embed` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `directus_folders`
--

CREATE TABLE `directus_folders` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `directus_migrations`
--

CREATE TABLE `directus_migrations` (
  `version` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `directus_migrations`
--

INSERT INTO `directus_migrations` (`version`, `name`, `timestamp`) VALUES
('20201028A', 'Remove Collection Foreign Keys', '2022-04-19 06:27:13'),
('20201029A', 'Remove System Relations', '2022-04-19 06:27:13'),
('20201029B', 'Remove System Collections', '2022-04-19 06:27:13'),
('20201029C', 'Remove System Fields', '2022-04-19 06:27:13'),
('20201105A', 'Add Cascade System Relations', '2022-04-19 06:27:14'),
('20201105B', 'Change Webhook URL Type', '2022-04-19 06:27:14'),
('20210225A', 'Add Relations Sort Field', '2022-04-19 06:27:14'),
('20210304A', 'Remove Locked Fields', '2022-04-19 06:27:14'),
('20210312A', 'Webhooks Collections Text', '2022-04-19 06:27:14'),
('20210331A', 'Add Refresh Interval', '2022-04-19 06:27:14'),
('20210415A', 'Make Filesize Nullable', '2022-04-19 06:27:14'),
('20210416A', 'Add Collections Accountability', '2022-04-19 06:27:14'),
('20210422A', 'Remove Files Interface', '2022-04-19 06:27:14'),
('20210506A', 'Rename Interfaces', '2022-04-19 06:27:14'),
('20210510A', 'Restructure Relations', '2022-04-19 06:27:15'),
('20210518A', 'Add Foreign Key Constraints', '2022-04-19 06:27:16'),
('20210519A', 'Add System Fk Triggers', '2022-04-19 06:27:17'),
('20210521A', 'Add Collections Icon Color', '2022-04-19 06:27:17'),
('20210525A', 'Add Insights', '2022-04-19 06:27:17'),
('20210608A', 'Add Deep Clone Config', '2022-04-19 06:27:18'),
('20210626A', 'Change Filesize Bigint', '2022-04-19 06:27:18'),
('20210716A', 'Add Conditions to Fields', '2022-04-19 06:27:18'),
('20210721A', 'Add Default Folder', '2022-04-19 06:27:18'),
('20210802A', 'Replace Groups', '2022-04-19 06:27:18'),
('20210803A', 'Add Required to Fields', '2022-04-19 06:27:18'),
('20210805A', 'Update Groups', '2022-04-19 06:27:18'),
('20210805B', 'Change Image Metadata Structure', '2022-04-19 06:27:18'),
('20210811A', 'Add Geometry Config', '2022-04-19 06:27:18'),
('20210831A', 'Remove Limit Column', '2022-04-19 06:27:18'),
('20210903A', 'Add Auth Provider', '2022-04-19 06:27:18'),
('20210907A', 'Webhooks Collections Not Null', '2022-04-19 06:27:18'),
('20210910A', 'Move Module Setup', '2022-04-19 06:27:19'),
('20210920A', 'Webhooks URL Not Null', '2022-04-19 06:27:19'),
('20210924A', 'Add Collection Organization', '2022-04-19 06:27:19'),
('20210927A', 'Replace Fields Group', '2022-04-19 06:27:19'),
('20210927B', 'Replace M2M Interface', '2022-04-19 06:27:19'),
('20210929A', 'Rename Login Action', '2022-04-19 06:27:19'),
('20211007A', 'Update Presets', '2022-04-19 06:27:19'),
('20211009A', 'Add Auth Data', '2022-04-19 06:27:19'),
('20211016A', 'Add Webhook Headers', '2022-04-19 06:27:19'),
('20211103A', 'Set Unique to User Token', '2022-04-19 06:27:19'),
('20211103B', 'Update Special Geometry', '2022-04-19 06:27:19'),
('20211104A', 'Remove Collections Listing', '2022-04-19 06:27:19'),
('20211118A', 'Add Notifications', '2022-04-19 06:27:19'),
('20211211A', 'Add Shares', '2022-04-19 06:27:20'),
('20211230A', 'Add Project Descriptor', '2022-04-19 06:27:20'),
('20220303A', 'Remove Default Project Color', '2022-04-19 06:27:20'),
('20220308A', 'Add Bookmark Icon and Color', '2022-04-19 06:27:20'),
('20220314A', 'Add Translation Strings', '2022-04-19 06:27:20'),
('20220322A', 'Rename Field Typecast Flags', '2022-04-19 06:27:20'),
('20220323A', 'Add Field Validation', '2022-04-19 06:27:20'),
('20220325A', 'Fix Typecast Flags', '2022-04-19 06:27:20'),
('20220325B', 'Add Default Language', '2022-04-19 06:27:20'),
('20220402A', 'Remove Default Value Panel Icon', '2022-04-19 06:27:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `directus_notifications`
--

CREATE TABLE `directus_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(255) DEFAULT 'inbox',
  `recipient` char(36) NOT NULL,
  `sender` char(36) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `collection` varchar(64) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `directus_panels`
--

CREATE TABLE `directus_panels` (
  `id` char(36) NOT NULL,
  `dashboard` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `show_header` tinyint(1) NOT NULL DEFAULT 0,
  `note` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `position_x` int(11) NOT NULL,
  `position_y` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `date_created` timestamp NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `directus_permissions`
--

CREATE TABLE `directus_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` char(36) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `action` varchar(10) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `validation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`validation`)),
  `presets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`presets`)),
  `fields` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `directus_permissions`
--

INSERT INTO `directus_permissions` (`id`, `role`, `collection`, `action`, `permissions`, `validation`, `presets`, `fields`) VALUES
(1, NULL, 'user', 'read', '{}', '{}', NULL, '*'),
(2, NULL, 'users', 'read', '{}', '{}', NULL, '*'),
(3, NULL, 'user', 'create', '{}', '{}', NULL, '*'),
(4, NULL, 'user', 'update', '{}', '{}', NULL, '*'),
(5, NULL, 'user', 'delete', '{}', '{}', NULL, '*'),
(6, NULL, 'user', 'share', '{}', '{}', NULL, '*'),
(7, NULL, 'users', 'create', '{}', '{}', NULL, '*');

-- --------------------------------------------------------

--
-- Struktur dari tabel `directus_presets`
--

CREATE TABLE `directus_presets` (
  `id` int(10) UNSIGNED NOT NULL,
  `bookmark` varchar(255) DEFAULT NULL,
  `user` char(36) DEFAULT NULL,
  `role` char(36) DEFAULT NULL,
  `collection` varchar(64) DEFAULT NULL,
  `search` varchar(100) DEFAULT NULL,
  `layout` varchar(100) DEFAULT 'tabular',
  `layout_query` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`layout_query`)),
  `layout_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`layout_options`)),
  `refresh_interval` int(11) DEFAULT NULL,
  `filter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`filter`)),
  `icon` varchar(30) NOT NULL DEFAULT 'bookmark_outline',
  `color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `directus_presets`
--

INSERT INTO `directus_presets` (`id`, `bookmark`, `user`, `role`, `collection`, `search`, `layout`, `layout_query`, `layout_options`, `refresh_interval`, `filter`, `icon`, `color`) VALUES
(1, NULL, 'fb379746-e721-4844-9bcf-a64196a999c6', NULL, 'directus_users', NULL, 'cards', '{\"cards\": {\"page\": 1, \"sort\": [\"email\"]}}', '{\"cards\": {\"icon\": \"account_circle\", \"size\": 4, \"title\": \"{{ first_name }} {{ last_name }}\", \"subtitle\": \"{{ email }}\"}}', NULL, NULL, 'bookmark_outline', NULL),
(2, NULL, 'fb379746-e721-4844-9bcf-a64196a999c6', NULL, 'user', NULL, NULL, NULL, NULL, 60, NULL, 'bookmark_outline', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `directus_relations`
--

CREATE TABLE `directus_relations` (
  `id` int(10) UNSIGNED NOT NULL,
  `many_collection` varchar(64) NOT NULL,
  `many_field` varchar(64) NOT NULL,
  `one_collection` varchar(64) DEFAULT NULL,
  `one_field` varchar(64) DEFAULT NULL,
  `one_collection_field` varchar(64) DEFAULT NULL,
  `one_allowed_collections` text DEFAULT NULL,
  `junction_field` varchar(64) DEFAULT NULL,
  `sort_field` varchar(64) DEFAULT NULL,
  `one_deselect_action` varchar(255) NOT NULL DEFAULT 'nullify'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `directus_relations`
--

INSERT INTO `directus_relations` (`id`, `many_collection`, `many_field`, `one_collection`, `one_field`, `one_collection_field`, `one_allowed_collections`, `junction_field`, `sort_field`, `one_deselect_action`) VALUES
(1, 'user', 'user_created', 'directus_users', NULL, NULL, NULL, NULL, NULL, 'nullify');

-- --------------------------------------------------------

--
-- Struktur dari tabel `directus_revisions`
--

CREATE TABLE `directus_revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `activity` int(10) UNSIGNED NOT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `delta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`delta`)),
  `parent` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `directus_revisions`
--

INSERT INTO `directus_revisions` (`id`, `activity`, `collection`, `item`, `data`, `delta`, `parent`) VALUES
(1, 2, 'directus_fields', '1', '{\"field\": \"id\", \"hidden\": true, \"readonly\": true, \"interface\": \"input\", \"collection\": \"user\"}', '{\"field\": \"id\", \"hidden\": true, \"readonly\": true, \"interface\": \"input\", \"collection\": \"user\"}', NULL),
(2, 3, 'directus_fields', '2', '{\"field\": \"status\", \"width\": \"full\", \"display\": \"labels\", \"options\": {\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}, \"interface\": \"select-dropdown\", \"collection\": \"user\", \"display_options\": {\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}}', '{\"field\": \"status\", \"width\": \"full\", \"display\": \"labels\", \"options\": {\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}, \"interface\": \"select-dropdown\", \"collection\": \"user\", \"display_options\": {\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}}', NULL),
(3, 4, 'directus_fields', '3', '{\"field\": \"user_created\", \"width\": \"half\", \"hidden\": true, \"display\": \"user\", \"options\": {\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}, \"special\": \"user-created\", \"readonly\": true, \"interface\": \"select-dropdown-m2o\", \"collection\": \"user\"}', '{\"field\": \"user_created\", \"width\": \"half\", \"hidden\": true, \"display\": \"user\", \"options\": {\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}, \"special\": \"user-created\", \"readonly\": true, \"interface\": \"select-dropdown-m2o\", \"collection\": \"user\"}', NULL),
(4, 5, 'directus_fields', '4', '{\"field\": \"date_created\", \"width\": \"half\", \"hidden\": true, \"display\": \"datetime\", \"special\": \"date-created\", \"readonly\": true, \"interface\": \"datetime\", \"collection\": \"user\", \"display_options\": {\"relative\": true}}', '{\"field\": \"date_created\", \"width\": \"half\", \"hidden\": true, \"display\": \"datetime\", \"special\": \"date-created\", \"readonly\": true, \"interface\": \"datetime\", \"collection\": \"user\", \"display_options\": {\"relative\": true}}', NULL),
(5, 6, 'directus_collections', 'user', '{\"singleton\": false, \"collection\": \"user\", \"archive_field\": \"status\", \"archive_value\": \"archived\", \"unarchive_value\": \"draft\"}', '{\"singleton\": false, \"collection\": \"user\", \"archive_field\": \"status\", \"archive_value\": \"archived\", \"unarchive_value\": \"draft\"}', NULL),
(6, 7, 'directus_permissions', '1', '{\"role\": null, \"action\": \"read\", \"fields\": [\"*\"], \"collection\": \"user\", \"validation\": {}, \"permissions\": {}}', '{\"role\": null, \"action\": \"read\", \"fields\": [\"*\"], \"collection\": \"user\", \"validation\": {}, \"permissions\": {}}', NULL),
(7, 8, 'directus_collections', 'users', '{\"collection\": \"users\"}', '{\"collection\": \"users\"}', NULL),
(8, 9, 'directus_permissions', '2', '{\"role\": null, \"action\": \"read\", \"fields\": [\"*\"], \"collection\": \"users\", \"validation\": {}, \"permissions\": {}}', '{\"role\": null, \"action\": \"read\", \"fields\": [\"*\"], \"collection\": \"users\", \"validation\": {}, \"permissions\": {}}', NULL),
(9, 10, 'user', '1', '{}', '{}', NULL),
(10, 12, 'directus_fields', '5', '{\"field\": \"namae\", \"options\": {\"placeholder\": \"isikan nama anda\"}, \"special\": null, \"interface\": \"input\", \"collection\": \"user\"}', '{\"field\": \"namae\", \"options\": {\"placeholder\": \"isikan nama anda\"}, \"special\": null, \"interface\": \"input\", \"collection\": \"user\"}', NULL),
(11, 13, 'directus_fields', '1', '{\"id\": 1, \"note\": null, \"sort\": 1, \"field\": \"id\", \"group\": null, \"width\": \"full\", \"hidden\": true, \"display\": null, \"options\": null, \"special\": null, \"readonly\": true, \"required\": false, \"interface\": \"input\", \"collection\": \"user\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}', '{\"sort\": 1, \"field\": \"id\", \"group\": null, \"collection\": \"user\"}', NULL),
(12, 14, 'directus_fields', '5', '{\"id\": 5, \"note\": null, \"sort\": 2, \"field\": \"namae\", \"group\": null, \"width\": \"full\", \"hidden\": false, \"display\": null, \"options\": {\"placeholder\": \"isikan nama anda\"}, \"special\": null, \"readonly\": false, \"required\": false, \"interface\": \"input\", \"collection\": \"user\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}', '{\"sort\": 2, \"field\": \"namae\", \"group\": null, \"collection\": \"user\"}', NULL),
(13, 15, 'directus_fields', '2', '{\"id\": 2, \"note\": null, \"sort\": 3, \"field\": \"status\", \"group\": null, \"width\": \"full\", \"hidden\": false, \"display\": \"labels\", \"options\": {\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\"}, {\"text\": \"$t:draft\", \"value\": \"draft\"}, {\"text\": \"$t:archived\", \"value\": \"archived\"}]}, \"special\": null, \"readonly\": false, \"required\": false, \"interface\": \"select-dropdown\", \"collection\": \"user\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": {\"choices\": [{\"text\": \"$t:published\", \"value\": \"published\", \"background\": \"var(--primary)\", \"foreground\": \"#FFFFFF\"}, {\"text\": \"$t:draft\", \"value\": \"draft\", \"background\": \"#D3DAE4\", \"foreground\": \"#18222F\"}, {\"text\": \"$t:archived\", \"value\": \"archived\", \"background\": \"var(--warning)\", \"foreground\": \"#FFFFFF\"}], \"showAsDot\": true}, \"validation_message\": null}', '{\"sort\": 3, \"field\": \"status\", \"group\": null, \"collection\": \"user\"}', NULL),
(14, 16, 'directus_fields', '3', '{\"id\": 3, \"note\": null, \"sort\": 4, \"field\": \"user_created\", \"group\": null, \"width\": \"half\", \"hidden\": true, \"display\": \"user\", \"options\": {\"template\": \"{{avatar.$thumbnail}} {{first_name}} {{last_name}}\"}, \"special\": [\"user-created\"], \"readonly\": true, \"required\": false, \"interface\": \"select-dropdown-m2o\", \"collection\": \"user\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": null, \"validation_message\": null}', '{\"sort\": 4, \"field\": \"user_created\", \"group\": null, \"collection\": \"user\"}', NULL),
(15, 17, 'directus_fields', '4', '{\"id\": 4, \"note\": null, \"sort\": 5, \"field\": \"date_created\", \"group\": null, \"width\": \"half\", \"hidden\": true, \"display\": \"datetime\", \"options\": null, \"special\": [\"date-created\"], \"readonly\": true, \"required\": false, \"interface\": \"datetime\", \"collection\": \"user\", \"conditions\": null, \"validation\": null, \"translations\": null, \"display_options\": {\"relative\": true}, \"validation_message\": null}', '{\"sort\": 5, \"field\": \"date_created\", \"group\": null, \"collection\": \"user\"}', NULL),
(16, 18, 'user', '2', '{\"namae\": \"farhan\", \"status\": \"published\"}', '{\"namae\": \"farhan\", \"status\": \"published\"}', NULL),
(17, 19, 'directus_permissions', '3', '{\"role\": null, \"action\": \"create\", \"fields\": [\"*\"], \"collection\": \"user\", \"validation\": {}, \"permissions\": {}}', '{\"role\": null, \"action\": \"create\", \"fields\": [\"*\"], \"collection\": \"user\", \"validation\": {}, \"permissions\": {}}', NULL),
(18, 20, 'directus_permissions', '4', '{\"role\": null, \"action\": \"update\", \"fields\": [\"*\"], \"collection\": \"user\", \"validation\": {}, \"permissions\": {}}', '{\"role\": null, \"action\": \"update\", \"fields\": [\"*\"], \"collection\": \"user\", \"validation\": {}, \"permissions\": {}}', NULL),
(19, 21, 'directus_permissions', '5', '{\"role\": null, \"action\": \"delete\", \"fields\": [\"*\"], \"collection\": \"user\", \"validation\": {}, \"permissions\": {}}', '{\"role\": null, \"action\": \"delete\", \"fields\": [\"*\"], \"collection\": \"user\", \"validation\": {}, \"permissions\": {}}', NULL),
(20, 22, 'directus_permissions', '6', '{\"role\": null, \"action\": \"share\", \"fields\": [\"*\"], \"collection\": \"user\", \"validation\": {}, \"permissions\": {}}', '{\"role\": null, \"action\": \"share\", \"fields\": [\"*\"], \"collection\": \"user\", \"validation\": {}, \"permissions\": {}}', NULL),
(21, 23, 'user', '3', '{}', '{}', NULL),
(22, 24, 'directus_permissions', '7', '{\"role\": null, \"action\": \"create\", \"fields\": [\"*\"], \"collection\": \"users\", \"validation\": {}, \"permissions\": {}}', '{\"role\": null, \"action\": \"create\", \"fields\": [\"*\"], \"collection\": \"users\", \"validation\": {}, \"permissions\": {}}', NULL),
(23, 25, 'user', '4', '{}', '{}', NULL),
(24, 26, 'user', '5', '{}', '{}', NULL),
(25, 27, 'user', '6', '{}', '{}', NULL),
(26, 28, 'user', '7', '{}', '{}', NULL),
(27, 29, 'user', '8', '{}', '{}', NULL),
(28, 30, 'user', '9', '{}', '{}', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `directus_roles`
--

CREATE TABLE `directus_roles` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon` varchar(30) NOT NULL DEFAULT 'supervised_user_circle',
  `description` text DEFAULT NULL,
  `ip_access` text DEFAULT NULL,
  `enforce_tfa` tinyint(1) NOT NULL DEFAULT 0,
  `admin_access` tinyint(1) NOT NULL DEFAULT 0,
  `app_access` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `directus_roles`
--

INSERT INTO `directus_roles` (`id`, `name`, `icon`, `description`, `ip_access`, `enforce_tfa`, `admin_access`, `app_access`) VALUES
('70cfe8e0-6bda-43ac-81e5-05ec012cd273', 'Administrator', 'verified', '$t:admin_description', NULL, 0, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `directus_sessions`
--

CREATE TABLE `directus_sessions` (
  `token` varchar(64) NOT NULL,
  `user` char(36) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `share` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `directus_sessions`
--

INSERT INTO `directus_sessions` (`token`, `user`, `expires`, `ip`, `user_agent`, `share`) VALUES
('MRTvalPb8J9RcI-KrJlQkB8KHCwgtVOKWzWn9dvirsZBDLhynRnk9ECjJapIH_7d', 'fb379746-e721-4844-9bcf-a64196a999c6', '2022-04-26 09:21:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `directus_settings`
--

CREATE TABLE `directus_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_name` varchar(100) NOT NULL DEFAULT 'Directus',
  `project_url` varchar(255) DEFAULT NULL,
  `project_color` varchar(50) DEFAULT NULL,
  `project_logo` char(36) DEFAULT NULL,
  `public_foreground` char(36) DEFAULT NULL,
  `public_background` char(36) DEFAULT NULL,
  `public_note` text DEFAULT NULL,
  `auth_login_attempts` int(10) UNSIGNED DEFAULT 25,
  `auth_password_policy` varchar(100) DEFAULT NULL,
  `storage_asset_transform` varchar(7) DEFAULT 'all',
  `storage_asset_presets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`storage_asset_presets`)),
  `custom_css` text DEFAULT NULL,
  `storage_default_folder` char(36) DEFAULT NULL,
  `basemaps` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`basemaps`)),
  `mapbox_key` varchar(255) DEFAULT NULL,
  `module_bar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`module_bar`)),
  `project_descriptor` varchar(100) DEFAULT NULL,
  `translation_strings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`translation_strings`)),
  `default_language` varchar(255) NOT NULL DEFAULT 'en-US'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `directus_shares`
--

CREATE TABLE `directus_shares` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `collection` varchar(64) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `role` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT current_timestamp(),
  `date_start` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `times_used` int(11) DEFAULT 0,
  `max_uses` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `directus_users`
--

CREATE TABLE `directus_users` (
  `id` char(36) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `avatar` char(36) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `theme` varchar(20) DEFAULT 'auto',
  `tfa_secret` varchar(255) DEFAULT NULL,
  `status` varchar(16) NOT NULL DEFAULT 'active',
  `role` char(36) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `last_access` timestamp NULL DEFAULT NULL,
  `last_page` varchar(255) DEFAULT NULL,
  `provider` varchar(128) NOT NULL DEFAULT 'default',
  `external_identifier` varchar(255) DEFAULT NULL,
  `auth_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`auth_data`)),
  `email_notifications` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `directus_users`
--

INSERT INTO `directus_users` (`id`, `first_name`, `last_name`, `email`, `password`, `location`, `title`, `description`, `tags`, `avatar`, `language`, `theme`, `tfa_secret`, `status`, `role`, `token`, `last_access`, `last_page`, `provider`, `external_identifier`, `auth_data`, `email_notifications`) VALUES
('fb379746-e721-4844-9bcf-a64196a999c6', 'Admin', 'User', 'admin@example.com', '$argon2i$v=19$m=4096,t=3,p=1$17ajV3C++6Co25wOMXL2EQ$wPg8Ut17tR+b+2q5YF+13r/tSkcdyLGsLBrcAIi8Tl0', NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, 'active', '70cfe8e0-6bda-43ac-81e5-05ec012cd273', NULL, '2022-04-19 09:21:55', '/settings/roles/public', 'default', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `directus_webhooks`
--

CREATE TABLE `directus_webhooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `method` varchar(10) NOT NULL DEFAULT 'POST',
  `url` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active',
  `data` tinyint(1) NOT NULL DEFAULT 1,
  `actions` varchar(100) NOT NULL,
  `collections` varchar(255) NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headers`))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `groups`
--

CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `groups`
--

INSERT INTO `groups` (`group_id`, `group_name`, `status`) VALUES
(38, 'php', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `group_chat`
--

CREATE TABLE `group_chat` (
  `group_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `port_id` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `group_chat`
--

INSERT INTO `group_chat` (`group_id`, `status`, `port_id`, `create_at`) VALUES
(1, 'active', 60001, '2022-04-13 05:27:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ports`
--

CREATE TABLE `ports` (
  `port_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ports`
--

INSERT INTO `ports` (`port_id`, `value`, `status`, `group_id`) VALUES
(1, 60001, 0, 0),
(2, 60002, 0, 3),
(3, 60003, 0, 5),
(4, 8080, 0, 6),
(5, 60004, 0, 7),
(6, 60005, 0, 8),
(7, 60006, 0, 9),
(8, 60007, 0, 10),
(9, 60008, 0, 11),
(15, 60009, 0, 12),
(16, 60010, 0, 14),
(17, 60011, 0, 1),
(18, 60012, 0, 15),
(19, 60013, 0, 32),
(20, 60014, 0, 33),
(21, 60015, 0, 37);

-- --------------------------------------------------------

--
-- Struktur dari tabel `privillage_group`
--

CREATE TABLE `privillage_group` (
  `privillage_group_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `privillage_group`
--

INSERT INTO `privillage_group` (`privillage_group_id`, `status`, `group_id`, `user_id`) VALUES
(22, 0, 0, 0),
(23, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `login_status` tinyint(4) NOT NULL,
  `last_login` datetime NOT NULL,
  `role` int(11) NOT NULL,
  `privillage_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `login_status`, `last_login`, `role`, `privillage_group_id`) VALUES
(1, 'Admin', 'admin@gmail.com', '123', 0, '2022-05-13 06:34:37', 1, 0),
(2, 'lecture', 'lecture.dummy@gmail.com', '123', 0, '2022-05-13 06:34:37', 2, 0),
(3, 'student', 'student.dummy@gmail.com', '123', 0, '2022-05-13 06:34:37', 3, 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `acceptance`
--
ALTER TABLE `acceptance`
  ADD PRIMARY KEY (`acceptance_id`);

--
-- Indeks untuk tabel `availability`
--
ALTER TABLE `availability`
  ADD PRIMARY KEY (`availability_id`);

--
-- Indeks untuk tabel `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`chat_id`);

--
-- Indeks untuk tabel `directus_activity`
--
ALTER TABLE `directus_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_activity_collection_foreign` (`collection`);

--
-- Indeks untuk tabel `directus_collections`
--
ALTER TABLE `directus_collections`
  ADD PRIMARY KEY (`collection`),
  ADD KEY `directus_collections_group_foreign` (`group`);

--
-- Indeks untuk tabel `directus_dashboards`
--
ALTER TABLE `directus_dashboards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_dashboards_user_created_foreign` (`user_created`);

--
-- Indeks untuk tabel `directus_fields`
--
ALTER TABLE `directus_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_fields_collection_foreign` (`collection`);

--
-- Indeks untuk tabel `directus_files`
--
ALTER TABLE `directus_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_files_uploaded_by_foreign` (`uploaded_by`),
  ADD KEY `directus_files_modified_by_foreign` (`modified_by`),
  ADD KEY `directus_files_folder_foreign` (`folder`);

--
-- Indeks untuk tabel `directus_folders`
--
ALTER TABLE `directus_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_folders_parent_foreign` (`parent`);

--
-- Indeks untuk tabel `directus_migrations`
--
ALTER TABLE `directus_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indeks untuk tabel `directus_notifications`
--
ALTER TABLE `directus_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_notifications_recipient_foreign` (`recipient`),
  ADD KEY `directus_notifications_sender_foreign` (`sender`);

--
-- Indeks untuk tabel `directus_panels`
--
ALTER TABLE `directus_panels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_panels_dashboard_foreign` (`dashboard`),
  ADD KEY `directus_panels_user_created_foreign` (`user_created`);

--
-- Indeks untuk tabel `directus_permissions`
--
ALTER TABLE `directus_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_permissions_collection_foreign` (`collection`),
  ADD KEY `directus_permissions_role_foreign` (`role`);

--
-- Indeks untuk tabel `directus_presets`
--
ALTER TABLE `directus_presets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_presets_collection_foreign` (`collection`),
  ADD KEY `directus_presets_user_foreign` (`user`),
  ADD KEY `directus_presets_role_foreign` (`role`);

--
-- Indeks untuk tabel `directus_relations`
--
ALTER TABLE `directus_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_relations_many_collection_foreign` (`many_collection`),
  ADD KEY `directus_relations_one_collection_foreign` (`one_collection`);

--
-- Indeks untuk tabel `directus_revisions`
--
ALTER TABLE `directus_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_revisions_collection_foreign` (`collection`),
  ADD KEY `directus_revisions_parent_foreign` (`parent`),
  ADD KEY `directus_revisions_activity_foreign` (`activity`);

--
-- Indeks untuk tabel `directus_roles`
--
ALTER TABLE `directus_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `directus_sessions`
--
ALTER TABLE `directus_sessions`
  ADD PRIMARY KEY (`token`),
  ADD KEY `directus_sessions_user_foreign` (`user`),
  ADD KEY `directus_sessions_share_foreign` (`share`);

--
-- Indeks untuk tabel `directus_settings`
--
ALTER TABLE `directus_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_settings_project_logo_foreign` (`project_logo`),
  ADD KEY `directus_settings_public_foreground_foreign` (`public_foreground`),
  ADD KEY `directus_settings_public_background_foreign` (`public_background`),
  ADD KEY `directus_settings_storage_default_folder_foreign` (`storage_default_folder`);

--
-- Indeks untuk tabel `directus_shares`
--
ALTER TABLE `directus_shares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directus_shares_collection_foreign` (`collection`),
  ADD KEY `directus_shares_role_foreign` (`role`),
  ADD KEY `directus_shares_user_created_foreign` (`user_created`);

--
-- Indeks untuk tabel `directus_users`
--
ALTER TABLE `directus_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `directus_users_external_identifier_unique` (`external_identifier`),
  ADD UNIQUE KEY `directus_users_email_unique` (`email`),
  ADD UNIQUE KEY `directus_users_token_unique` (`token`),
  ADD KEY `directus_users_role_foreign` (`role`);

--
-- Indeks untuk tabel `directus_webhooks`
--
ALTER TABLE `directus_webhooks`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indeks untuk tabel `group_chat`
--
ALTER TABLE `group_chat`
  ADD PRIMARY KEY (`group_id`);

--
-- Indeks untuk tabel `ports`
--
ALTER TABLE `ports`
  ADD PRIMARY KEY (`port_id`);

--
-- Indeks untuk tabel `privillage_group`
--
ALTER TABLE `privillage_group`
  ADD PRIMARY KEY (`privillage_group_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `acceptance`
--
ALTER TABLE `acceptance`
  MODIFY `acceptance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT untuk tabel `availability`
--
ALTER TABLE `availability`
  MODIFY `availability_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `chats`
--
ALTER TABLE `chats`
  MODIFY `chat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT untuk tabel `directus_activity`
--
ALTER TABLE `directus_activity`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `directus_fields`
--
ALTER TABLE `directus_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `directus_notifications`
--
ALTER TABLE `directus_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `directus_permissions`
--
ALTER TABLE `directus_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `directus_presets`
--
ALTER TABLE `directus_presets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `directus_relations`
--
ALTER TABLE `directus_relations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `directus_revisions`
--
ALTER TABLE `directus_revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `directus_settings`
--
ALTER TABLE `directus_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `directus_webhooks`
--
ALTER TABLE `directus_webhooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `group_chat`
--
ALTER TABLE `group_chat`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `ports`
--
ALTER TABLE `ports`
  MODIFY `port_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `privillage_group`
--
ALTER TABLE `privillage_group`
  MODIFY `privillage_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `directus_collections`
--
ALTER TABLE `directus_collections`
  ADD CONSTRAINT `directus_collections_group_foreign` FOREIGN KEY (`group`) REFERENCES `directus_collections` (`collection`);

--
-- Ketidakleluasaan untuk tabel `directus_dashboards`
--
ALTER TABLE `directus_dashboards`
  ADD CONSTRAINT `directus_dashboards_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `directus_files`
--
ALTER TABLE `directus_files`
  ADD CONSTRAINT `directus_files_folder_foreign` FOREIGN KEY (`folder`) REFERENCES `directus_folders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `directus_files_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `directus_users` (`id`),
  ADD CONSTRAINT `directus_files_uploaded_by_foreign` FOREIGN KEY (`uploaded_by`) REFERENCES `directus_users` (`id`);

--
-- Ketidakleluasaan untuk tabel `directus_folders`
--
ALTER TABLE `directus_folders`
  ADD CONSTRAINT `directus_folders_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `directus_folders` (`id`);

--
-- Ketidakleluasaan untuk tabel `directus_notifications`
--
ALTER TABLE `directus_notifications`
  ADD CONSTRAINT `directus_notifications_recipient_foreign` FOREIGN KEY (`recipient`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_notifications_sender_foreign` FOREIGN KEY (`sender`) REFERENCES `directus_users` (`id`);

--
-- Ketidakleluasaan untuk tabel `directus_panels`
--
ALTER TABLE `directus_panels`
  ADD CONSTRAINT `directus_panels_dashboard_foreign` FOREIGN KEY (`dashboard`) REFERENCES `directus_dashboards` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_panels_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `directus_permissions`
--
ALTER TABLE `directus_permissions`
  ADD CONSTRAINT `directus_permissions_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `directus_presets`
--
ALTER TABLE `directus_presets`
  ADD CONSTRAINT `directus_presets_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_presets_user_foreign` FOREIGN KEY (`user`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `directus_revisions`
--
ALTER TABLE `directus_revisions`
  ADD CONSTRAINT `directus_revisions_activity_foreign` FOREIGN KEY (`activity`) REFERENCES `directus_activity` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_revisions_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `directus_revisions` (`id`);

--
-- Ketidakleluasaan untuk tabel `directus_sessions`
--
ALTER TABLE `directus_sessions`
  ADD CONSTRAINT `directus_sessions_share_foreign` FOREIGN KEY (`share`) REFERENCES `directus_shares` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_sessions_user_foreign` FOREIGN KEY (`user`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `directus_settings`
--
ALTER TABLE `directus_settings`
  ADD CONSTRAINT `directus_settings_project_logo_foreign` FOREIGN KEY (`project_logo`) REFERENCES `directus_files` (`id`),
  ADD CONSTRAINT `directus_settings_public_background_foreign` FOREIGN KEY (`public_background`) REFERENCES `directus_files` (`id`),
  ADD CONSTRAINT `directus_settings_public_foreground_foreign` FOREIGN KEY (`public_foreground`) REFERENCES `directus_files` (`id`),
  ADD CONSTRAINT `directus_settings_storage_default_folder_foreign` FOREIGN KEY (`storage_default_folder`) REFERENCES `directus_folders` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `directus_shares`
--
ALTER TABLE `directus_shares`
  ADD CONSTRAINT `directus_shares_collection_foreign` FOREIGN KEY (`collection`) REFERENCES `directus_collections` (`collection`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_shares_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `directus_shares_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `directus_users`
--
ALTER TABLE `directus_users`
  ADD CONSTRAINT `directus_users_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
