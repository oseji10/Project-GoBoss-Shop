-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 03, 2023 at 09:13 AM
-- Server version: 5.7.23-23
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `boomhubs_goboss`
--

-- --------------------------------------------------------

--
-- Table structure for table `abusive_reports`
--

CREATE TABLE `abusive_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `address` json NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `title`, `type`, `default`, `address`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 'Billing', 'billing', 0, '{\"zip\": \"99614\", \"city\": \"Kipnuk\", \"state\": \"AK\", \"country\": \"United States\", \"street_address\": \"2231 Kidd Avenue\"}', 3, '2021-08-18 19:18:03', '2021-08-18 19:18:03'),
(2, 'Shipping', 'shipping', 0, '{\"zip\": \"40391\", \"city\": \"Winchester\", \"state\": \"KY\", \"country\": \"United States\", \"street_address\": \"2148  Straford Park\"}', 3, '2021-08-18 19:18:12', '2021-08-18 19:18:12');

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `url`, `created_at`, `updated_at`) VALUES
(1, '', '2023-07-21 15:38:48', '2023-07-21 15:38:48'),
(2, '', '2023-07-21 15:39:42', '2023-07-21 15:39:42'),
(3, '', '2023-07-21 15:40:22', '2023-07-21 15:40:22'),
(4, '', '2023-07-26 15:02:33', '2023-07-26 15:02:33');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_product`
--

CREATE TABLE `attribute_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_value_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `meta` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `image` json DEFAULT NULL,
  `cover_image` json DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `bio` text COLLATE utf8mb4_unicode_ci,
  `quote` text COLLATE utf8mb4_unicode_ci,
  `born` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `death` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `languages` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socials` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `availabilities`
--

CREATE TABLE `availabilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `booking_duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_quantity` int(11) NOT NULL,
  `bookable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bookable_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `balances`
--

CREATE TABLE `balances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `admin_commission_rate` double DEFAULT NULL,
  `total_earnings` double NOT NULL DEFAULT '0',
  `withdrawn_amount` double NOT NULL DEFAULT '0',
  `current_balance` double NOT NULL DEFAULT '0',
  `payment_info` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `balances`
--

INSERT INTO `balances` (`id`, `shop_id`, `admin_commission_rate`, `total_earnings`, `withdrawn_amount`, `current_balance`, `payment_info`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 0, 0, 0, '{\"bank\": null, \"name\": null, \"email\": \"admin@example.com\"}', '2022-01-22 23:30:50', '2022-02-24 11:56:16'),
(2, 2, 10, 0, 0, 0, '{\"bank\": null, \"name\": null, \"email\": \"rnb@rnc.rnd\"}', '2022-01-22 23:51:34', '2022-02-20 13:24:39'),
(3, 3, 10, 0, 0, 0, '{\"bank\": null, \"name\": null, \"email\": \"furniture_shop@demo.com\"}', '2022-01-22 23:53:14', '2022-02-19 19:09:26'),
(4, 4, 10, 0, 0, 0, '{\"bank\": null, \"name\": null, \"email\": \"admin@example.com\"}', '2022-01-26 15:55:45', '2022-05-11 14:10:25'),
(5, 5, 10, 0, 0, 0, '{\"bank\": null, \"name\": null, \"email\": \"shop_owner@demo.com\"}', '2022-01-26 16:00:06', '2022-05-11 14:10:25'),
(6, 6, 10, 0, 0, 0, '{\"bank\": null, \"name\": null, \"email\": \"admin@example.com\"}', '2022-01-26 22:51:40', '2022-05-11 14:10:25'),
(7, 7, 10, 0, 0, 0, '{\"bank\": null, \"name\": null, \"email\": \"admin@example.com\"}', '2022-01-26 22:53:03', '2022-05-11 14:10:24'),
(8, 8, 10, 0, 0, 0, '{\"bank\": null, \"name\": null, \"email\": \"rnb@rnc.rnd\"}', '2022-01-26 22:54:49', '2022-05-11 14:10:25'),
(9, 9, 10, 0, 0, 0, '{\"bank\": \"demo\", \"name\": \"demo\", \"email\": \"shop_owner@demo.com\", \"account\": 1231321321}', '2022-01-26 22:56:04', '2022-05-11 14:10:25'),
(10, 12, 10, 0, 0, 0, '{\"bank\": \"GTB\", \"name\": \"OSEJI DIGITAL TRENDS\", \"email\": \"vctroseji@gmail.com\", \"account\": 27266509}', '2023-05-22 18:20:34', '2023-05-29 17:08:08'),
(11, 13, 10, 0, 0, 0, '{\"bank\": \"99\", \"name\": \"99\", \"email\": \"victoroseji2004@yahoo.com\", \"account\": 99}', '2023-06-25 18:10:38', '2023-06-25 18:12:09'),
(12, 14, 10, 0, 0, 0, '{\"bank\": \"Test Bak Plc\", \"name\": \"Mr test\", \"email\": \"Test@test.com\", \"account\": 1234567890}', '2023-06-25 19:36:52', '2023-07-11 15:59:20'),
(13, 15, 10, 0, 0, 0, '{\"bank\": \"99\", \"name\": \"99\", \"email\": \"00@k.com\", \"account\": 99}', '2023-06-29 16:28:52', '2023-08-30 21:26:27'),
(15, 17, 10, 0, 0, 0, '{\"bank\": \"GTBANK\", \"name\": \"0000000\", \"email\": \"g@g.com\", \"account\": 900009090}', '2023-06-29 17:32:34', '2023-06-29 18:01:13'),
(16, 18, 10, 0, 0, 0, '{\"bank\": null, \"name\": \"Miss Uche\", \"email\": null}', '2023-09-01 16:14:15', '2023-09-01 16:15:02'),
(17, 19, 10, 0, 0, 0, '{\"bank\": null, \"name\": \"Mrs Paul\", \"email\": \"noemail@noemail.com\"}', '2023-09-04 20:42:16', '2023-09-04 20:44:38'),
(18, 20, 10, 0, 0, 0, '{\"bank\": null, \"name\": \"Mr Johnson\", \"email\": \"uy48@yahoo.com\"}', '2023-09-28 18:58:25', '2023-09-28 18:58:54');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `type_id`, `title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'test', NULL, '{\"id\": 4, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/4/img-%281%29.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/4/conversions/img-%281%29-thumbnail.jpg\"}', '2022-01-22 20:04:37', '2022-01-22 20:04:37'),
(2, 2, 'test', NULL, '{\"id\": 5, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/5/img-%281%29.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/5/conversions/img-%281%29-thumbnail.jpg\"}', '2022-01-22 20:05:05', '2022-01-22 20:05:05'),
(3, 3, 'test', NULL, '{\"id\": 6, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/6/img-%281%29.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/6/conversions/img-%281%29-thumbnail.jpg\"}', '2022-01-22 20:05:32', '2022-01-22 20:05:32'),
(4, 4, 'test', NULL, '{\"id\": 7, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/7/img-%281%29.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/7/conversions/img-%281%29-thumbnail.jpg\"}', '2022-01-22 20:05:52', '2022-01-22 20:05:52');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` json DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `parent` bigint(20) UNSIGNED DEFAULT NULL,
  `type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `language`, `icon`, `image`, `details`, `parent`, `type_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(22, 'SERVICES', 'services', 'en', NULL, '[]', NULL, NULL, NULL, '2023-05-30 02:43:12', '2023-05-30 02:43:12', NULL),
(25, 'Building Materials', 'building-materials', 'en', NULL, '[]', NULL, NULL, NULL, '2023-05-31 14:32:49', '2023-05-31 14:32:49', NULL),
(26, 'Plumbing', 'plumbing', 'en', NULL, '[]', NULL, 25, NULL, '2023-05-31 14:33:13', '2023-05-31 14:33:13', NULL),
(27, 'Electricals', 'electricals', 'en', NULL, '[]', NULL, 25, NULL, '2023-05-31 21:32:08', '2023-05-31 21:32:08', NULL),
(28, 'Timber', 'timber', 'en', NULL, '[]', NULL, 25, NULL, '2023-05-31 21:32:23', '2023-05-31 21:32:23', NULL),
(29, 'Automobile Spare Parts', 'automobile-spare-parts', 'en', NULL, '[]', NULL, NULL, NULL, '2023-05-31 21:33:11', '2023-05-31 21:33:11', NULL),
(30, 'Honda', 'honda', 'en', NULL, '[]', NULL, 29, NULL, '2023-05-31 21:33:33', '2023-05-31 21:33:33', NULL),
(31, 'Toyota', 'toyota', 'en', NULL, '[]', NULL, 29, NULL, '2023-05-31 21:33:47', '2023-05-31 21:33:47', NULL),
(32, 'Mercedes', 'mercedes', 'en', NULL, '[]', NULL, 29, NULL, '2023-05-31 21:34:11', '2023-05-31 21:34:11', NULL),
(33, 'Kia', 'kia', 'en', NULL, '[]', NULL, 29, NULL, '2023-05-31 21:34:23', '2023-05-31 21:34:23', NULL),
(34, 'Fashion', 'fashion', 'en', NULL, '[]', NULL, NULL, NULL, '2023-05-31 21:39:00', '2023-05-31 21:39:00', NULL),
(35, 'Traditional Attires', 'traditional-attires', 'en', NULL, '[]', NULL, 34, NULL, '2023-05-31 21:39:14', '2023-05-31 21:39:14', NULL),
(36, 'Footwears', 'footwears', 'en', NULL, '[]', NULL, 34, NULL, '2023-05-31 21:39:33', '2023-05-31 21:39:33', NULL),
(37, 'Consumer Goods', 'consumer-goods', 'en', NULL, '[]', NULL, NULL, NULL, '2023-05-31 21:40:52', '2023-05-31 21:40:52', NULL),
(38, 'Furniture', 'furniture', 'en', NULL, '[]', NULL, NULL, NULL, '2023-05-31 21:42:06', '2023-05-31 21:42:06', NULL),
(39, 'Catering & Confectionaries', 'catering-confectionaries', 'en', NULL, '[]', NULL, NULL, NULL, '2023-05-31 21:42:35', '2023-05-31 21:42:35', NULL),
(40, 'Village Markets', 'village-markets', 'en', NULL, '[]', NULL, NULL, NULL, '2023-05-31 21:43:29', '2023-05-31 21:43:29', NULL),
(41, 'Wuse Market', 'wuse-market', 'en', NULL, '[]', NULL, 40, NULL, '2023-05-31 21:43:57', '2023-05-31 21:43:57', NULL),
(42, 'Professional Services', 'professional-services', 'en', NULL, '[]', NULL, 22, NULL, '2023-05-31 21:45:14', '2023-05-31 21:45:14', NULL),
(43, 'Artisans', 'artisans', 'en', NULL, '[]', NULL, 22, NULL, '2023-05-31 21:45:25', '2023-05-31 21:45:25', NULL),
(45, 'Food', 'food', 'en', NULL, '[]', NULL, NULL, NULL, '2023-09-25 17:58:30', '2023-09-25 17:58:30', NULL),
(46, 'Drinks', 'drinks', 'en', NULL, '[]', NULL, 45, NULL, '2023-09-25 17:59:22', '2023-09-25 17:59:22', NULL),
(47, 'Alcoholic Drinks', 'alcoholic-drinks', 'en', NULL, '[]', NULL, 46, NULL, '2023-09-25 18:00:13', '2023-09-25 18:00:13', NULL),
(48, 'Wines & Spirits', 'wines-spirits', 'en', NULL, '[]', NULL, 47, NULL, '2023-09-25 18:00:41', '2023-09-25 18:00:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_shop`
--

CREATE TABLE `category_shop` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` json DEFAULT NULL,
  `type` enum('fixed','percentage','free_shipping') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `amount` double(8,2) NOT NULL DEFAULT '0.00',
  `minimum_cart_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `active_from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_at` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_times`
--

CREATE TABLE `delivery_times` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposit_product`
--

CREATE TABLE `deposit_product` (
  `resource_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `digital_files`
--

CREATE TABLE `digital_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attachment_id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fileable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `digital_files`
--

INSERT INTO `digital_files` (`id`, `attachment_id`, `url`, `file_name`, `fileable_type`, `fileable_id`, `created_at`, `updated_at`) VALUES
(1, 660, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/658/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 1, '2022-01-23 00:26:22', '2022-03-08 15:01:09'),
(2, 657, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/655/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 2, '2022-01-23 00:39:40', '2022-03-07 20:14:36'),
(3, 651, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/649/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 3, '2022-01-23 00:49:05', '2022-03-07 20:14:01'),
(4, 645, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/643/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 4, '2022-01-23 01:29:05', '2022-03-07 20:13:01'),
(5, 639, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/637/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 5, '2022-01-23 01:40:10', '2022-03-07 20:02:02'),
(6, 633, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/631/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 6, '2022-01-23 01:54:10', '2022-03-07 19:49:24'),
(7, 627, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/625/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 7, '2022-01-23 01:55:17', '2022-03-07 19:48:27'),
(8, 621, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/619/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 8, '2022-01-23 01:56:33', '2022-03-07 19:47:46'),
(9, 615, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/613/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 9, '2022-01-23 13:58:18', '2022-03-07 19:47:00'),
(10, 609, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/607/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 10, '2022-01-23 14:03:51', '2022-03-07 19:44:57'),
(11, 603, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/601/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 11, '2022-01-23 14:06:05', '2022-03-07 19:44:07'),
(12, 799, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/797/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 12, '2022-01-23 14:08:14', '2022-03-07 20:37:13'),
(13, 793, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/791/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 13, '2022-01-23 14:30:01', '2022-03-07 20:36:31'),
(14, 787, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/785/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 14, '2022-01-23 14:32:23', '2022-03-07 20:35:38'),
(15, 781, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/779/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 15, '2022-01-23 14:34:27', '2022-03-07 20:34:48'),
(16, 775, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/773/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 16, '2022-01-26 23:03:51', '2022-03-07 20:38:06'),
(17, 768, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/766/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 17, '2022-01-26 23:07:11', '2022-03-07 20:38:02'),
(18, 762, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/760/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 18, '2022-01-26 23:11:21', '2022-03-07 20:37:57'),
(19, 756, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/754/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 19, '2022-01-26 23:12:59', '2022-03-07 20:37:51'),
(20, 750, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/748/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 20, '2022-01-26 23:14:10', '2022-03-07 20:37:47'),
(21, 744, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/742/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 21, '2022-01-27 21:35:52', '2022-03-07 20:29:54'),
(22, 738, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/736/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 22, '2022-01-27 21:37:39', '2022-03-07 20:29:11'),
(23, 732, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/730/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 23, '2022-01-27 21:38:56', '2022-03-07 20:28:39'),
(24, 726, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/724/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 24, '2022-01-27 22:03:52', '2022-03-07 20:27:50'),
(25, 720, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/718/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 25, '2022-01-27 22:05:09', '2022-03-07 20:26:58'),
(26, 702, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/700/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 26, '2022-01-27 22:54:32', '2022-03-07 20:24:06'),
(27, 696, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/694/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 27, '2022-01-27 22:56:29', '2022-03-07 20:23:34'),
(28, 690, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/688/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 28, '2022-01-27 22:58:01', '2022-03-07 20:22:56'),
(29, 678, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/676/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 29, '2022-01-27 22:59:37', '2022-03-07 20:21:48'),
(30, 672, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/670/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 30, '2022-01-27 23:01:21', '2022-03-07 20:19:01'),
(31, 666, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/664/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 31, '2022-01-27 23:03:50', '2022-03-07 20:17:35'),
(32, 597, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/595/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 32, '2022-01-27 23:18:52', '2022-03-05 20:52:30'),
(33, 810, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/808/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 33, '2022-01-27 23:24:16', '2022-03-08 15:01:36'),
(34, 585, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/583/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 34, '2022-01-27 23:29:45', '2022-03-05 20:49:35'),
(35, 579, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/577/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 35, '2022-01-27 23:31:35', '2022-03-05 20:48:36'),
(36, 569, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/567/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 36, '2022-01-27 23:33:57', '2022-03-05 20:47:39'),
(37, 568, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/566/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 37, '2022-01-27 23:37:54', '2022-03-05 20:44:19'),
(38, 562, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/560/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 38, '2022-01-27 23:48:28', '2022-03-05 20:41:16'),
(39, 556, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/554/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 39, '2022-01-27 23:50:48', '2022-03-05 20:38:44'),
(40, 549, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/547/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 40, '2022-01-27 23:53:04', '2022-03-05 20:37:03'),
(41, 543, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/541/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 41, '2022-01-27 23:57:42', '2022-03-07 20:38:30'),
(42, 537, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/535/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 42, '2022-01-28 00:27:50', '2022-03-05 20:34:26'),
(43, 531, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/529/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 43, '2022-01-28 00:29:57', '2022-03-05 20:33:51'),
(44, 374, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/374/DOCUMENTATION.pdf', '', 'Marvel\\Database\\Models\\Product', 44, '2022-01-28 00:31:12', '2022-02-03 20:23:08'),
(45, 525, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/523/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 45, '2022-01-28 00:31:12', '2022-03-05 20:33:04'),
(46, 519, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/517/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 46, '2022-01-28 00:32:43', '2022-03-05 20:32:29'),
(47, 513, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/511/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 47, '2022-01-28 00:33:59', '2022-03-05 20:31:56'),
(48, 507, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/505/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 48, '2022-01-28 00:36:06', '2022-03-05 20:31:15'),
(49, 399, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/399/DOCUMENTATION.pdf', '', 'Marvel\\Database\\Models\\Product', 49, '2022-01-28 00:37:27', '2022-02-03 20:22:37'),
(50, 501, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/499/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 50, '2022-01-28 00:38:43', '2022-03-05 20:09:47'),
(51, 495, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/493/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 51, '2022-01-28 00:40:14', '2022-03-05 19:53:03'),
(52, 482, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/480/cartsy-lite.1.4.6.zip', '', 'Marvel\\Database\\Models\\Product', 52, '2022-01-28 00:41:47', '2022-03-05 19:33:10'),
(53, 471, 'https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/469/logo.jpg', '', 'Marvel\\Database\\Models\\Product', 56, '2022-02-19 23:03:32', '2022-02-20 00:11:43');

-- --------------------------------------------------------

--
-- Table structure for table `download_tokens`
--

CREATE TABLE `download_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `downloaded` tinyint(1) NOT NULL DEFAULT '0',
  `digital_file_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dropoff_location_product`
--

CREATE TABLE `dropoff_location_product` (
  `resource_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_product`
--

CREATE TABLE `feature_product` (
  `resource_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `positive` tinyint(1) DEFAULT NULL,
  `negative` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `flag` json NOT NULL,
  `language_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `image` json DEFAULT NULL,
  `cover_image` json DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socials` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `custom_properties` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `generated_conversions`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'Marvel\\Database\\Models\\Attachment', 1, '2f25ccd3-e343-4fd2-9238-71511b49ea89', 'default', 'PickBazar', 'PickBazar.png', 'image/png', 's3', 's3', 3089, '[]', '[]', '[]', '[]', 1, '2022-01-22 16:40:27', '2022-01-22 16:40:27'),
(2, 'Marvel\\Database\\Models\\Attachment', 2, '674838ac-95fa-4a7a-aed7-f015c0f08f45', 'default', 'PickBazar', 'PickBazar.png', 'image/png', 's3', 's3', 3089, '[]', '[]', '[]', '[]', 2, '2022-01-22 16:40:55', '2022-01-22 16:40:55'),
(3, 'Marvel\\Database\\Models\\Attachment', 3, 'ae0d12ef-a387-471b-b904-0a484157a252', 'default', 'PickBazar', 'PickBazar.png', 'image/png', 's3', 's3', 3089, '[]', '{\"thumbnail\": true}', '[]', '[]', 3, '2022-01-22 16:43:28', '2022-01-22 16:43:28'),
(4, 'Marvel\\Database\\Models\\Attachment', 4, '15e9fb1c-ef99-44d6-b968-d619317feb10', 'default', 'img (1)', 'img-(1).png', 'image/png', 's3', 's3', 28910, '[]', '{\"thumbnail\": true}', '[]', '[]', 4, '2022-01-22 20:04:32', '2022-01-22 20:04:33'),
(5, 'Marvel\\Database\\Models\\Attachment', 5, '42b852e3-9ad1-43d1-b58a-39a19145b974', 'default', 'img (1)', 'img-(1).png', 'image/png', 's3', 's3', 28910, '[]', '{\"thumbnail\": true}', '[]', '[]', 5, '2022-01-22 20:05:04', '2022-01-22 20:05:04'),
(6, 'Marvel\\Database\\Models\\Attachment', 6, '1f38a78e-80a5-4a6c-9de6-2e6f2964aaf3', 'default', 'img (1)', 'img-(1).png', 'image/png', 's3', 's3', 28910, '[]', '{\"thumbnail\": true}', '[]', '[]', 6, '2022-01-22 20:05:31', '2022-01-22 20:05:31'),
(7, 'Marvel\\Database\\Models\\Attachment', 7, '8e312318-2254-473d-bfbe-39e0e8c6b5b7', 'default', 'img (1)', 'img-(1).png', 'image/png', 's3', 's3', 28910, '[]', '{\"thumbnail\": true}', '[]', '[]', 7, '2022-01-22 20:05:47', '2022-01-22 20:05:48'),
(8, 'Marvel\\Database\\Models\\Attachment', 8, 'b7e65ac4-4151-4b7d-b2d2-810496f975dd', 'default', 'Publisher banner 1', 'Publisher-banner-1.png', 'image/png', 's3', 's3', 44155, '[]', '{\"thumbnail\": true}', '[]', '[]', 8, '2022-01-22 23:22:27', '2022-01-22 23:22:27'),
(9, 'Marvel\\Database\\Models\\Attachment', 9, '07ff27a4-6e50-46a3-84f6-83635295fadd', 'default', 'Publisher logo 8', 'Publisher-logo-8.png', 'image/png', 's3', 's3', 3101, '[]', '{\"thumbnail\": true}', '[]', '[]', 9, '2022-01-22 23:22:56', '2022-01-22 23:22:56'),
(10, 'Marvel\\Database\\Models\\Attachment', 10, '8d6967e0-216c-4dbf-956e-1227f98c6a4e', 'default', 'Publisher logo', 'Publisher-logo.png', 'image/png', 's3', 's3', 2560, '[]', '{\"thumbnail\": true}', '[]', '[]', 10, '2022-01-22 23:25:58', '2022-01-22 23:25:58'),
(11, 'Marvel\\Database\\Models\\Attachment', 11, 'ea016cf3-58f5-4c4b-bfd1-c47392e4c2ba', 'default', 'Publisher banner 8', 'Publisher-banner-8.png', 'image/png', 's3', 's3', 176380, '[]', '{\"thumbnail\": true}', '[]', '[]', 11, '2022-01-22 23:26:11', '2022-01-22 23:26:11'),
(12, 'Marvel\\Database\\Models\\Attachment', 12, '7c147922-b2f7-4f39-93db-96085eb5e90c', 'default', 'Publisher banner 9', 'Publisher-banner-9.png', 'image/png', 's3', 's3', 163996, '[]', '{\"thumbnail\": true}', '[]', '[]', 12, '2022-01-22 23:35:53', '2022-01-22 23:35:53'),
(13, 'Marvel\\Database\\Models\\Attachment', 13, 'b3a33cb1-6897-47eb-992d-c36dfb9eb078', 'default', 'Publisher logo 10', 'Publisher-logo-10.png', 'image/png', 's3', 's3', 2559, '[]', '{\"thumbnail\": true}', '[]', '[]', 13, '2022-01-22 23:36:01', '2022-01-22 23:36:01'),
(14, 'Marvel\\Database\\Models\\Attachment', 14, '891b7c10-cf56-48f4-ad82-48eee5e4785e', 'default', 'Publisher logo 9', 'Publisher-logo-9.png', 'image/png', 's3', 's3', 2786, '[]', '{\"thumbnail\": true}', '[]', '[]', 14, '2022-01-22 23:52:15', '2022-01-22 23:52:15'),
(15, 'Marvel\\Database\\Models\\Attachment', 15, 'f82d4f5c-68df-4eac-8638-69219ac8aa43', 'default', 'Publisher banner 10', 'Publisher-banner-10.png', 'image/png', 's3', 's3', 191865, '[]', '{\"thumbnail\": true}', '[]', '[]', 15, '2022-01-22 23:52:26', '2022-01-22 23:52:26'),
(16, 'Marvel\\Database\\Models\\Attachment', 16, '8ddbc66e-ebeb-4457-99e4-ad1d0b765007', 'default', 'Mask Group', 'Mask-Group.png', 'image/png', 's3', 's3', 95021, '[]', '{\"thumbnail\": true}', '[]', '[]', 16, '2022-01-22 23:59:51', '2022-01-22 23:59:51'),
(17, 'Marvel\\Database\\Models\\Attachment', 17, '144d0000-4969-40df-9efe-a17fe33bce83', 'default', 'Mask Group-1', 'Mask-Group-1.png', 'image/png', 's3', 's3', 171786, '[]', '{\"thumbnail\": true}', '[]', '[]', 17, '2022-01-23 00:04:29', '2022-01-23 00:04:30'),
(18, 'Marvel\\Database\\Models\\Attachment', 18, '10692acf-7eaa-47e5-8452-2c51ab502052', 'default', 'Mask Group-49', 'Mask-Group-49.png', 'image/png', 's3', 's3', 76196, '[]', '{\"thumbnail\": true}', '[]', '[]', 18, '2022-01-23 00:04:30', '2022-01-23 00:04:30'),
(19, 'Marvel\\Database\\Models\\Attachment', 19, 'c9ad33de-870d-4fc1-bc32-e8c13bc0e792', 'default', 'Mask Group-50', 'Mask-Group-50.png', 'image/png', 's3', 's3', 102145, '[]', '{\"thumbnail\": true}', '[]', '[]', 19, '2022-01-23 00:04:30', '2022-01-23 00:04:30'),
(20, 'Marvel\\Database\\Models\\Attachment', 20, 'd97a00c5-dc3a-4f24-8000-a1b20c2abbc9', 'default', 'Mask Group', 'Mask-Group.png', 'image/png', 's3', 's3', 95021, '[]', '{\"thumbnail\": true}', '[]', '[]', 20, '2022-01-23 00:18:05', '2022-01-23 00:18:05'),
(21, 'Marvel\\Database\\Models\\Attachment', 21, 'dc51b933-652f-403d-bb0e-dfd2107abd18', 'default', 'Mask Group-1', 'Mask-Group-1.png', 'image/png', 's3', 's3', 171786, '[]', '{\"thumbnail\": true}', '[]', '[]', 21, '2022-01-23 00:18:16', '2022-01-23 00:18:16'),
(22, 'Marvel\\Database\\Models\\Attachment', 22, 'e5472cce-bcad-4bcf-b342-9ed1a9c0d4af', 'default', 'Mask Group-49', 'Mask-Group-49.png', 'image/png', 's3', 's3', 76196, '[]', '{\"thumbnail\": true}', '[]', '[]', 22, '2022-01-23 00:18:16', '2022-01-23 00:18:16'),
(23, 'Marvel\\Database\\Models\\Attachment', 23, 'e594eb90-2eb2-4fd2-bba6-4d8a12ec62bc', 'default', 'Mask Group-50', 'Mask-Group-50.png', 'image/png', 's3', 's3', 102145, '[]', '{\"thumbnail\": true}', '[]', '[]', 23, '2022-01-23 00:18:16', '2022-01-23 00:18:16'),
(24, 'Marvel\\Database\\Models\\Attachment', 24, 'a50287a8-fbc0-46f5-b1a3-995666df5170', 'default', 'Mask Group', 'Mask-Group.png', 'image/png', 's3', 's3', 95021, '[]', '{\"thumbnail\": true}', '[]', '[]', 24, '2022-01-23 00:23:12', '2022-01-23 00:23:12'),
(25, 'Marvel\\Database\\Models\\Attachment', 25, '0ae38883-1e9a-4b47-89a5-53b69150402d', 'default', 'Mask Group-1', 'Mask-Group-1.png', 'image/png', 's3', 's3', 171786, '[]', '{\"thumbnail\": true}', '[]', '[]', 25, '2022-01-23 00:23:13', '2022-01-23 00:23:14'),
(26, 'Marvel\\Database\\Models\\Attachment', 26, 'fa000230-39ee-4bc5-a1dc-c8663d81e056', 'default', 'Mask Group-49', 'Mask-Group-49.png', 'image/png', 's3', 's3', 76196, '[]', '{\"thumbnail\": true}', '[]', '[]', 26, '2022-01-23 00:23:14', '2022-01-23 00:23:14'),
(27, 'Marvel\\Database\\Models\\Attachment', 27, '1a678eac-b246-4237-bf2e-ae0fe87b8f93', 'default', 'Mask Group-50', 'Mask-Group-50.png', 'image/png', 's3', 's3', 102145, '[]', '{\"thumbnail\": true}', '[]', '[]', 27, '2022-01-23 00:23:14', '2022-01-23 00:23:14'),
(28, 'Marvel\\Database\\Models\\Attachment', 28, '354f469a-9596-4720-a9c6-5a3d1fe081a1', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 28, '2022-01-23 00:26:20', '2022-01-23 00:26:20'),
(29, 'Marvel\\Database\\Models\\Attachment', 29, '28dac209-b7fc-4128-a832-38e155a02e83', 'default', 'Mask Group-1', 'Mask-Group-1.png', 'image/png', 's3', 's3', 171786, '[]', '{\"thumbnail\": true}', '[]', '[]', 29, '2022-01-23 00:38:01', '2022-01-23 00:38:02'),
(30, 'Marvel\\Database\\Models\\Attachment', 30, 'cafd1181-1092-4d75-bd1d-0df07c927008', 'default', 'Mask Group', 'Mask-Group.png', 'image/png', 's3', 's3', 95021, '[]', '{\"thumbnail\": true}', '[]', '[]', 30, '2022-01-23 00:38:22', '2022-01-23 00:38:22'),
(31, 'Marvel\\Database\\Models\\Attachment', 31, 'c7b11dd2-4ea0-4870-a7f5-cb6fb29e4403', 'default', 'Mask Group-49', 'Mask-Group-49.png', 'image/png', 's3', 's3', 76196, '[]', '{\"thumbnail\": true}', '[]', '[]', 31, '2022-01-23 00:38:22', '2022-01-23 00:38:22'),
(32, 'Marvel\\Database\\Models\\Attachment', 32, '4ecf217c-6477-463f-aabc-8488af30f29e', 'default', 'Mask Group-50', 'Mask-Group-50.png', 'image/png', 's3', 's3', 102145, '[]', '{\"thumbnail\": true}', '[]', '[]', 32, '2022-01-23 00:38:22', '2022-01-23 00:38:22'),
(33, 'Marvel\\Database\\Models\\Attachment', 33, 'a40a4e6d-4b7b-4b1b-b52d-c0f8246e7e94', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 33, '2022-01-23 00:39:39', '2022-01-23 00:39:39'),
(34, 'Marvel\\Database\\Models\\Attachment', 34, 'f6dcc67c-5e04-44c2-8cea-75fddd0fb6c7', 'default', 'Mask Group-2', 'Mask-Group-2.png', 'image/png', 's3', 's3', 86702, '[]', '{\"thumbnail\": true}', '[]', '[]', 34, '2022-01-23 00:47:55', '2022-01-23 00:47:55'),
(35, 'Marvel\\Database\\Models\\Attachment', 35, '0c0ca3c3-aec0-42f8-9d00-3469524a3380', 'default', 'Mask Group-16', 'Mask-Group-16.png', 'image/png', 's3', 's3', 60129, '[]', '{\"thumbnail\": true}', '[]', '[]', 35, '2022-01-23 00:48:04', '2022-01-23 00:48:04'),
(36, 'Marvel\\Database\\Models\\Attachment', 36, '1b4d8311-fbb6-47d0-afe4-728d414401ea', 'default', 'Mask Group-24', 'Mask-Group-24.png', 'image/png', 's3', 's3', 62757, '[]', '{\"thumbnail\": true}', '[]', '[]', 36, '2022-01-23 00:48:04', '2022-01-23 00:48:04'),
(37, 'Marvel\\Database\\Models\\Attachment', 37, '25169e11-e110-4bc5-a88c-75cfbd8ad342', 'default', 'Mask Group-26', 'Mask-Group-26.png', 'image/png', 's3', 's3', 39126, '[]', '{\"thumbnail\": true}', '[]', '[]', 37, '2022-01-23 00:48:04', '2022-01-23 00:48:04'),
(38, 'Marvel\\Database\\Models\\Attachment', 38, 'd2a723ae-9c8e-443f-abd8-9db9f59910d8', 'default', 'Mask Group-2', 'Mask-Group-2.png', 'image/png', 's3', 's3', 86702, '[]', '{\"thumbnail\": true}', '[]', '[]', 38, '2022-01-23 00:49:01', '2022-01-23 00:49:02'),
(39, 'Marvel\\Database\\Models\\Attachment', 39, '1cd7aad6-d659-4db1-959f-ab0bdfc7cb62', 'default', 'Mask Group-3', 'Mask-Group-3.png', 'image/png', 's3', 's3', 62418, '[]', '{\"thumbnail\": true}', '[]', '[]', 39, '2022-01-23 01:27:37', '2022-01-23 01:27:37'),
(40, 'Marvel\\Database\\Models\\Attachment', 40, '153339d6-8927-4039-88a7-ae5ec60ed073', 'default', 'Mask Group-11', 'Mask-Group-11.png', 'image/png', 's3', 's3', 39404, '[]', '{\"thumbnail\": true}', '[]', '[]', 40, '2022-01-23 01:27:54', '2022-01-23 01:27:54'),
(41, 'Marvel\\Database\\Models\\Attachment', 41, '34945d08-f9cf-4546-9d41-2b327732ed7f', 'default', 'Mask Group-18', 'Mask-Group-18.png', 'image/png', 's3', 's3', 85695, '[]', '{\"thumbnail\": true}', '[]', '[]', 41, '2022-01-23 01:27:54', '2022-01-23 01:27:54'),
(42, 'Marvel\\Database\\Models\\Attachment', 42, 'a81e2281-af8c-4201-b460-b1e8be7cc00f', 'default', 'Mask Group-22', 'Mask-Group-22.png', 'image/png', 's3', 's3', 48500, '[]', '{\"thumbnail\": true}', '[]', '[]', 42, '2022-01-23 01:27:54', '2022-01-23 01:27:55'),
(43, 'Marvel\\Database\\Models\\Attachment', 43, '5be72c89-63e5-4ab8-9d6b-474165b3e6b3', 'default', 'Mask Group-30', 'Mask-Group-30.png', 'image/png', 's3', 's3', 48701, '[]', '{\"thumbnail\": true}', '[]', '[]', 43, '2022-01-23 01:27:55', '2022-01-23 01:27:55'),
(44, 'Marvel\\Database\\Models\\Attachment', 44, '1bded0b8-3337-4203-993a-6c2e1a544093', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 44, '2022-01-23 01:29:03', '2022-01-23 01:29:03'),
(45, 'Marvel\\Database\\Models\\Attachment', 45, 'd7541dda-4004-4a44-bce6-71db3129c9e3', 'default', 'Mask Group-4', 'Mask-Group-4.png', 'image/png', 's3', 's3', 75925, '[]', '{\"thumbnail\": true}', '[]', '[]', 45, '2022-01-23 01:39:02', '2022-01-23 01:39:02'),
(46, 'Marvel\\Database\\Models\\Attachment', 46, 'fa1ce07a-86b3-4696-9890-5358e8680910', 'default', 'Mask Group-23', 'Mask-Group-23.png', 'image/png', 's3', 's3', 41618, '[]', '{\"thumbnail\": true}', '[]', '[]', 46, '2022-01-23 01:39:13', '2022-01-23 01:39:13'),
(47, 'Marvel\\Database\\Models\\Attachment', 47, '9d0b4657-5ce0-4257-a3a6-3b31d668bdea', 'default', 'Mask Group-31', 'Mask-Group-31.png', 'image/png', 's3', 's3', 54182, '[]', '{\"thumbnail\": true}', '[]', '[]', 47, '2022-01-23 01:39:13', '2022-01-23 01:39:14'),
(48, 'Marvel\\Database\\Models\\Attachment', 48, '45845bfa-e8e3-4bb0-afc0-0c7c5cbba480', 'default', 'Mask Group-45', 'Mask-Group-45.png', 'image/png', 's3', 's3', 158689, '[]', '{\"thumbnail\": true}', '[]', '[]', 48, '2022-01-23 01:39:14', '2022-01-23 01:39:14'),
(49, 'Marvel\\Database\\Models\\Attachment', 49, '2ab4f742-fcfe-4322-80d9-d9f62781ca0f', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 49, '2022-01-23 01:40:10', '2022-01-23 01:40:10'),
(50, 'Marvel\\Database\\Models\\Attachment', 50, '05a4e0cc-ce3f-40a9-ac67-2e9b38a1184a', 'default', 'Mask Group-5', 'Mask-Group-5.png', 'image/png', 's3', 's3', 66713, '[]', '{\"thumbnail\": true}', '[]', '[]', 50, '2022-01-23 01:52:58', '2022-01-23 01:52:58'),
(51, 'Marvel\\Database\\Models\\Attachment', 51, '669bcf31-30b2-4c7e-9670-bf79ea461ff4', 'default', 'Mask Group-14', 'Mask-Group-14.png', 'image/png', 's3', 's3', 65110, '[]', '{\"thumbnail\": true}', '[]', '[]', 51, '2022-01-23 01:53:11', '2022-01-23 01:53:11'),
(52, 'Marvel\\Database\\Models\\Attachment', 52, '1831a98b-cf7c-45d0-a05e-e8f9a468f95d', 'default', 'Mask Group-19', 'Mask-Group-19.png', 'image/png', 's3', 's3', 89206, '[]', '{\"thumbnail\": true}', '[]', '[]', 52, '2022-01-23 01:53:11', '2022-01-23 01:53:11'),
(53, 'Marvel\\Database\\Models\\Attachment', 53, '83edfb89-5d7d-45f5-957c-d0e158422745', 'default', 'Mask Group-21', 'Mask-Group-21.png', 'image/png', 's3', 's3', 83094, '[]', '{\"thumbnail\": true}', '[]', '[]', 53, '2022-01-23 01:53:11', '2022-01-23 01:53:12'),
(54, 'Marvel\\Database\\Models\\Attachment', 54, '0a48073d-93d2-49b9-a75a-b94ef07e0a1b', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 54, '2022-01-23 01:54:07', '2022-01-23 01:54:07'),
(55, 'Marvel\\Database\\Models\\Attachment', 55, 'f0c75da3-9efe-4874-ab6f-607f6dab94da', 'default', 'Mask Group-6', 'Mask-Group-6.png', 'image/png', 's3', 's3', 65042, '[]', '{\"thumbnail\": true}', '[]', '[]', 55, '2022-01-23 01:54:23', '2022-01-23 01:54:23'),
(56, 'Marvel\\Database\\Models\\Attachment', 56, '4334887e-ec9c-4800-be26-b956eddcd0f5', 'default', 'Mask Group-10', 'Mask-Group-10.png', 'image/png', 's3', 's3', 106996, '[]', '{\"thumbnail\": true}', '[]', '[]', 56, '2022-01-23 01:54:38', '2022-01-23 01:54:38'),
(57, 'Marvel\\Database\\Models\\Attachment', 57, 'f6a851b1-00e4-472c-8a24-49520eba7a90', 'default', 'Mask Group-16', 'Mask-Group-16.png', 'image/png', 's3', 's3', 60129, '[]', '{\"thumbnail\": true}', '[]', '[]', 57, '2022-01-23 01:54:38', '2022-01-23 01:54:38'),
(58, 'Marvel\\Database\\Models\\Attachment', 58, 'd93f1917-43b2-4fa8-9388-b9fdefe97d24', 'default', 'Mask Group-38', 'Mask-Group-38.png', 'image/png', 's3', 's3', 66704, '[]', '{\"thumbnail\": true}', '[]', '[]', 58, '2022-01-23 01:54:38', '2022-01-23 01:54:38'),
(59, 'Marvel\\Database\\Models\\Attachment', 59, '402df832-8c96-45c2-8f54-29c9cb28beae', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 59, '2022-01-23 01:55:19', '2022-01-23 01:55:19'),
(60, 'Marvel\\Database\\Models\\Attachment', 60, '254eed23-85f0-499a-a04a-babf5b27127a', 'default', 'Mask Group-7', 'Mask-Group-7.png', 'image/png', 's3', 's3', 40144, '[]', '{\"thumbnail\": true}', '[]', '[]', 60, '2022-01-23 01:55:34', '2022-01-23 01:55:34'),
(61, 'Marvel\\Database\\Models\\Attachment', 61, '64f99260-0e68-415f-8c67-4e49f447d148', 'default', 'Mask Group-42', 'Mask-Group-42.png', 'image/png', 's3', 's3', 93953, '[]', '{\"thumbnail\": true}', '[]', '[]', 61, '2022-01-23 01:55:42', '2022-01-23 01:55:42'),
(62, 'Marvel\\Database\\Models\\Attachment', 62, '3edc1c3f-88f8-426f-858a-924dfbe3c912', 'default', 'Mask Group-43', 'Mask-Group-43.png', 'image/png', 's3', 's3', 54973, '[]', '{\"thumbnail\": true}', '[]', '[]', 62, '2022-01-23 01:55:42', '2022-01-23 01:55:43'),
(63, 'Marvel\\Database\\Models\\Attachment', 63, '025aaf9e-cfb1-4c1e-8922-abb4cbdf5f4e', 'default', 'Mask Group-45', 'Mask-Group-45.png', 'image/png', 's3', 's3', 158689, '[]', '{\"thumbnail\": true}', '[]', '[]', 63, '2022-01-23 01:55:43', '2022-01-23 01:55:43'),
(64, 'Marvel\\Database\\Models\\Attachment', 64, '871b5c9b-6182-453a-8923-8bf945e05990', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 64, '2022-01-23 01:56:32', '2022-01-23 01:56:32'),
(65, 'Marvel\\Database\\Models\\Attachment', 65, 'afc320d1-b23c-443c-b209-fdf9f716cf0e', 'default', 'Mask Group-8', 'Mask-Group-8.png', 'image/png', 's3', 's3', 40508, '[]', '{\"thumbnail\": true}', '[]', '[]', 65, '2022-01-23 13:56:33', '2022-01-23 13:56:33'),
(66, 'Marvel\\Database\\Models\\Attachment', 66, 'c2f8d4b0-c91b-463e-83ef-ba9464a78bc7', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 66, '2022-01-23 13:58:15', '2022-01-23 13:58:15'),
(67, 'Marvel\\Database\\Models\\Attachment', 67, 'd459681d-0b8f-417f-b648-0d0cfed3b442', 'default', 'Mask Group-9', 'Mask-Group-9.png', 'image/png', 's3', 's3', 57741, '[]', '{\"thumbnail\": true}', '[]', '[]', 67, '2022-01-23 13:58:31', '2022-01-23 13:58:31'),
(68, 'Marvel\\Database\\Models\\Attachment', 68, '12dc58d8-1f21-4b2e-aebb-d243dba427f5', 'default', 'Mask Group-18', 'Mask-Group-18.png', 'image/png', 's3', 's3', 85695, '[]', '{\"thumbnail\": true}', '[]', '[]', 68, '2022-01-23 14:02:56', '2022-01-23 14:02:56'),
(69, 'Marvel\\Database\\Models\\Attachment', 69, '7661308f-bb4c-465b-9b04-331dd30f2669', 'default', 'Mask Group-21', 'Mask-Group-21.png', 'image/png', 's3', 's3', 83094, '[]', '{\"thumbnail\": true}', '[]', '[]', 69, '2022-01-23 14:02:56', '2022-01-23 14:02:56'),
(70, 'Marvel\\Database\\Models\\Attachment', 70, 'd62c7c31-f8f3-4ab2-b30d-d300e0efb977', 'default', 'Mask Group-26', 'Mask-Group-26.png', 'image/png', 's3', 's3', 39126, '[]', '{\"thumbnail\": true}', '[]', '[]', 70, '2022-01-23 14:02:56', '2022-01-23 14:02:56'),
(71, 'Marvel\\Database\\Models\\Attachment', 71, '46d4f5de-d873-45ae-a317-6e350b65c4c2', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 71, '2022-01-23 14:03:50', '2022-01-23 14:03:50'),
(72, 'Marvel\\Database\\Models\\Attachment', 72, 'c4c04a45-b583-4e60-bba4-73d6f35a15f0', 'default', 'Mask Group-10', 'Mask-Group-10.png', 'image/png', 's3', 's3', 106996, '[]', '{\"thumbnail\": true}', '[]', '[]', 72, '2022-01-23 14:05:13', '2022-01-23 14:05:13'),
(73, 'Marvel\\Database\\Models\\Attachment', 73, '51ad77bf-fa10-47eb-8b8e-3e7cf61bd571', 'default', 'Mask Group-42', 'Mask-Group-42.png', 'image/png', 's3', 's3', 93953, '[]', '{\"thumbnail\": true}', '[]', '[]', 73, '2022-01-23 14:05:19', '2022-01-23 14:05:20'),
(74, 'Marvel\\Database\\Models\\Attachment', 74, '60ac4fa0-ae36-4b2b-bc54-9acddfb1360e', 'default', 'Mask Group-44', 'Mask-Group-44.png', 'image/png', 's3', 's3', 66034, '[]', '{\"thumbnail\": true}', '[]', '[]', 74, '2022-01-23 14:05:20', '2022-01-23 14:05:20'),
(75, 'Marvel\\Database\\Models\\Attachment', 75, 'a50ec416-00aa-481f-b2a4-0f6c84303e0d', 'default', 'Mask Group-49', 'Mask-Group-49.png', 'image/png', 's3', 's3', 76196, '[]', '{\"thumbnail\": true}', '[]', '[]', 75, '2022-01-23 14:05:20', '2022-01-23 14:05:20'),
(76, 'Marvel\\Database\\Models\\Attachment', 76, '1373e70b-dcf6-47ca-94b4-b143dc87285c', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 76, '2022-01-23 14:06:04', '2022-01-23 14:06:04'),
(77, 'Marvel\\Database\\Models\\Attachment', 77, '85de0386-d958-4e8a-925f-aae8a62cb1d2', 'default', 'Mask Group-11', 'Mask-Group-11.png', 'image/png', 's3', 's3', 39404, '[]', '{\"thumbnail\": true}', '[]', '[]', 77, '2022-01-23 14:06:51', '2022-01-23 14:06:51'),
(78, 'Marvel\\Database\\Models\\Attachment', 78, '9168279f-ae38-4e3a-9be1-e7ca5612c39b', 'default', 'Mask Group-3', 'Mask-Group-3.png', 'image/png', 's3', 's3', 62418, '[]', '{\"thumbnail\": true}', '[]', '[]', 78, '2022-01-23 14:07:01', '2022-01-23 14:07:01'),
(79, 'Marvel\\Database\\Models\\Attachment', 79, '9777b673-4b8a-43b3-8f10-4eba585077da', 'default', 'Mask Group-14', 'Mask-Group-14.png', 'image/png', 's3', 's3', 65110, '[]', '{\"thumbnail\": true}', '[]', '[]', 79, '2022-01-23 14:07:01', '2022-01-23 14:07:01'),
(80, 'Marvel\\Database\\Models\\Attachment', 80, '269473df-cfbc-4bdc-8a35-b0cd95a3bf25', 'default', 'Mask Group-18', 'Mask-Group-18.png', 'image/png', 's3', 's3', 85695, '[]', '{\"thumbnail\": true}', '[]', '[]', 80, '2022-01-23 14:07:02', '2022-01-23 14:07:02'),
(81, 'Marvel\\Database\\Models\\Attachment', 81, '270e899e-0e7a-46c1-be73-cc50c213b9bf', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 81, '2022-01-23 14:08:15', '2022-01-23 14:08:15'),
(82, 'Marvel\\Database\\Models\\Attachment', 82, 'aec69baf-15a0-423b-a7a8-36df77431209', 'default', 'Mask Group-12', 'Mask-Group-12.png', 'image/png', 's3', 's3', 140851, '[]', '{\"thumbnail\": true}', '[]', '[]', 82, '2022-01-23 14:28:56', '2022-01-23 14:28:56'),
(83, 'Marvel\\Database\\Models\\Attachment', 83, '2f1e62c3-304f-4ac2-9d80-eefe73adda05', 'default', 'Mask Group-23', 'Mask-Group-23.png', 'image/png', 's3', 's3', 41618, '[]', '{\"thumbnail\": true}', '[]', '[]', 83, '2022-01-23 14:29:07', '2022-01-23 14:29:07'),
(84, 'Marvel\\Database\\Models\\Attachment', 84, 'b887769d-0d3c-4938-aa2b-48b50851d261', 'default', 'Mask Group-27', 'Mask-Group-27.png', 'image/png', 's3', 's3', 41933, '[]', '{\"thumbnail\": true}', '[]', '[]', 84, '2022-01-23 14:29:07', '2022-01-23 14:29:07'),
(85, 'Marvel\\Database\\Models\\Attachment', 85, '0f20cd6b-e889-4bf4-880d-4add79f75834', 'default', 'Mask Group-28', 'Mask-Group-28.png', 'image/png', 's3', 's3', 91010, '[]', '{\"thumbnail\": true}', '[]', '[]', 85, '2022-01-23 14:29:07', '2022-01-23 14:29:07'),
(86, 'Marvel\\Database\\Models\\Attachment', 86, 'bb9cd3be-1b5a-4e4a-be87-5e0ebd13d840', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 86, '2022-01-23 14:30:00', '2022-01-23 14:30:00'),
(87, 'Marvel\\Database\\Models\\Attachment', 87, '96fbaaae-8465-4af9-add8-b0d8485e0de4', 'default', 'Mask Group-13', 'Mask-Group-13.png', 'image/png', 's3', 's3', 160567, '[]', '{\"thumbnail\": true}', '[]', '[]', 87, '2022-01-23 14:30:17', '2022-01-23 14:30:18'),
(88, 'Marvel\\Database\\Models\\Attachment', 88, 'e36efb30-f2cc-4bc8-b9e6-a014ab85b4ba', 'default', 'Mask Group-21', 'Mask-Group-21.png', 'image/png', 's3', 's3', 83094, '[]', '{\"thumbnail\": true}', '[]', '[]', 88, '2022-01-23 14:30:21', '2022-01-23 14:30:21'),
(89, 'Marvel\\Database\\Models\\Attachment', 89, 'd0200ab2-983b-44ce-a4a8-04f7a7ae33b9', 'default', 'Mask Group-25', 'Mask-Group-25.png', 'image/png', 's3', 's3', 36241, '[]', '{\"thumbnail\": true}', '[]', '[]', 89, '2022-01-23 14:30:21', '2022-01-23 14:30:22'),
(90, 'Marvel\\Database\\Models\\Attachment', 90, '9c54e81d-e6a8-44de-a3af-446df660ff6a', 'default', 'Mask Group-27', 'Mask-Group-27.png', 'image/png', 's3', 's3', 41933, '[]', '{\"thumbnail\": true}', '[]', '[]', 90, '2022-01-23 14:30:22', '2022-01-23 14:30:22'),
(91, 'Marvel\\Database\\Models\\Attachment', 91, '24fe83b3-c0d4-4514-b9ff-000c4853db18', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 91, '2022-01-23 14:32:22', '2022-01-23 14:32:22'),
(92, 'Marvel\\Database\\Models\\Attachment', 92, 'e767d961-3dce-4a4f-b954-18846bf94eab', 'default', 'Mask Group-14', 'Mask-Group-14.png', 'image/png', 's3', 's3', 65110, '[]', '{\"thumbnail\": true}', '[]', '[]', 92, '2022-01-23 14:32:32', '2022-01-23 14:32:32'),
(93, 'Marvel\\Database\\Models\\Attachment', 93, '858b9fd9-86c0-4373-b3b6-3b8c29127d80', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 93, '2022-01-23 14:34:26', '2022-01-23 14:34:26'),
(94, 'Marvel\\Database\\Models\\Attachment', 94, '195a94a9-547a-42ec-8b81-88625ab0923e', 'default', 'Mask Group-2', 'Mask-Group-2.png', 'image/png', 's3', 's3', 86702, '[]', '{\"thumbnail\": true}', '[]', '[]', 94, '2022-01-23 17:22:13', '2022-01-23 17:22:13'),
(95, 'Marvel\\Database\\Models\\Attachment', 95, 'd8f5d8fe-175b-4970-8d09-77e8e03e2973', 'default', 'Group 14400', 'Group-14400.png', 'image/png', 's3', 's3', 9974, '[]', '{\"thumbnail\": true}', '[]', '[]', 95, '2022-01-25 19:27:08', '2022-01-25 19:27:08'),
(96, 'Marvel\\Database\\Models\\Attachment', 96, '8f816f79-4b77-4dc4-ab40-6f81d9b47e52', 'default', 'Group 14392', 'Group-14392.png', 'image/png', 's3', 's3', 9958, '[]', '{\"thumbnail\": true}', '[]', '[]', 96, '2022-01-25 19:27:34', '2022-01-25 19:27:34'),
(97, 'Marvel\\Database\\Models\\Attachment', 97, '88968824-4a5c-4ed3-b23a-2e14ed07b043', 'default', 'Group 14405', 'Group-14405.png', 'image/png', 's3', 's3', 10287, '[]', '{\"thumbnail\": true}', '[]', '[]', 97, '2022-01-25 19:27:58', '2022-01-25 19:27:58'),
(98, 'Marvel\\Database\\Models\\Attachment', 98, '94d3ff2b-04c6-400e-ad78-66d65e6e025b', 'default', 'Group 14400', 'Group-14400.png', 'image/png', 's3', 's3', 32595, '[]', '{\"thumbnail\": true}', '[]', '[]', 98, '2022-01-26 15:50:11', '2022-01-26 15:50:11'),
(99, 'Marvel\\Database\\Models\\Attachment', 99, '18b45011-79aa-4472-875c-e86565afe2f0', 'default', 'Cover 1', 'Cover-1.png', 'image/png', 's3', 's3', 130338, '[]', '{\"thumbnail\": true}', '[]', '[]', 99, '2022-01-26 15:50:21', '2022-01-26 15:50:21'),
(100, 'Marvel\\Database\\Models\\Attachment', 100, 'a7a7b706-c288-4093-8a75-f734ea033953', 'default', 'Cover 2', 'Cover-2.png', 'image/png', 's3', 's3', 193692, '[]', '{\"thumbnail\": true}', '[]', '[]', 100, '2022-01-26 15:52:09', '2022-01-26 15:52:10'),
(101, 'Marvel\\Database\\Models\\Attachment', 101, '3f05d666-6f1b-4e2e-b2bb-a6e4f3b8370c', 'default', 'Group 14392', 'Group-14392.png', 'image/png', 's3', 's3', 33582, '[]', '{\"thumbnail\": true}', '[]', '[]', 101, '2022-01-26 15:52:18', '2022-01-26 15:52:18'),
(102, 'Marvel\\Database\\Models\\Attachment', 102, '2d8410b6-e038-434f-a0aa-de6c22566b47', 'default', 'Group 14405', 'Group-14405.png', 'image/png', 's3', 's3', 34436, '[]', '{\"thumbnail\": true}', '[]', '[]', 102, '2022-01-26 15:52:57', '2022-01-26 15:52:58'),
(103, 'Marvel\\Database\\Models\\Attachment', 103, 'a8c176fa-49dc-4255-8238-94a3090c4011', 'default', 'Cover 3', 'Cover-3.png', 'image/png', 's3', 's3', 352154, '[]', '{\"thumbnail\": true}', '[]', '[]', 103, '2022-01-26 15:53:05', '2022-01-26 15:53:06'),
(104, 'Marvel\\Database\\Models\\Attachment', 104, '69d8310f-2fb1-451c-8941-916612355c8f', 'default', 'Cover 4', 'Cover-4.png', 'image/png', 's3', 's3', 203468, '[]', '{\"thumbnail\": true}', '[]', '[]', 104, '2022-01-26 15:54:25', '2022-01-26 15:54:25'),
(105, 'Marvel\\Database\\Models\\Attachment', 105, '6460f435-26f6-45ba-9a95-a658eef4a7c1', 'default', 'Group 14393', 'Group-14393.png', 'image/png', 's3', 's3', 4023, '[]', '{\"thumbnail\": true}', '[]', '[]', 105, '2022-01-26 15:54:30', '2022-01-26 15:54:30'),
(106, 'Marvel\\Database\\Models\\Attachment', 106, 'a9960690-cc1c-4ecc-be23-f37ad358eb58', 'default', 'Group 14395', 'Group-14395.png', 'image/png', 's3', 's3', 4007, '[]', '{\"thumbnail\": true}', '[]', '[]', 106, '2022-01-26 15:56:54', '2022-01-26 15:56:54'),
(107, 'Marvel\\Database\\Models\\Attachment', 107, '2665b482-42df-4ce3-b8ae-4c935ca55b91', 'default', 'Cover 5', 'Cover-5.png', 'image/png', 's3', 's3', 390436, '[]', '{\"thumbnail\": true}', '[]', '[]', 107, '2022-01-26 15:57:26', '2022-01-26 15:57:27'),
(108, 'Marvel\\Database\\Models\\Attachment', 108, '87977a11-500b-4b0d-823b-8982425d0a69', 'default', 'Cover 5', 'Cover-5.png', 'image/png', 's3', 's3', 390436, '[]', '{\"thumbnail\": true}', '[]', '[]', 108, '2022-01-26 15:59:14', '2022-01-26 15:59:14'),
(109, 'Marvel\\Database\\Models\\Attachment', 109, '5b298bfe-6aae-4700-a727-71c39cdd5d24', 'default', 'Group 14395', 'Group-14395.png', 'image/png', 's3', 's3', 4007, '[]', '{\"thumbnail\": true}', '[]', '[]', 109, '2022-01-26 15:59:21', '2022-01-26 15:59:21'),
(110, 'Marvel\\Database\\Models\\Attachment', 110, 'a683347f-9720-42f7-a8bc-98d71eb6ea5d', 'default', 'Rectangle 851', 'Rectangle-851.png', 'image/png', 's3', 's3', 80675, '[]', '{\"thumbnail\": true}', '[]', '[]', 110, '2022-01-26 20:24:58', '2022-01-26 20:24:58'),
(111, 'Marvel\\Database\\Models\\Attachment', 111, '77fcb67c-a209-4299-93cd-4ff92bf86e9e', 'default', 'Rectangle 773', 'Rectangle-773.png', 'image/png', 's3', 's3', 92451, '[]', '{\"thumbnail\": true}', '[]', '[]', 111, '2022-01-26 20:25:05', '2022-01-26 20:25:05'),
(112, 'Marvel\\Database\\Models\\Attachment', 112, 'c20785f9-3e61-4581-871b-22a8da0cbc61', 'default', 'Rectangle 780', 'Rectangle-780.png', 'image/png', 's3', 's3', 33237, '[]', '{\"thumbnail\": true}', '[]', '[]', 112, '2022-01-26 20:25:05', '2022-01-26 20:25:06'),
(113, 'Marvel\\Database\\Models\\Attachment', 113, '048e3b3a-37cb-48ed-b74a-abb0c5ffd90b', 'default', 'Rectangle 781', 'Rectangle-781.png', 'image/png', 's3', 's3', 67432, '[]', '{\"thumbnail\": true}', '[]', '[]', 113, '2022-01-26 20:25:06', '2022-01-26 20:25:06'),
(114, 'Marvel\\Database\\Models\\Attachment', 114, 'a09e42fb-c8d2-455a-896e-437875da0066', 'default', 'Rectangle 782', 'Rectangle-782.png', 'image/png', 's3', 's3', 84601, '[]', '{\"thumbnail\": true}', '[]', '[]', 114, '2022-01-26 20:25:06', '2022-01-26 20:25:06'),
(115, 'Marvel\\Database\\Models\\Attachment', 115, '1fa8a02e-5dd8-49da-b7bc-c1bb92599e9c', 'default', 'Rectangle 850', 'Rectangle-850.png', 'image/png', 's3', 's3', 72595, '[]', '{\"thumbnail\": true}', '[]', '[]', 115, '2022-01-26 21:01:36', '2022-01-26 21:01:36'),
(116, 'Marvel\\Database\\Models\\Attachment', 116, '8bf7d44e-b2a9-44dc-8a83-ba1f248de9be', 'default', 'Rectangle 780', 'Rectangle-780.png', 'image/png', 's3', 's3', 33237, '[]', '{\"thumbnail\": true}', '[]', '[]', 116, '2022-01-26 21:01:45', '2022-01-26 21:01:45'),
(117, 'Marvel\\Database\\Models\\Attachment', 117, 'cba99850-e04e-4606-8617-99f2d44cd7b9', 'default', 'Rectangle 781', 'Rectangle-781.png', 'image/png', 's3', 's3', 67432, '[]', '{\"thumbnail\": true}', '[]', '[]', 117, '2022-01-26 21:01:45', '2022-01-26 21:01:45'),
(118, 'Marvel\\Database\\Models\\Attachment', 118, 'b2110952-7635-464a-8fef-d6fbbecb05f9', 'default', 'Rectangle 789', 'Rectangle-789.png', 'image/png', 's3', 's3', 37131, '[]', '{\"thumbnail\": true}', '[]', '[]', 118, '2022-01-26 21:01:45', '2022-01-26 21:01:45'),
(119, 'Marvel\\Database\\Models\\Attachment', 119, 'ac28e097-e1d4-492d-b391-cda5c2841415', 'default', 'Rectangle 826', 'Rectangle-826.png', 'image/png', 's3', 's3', 36896, '[]', '{\"thumbnail\": true}', '[]', '[]', 119, '2022-01-26 21:01:45', '2022-01-26 21:01:45'),
(120, 'Marvel\\Database\\Models\\Attachment', 120, '16f4fb89-6272-4401-adac-25047b742868', 'default', 'Rectangle 849', 'Rectangle-849.png', 'image/png', 's3', 's3', 41912, '[]', '{\"thumbnail\": true}', '[]', '[]', 120, '2022-01-26 21:02:00', '2022-01-26 21:02:00'),
(121, 'Marvel\\Database\\Models\\Attachment', 121, '8a86aeaa-512f-4a85-88a8-1d8000e2e4d0', 'default', 'Rectangle 777', 'Rectangle-777.png', 'image/png', 's3', 's3', 77487, '[]', '{\"thumbnail\": true}', '[]', '[]', 121, '2022-01-26 21:02:07', '2022-01-26 21:02:07'),
(122, 'Marvel\\Database\\Models\\Attachment', 122, '3472d7e7-e498-4bda-9e03-8d551ded4f18', 'default', 'Rectangle 779', 'Rectangle-779.png', 'image/png', 's3', 's3', 30987, '[]', '{\"thumbnail\": true}', '[]', '[]', 122, '2022-01-26 21:02:07', '2022-01-26 21:02:08'),
(123, 'Marvel\\Database\\Models\\Attachment', 123, '8384a303-9bee-43fe-bf96-f71e20843e89', 'default', 'Rectangle 780', 'Rectangle-780.png', 'image/png', 's3', 's3', 33237, '[]', '{\"thumbnail\": true}', '[]', '[]', 123, '2022-01-26 21:02:08', '2022-01-26 21:02:08'),
(124, 'Marvel\\Database\\Models\\Attachment', 124, '0776b409-8f3f-4180-ba77-117fd034f5f9', 'default', 'Rectangle 782', 'Rectangle-782.png', 'image/png', 's3', 's3', 84601, '[]', '{\"thumbnail\": true}', '[]', '[]', 124, '2022-01-26 21:02:08', '2022-01-26 21:02:08'),
(125, 'Marvel\\Database\\Models\\Attachment', 125, '94e08b9f-4d32-4cba-8b17-1d0507a1eba4', 'default', 'Rectangle 851', 'Rectangle-851.png', 'image/png', 's3', 's3', 80675, '[]', '{\"thumbnail\": true}', '[]', '[]', 125, '2022-01-26 21:02:24', '2022-01-26 21:02:24'),
(126, 'Marvel\\Database\\Models\\Attachment', 126, '478962c0-5aa2-4c3d-bfc8-facc88aa26b7', 'default', 'Rectangle 850', 'Rectangle-850.png', 'image/png', 's3', 's3', 72595, '[]', '{\"thumbnail\": true}', '[]', '[]', 126, '2022-01-26 21:03:03', '2022-01-26 21:03:03'),
(127, 'Marvel\\Database\\Models\\Attachment', 127, '6a6ee6c4-e0b0-42e4-8641-ef77c6183a4c', 'default', 'Rectangle 831', 'Rectangle-831.png', 'image/png', 's3', 's3', 99158, '[]', '{\"thumbnail\": true}', '[]', '[]', 127, '2022-01-26 21:03:15', '2022-01-26 21:03:15'),
(128, 'Marvel\\Database\\Models\\Attachment', 128, '40d83c87-b6cb-4faa-bde9-2ef49dc947d7', 'default', 'Rectangle 841', 'Rectangle-841.png', 'image/png', 's3', 's3', 56460, '[]', '{\"thumbnail\": true}', '[]', '[]', 128, '2022-01-26 21:03:15', '2022-01-26 21:03:15'),
(129, 'Marvel\\Database\\Models\\Attachment', 129, 'd52d4366-017e-44f9-ae7b-15f1a7a5b18b', 'default', 'Rectangle 842', 'Rectangle-842.png', 'image/png', 's3', 's3', 42255, '[]', '{\"thumbnail\": true}', '[]', '[]', 129, '2022-01-26 21:03:15', '2022-01-26 21:03:15'),
(130, 'Marvel\\Database\\Models\\Attachment', 130, 'a5a93f9c-30ea-4aa1-83df-c40692178fa4', 'default', 'Rectangle 850', 'Rectangle-850.png', 'image/png', 's3', 's3', 72595, '[]', '{\"thumbnail\": true}', '[]', '[]', 130, '2022-01-26 21:03:15', '2022-01-26 21:03:15'),
(131, 'Marvel\\Database\\Models\\Attachment', 131, '08a3109d-bca7-4a5e-bbfb-6b411bbda0b6', 'default', 'Rectangle 849', 'Rectangle-849.png', 'image/png', 's3', 's3', 41912, '[]', '{\"thumbnail\": true}', '[]', '[]', 131, '2022-01-26 21:03:27', '2022-01-26 21:03:27'),
(132, 'Marvel\\Database\\Models\\Attachment', 132, '8900ee36-7368-4dd4-a7f8-1e2cd25b645d', 'default', 'Rectangle 827', 'Rectangle-827.png', 'image/png', 's3', 's3', 91300, '[]', '{\"thumbnail\": true}', '[]', '[]', 132, '2022-01-26 21:03:35', '2022-01-26 21:03:35'),
(133, 'Marvel\\Database\\Models\\Attachment', 133, 'ef9ed1db-fff3-41fa-aaa7-adb3d08f2c0b', 'default', 'Rectangle 828', 'Rectangle-828.png', 'image/png', 's3', 's3', 45088, '[]', '{\"thumbnail\": true}', '[]', '[]', 133, '2022-01-26 21:03:35', '2022-01-26 21:03:35'),
(134, 'Marvel\\Database\\Models\\Attachment', 134, 'd9ac1ca4-2b01-4c84-b9f5-600139e31eed', 'default', 'Rectangle 832', 'Rectangle-832.png', 'image/png', 's3', 's3', 126467, '[]', '{\"thumbnail\": true}', '[]', '[]', 134, '2022-01-26 21:03:35', '2022-01-26 21:03:36'),
(135, 'Marvel\\Database\\Models\\Attachment', 135, '1c1b3632-8dda-4018-9764-00b658c0f095', 'default', 'Rectangle 849', 'Rectangle-849.png', 'image/png', 's3', 's3', 41912, '[]', '{\"thumbnail\": true}', '[]', '[]', 135, '2022-01-26 21:03:36', '2022-01-26 21:03:36'),
(136, 'Marvel\\Database\\Models\\Attachment', 136, 'b2442106-46ff-44d3-9b5a-a6e694c59a88', 'default', 'Rectangle 848', 'Rectangle-848.png', 'image/png', 's3', 's3', 99042, '[]', '{\"thumbnail\": true}', '[]', '[]', 136, '2022-01-26 21:03:50', '2022-01-26 21:03:50'),
(137, 'Marvel\\Database\\Models\\Attachment', 137, '1eb9ee2a-919e-41ae-8d62-cbde7ef06b67', 'default', 'Mask Group-3', 'Mask-Group-3.png', 'image/png', 's3', 's3', 75684, '[]', '{\"thumbnail\": true}', '[]', '[]', 137, '2022-01-26 21:04:01', '2022-01-26 21:04:01'),
(138, 'Marvel\\Database\\Models\\Attachment', 138, '3be8ef56-f899-4595-b0d0-a8d7e6be3143', 'default', 'Rectangle 773', 'Rectangle-773.png', 'image/png', 's3', 's3', 92451, '[]', '{\"thumbnail\": true}', '[]', '[]', 138, '2022-01-26 21:04:01', '2022-01-26 21:04:01'),
(139, 'Marvel\\Database\\Models\\Attachment', 139, '8b5255c0-78c7-43e2-978e-fc3a8592fc8f', 'default', 'Rectangle 777', 'Rectangle-777.png', 'image/png', 's3', 's3', 77487, '[]', '{\"thumbnail\": true}', '[]', '[]', 139, '2022-01-26 21:04:01', '2022-01-26 21:04:02'),
(140, 'Marvel\\Database\\Models\\Attachment', 140, '85d6f71e-33ca-4000-b2f9-f596eee5d833', 'default', 'Rectangle 848', 'Rectangle-848.png', 'image/png', 's3', 's3', 99042, '[]', '{\"thumbnail\": true}', '[]', '[]', 140, '2022-01-26 21:04:02', '2022-01-26 21:04:02'),
(141, 'Marvel\\Database\\Models\\Attachment', 141, '729a4c38-445b-4252-835d-dd14d0734b07', 'default', 'Rectangle 847', 'Rectangle-847.png', 'image/png', 's3', 's3', 35944, '[]', '{\"thumbnail\": true}', '[]', '[]', 141, '2022-01-26 21:04:58', '2022-01-26 21:04:58'),
(142, 'Marvel\\Database\\Models\\Attachment', 142, '3692fd8f-714e-4879-855f-9b3e653300b8', 'default', 'Rectangle 834', 'Rectangle-834.png', 'image/png', 's3', 's3', 146913, '[]', '{\"thumbnail\": true}', '[]', '[]', 142, '2022-01-26 21:05:08', '2022-01-26 21:05:08'),
(143, 'Marvel\\Database\\Models\\Attachment', 143, '3bc2c673-ebef-4075-af35-feadbf50d711', 'default', 'Rectangle 836', 'Rectangle-836.png', 'image/png', 's3', 's3', 56569, '[]', '{\"thumbnail\": true}', '[]', '[]', 143, '2022-01-26 21:05:08', '2022-01-26 21:05:09'),
(144, 'Marvel\\Database\\Models\\Attachment', 144, '587fde32-4946-4800-a502-4d6d2344ed5a', 'default', 'Rectangle 837', 'Rectangle-837.png', 'image/png', 's3', 's3', 78143, '[]', '{\"thumbnail\": true}', '[]', '[]', 144, '2022-01-26 21:05:09', '2022-01-26 21:05:09'),
(145, 'Marvel\\Database\\Models\\Attachment', 145, 'fe095485-0209-456f-a327-a7a6ed7f6c0c', 'default', 'Rectangle 847', 'Rectangle-847.png', 'image/png', 's3', 's3', 35944, '[]', '{\"thumbnail\": true}', '[]', '[]', 145, '2022-01-26 21:05:09', '2022-01-26 21:05:09'),
(146, 'Marvel\\Database\\Models\\Attachment', 146, '0a21d29a-e461-4a82-b71b-f40407f94cfc', 'default', 'Rectangle 846', 'Rectangle-846.png', 'image/png', 's3', 's3', 76296, '[]', '{\"thumbnail\": true}', '[]', '[]', 146, '2022-01-26 21:05:21', '2022-01-26 21:05:21'),
(147, 'Marvel\\Database\\Models\\Attachment', 147, 'b2736c39-14e2-487d-bacd-016f91087164', 'default', 'Rectangle 834', 'Rectangle-834.png', 'image/png', 's3', 's3', 146913, '[]', '{\"thumbnail\": true}', '[]', '[]', 147, '2022-01-26 21:05:34', '2022-01-26 21:05:34'),
(148, 'Marvel\\Database\\Models\\Attachment', 148, 'bd8fb81a-9379-4a53-b3ca-9286d6b080dd', 'default', 'Rectangle 836', 'Rectangle-836.png', 'image/png', 's3', 's3', 56569, '[]', '{\"thumbnail\": true}', '[]', '[]', 148, '2022-01-26 21:05:34', '2022-01-26 21:05:35'),
(149, 'Marvel\\Database\\Models\\Attachment', 149, '30590e96-c4b7-4f5a-85db-9a5b391ebd15', 'default', 'Rectangle 845', 'Rectangle-845.png', 'image/png', 's3', 's3', 45321, '[]', '{\"thumbnail\": true}', '[]', '[]', 149, '2022-01-26 21:05:35', '2022-01-26 21:05:35'),
(150, 'Marvel\\Database\\Models\\Attachment', 150, '110c3f64-faee-47b8-b515-563bc4c0295c', 'default', 'Rectangle 846', 'Rectangle-846.png', 'image/png', 's3', 's3', 76296, '[]', '{\"thumbnail\": true}', '[]', '[]', 150, '2022-01-26 21:05:35', '2022-01-26 21:05:35'),
(151, 'Marvel\\Database\\Models\\Attachment', 151, '1949788c-aabc-4cd6-aefb-eb18d22c86ed', 'default', 'Rectangle 845', 'Rectangle-845.png', 'image/png', 's3', 's3', 45321, '[]', '{\"thumbnail\": true}', '[]', '[]', 151, '2022-01-26 21:06:02', '2022-01-26 21:06:02'),
(152, 'Marvel\\Database\\Models\\Attachment', 152, '51d51d7d-22c8-4ea3-bb7f-ab5689ea3f04', 'default', 'Rectangle 790', 'Rectangle-790.png', 'image/png', 's3', 's3', 73860, '[]', '{\"thumbnail\": true}', '[]', '[]', 152, '2022-01-26 21:06:11', '2022-01-26 21:06:11'),
(153, 'Marvel\\Database\\Models\\Attachment', 153, 'b7213963-444d-4774-9838-267e52ee3cdd', 'default', 'Rectangle 841', 'Rectangle-841.png', 'image/png', 's3', 's3', 56460, '[]', '{\"thumbnail\": true}', '[]', '[]', 153, '2022-01-26 21:06:11', '2022-01-26 21:06:11'),
(154, 'Marvel\\Database\\Models\\Attachment', 154, 'e7b4a614-ae12-4b74-96ef-d3fc6680efaa', 'default', 'Rectangle 844', 'Rectangle-844.png', 'image/png', 's3', 's3', 83764, '[]', '{\"thumbnail\": true}', '[]', '[]', 154, '2022-01-26 21:06:11', '2022-01-26 21:06:12'),
(155, 'Marvel\\Database\\Models\\Attachment', 155, '6ec3f332-a1e9-4815-9df9-c889a7b41042', 'default', 'Rectangle 845', 'Rectangle-845.png', 'image/png', 's3', 's3', 45321, '[]', '{\"thumbnail\": true}', '[]', '[]', 155, '2022-01-26 21:06:12', '2022-01-26 21:06:12'),
(156, 'Marvel\\Database\\Models\\Attachment', 156, '28947f72-4529-4f8a-978a-71394ea2a457', 'default', 'Rectangle 844', 'Rectangle-844.png', 'image/png', 's3', 's3', 83764, '[]', '{\"thumbnail\": true}', '[]', '[]', 156, '2022-01-26 21:06:22', '2022-01-26 21:06:22'),
(157, 'Marvel\\Database\\Models\\Attachment', 157, '3b26f8b2-9d2e-4af5-b829-5d53cd0911b2', 'default', 'Rectangle 828', 'Rectangle-828.png', 'image/png', 's3', 's3', 45088, '[]', '{\"thumbnail\": true}', '[]', '[]', 157, '2022-01-26 21:06:32', '2022-01-26 21:06:32'),
(158, 'Marvel\\Database\\Models\\Attachment', 158, '16cc7b9d-5839-43e2-91ea-fbdff19f79f5', 'default', 'Rectangle 836', 'Rectangle-836.png', 'image/png', 's3', 's3', 56569, '[]', '{\"thumbnail\": true}', '[]', '[]', 158, '2022-01-26 21:06:32', '2022-01-26 21:06:32'),
(159, 'Marvel\\Database\\Models\\Attachment', 159, 'ca71ebb6-374a-476e-b1eb-8cad4b7a2445', 'default', 'Rectangle 844', 'Rectangle-844.png', 'image/png', 's3', 's3', 83764, '[]', '{\"thumbnail\": true}', '[]', '[]', 159, '2022-01-26 21:06:32', '2022-01-26 21:06:32'),
(160, 'Marvel\\Database\\Models\\Attachment', 160, 'b651165a-a52b-49ce-bceb-542190c0c369', 'default', 'Rectangle 845', 'Rectangle-845.png', 'image/png', 's3', 's3', 45321, '[]', '{\"thumbnail\": true}', '[]', '[]', 160, '2022-01-26 21:06:32', '2022-01-26 21:06:32'),
(161, 'Marvel\\Database\\Models\\Attachment', 161, 'cc05a09c-75f2-4386-95fe-3557a2296acb', 'default', 'Rectangle 841', 'Rectangle-841.png', 'image/png', 's3', 's3', 56460, '[]', '{\"thumbnail\": true}', '[]', '[]', 161, '2022-01-26 21:07:16', '2022-01-26 21:07:16'),
(162, 'Marvel\\Database\\Models\\Attachment', 162, '2f3121ab-4436-41dd-93ef-c5cb6eeb8192', 'default', 'Rectangle 841', 'Rectangle-841.png', 'image/png', 's3', 's3', 56460, '[]', '{\"thumbnail\": true}', '[]', '[]', 162, '2022-01-26 21:07:29', '2022-01-26 21:07:29'),
(163, 'Marvel\\Database\\Models\\Attachment', 163, 'dfb16091-a9ec-436a-bb19-b13e4271120b', 'default', 'Rectangle 842', 'Rectangle-842.png', 'image/png', 's3', 's3', 42255, '[]', '{\"thumbnail\": true}', '[]', '[]', 163, '2022-01-26 21:07:29', '2022-01-26 21:07:29'),
(164, 'Marvel\\Database\\Models\\Attachment', 164, '468b4704-f220-4f11-96da-31c5d81a1dd9', 'default', 'Rectangle 845', 'Rectangle-845.png', 'image/png', 's3', 's3', 45321, '[]', '{\"thumbnail\": true}', '[]', '[]', 164, '2022-01-26 21:07:29', '2022-01-26 21:07:29'),
(165, 'Marvel\\Database\\Models\\Attachment', 165, '620b62a6-7b93-4077-8ce1-c98c8e2b9dc6', 'default', 'Rectangle 850', 'Rectangle-850.png', 'image/png', 's3', 's3', 72595, '[]', '{\"thumbnail\": true}', '[]', '[]', 165, '2022-01-26 21:07:29', '2022-01-26 21:07:29'),
(166, 'Marvel\\Database\\Models\\Attachment', 166, 'ab9ddfb9-ef13-42d9-a937-209c79023236', 'default', 'Rectangle 840', 'Rectangle-840.png', 'image/png', 's3', 's3', 51337, '[]', '{\"thumbnail\": true}', '[]', '[]', 166, '2022-01-26 22:33:00', '2022-01-26 22:33:00'),
(167, 'Marvel\\Database\\Models\\Attachment', 167, 'e07c5a3c-f28f-4257-b2f9-ffcbd6eba2aa', 'default', 'Rectangle 832', 'Rectangle-832.png', 'image/png', 's3', 's3', 126467, '[]', '{\"thumbnail\": true}', '[]', '[]', 167, '2022-01-26 22:33:18', '2022-01-26 22:33:18'),
(168, 'Marvel\\Database\\Models\\Attachment', 168, '86ee52be-ff38-44db-bc4b-bfe8daee8aa9', 'default', 'Rectangle 833', 'Rectangle-833.png', 'image/png', 's3', 's3', 66797, '[]', '{\"thumbnail\": true}', '[]', '[]', 168, '2022-01-26 22:33:18', '2022-01-26 22:33:18'),
(169, 'Marvel\\Database\\Models\\Attachment', 169, 'bca3892c-4df9-4377-bef6-814d477cc5e5', 'default', 'Rectangle 834', 'Rectangle-834.png', 'image/png', 's3', 's3', 146913, '[]', '{\"thumbnail\": true}', '[]', '[]', 169, '2022-01-26 22:33:18', '2022-01-26 22:33:18'),
(170, 'Marvel\\Database\\Models\\Attachment', 170, 'e0863233-bf9a-4965-8b53-990fbc3396c2', 'default', 'Rectangle 840', 'Rectangle-840.png', 'image/png', 's3', 's3', 51337, '[]', '{\"thumbnail\": true}', '[]', '[]', 170, '2022-01-26 22:33:18', '2022-01-26 22:33:18'),
(171, 'Marvel\\Database\\Models\\Attachment', 171, 'a4d6885a-d370-43a8-acf2-32fcb8df90e9', 'default', 'Rectangle 839', 'Rectangle-839.png', 'image/png', 's3', 's3', 43285, '[]', '{\"thumbnail\": true}', '[]', '[]', 171, '2022-01-26 22:33:54', '2022-01-26 22:33:54'),
(172, 'Marvel\\Database\\Models\\Attachment', 172, '4061bedc-b130-461c-841d-15804549ee28', 'default', 'Rectangle 839', 'Rectangle-839.png', 'image/png', 's3', 's3', 43285, '[]', '{\"thumbnail\": true}', '[]', '[]', 172, '2022-01-26 22:34:04', '2022-01-26 22:34:05'),
(173, 'Marvel\\Database\\Models\\Attachment', 173, 'da0171ee-84b0-43e0-b36c-b3b7ab9476c6', 'default', 'Rectangle 840', 'Rectangle-840.png', 'image/png', 's3', 's3', 51337, '[]', '{\"thumbnail\": true}', '[]', '[]', 173, '2022-01-26 22:34:05', '2022-01-26 22:34:05'),
(174, 'Marvel\\Database\\Models\\Attachment', 174, '668f4a49-40cb-439a-8f3b-e5aa5e915814', 'default', 'Rectangle 842', 'Rectangle-842.png', 'image/png', 's3', 's3', 42255, '[]', '{\"thumbnail\": true}', '[]', '[]', 174, '2022-01-26 22:34:05', '2022-01-26 22:34:05'),
(175, 'Marvel\\Database\\Models\\Attachment', 175, 'dc0b39b4-5fbf-44fe-bc2b-51efba27a762', 'default', 'Rectangle 844', 'Rectangle-844.png', 'image/png', 's3', 's3', 83764, '[]', '{\"thumbnail\": true}', '[]', '[]', 175, '2022-01-26 22:34:05', '2022-01-26 22:34:05'),
(176, 'Marvel\\Database\\Models\\Attachment', 176, '9de98ec0-4c6a-464d-adec-b3b39e376fe5', 'default', 'Rectangle 838', 'Rectangle-838.png', 'image/png', 's3', 's3', 56959, '[]', '{\"thumbnail\": true}', '[]', '[]', 176, '2022-01-26 22:34:49', '2022-01-26 22:34:49'),
(177, 'Marvel\\Database\\Models\\Attachment', 177, 'c79209aa-d61c-42e0-a52a-8b2c62f1435c', 'default', 'Rectangle 837', 'Rectangle-837.png', 'image/png', 's3', 's3', 78143, '[]', '{\"thumbnail\": true}', '[]', '[]', 177, '2022-01-26 22:34:57', '2022-01-26 22:34:57'),
(178, 'Marvel\\Database\\Models\\Attachment', 178, '64da6b7a-aad0-460d-818d-adf3842b43ea', 'default', 'Rectangle 838', 'Rectangle-838.png', 'image/png', 's3', 's3', 56959, '[]', '{\"thumbnail\": true}', '[]', '[]', 178, '2022-01-26 22:34:57', '2022-01-26 22:34:57'),
(179, 'Marvel\\Database\\Models\\Attachment', 179, '59db67d2-31a6-458b-b7ea-326db807a216', 'default', 'Rectangle 845', 'Rectangle-845.png', 'image/png', 's3', 's3', 45321, '[]', '{\"thumbnail\": true}', '[]', '[]', 179, '2022-01-26 22:34:57', '2022-01-26 22:34:57'),
(180, 'Marvel\\Database\\Models\\Attachment', 180, '819e20be-8c35-470c-8ae2-5c8c5605ab72', 'default', 'Rectangle 846', 'Rectangle-846.png', 'image/png', 's3', 's3', 76296, '[]', '{\"thumbnail\": true}', '[]', '[]', 180, '2022-01-26 22:34:58', '2022-01-26 22:34:58'),
(181, 'Marvel\\Database\\Models\\Attachment', 181, 'f4000e16-12bf-4b48-90bc-3408730f305b', 'default', 'Rectangle 837', 'Rectangle-837.png', 'image/png', 's3', 's3', 78143, '[]', '{\"thumbnail\": true}', '[]', '[]', 181, '2022-01-26 22:35:22', '2022-01-26 22:35:23'),
(182, 'Marvel\\Database\\Models\\Attachment', 182, '170f5c1b-aedf-4b36-8e91-9aef13769c4b', 'default', 'Rectangle 837', 'Rectangle-837.png', 'image/png', 's3', 's3', 78143, '[]', '{\"thumbnail\": true}', '[]', '[]', 182, '2022-01-26 22:35:35', '2022-01-26 22:35:35'),
(183, 'Marvel\\Database\\Models\\Attachment', 183, '8abbb73b-ff80-49ff-8645-c022ff99c370', 'default', 'Rectangle 838', 'Rectangle-838.png', 'image/png', 's3', 's3', 56959, '[]', '{\"thumbnail\": true}', '[]', '[]', 183, '2022-01-26 22:35:35', '2022-01-26 22:35:35'),
(184, 'Marvel\\Database\\Models\\Attachment', 184, 'c57a808b-8f28-411c-8a57-97830b6eb921', 'default', 'Rectangle 840', 'Rectangle-840.png', 'image/png', 's3', 's3', 51337, '[]', '{\"thumbnail\": true}', '[]', '[]', 184, '2022-01-26 22:35:35', '2022-01-26 22:35:35'),
(185, 'Marvel\\Database\\Models\\Attachment', 185, 'e7b30cfd-d5a5-40ae-aa12-a4f851522ca2', 'default', 'Rectangle 845', 'Rectangle-845.png', 'image/png', 's3', 's3', 45321, '[]', '{\"thumbnail\": true}', '[]', '[]', 185, '2022-01-26 22:35:36', '2022-01-26 22:35:36'),
(186, 'Marvel\\Database\\Models\\Attachment', 186, '0c349b58-4f33-489e-9ad9-94ac2c9161ba', 'default', 'Rectangle 836', 'Rectangle-836.png', 'image/png', 's3', 's3', 56569, '[]', '{\"thumbnail\": true}', '[]', '[]', 186, '2022-01-26 22:36:06', '2022-01-26 22:36:07'),
(187, 'Marvel\\Database\\Models\\Attachment', 187, '6ca234dc-7b26-4981-b9a1-7c4ea3e6a411', 'default', 'Rectangle 836', 'Rectangle-836.png', 'image/png', 's3', 's3', 56569, '[]', '{\"thumbnail\": true}', '[]', '[]', 187, '2022-01-26 22:36:20', '2022-01-26 22:36:20'),
(188, 'Marvel\\Database\\Models\\Attachment', 188, '276fefa6-74cf-4954-a498-cf0ab21c84de', 'default', 'Rectangle 844', 'Rectangle-844.png', 'image/png', 's3', 's3', 83764, '[]', '{\"thumbnail\": true}', '[]', '[]', 188, '2022-01-26 22:36:20', '2022-01-26 22:36:20'),
(189, 'Marvel\\Database\\Models\\Attachment', 189, 'a0727d1e-45d5-4c9a-af97-de8d8827d898', 'default', 'Rectangle 845', 'Rectangle-845.png', 'image/png', 's3', 's3', 45321, '[]', '{\"thumbnail\": true}', '[]', '[]', 189, '2022-01-26 22:36:20', '2022-01-26 22:36:20'),
(190, 'Marvel\\Database\\Models\\Attachment', 190, '801ee4c8-c069-41bc-927e-3dd115410053', 'default', 'Rectangle 846', 'Rectangle-846.png', 'image/png', 's3', 's3', 76296, '[]', '{\"thumbnail\": true}', '[]', '[]', 190, '2022-01-26 22:36:20', '2022-01-26 22:36:20');
INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `generated_conversions`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(191, 'Marvel\\Database\\Models\\Attachment', 191, '6cbedfbd-9404-4b34-aa3d-dab80735f252', 'default', 'Group 14394', 'Group-14394.png', 'image/png', 's3', 's3', 3529, '[]', '{\"thumbnail\": true}', '[]', '[]', 191, '2022-01-26 22:48:23', '2022-01-26 22:48:23'),
(192, 'Marvel\\Database\\Models\\Attachment', 192, 'c47cb3af-f906-479a-947d-917cae779e9b', 'default', 'Cover 1', 'Cover-1.png', 'image/png', 's3', 's3', 130338, '[]', '{\"thumbnail\": true}', '[]', '[]', 192, '2022-01-26 22:48:33', '2022-01-26 22:48:34'),
(193, 'Marvel\\Database\\Models\\Attachment', 193, '082ab85b-88a8-457a-a1f5-a1a2bc25e2f2', 'default', 'Cover 2', 'Cover-2.png', 'image/png', 's3', 's3', 193692, '[]', '{\"thumbnail\": true}', '[]', '[]', 193, '2022-01-26 22:51:51', '2022-01-26 22:51:51'),
(194, 'Marvel\\Database\\Models\\Attachment', 194, '99f60744-ab0e-480c-9251-de82f220d00a', 'default', 'Group 14398', 'Group-14398.png', 'image/png', 's3', 's3', 34936, '[]', '{\"thumbnail\": true}', '[]', '[]', 194, '2022-01-26 22:52:02', '2022-01-26 22:52:02'),
(195, 'Marvel\\Database\\Models\\Attachment', 195, 'ea82c932-485c-4d13-9c8f-a3689b614b0b', 'default', 'Group 14404', 'Group-14404.png', 'image/png', 's3', 's3', 8831, '[]', '{\"thumbnail\": true}', '[]', '[]', 195, '2022-01-26 22:53:50', '2022-01-26 22:53:50'),
(196, 'Marvel\\Database\\Models\\Attachment', 196, '8f0c752e-44ae-4335-bd39-6fab54a521d1', 'default', 'Cover 3', 'Cover-3.png', 'image/png', 's3', 's3', 352154, '[]', '{\"thumbnail\": true}', '[]', '[]', 196, '2022-01-26 22:54:00', '2022-01-26 22:54:00'),
(197, 'Marvel\\Database\\Models\\Attachment', 197, '7a79d9b2-c845-4f87-b5fa-8ac7998480ba', 'default', 'Cover 4', 'Cover-4.png', 'image/png', 's3', 's3', 203468, '[]', '{\"thumbnail\": true}', '[]', '[]', 197, '2022-01-26 22:55:00', '2022-01-26 22:55:00'),
(198, 'Marvel\\Database\\Models\\Attachment', 198, 'e1252174-2554-4e9b-88d1-2b2280292dd2', 'default', 'Cover 4', 'Cover-4.png', 'image/png', 's3', 's3', 203468, '[]', '{\"thumbnail\": true}', '[]', '[]', 198, '2022-01-26 22:55:03', '2022-01-26 22:55:03'),
(199, 'Marvel\\Database\\Models\\Attachment', 199, 'b885daf1-7e97-4f5a-8987-3734e1c3095d', 'default', 'Group 14403', 'Group-14403.png', 'image/png', 's3', 's3', 27150, '[]', '{\"thumbnail\": true}', '[]', '[]', 199, '2022-01-26 22:55:10', '2022-01-26 22:55:11'),
(200, 'Marvel\\Database\\Models\\Attachment', 200, '196b05ae-6e76-4293-a54c-6fb7706b05c5', 'default', 'Rectangle 834', 'Rectangle-834.png', 'image/png', 's3', 's3', 146913, '[]', '{\"thumbnail\": true}', '[]', '[]', 200, '2022-01-26 23:01:24', '2022-01-26 23:01:24'),
(201, 'Marvel\\Database\\Models\\Attachment', 201, '501271f2-0356-491c-a30b-f3026375a0a8', 'default', 'Rectangle 797', 'Rectangle-797.png', 'image/png', 's3', 's3', 45164, '[]', '{\"thumbnail\": true}', '[]', '[]', 201, '2022-01-26 23:01:33', '2022-01-26 23:01:33'),
(202, 'Marvel\\Database\\Models\\Attachment', 202, '1d2e5b7b-6437-4d54-a77f-02eb62d71f89', 'default', 'Rectangle 831', 'Rectangle-831.png', 'image/png', 's3', 's3', 99158, '[]', '{\"thumbnail\": true}', '[]', '[]', 202, '2022-01-26 23:01:33', '2022-01-26 23:01:34'),
(203, 'Marvel\\Database\\Models\\Attachment', 203, '13cafb29-1231-43b6-9c05-49249ebd785e', 'default', 'Rectangle 834', 'Rectangle-834.png', 'image/png', 's3', 's3', 146913, '[]', '{\"thumbnail\": true}', '[]', '[]', 203, '2022-01-26 23:01:34', '2022-01-26 23:01:34'),
(204, 'Marvel\\Database\\Models\\Attachment', 204, 'bd06527d-c9fe-4aae-a3e9-87f6d7734b41', 'default', 'Rectangle 841', 'Rectangle-841.png', 'image/png', 's3', 's3', 56460, '[]', '{\"thumbnail\": true}', '[]', '[]', 204, '2022-01-26 23:01:34', '2022-01-26 23:01:34'),
(205, 'Marvel\\Database\\Models\\Attachment', 205, '75e8c282-74bc-40b3-94b6-5afc7bea6b28', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 205, '2022-01-26 23:03:49', '2022-01-26 23:03:49'),
(206, 'Marvel\\Database\\Models\\Attachment', 206, '65a137e2-6aed-4539-9edf-bce9783eeeca', 'default', 'Rectangle 832', 'Rectangle-832.png', 'image/png', 's3', 's3', 126467, '[]', '{\"thumbnail\": true}', '[]', '[]', 206, '2022-01-26 23:05:38', '2022-01-26 23:05:38'),
(207, 'Marvel\\Database\\Models\\Attachment', 207, 'f8ad28f4-102c-4bea-b898-e057990f22e8', 'default', 'Rectangle 832', 'Rectangle-832.png', 'image/png', 's3', 's3', 126467, '[]', '{\"thumbnail\": true}', '[]', '[]', 207, '2022-01-26 23:05:50', '2022-01-26 23:05:50'),
(208, 'Marvel\\Database\\Models\\Attachment', 208, '81e10e4d-70bf-401e-beae-e4ca1642a7ed', 'default', 'Rectangle 787', 'Rectangle-787.png', 'image/png', 's3', 's3', 64703, '[]', '{\"thumbnail\": true}', '[]', '[]', 208, '2022-01-26 23:05:58', '2022-01-26 23:05:58'),
(209, 'Marvel\\Database\\Models\\Attachment', 209, 'fe817b63-a864-4ea3-bc99-dc64c747aa4f', 'default', 'Rectangle 827', 'Rectangle-827.png', 'image/png', 's3', 's3', 91300, '[]', '{\"thumbnail\": true}', '[]', '[]', 209, '2022-01-26 23:05:58', '2022-01-26 23:05:58'),
(210, 'Marvel\\Database\\Models\\Attachment', 210, 'f39a96dc-b5a8-4993-8979-017f2b4f3919', 'default', 'Rectangle 785', 'Rectangle-785.png', 'image/png', 's3', 's3', 35364, '[]', '{\"thumbnail\": true}', '[]', '[]', 210, '2022-01-26 23:06:04', '2022-01-26 23:06:04'),
(211, 'Marvel\\Database\\Models\\Attachment', 211, '43e650f8-d11c-4ca0-bf31-c5bc24a065c8', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 211, '2022-01-26 23:07:09', '2022-01-26 23:07:09'),
(212, 'Marvel\\Database\\Models\\Attachment', 212, 'e13c885e-9f55-47f9-adea-f874a05a9c0e', 'default', 'Rectangle 831', 'Rectangle-831.png', 'image/png', 's3', 's3', 99158, '[]', '{\"thumbnail\": true}', '[]', '[]', 212, '2022-01-26 23:09:42', '2022-01-26 23:09:42'),
(213, 'Marvel\\Database\\Models\\Attachment', 213, '7459f339-f8bf-4e74-9ad4-0bb3de68975a', 'default', 'Rectangle 829', 'Rectangle-829.png', 'image/png', 's3', 's3', 89430, '[]', '{\"thumbnail\": true}', '[]', '[]', 213, '2022-01-26 23:09:52', '2022-01-26 23:09:52'),
(214, 'Marvel\\Database\\Models\\Attachment', 214, '63906bdb-4889-429e-b08c-2c508edf2c26', 'default', 'Rectangle 831', 'Rectangle-831.png', 'image/png', 's3', 's3', 99158, '[]', '{\"thumbnail\": true}', '[]', '[]', 214, '2022-01-26 23:09:52', '2022-01-26 23:09:52'),
(215, 'Marvel\\Database\\Models\\Attachment', 215, '8d46d965-ede6-451f-97b2-4b5938a93aa7', 'default', 'Rectangle 837', 'Rectangle-837.png', 'image/png', 's3', 's3', 78143, '[]', '{\"thumbnail\": true}', '[]', '[]', 215, '2022-01-26 23:09:52', '2022-01-26 23:09:53'),
(216, 'Marvel\\Database\\Models\\Attachment', 216, 'dc803733-c2d1-4ba2-a46d-e3062f0c0677', 'default', 'Rectangle 851', 'Rectangle-851.png', 'image/png', 's3', 's3', 80675, '[]', '{\"thumbnail\": true}', '[]', '[]', 216, '2022-01-26 23:09:53', '2022-01-26 23:09:53'),
(217, 'Marvel\\Database\\Models\\Attachment', 217, 'ba271072-8c78-4a48-8b0d-e7699ac9ee78', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 217, '2022-01-26 23:11:20', '2022-01-26 23:11:20'),
(218, 'Marvel\\Database\\Models\\Attachment', 218, '4a61a720-7916-4cb3-8b96-80378749e1f5', 'default', 'Rectangle 830', 'Rectangle-830.png', 'image/png', 's3', 's3', 36718, '[]', '{\"thumbnail\": true}', '[]', '[]', 218, '2022-01-26 23:11:41', '2022-01-26 23:11:41'),
(219, 'Marvel\\Database\\Models\\Attachment', 219, '54bea0c5-2205-47d5-9ac3-70bc7dd4c62c', 'default', 'Rectangle 783', 'Rectangle-783.png', 'image/png', 's3', 's3', 41088, '[]', '{\"thumbnail\": true}', '[]', '[]', 219, '2022-01-26 23:11:55', '2022-01-26 23:11:56'),
(220, 'Marvel\\Database\\Models\\Attachment', 220, '802e44ba-c925-4631-ad11-30ff2d2719be', 'default', 'Rectangle 789', 'Rectangle-789.png', 'image/png', 's3', 's3', 37131, '[]', '{\"thumbnail\": true}', '[]', '[]', 220, '2022-01-26 23:11:56', '2022-01-26 23:11:56'),
(221, 'Marvel\\Database\\Models\\Attachment', 221, 'f60c3195-2422-4132-b120-630f1b1aa620', 'default', 'Rectangle 830', 'Rectangle-830.png', 'image/png', 's3', 's3', 36718, '[]', '{\"thumbnail\": true}', '[]', '[]', 221, '2022-01-26 23:11:56', '2022-01-26 23:11:56'),
(222, 'Marvel\\Database\\Models\\Attachment', 222, '9ce6a1f7-623b-4015-9696-bd5cc5456dcf', 'default', 'Rectangle 847', 'Rectangle-847.png', 'image/png', 's3', 's3', 35944, '[]', '{\"thumbnail\": true}', '[]', '[]', 222, '2022-01-26 23:11:56', '2022-01-26 23:11:56'),
(223, 'Marvel\\Database\\Models\\Attachment', 223, '8d9312c8-d7e7-4f52-8c2f-063b0e8b9b93', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 223, '2022-01-26 23:12:58', '2022-01-26 23:12:58'),
(224, 'Marvel\\Database\\Models\\Attachment', 224, '7d70f337-f6d7-432c-97d5-27d41a67d70a', 'default', 'Rectangle 829', 'Rectangle-829.png', 'image/png', 's3', 's3', 89430, '[]', '{\"thumbnail\": true}', '[]', '[]', 224, '2022-01-26 23:13:11', '2022-01-26 23:13:11'),
(225, 'Marvel\\Database\\Models\\Attachment', 225, 'b8b699c0-e6c0-428a-b505-186aa6808fb2', 'default', 'Rectangle 797', 'Rectangle-797.png', 'image/png', 's3', 's3', 45164, '[]', '{\"thumbnail\": true}', '[]', '[]', 225, '2022-01-26 23:13:20', '2022-01-26 23:13:21'),
(226, 'Marvel\\Database\\Models\\Attachment', 226, 'd4f0765b-c555-4cf9-a4b4-aadf37d79ab2', 'default', 'Rectangle 829', 'Rectangle-829.png', 'image/png', 's3', 's3', 89430, '[]', '{\"thumbnail\": true}', '[]', '[]', 226, '2022-01-26 23:13:21', '2022-01-26 23:13:21'),
(227, 'Marvel\\Database\\Models\\Attachment', 227, 'df169aa1-77d0-4033-b79d-cb85209785c4', 'default', 'Rectangle 830', 'Rectangle-830.png', 'image/png', 's3', 's3', 36718, '[]', '{\"thumbnail\": true}', '[]', '[]', 227, '2022-01-26 23:13:21', '2022-01-26 23:13:21'),
(228, 'Marvel\\Database\\Models\\Attachment', 228, '864dcad3-7eb6-4e3e-9a00-ef3b11813e36', 'default', 'Rectangle 844', 'Rectangle-844.png', 'image/png', 's3', 's3', 83764, '[]', '{\"thumbnail\": true}', '[]', '[]', 228, '2022-01-26 23:13:21', '2022-01-26 23:13:21'),
(229, 'Marvel\\Database\\Models\\Attachment', 229, 'a5940190-315f-47b2-956b-df2139c3d688', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 229, '2022-01-26 23:14:09', '2022-01-26 23:14:09'),
(230, 'Marvel\\Database\\Models\\Attachment', 230, '84ee22e0-8a85-4ab7-8cca-fe1df4ceffef', 'default', 'Rectangle 829', 'Rectangle-829.png', 'image/png', 's3', 's3', 89430, '[]', '{\"thumbnail\": true}', '[]', '[]', 230, '2022-01-27 21:02:39', '2022-01-27 21:02:39'),
(231, 'Marvel\\Database\\Models\\Attachment', 231, 'f616d747-7113-4fa7-a22e-3399cfa52da4', 'default', 'Rectangle 829', 'Rectangle-829.png', 'image/png', 's3', 's3', 89430, '[]', '{\"thumbnail\": true}', '[]', '[]', 231, '2022-01-27 21:07:40', '2022-01-27 21:07:40'),
(232, 'Marvel\\Database\\Models\\Attachment', 232, '9aeeb5fb-b492-47c2-8d78-fb670d7cd775', 'default', 'Rectangle 832', 'Rectangle-832.png', 'image/png', 's3', 's3', 126467, '[]', '{\"thumbnail\": true}', '[]', '[]', 232, '2022-01-27 21:07:40', '2022-01-27 21:07:41'),
(233, 'Marvel\\Database\\Models\\Attachment', 233, '2329f694-d3b5-496c-9f32-1d905367acd6', 'default', 'Rectangle 834', 'Rectangle-834.png', 'image/png', 's3', 's3', 146913, '[]', '{\"thumbnail\": true}', '[]', '[]', 233, '2022-01-27 21:07:41', '2022-01-27 21:07:41'),
(234, 'Marvel\\Database\\Models\\Attachment', 234, '334968d5-24aa-4f52-8ff3-fae6317373f1', 'default', 'Rectangle 849', 'Rectangle-849.png', 'image/png', 's3', 's3', 41912, '[]', '{\"thumbnail\": true}', '[]', '[]', 234, '2022-01-27 21:07:41', '2022-01-27 21:07:41'),
(235, 'Marvel\\Database\\Models\\Attachment', 235, '35c052c7-e9f1-40f4-8650-93e696376c22', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 235, '2022-01-27 21:35:50', '2022-01-27 21:35:50'),
(236, 'Marvel\\Database\\Models\\Attachment', 236, 'e81e7a6d-b6a3-42f0-8b4d-5ee27992dc02', 'default', 'Rectangle 797', 'Rectangle-797.png', 'image/png', 's3', 's3', 45164, '[]', '{\"thumbnail\": true}', '[]', '[]', 236, '2022-01-27 21:36:16', '2022-01-27 21:36:16'),
(237, 'Marvel\\Database\\Models\\Attachment', 237, '1116d870-3fdd-46b6-9d48-2dc38ec5d2e9', 'default', 'Rectangle 828', 'Rectangle-828.png', 'image/png', 's3', 's3', 45088, '[]', '{\"thumbnail\": true}', '[]', '[]', 237, '2022-01-27 21:36:25', '2022-01-27 21:36:25'),
(238, 'Marvel\\Database\\Models\\Attachment', 238, 'd66dcbf8-af36-49f5-89b2-f18daab1fbee', 'default', 'Rectangle 796', 'Rectangle-796.png', 'image/png', 's3', 's3', 53467, '[]', '{\"thumbnail\": true}', '[]', '[]', 238, '2022-01-27 21:36:34', '2022-01-27 21:36:34'),
(239, 'Marvel\\Database\\Models\\Attachment', 239, '502e2eb3-677d-4fcf-9b8f-8ccbeebcdefe', 'default', 'Rectangle 797', 'Rectangle-797.png', 'image/png', 's3', 's3', 45164, '[]', '{\"thumbnail\": true}', '[]', '[]', 239, '2022-01-27 21:36:34', '2022-01-27 21:36:34'),
(240, 'Marvel\\Database\\Models\\Attachment', 240, '0bd4496e-b5e5-4074-b30c-2ad9c19fd20d', 'default', 'Rectangle 828', 'Rectangle-828.png', 'image/png', 's3', 's3', 45088, '[]', '{\"thumbnail\": true}', '[]', '[]', 240, '2022-01-27 21:36:34', '2022-01-27 21:36:34'),
(241, 'Marvel\\Database\\Models\\Attachment', 241, '85738dc5-d870-4cb9-91b5-4f4f884fc576', 'default', 'Rectangle 832', 'Rectangle-832.png', 'image/png', 's3', 's3', 126467, '[]', '{\"thumbnail\": true}', '[]', '[]', 241, '2022-01-27 21:36:34', '2022-01-27 21:36:35'),
(242, 'Marvel\\Database\\Models\\Attachment', 242, 'a456f460-c229-4987-914b-96a22a945956', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 242, '2022-01-27 21:37:31', '2022-01-27 21:37:31'),
(243, 'Marvel\\Database\\Models\\Attachment', 243, '26bdd230-a214-417b-ae20-0b3b071cf146', 'default', 'Rectangle 827', 'Rectangle-827.png', 'image/png', 's3', 's3', 91300, '[]', '{\"thumbnail\": true}', '[]', '[]', 243, '2022-01-27 21:37:50', '2022-01-27 21:37:50'),
(244, 'Marvel\\Database\\Models\\Attachment', 244, 'e32cb839-459f-408d-87a4-6ce6e908e773', 'default', 'Rectangle 827', 'Rectangle-827.png', 'image/png', 's3', 's3', 91300, '[]', '{\"thumbnail\": true}', '[]', '[]', 244, '2022-01-27 21:37:58', '2022-01-27 21:37:58'),
(245, 'Marvel\\Database\\Models\\Attachment', 245, '7ef840ce-0cb1-4d8b-83bf-f2fb6a7672d1', 'default', 'Rectangle 842', 'Rectangle-842.png', 'image/png', 's3', 's3', 42255, '[]', '{\"thumbnail\": true}', '[]', '[]', 245, '2022-01-27 21:37:58', '2022-01-27 21:37:59'),
(246, 'Marvel\\Database\\Models\\Attachment', 246, '63de73ab-8e88-43b6-bfda-b66de076768b', 'default', 'Rectangle 849', 'Rectangle-849.png', 'image/png', 's3', 's3', 41912, '[]', '{\"thumbnail\": true}', '[]', '[]', 246, '2022-01-27 21:37:59', '2022-01-27 21:37:59'),
(247, 'Marvel\\Database\\Models\\Attachment', 247, 'ce8670d1-2d9c-4201-9565-d37dda99e369', 'default', 'Rectangle 851', 'Rectangle-851.png', 'image/png', 's3', 's3', 80675, '[]', '{\"thumbnail\": true}', '[]', '[]', 247, '2022-01-27 21:37:59', '2022-01-27 21:37:59'),
(248, 'Marvel\\Database\\Models\\Attachment', 248, '78e8dc3d-4f46-4c5b-bf52-322e4fe93268', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 248, '2022-01-27 21:38:55', '2022-01-27 21:38:55'),
(249, 'Marvel\\Database\\Models\\Attachment', 249, '981964f6-7dee-44a2-82b2-41930ae85da5', 'default', 'Rectangle 826', 'Rectangle-826.png', 'image/png', 's3', 's3', 36896, '[]', '{\"thumbnail\": true}', '[]', '[]', 249, '2022-01-27 22:02:38', '2022-01-27 22:02:38'),
(250, 'Marvel\\Database\\Models\\Attachment', 250, '10dee599-cf13-4660-bc4f-0fa9b1f2e94b', 'default', 'Rectangle 826', 'Rectangle-826.png', 'image/png', 's3', 's3', 36896, '[]', '{\"thumbnail\": true}', '[]', '[]', 250, '2022-01-27 22:02:45', '2022-01-27 22:02:46'),
(251, 'Marvel\\Database\\Models\\Attachment', 251, '41cfd340-d637-446c-b24d-83aaaf515642', 'default', 'Rectangle 833', 'Rectangle-833.png', 'image/png', 's3', 's3', 66797, '[]', '{\"thumbnail\": true}', '[]', '[]', 251, '2022-01-27 22:02:46', '2022-01-27 22:02:46'),
(252, 'Marvel\\Database\\Models\\Attachment', 252, '772f82ec-e63c-4f16-8df2-c8f44397fa54', 'default', 'Rectangle 841', 'Rectangle-841.png', 'image/png', 's3', 's3', 56460, '[]', '{\"thumbnail\": true}', '[]', '[]', 252, '2022-01-27 22:02:46', '2022-01-27 22:02:46'),
(253, 'Marvel\\Database\\Models\\Attachment', 253, '566f6a41-6503-4436-83fd-fe85491d970f', 'default', 'Rectangle 849', 'Rectangle-849.png', 'image/png', 's3', 's3', 41912, '[]', '{\"thumbnail\": true}', '[]', '[]', 253, '2022-01-27 22:02:46', '2022-01-27 22:02:46'),
(254, 'Marvel\\Database\\Models\\Attachment', 254, '44507852-2b06-4ee9-9f96-39133063c320', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 254, '2022-01-27 22:03:56', '2022-01-27 22:03:56'),
(255, 'Marvel\\Database\\Models\\Attachment', 255, '6b11748c-a1d7-438a-a4c8-ff5fa06f7796', 'default', 'Rectangle 797', 'Rectangle-797.png', 'image/png', 's3', 's3', 45164, '[]', '{\"thumbnail\": true}', '[]', '[]', 255, '2022-01-27 22:04:08', '2022-01-27 22:04:08'),
(256, 'Marvel\\Database\\Models\\Attachment', 256, 'dd81cbc5-6e58-4be3-a12a-1f45d18d82bf', 'default', 'Rectangle 797', 'Rectangle-797.png', 'image/png', 's3', 's3', 45164, '[]', '{\"thumbnail\": true}', '[]', '[]', 256, '2022-01-27 22:04:16', '2022-01-27 22:04:17'),
(257, 'Marvel\\Database\\Models\\Attachment', 257, '87d2c6e5-26df-410d-95a8-9ff42f7bce5a', 'default', 'Rectangle 837', 'Rectangle-837.png', 'image/png', 's3', 's3', 78143, '[]', '{\"thumbnail\": true}', '[]', '[]', 257, '2022-01-27 22:04:17', '2022-01-27 22:04:17'),
(258, 'Marvel\\Database\\Models\\Attachment', 258, '71c8b1b6-4c81-4105-967e-1dec72f123c2', 'default', 'Rectangle 838', 'Rectangle-838.png', 'image/png', 's3', 's3', 56959, '[]', '{\"thumbnail\": true}', '[]', '[]', 258, '2022-01-27 22:04:17', '2022-01-27 22:04:17'),
(259, 'Marvel\\Database\\Models\\Attachment', 259, 'bc8bc1dd-fdd8-4bb7-9c89-cd178631a067', 'default', 'Rectangle 847', 'Rectangle-847.png', 'image/png', 's3', 's3', 35944, '[]', '{\"thumbnail\": true}', '[]', '[]', 259, '2022-01-27 22:04:17', '2022-01-27 22:04:17'),
(260, 'Marvel\\Database\\Models\\Attachment', 260, 'b323ab48-3d95-4f2f-aedd-89a992177bbf', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 260, '2022-01-27 22:05:08', '2022-01-27 22:05:08'),
(261, 'Marvel\\Database\\Models\\Attachment', 261, 'd82cdd4c-22b0-4f0e-a155-3b5cc1065bca', 'default', 'Rectangle 796', 'Rectangle-796.png', 'image/png', 's3', 's3', 53467, '[]', '{\"thumbnail\": true}', '[]', '[]', 261, '2022-01-27 22:53:23', '2022-01-27 22:53:24'),
(262, 'Marvel\\Database\\Models\\Attachment', 262, '8dee68b1-9ac0-4a57-8595-cca1ea6ff60c', 'default', 'Rectangle 797', 'Rectangle-797.png', 'image/png', 's3', 's3', 45164, '[]', '{\"thumbnail\": true}', '[]', '[]', 262, '2022-01-27 22:53:33', '2022-01-27 22:53:33'),
(263, 'Marvel\\Database\\Models\\Attachment', 263, 'fb3c127d-2dd1-4cb1-b0c8-f84dbc5d11bb', 'default', 'Rectangle 832', 'Rectangle-832.png', 'image/png', 's3', 's3', 126467, '[]', '{\"thumbnail\": true}', '[]', '[]', 263, '2022-01-27 22:53:33', '2022-01-27 22:53:33'),
(264, 'Marvel\\Database\\Models\\Attachment', 264, '84dc2cf2-ec09-42df-bc80-84a02ba1005f', 'default', 'Rectangle 834', 'Rectangle-834.png', 'image/png', 's3', 's3', 146913, '[]', '{\"thumbnail\": true}', '[]', '[]', 264, '2022-01-27 22:53:33', '2022-01-27 22:53:33'),
(265, 'Marvel\\Database\\Models\\Attachment', 265, '8c6ea27a-8c34-4775-ac7f-194ebbf81797', 'default', 'Rectangle 844', 'Rectangle-844.png', 'image/png', 's3', 's3', 83764, '[]', '{\"thumbnail\": true}', '[]', '[]', 265, '2022-01-27 22:53:33', '2022-01-27 22:53:34'),
(266, 'Marvel\\Database\\Models\\Attachment', 266, '0f619c58-0edf-4ef4-91c5-3319e890f35a', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 266, '2022-01-27 22:54:29', '2022-01-27 22:54:29'),
(267, 'Marvel\\Database\\Models\\Attachment', 267, '46a1d1ce-5518-42a5-8b37-7c3f589d6bbf', 'default', 'Rectangle 792', 'Rectangle-792.png', 'image/png', 's3', 's3', 37547, '[]', '{\"thumbnail\": true}', '[]', '[]', 267, '2022-01-27 22:54:58', '2022-01-27 22:54:59'),
(268, 'Marvel\\Database\\Models\\Attachment', 268, 'b3f6178d-cfd0-4115-a990-e6b5c7636aa0', 'default', 'Rectangle 789', 'Rectangle-789.png', 'image/png', 's3', 's3', 37131, '[]', '{\"thumbnail\": true}', '[]', '[]', 268, '2022-01-27 22:55:11', '2022-01-27 22:55:11'),
(269, 'Marvel\\Database\\Models\\Attachment', 269, '96ddab38-bb7d-46e9-81cf-f8102ee9d448', 'default', 'Rectangle 790', 'Rectangle-790.png', 'image/png', 's3', 's3', 73860, '[]', '{\"thumbnail\": true}', '[]', '[]', 269, '2022-01-27 22:55:11', '2022-01-27 22:55:11'),
(270, 'Marvel\\Database\\Models\\Attachment', 270, 'ab7389af-744a-4015-889d-defce44ac57e', 'default', 'Rectangle 792', 'Rectangle-792.png', 'image/png', 's3', 's3', 37547, '[]', '{\"thumbnail\": true}', '[]', '[]', 270, '2022-01-27 22:55:11', '2022-01-27 22:55:11'),
(271, 'Marvel\\Database\\Models\\Attachment', 271, 'e6ea7b4a-65a8-4658-9546-0e9a4a5d273a', 'default', 'Rectangle 796', 'Rectangle-796.png', 'image/png', 's3', 's3', 53467, '[]', '{\"thumbnail\": true}', '[]', '[]', 271, '2022-01-27 22:55:11', '2022-01-27 22:55:12'),
(272, 'Marvel\\Database\\Models\\Attachment', 272, '083a3f4e-3477-4934-a8ba-f69560f49cfa', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 272, '2022-01-27 22:56:23', '2022-01-27 22:56:23'),
(273, 'Marvel\\Database\\Models\\Attachment', 273, '7459fb14-8454-4a41-90ec-712e571939f5', 'default', 'Rectangle 795', 'Rectangle-795.png', 'image/png', 's3', 's3', 45223, '[]', '{\"thumbnail\": true}', '[]', '[]', 273, '2022-01-27 22:56:41', '2022-01-27 22:56:42'),
(274, 'Marvel\\Database\\Models\\Attachment', 274, 'b140b9e4-ca37-4607-9475-db051d08af5b', 'default', 'Rectangle 795', 'Rectangle-795.png', 'image/png', 's3', 's3', 45223, '[]', '{\"thumbnail\": true}', '[]', '[]', 274, '2022-01-27 22:56:46', '2022-01-27 22:56:47'),
(275, 'Marvel\\Database\\Models\\Attachment', 275, 'b11cb0ae-7d31-4822-b392-7793b9c607da', 'default', 'Rectangle 832', 'Rectangle-832.png', 'image/png', 's3', 's3', 126467, '[]', '{\"thumbnail\": true}', '[]', '[]', 275, '2022-01-27 22:56:47', '2022-01-27 22:56:47'),
(276, 'Marvel\\Database\\Models\\Attachment', 276, 'fb8cc050-fb47-4145-bf50-ff6c48346394', 'default', 'Rectangle 841', 'Rectangle-841.png', 'image/png', 's3', 's3', 56460, '[]', '{\"thumbnail\": true}', '[]', '[]', 276, '2022-01-27 22:56:47', '2022-01-27 22:56:47'),
(277, 'Marvel\\Database\\Models\\Attachment', 277, '53f4093e-59f6-4117-a3d8-3bb887571ba3', 'default', 'Rectangle 849', 'Rectangle-849.png', 'image/png', 's3', 's3', 41912, '[]', '{\"thumbnail\": true}', '[]', '[]', 277, '2022-01-27 22:56:47', '2022-01-27 22:56:47'),
(278, 'Marvel\\Database\\Models\\Attachment', 278, 'd061daac-b3bd-4270-b7ad-af165ca015ea', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 278, '2022-01-27 22:57:59', '2022-01-27 22:57:59'),
(279, 'Marvel\\Database\\Models\\Attachment', 279, '782fd2de-0c06-45e0-9d77-7befd343a2ca', 'default', 'Rectangle 794', 'Rectangle-794.png', 'image/png', 's3', 's3', 75588, '[]', '{\"thumbnail\": true}', '[]', '[]', 279, '2022-01-27 22:58:18', '2022-01-27 22:58:18'),
(280, 'Marvel\\Database\\Models\\Attachment', 280, '3fa0c61c-dfac-4116-8ad5-403b9914207a', 'default', 'Mask Group', 'Mask-Group.png', 'image/png', 's3', 's3', 58213, '[]', '{\"thumbnail\": true}', '[]', '[]', 280, '2022-01-27 22:58:28', '2022-01-27 22:58:28'),
(281, 'Marvel\\Database\\Models\\Attachment', 281, 'cca5c956-a94b-45f9-819d-38b941acaac3', 'default', 'Rectangle 780', 'Rectangle-780.png', 'image/png', 's3', 's3', 33237, '[]', '{\"thumbnail\": true}', '[]', '[]', 281, '2022-01-27 22:58:28', '2022-01-27 22:58:28'),
(282, 'Marvel\\Database\\Models\\Attachment', 282, '3483b988-eeab-438e-9151-16bae0f7ec70', 'default', 'Rectangle 781', 'Rectangle-781.png', 'image/png', 's3', 's3', 67432, '[]', '{\"thumbnail\": true}', '[]', '[]', 282, '2022-01-27 22:58:28', '2022-01-27 22:58:28'),
(283, 'Marvel\\Database\\Models\\Attachment', 283, '4c043a8d-595c-4496-b8db-e5f473c5ef59', 'default', 'Rectangle 794', 'Rectangle-794.png', 'image/png', 's3', 's3', 75588, '[]', '{\"thumbnail\": true}', '[]', '[]', 283, '2022-01-27 22:58:28', '2022-01-27 22:58:29'),
(284, 'Marvel\\Database\\Models\\Attachment', 284, 'c506a3d2-7b3a-4562-9062-151f7fe35960', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 284, '2022-01-27 22:59:36', '2022-01-27 22:59:36'),
(285, 'Marvel\\Database\\Models\\Attachment', 285, '435596e8-ba95-463b-bacd-ab5744d668d1', 'default', 'Rectangle 791', 'Rectangle-791.png', 'image/png', 's3', 's3', 52916, '[]', '{\"thumbnail\": true}', '[]', '[]', 285, '2022-01-27 22:59:51', '2022-01-27 22:59:51'),
(286, 'Marvel\\Database\\Models\\Attachment', 286, 'ddba7697-2ca0-405a-96bf-b0604eaefbf2', 'default', 'Rectangle 791', 'Rectangle-791.png', 'image/png', 's3', 's3', 52916, '[]', '{\"thumbnail\": true}', '[]', '[]', 286, '2022-01-27 23:00:04', '2022-01-27 23:00:04'),
(287, 'Marvel\\Database\\Models\\Attachment', 287, '437da895-964b-4598-b77a-34af7dfedfa3', 'default', 'Rectangle 796', 'Rectangle-796.png', 'image/png', 's3', 's3', 53467, '[]', '{\"thumbnail\": true}', '[]', '[]', 287, '2022-01-27 23:00:04', '2022-01-27 23:00:04'),
(288, 'Marvel\\Database\\Models\\Attachment', 288, 'afc4257f-b33c-43b1-bfb6-07dfba3e46f5', 'default', 'Rectangle 797', 'Rectangle-797.png', 'image/png', 's3', 's3', 45164, '[]', '{\"thumbnail\": true}', '[]', '[]', 288, '2022-01-27 23:00:04', '2022-01-27 23:00:05'),
(289, 'Marvel\\Database\\Models\\Attachment', 289, 'a10e30ce-be6d-4e4e-8abd-06efa9a977c2', 'default', 'Rectangle 827', 'Rectangle-827.png', 'image/png', 's3', 's3', 91300, '[]', '{\"thumbnail\": true}', '[]', '[]', 289, '2022-01-27 23:00:05', '2022-01-27 23:00:05'),
(290, 'Marvel\\Database\\Models\\Attachment', 290, '98427d1b-d412-4146-8597-24f828fd6815', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 290, '2022-01-27 23:01:20', '2022-01-27 23:01:20'),
(291, 'Marvel\\Database\\Models\\Attachment', 291, '32999c74-4caa-4c2a-917b-f0f3cac4f94d', 'default', 'Rectangle 790', 'Rectangle-790.png', 'image/png', 's3', 's3', 73860, '[]', '{\"thumbnail\": true}', '[]', '[]', 291, '2022-01-27 23:02:34', '2022-01-27 23:02:34'),
(292, 'Marvel\\Database\\Models\\Attachment', 292, '0bfa2870-5fd0-43e5-8ec8-16b58430704f', 'default', 'Rectangle 786', 'Rectangle-786.png', 'image/png', 's3', 's3', 70145, '[]', '{\"thumbnail\": true}', '[]', '[]', 292, '2022-01-27 23:02:45', '2022-01-27 23:02:45'),
(293, 'Marvel\\Database\\Models\\Attachment', 293, '42e2b41b-bbae-430a-ae29-0e64cda020ba', 'default', 'Rectangle 790', 'Rectangle-790.png', 'image/png', 's3', 's3', 73860, '[]', '{\"thumbnail\": true}', '[]', '[]', 293, '2022-01-27 23:02:45', '2022-01-27 23:02:46'),
(294, 'Marvel\\Database\\Models\\Attachment', 294, '3d315a79-79e6-42e9-99c9-e4a9b776adb5', 'default', 'Rectangle 845', 'Rectangle-845.png', 'image/png', 's3', 's3', 45321, '[]', '{\"thumbnail\": true}', '[]', '[]', 294, '2022-01-27 23:02:46', '2022-01-27 23:02:46'),
(295, 'Marvel\\Database\\Models\\Attachment', 295, 'bf637881-5162-45e6-b4b8-ee967bfd9d3f', 'default', 'Rectangle 846', 'Rectangle-846.png', 'image/png', 's3', 's3', 76296, '[]', '{\"thumbnail\": true}', '[]', '[]', 295, '2022-01-27 23:02:46', '2022-01-27 23:02:46'),
(296, 'Marvel\\Database\\Models\\Attachment', 296, '42bf8bef-ca8e-4bc9-ad84-2c45ccab6392', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 296, '2022-01-27 23:03:49', '2022-01-27 23:03:49'),
(297, 'Marvel\\Database\\Models\\Attachment', 297, '48e3907d-b720-4ae8-905e-ad300e320ec3', 'default', 'Rectangle 789', 'Rectangle-789.png', 'image/png', 's3', 's3', 37131, '[]', '{\"thumbnail\": true}', '[]', '[]', 297, '2022-01-27 23:17:40', '2022-01-27 23:17:41'),
(298, 'Marvel\\Database\\Models\\Attachment', 298, '783742fa-76af-425c-9bcd-c8d0b3a93f1d', 'default', 'Rectangle 789', 'Rectangle-789.png', 'image/png', 's3', 's3', 37131, '[]', '{\"thumbnail\": true}', '[]', '[]', 298, '2022-01-27 23:17:49', '2022-01-27 23:17:50'),
(299, 'Marvel\\Database\\Models\\Attachment', 299, 'c8bbb801-155e-4120-ae1a-46840fe5e502', 'default', 'Rectangle 797', 'Rectangle-797.png', 'image/png', 's3', 's3', 45164, '[]', '{\"thumbnail\": true}', '[]', '[]', 299, '2022-01-27 23:17:50', '2022-01-27 23:17:50'),
(300, 'Marvel\\Database\\Models\\Attachment', 300, 'f3736dd7-c13c-4753-b040-75b9ffa4c0a7', 'default', 'Rectangle 827', 'Rectangle-827.png', 'image/png', 's3', 's3', 91300, '[]', '{\"thumbnail\": true}', '[]', '[]', 300, '2022-01-27 23:17:50', '2022-01-27 23:17:50'),
(301, 'Marvel\\Database\\Models\\Attachment', 301, '42dd49ed-f897-4865-9bfa-967e59fa4376', 'default', 'Rectangle 792', 'Rectangle-792.png', 'image/png', 's3', 's3', 37547, '[]', '{\"thumbnail\": true}', '[]', '[]', 301, '2022-01-27 23:17:54', '2022-01-27 23:17:55'),
(302, 'Marvel\\Database\\Models\\Attachment', 302, '9fea751d-1d4f-4eca-9e31-41f9905da550', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 302, '2022-01-27 23:18:51', '2022-01-27 23:18:51'),
(303, 'Marvel\\Database\\Models\\Attachment', 303, 'a37f0fb8-d3ee-4032-b2d9-fdc66ed1409c', 'default', 'Rectangle 787', 'Rectangle-787.png', 'image/png', 's3', 's3', 64703, '[]', '{\"thumbnail\": true}', '[]', '[]', 303, '2022-01-27 23:22:49', '2022-01-27 23:22:49'),
(304, 'Marvel\\Database\\Models\\Attachment', 304, '719e3dc3-e451-47f3-8141-9426b2e4c71b', 'default', 'Rectangle 787', 'Rectangle-787.png', 'image/png', 's3', 's3', 64703, '[]', '{\"thumbnail\": true}', '[]', '[]', 304, '2022-01-27 23:22:57', '2022-01-27 23:22:57'),
(305, 'Marvel\\Database\\Models\\Attachment', 305, 'f6c2a117-cc32-4d80-926e-48d188171add', 'default', 'Rectangle 789', 'Rectangle-789.png', 'image/png', 's3', 's3', 37131, '[]', '{\"thumbnail\": true}', '[]', '[]', 305, '2022-01-27 23:22:57', '2022-01-27 23:22:58'),
(306, 'Marvel\\Database\\Models\\Attachment', 306, '30e4e0da-faba-4b1f-b004-7c3f7481a7d2', 'default', 'Rectangle 790', 'Rectangle-790.png', 'image/png', 's3', 's3', 73860, '[]', '{\"thumbnail\": true}', '[]', '[]', 306, '2022-01-27 23:22:58', '2022-01-27 23:22:58'),
(307, 'Marvel\\Database\\Models\\Attachment', 307, 'b8d7df41-17f9-4fb9-9b3f-de7163069179', 'default', 'Rectangle 827', 'Rectangle-827.png', 'image/png', 's3', 's3', 91300, '[]', '{\"thumbnail\": true}', '[]', '[]', 307, '2022-01-27 23:22:58', '2022-01-27 23:22:58'),
(308, 'Marvel\\Database\\Models\\Attachment', 308, '8ffe84fd-6c2f-47ca-ba7b-37e002755874', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 308, '2022-01-27 23:24:13', '2022-01-27 23:24:13'),
(309, 'Marvel\\Database\\Models\\Attachment', 309, '8c6b7589-372f-4899-8374-828601d02495', 'default', 'Rectangle 786', 'Rectangle-786.png', 'image/png', 's3', 's3', 70145, '[]', '{\"thumbnail\": true}', '[]', '[]', 309, '2022-01-27 23:28:11', '2022-01-27 23:28:11'),
(310, 'Marvel\\Database\\Models\\Attachment', 310, 'af90dd54-dacf-49d5-a7cb-21413ed10ba0', 'default', 'Mask Group-1', 'Mask-Group-1.png', 'image/png', 's3', 's3', 143783, '[]', '{\"thumbnail\": true}', '[]', '[]', 310, '2022-01-27 23:28:22', '2022-01-27 23:28:22'),
(311, 'Marvel\\Database\\Models\\Attachment', 311, '599d23ef-2952-44ff-aff4-c49a7e836f28', 'default', 'Rectangle 782', 'Rectangle-782.png', 'image/png', 's3', 's3', 84601, '[]', '{\"thumbnail\": true}', '[]', '[]', 311, '2022-01-27 23:28:22', '2022-01-27 23:28:22'),
(312, 'Marvel\\Database\\Models\\Attachment', 312, '53afdc31-ffe9-43b0-939b-a8a523c6aa2b', 'default', 'Rectangle 786', 'Rectangle-786.png', 'image/png', 's3', 's3', 70145, '[]', '{\"thumbnail\": true}', '[]', '[]', 312, '2022-01-27 23:28:22', '2022-01-27 23:28:22'),
(313, 'Marvel\\Database\\Models\\Attachment', 313, '96157f83-0bfd-427c-91c5-10cca7136db5', 'default', 'Rectangle 790', 'Rectangle-790.png', 'image/png', 's3', 's3', 73860, '[]', '{\"thumbnail\": true}', '[]', '[]', 313, '2022-01-27 23:28:22', '2022-01-27 23:28:22'),
(314, 'Marvel\\Database\\Models\\Attachment', 314, '5f28b589-4114-44a4-8521-8457150a43bd', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 314, '2022-01-27 23:29:45', '2022-01-27 23:29:45'),
(315, 'Marvel\\Database\\Models\\Attachment', 315, 'e8d4f366-db91-4d35-b6e3-c69fbd2fba6a', 'default', 'Rectangle 785', 'Rectangle-785.png', 'image/png', 's3', 's3', 35364, '[]', '{\"thumbnail\": true}', '[]', '[]', 315, '2022-01-27 23:30:28', '2022-01-27 23:30:28'),
(316, 'Marvel\\Database\\Models\\Attachment', 316, 'd7ea045e-08f8-442a-9a4a-1bdf15277ae0', 'default', 'Mask Group-3', 'Mask-Group-3.png', 'image/png', 's3', 's3', 75684, '[]', '{\"thumbnail\": true}', '[]', '[]', 316, '2022-01-27 23:30:35', '2022-01-27 23:30:35'),
(317, 'Marvel\\Database\\Models\\Attachment', 317, '34b44c34-b957-40ba-8e81-09cf7fd056d6', 'default', 'Rectangle 773', 'Rectangle-773.png', 'image/png', 's3', 's3', 92451, '[]', '{\"thumbnail\": true}', '[]', '[]', 317, '2022-01-27 23:30:35', '2022-01-27 23:30:35'),
(318, 'Marvel\\Database\\Models\\Attachment', 318, '3879e0cd-438c-4c0d-b047-2e08c450359b', 'default', 'Rectangle 774', 'Rectangle-774.png', 'image/png', 's3', 's3', 71922, '[]', '{\"thumbnail\": true}', '[]', '[]', 318, '2022-01-27 23:30:35', '2022-01-27 23:30:35'),
(319, 'Marvel\\Database\\Models\\Attachment', 319, '3b2949c9-999b-49b3-952d-4d5aa2bb6588', 'default', 'Rectangle 785', 'Rectangle-785.png', 'image/png', 's3', 's3', 35364, '[]', '{\"thumbnail\": true}', '[]', '[]', 319, '2022-01-27 23:30:35', '2022-01-27 23:30:35'),
(320, 'Marvel\\Database\\Models\\Attachment', 320, 'c8ff8ec7-2f6a-4e6e-8c76-9f7068063b44', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 320, '2022-01-27 23:31:34', '2022-01-27 23:31:34'),
(321, 'Marvel\\Database\\Models\\Attachment', 321, '80b5741a-5e2d-4bd5-ba07-a0f146d9cff6', 'default', 'Rectangle 784', 'Rectangle-784.png', 'image/png', 's3', 's3', 52678, '[]', '{\"thumbnail\": true}', '[]', '[]', 321, '2022-01-27 23:32:47', '2022-01-27 23:32:47'),
(322, 'Marvel\\Database\\Models\\Attachment', 322, 'd6573fc5-dc5d-444f-9d08-4e40f843e714', 'default', 'Rectangle 778', 'Rectangle-778.png', 'image/png', 's3', 's3', 56295, '[]', '{\"thumbnail\": true}', '[]', '[]', 322, '2022-01-27 23:32:54', '2022-01-27 23:32:54'),
(323, 'Marvel\\Database\\Models\\Attachment', 323, '3ddbc7b1-b1f2-4422-a2e3-dcf08e232596', 'default', 'Rectangle 784', 'Rectangle-784.png', 'image/png', 's3', 's3', 52678, '[]', '{\"thumbnail\": true}', '[]', '[]', 323, '2022-01-27 23:32:54', '2022-01-27 23:32:54'),
(324, 'Marvel\\Database\\Models\\Attachment', 324, '25ff3138-f33d-4ad6-9455-22799a1f4f31', 'default', 'Rectangle 789', 'Rectangle-789.png', 'image/png', 's3', 's3', 37131, '[]', '{\"thumbnail\": true}', '[]', '[]', 324, '2022-01-27 23:32:54', '2022-01-27 23:32:54'),
(325, 'Marvel\\Database\\Models\\Attachment', 325, 'a10fcdcf-6b8c-4e17-876d-ecca13be32a8', 'default', 'Rectangle 797', 'Rectangle-797.png', 'image/png', 's3', 's3', 45164, '[]', '{\"thumbnail\": true}', '[]', '[]', 325, '2022-01-27 23:32:54', '2022-01-27 23:32:54'),
(326, 'Marvel\\Database\\Models\\Attachment', 326, 'd048f16e-42e9-4976-b2f6-ab00a6841195', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 326, '2022-01-27 23:33:55', '2022-01-27 23:33:55'),
(327, 'Marvel\\Database\\Models\\Attachment', 327, '7dd9eb4b-a288-4f88-aa4d-2f56d1c2f96b', 'default', 'Rectangle 783', 'Rectangle-783.png', 'image/png', 's3', 's3', 41088, '[]', '{\"thumbnail\": true}', '[]', '[]', 327, '2022-01-27 23:36:41', '2022-01-27 23:36:42'),
(328, 'Marvel\\Database\\Models\\Attachment', 328, '76a55411-b7f0-4b1f-a5ac-c9920023c11e', 'default', 'Rectangle 783', 'Rectangle-783.png', 'image/png', 's3', 's3', 41088, '[]', '{\"thumbnail\": true}', '[]', '[]', 328, '2022-01-27 23:36:51', '2022-01-27 23:36:51'),
(329, 'Marvel\\Database\\Models\\Attachment', 329, '8573aa24-7110-4719-b985-33ff375eb989', 'default', 'Rectangle 789', 'Rectangle-789.png', 'image/png', 's3', 's3', 37131, '[]', '{\"thumbnail\": true}', '[]', '[]', 329, '2022-01-27 23:36:51', '2022-01-27 23:36:51'),
(330, 'Marvel\\Database\\Models\\Attachment', 330, '4cb6a6aa-77bb-4538-b3ae-453f67e89a5c', 'default', 'Rectangle 790', 'Rectangle-790.png', 'image/png', 's3', 's3', 73860, '[]', '{\"thumbnail\": true}', '[]', '[]', 330, '2022-01-27 23:36:51', '2022-01-27 23:36:51'),
(331, 'Marvel\\Database\\Models\\Attachment', 331, '206f5059-cb3f-4759-8113-75b7f5116104', 'default', 'Rectangle 791', 'Rectangle-791.png', 'image/png', 's3', 's3', 52916, '[]', '{\"thumbnail\": true}', '[]', '[]', 331, '2022-01-27 23:36:51', '2022-01-27 23:36:51'),
(332, 'Marvel\\Database\\Models\\Attachment', 332, 'e7b0c111-f8fa-4af3-8e9b-df7dbff7505b', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 332, '2022-01-27 23:37:53', '2022-01-27 23:37:53'),
(333, 'Marvel\\Database\\Models\\Attachment', 333, '86a0942e-58a9-449f-9f7d-75ea67ca65cf', 'default', 'Rectangle 782', 'Rectangle-782.png', 'image/png', 's3', 's3', 84601, '[]', '{\"thumbnail\": true}', '[]', '[]', 333, '2022-01-27 23:47:04', '2022-01-27 23:47:04'),
(334, 'Marvel\\Database\\Models\\Attachment', 334, 'f3017f28-3c58-48a9-bb6c-c1a8592267b7', 'default', 'Rectangle 782', 'Rectangle-782.png', 'image/png', 's3', 's3', 84601, '[]', '{\"thumbnail\": true}', '[]', '[]', 334, '2022-01-27 23:47:19', '2022-01-27 23:47:19'),
(335, 'Marvel\\Database\\Models\\Attachment', 335, '63ead19b-8eff-4002-b10a-c90e3b030cb6', 'default', 'Rectangle 786', 'Rectangle-786.png', 'image/png', 's3', 's3', 70145, '[]', '{\"thumbnail\": true}', '[]', '[]', 335, '2022-01-27 23:47:19', '2022-01-27 23:47:19'),
(336, 'Marvel\\Database\\Models\\Attachment', 336, '1f1713c7-d95e-4b64-bcd5-ebca02a9b421', 'default', 'Rectangle 787', 'Rectangle-787.png', 'image/png', 's3', 's3', 64703, '[]', '{\"thumbnail\": true}', '[]', '[]', 336, '2022-01-27 23:47:19', '2022-01-27 23:47:19'),
(337, 'Marvel\\Database\\Models\\Attachment', 337, '0ebe20b8-eaf7-49c4-8f7b-acafd1d34b20', 'default', 'Rectangle 790', 'Rectangle-790.png', 'image/png', 's3', 's3', 73860, '[]', '{\"thumbnail\": true}', '[]', '[]', 337, '2022-01-27 23:47:19', '2022-01-27 23:47:20'),
(338, 'Marvel\\Database\\Models\\Attachment', 338, '5048118d-5cfa-4f94-a3c6-e8363be7820c', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 338, '2022-01-27 23:48:15', '2022-01-27 23:48:15'),
(339, 'Marvel\\Database\\Models\\Attachment', 339, '17945ba8-ab7b-4cd3-94d3-78f8915b1aba', 'default', 'Rectangle 781', 'Rectangle-781.png', 'image/png', 's3', 's3', 67432, '[]', '{\"thumbnail\": true}', '[]', '[]', 339, '2022-01-27 23:49:14', '2022-01-27 23:49:15'),
(340, 'Marvel\\Database\\Models\\Attachment', 340, '5fa8392f-ae1e-45c0-9af9-397152fc6601', 'default', 'Rectangle 781', 'Rectangle-781.png', 'image/png', 's3', 's3', 67432, '[]', '{\"thumbnail\": true}', '[]', '[]', 340, '2022-01-27 23:49:22', '2022-01-27 23:49:22'),
(341, 'Marvel\\Database\\Models\\Attachment', 341, 'cd8bd420-ff96-4baf-ac7b-4616890e8d04', 'default', 'Rectangle 795', 'Rectangle-795.png', 'image/png', 's3', 's3', 45223, '[]', '{\"thumbnail\": true}', '[]', '[]', 341, '2022-01-27 23:49:22', '2022-01-27 23:49:22'),
(342, 'Marvel\\Database\\Models\\Attachment', 342, 'ec6cc2b9-c4da-4edf-892d-1d2b9bf84950', 'default', 'Rectangle 836', 'Rectangle-836.png', 'image/png', 's3', 's3', 56569, '[]', '{\"thumbnail\": true}', '[]', '[]', 342, '2022-01-27 23:49:22', '2022-01-27 23:49:22'),
(343, 'Marvel\\Database\\Models\\Attachment', 343, '8d14fb25-c43b-460e-89b8-617d554f4255', 'default', 'Rectangle 844', 'Rectangle-844.png', 'image/png', 's3', 's3', 83764, '[]', '{\"thumbnail\": true}', '[]', '[]', 343, '2022-01-27 23:49:22', '2022-01-27 23:49:22'),
(344, 'Marvel\\Database\\Models\\Attachment', 344, 'f547fdfc-83f7-459e-a718-38a8db2a89c0', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 344, '2022-01-27 23:50:47', '2022-01-27 23:50:47'),
(345, 'Marvel\\Database\\Models\\Attachment', 345, '959082a8-222e-4f70-a733-a9ab656dc7e0', 'default', 'Rectangle 780', 'Rectangle-780.png', 'image/png', 's3', 's3', 33237, '[]', '{\"thumbnail\": true}', '[]', '[]', 345, '2022-01-27 23:51:21', '2022-01-27 23:51:21'),
(346, 'Marvel\\Database\\Models\\Attachment', 346, '8b96a047-f3d8-44e1-8747-36441c0d0d0d', 'default', 'Rectangle 780', 'Rectangle-780.png', 'image/png', 's3', 's3', 33237, '[]', '{\"thumbnail\": true}', '[]', '[]', 346, '2022-01-27 23:51:32', '2022-01-27 23:51:32'),
(347, 'Marvel\\Database\\Models\\Attachment', 347, '71e91875-a995-4f8e-b2ac-b8d3fd84cddb', 'default', 'Rectangle 789', 'Rectangle-789.png', 'image/png', 's3', 's3', 37131, '[]', '{\"thumbnail\": true}', '[]', '[]', 347, '2022-01-27 23:51:32', '2022-01-27 23:51:32'),
(348, 'Marvel\\Database\\Models\\Attachment', 348, '21d69319-e66f-474a-b994-4fdb560d8dd8', 'default', 'Rectangle 796', 'Rectangle-796.png', 'image/png', 's3', 's3', 53467, '[]', '{\"thumbnail\": true}', '[]', '[]', 348, '2022-01-27 23:51:32', '2022-01-27 23:51:33'),
(349, 'Marvel\\Database\\Models\\Attachment', 349, '703ab27b-525a-40cc-9c34-e189247a00ad', 'default', 'Rectangle 797', 'Rectangle-797.png', 'image/png', 's3', 's3', 45164, '[]', '{\"thumbnail\": true}', '[]', '[]', 349, '2022-01-27 23:51:33', '2022-01-27 23:51:33'),
(350, 'Marvel\\Database\\Models\\Attachment', 350, 'e7c83502-22ee-47d2-9d34-22cc91eb429b', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 350, '2022-01-27 23:52:58', '2022-01-27 23:52:58'),
(351, 'Marvel\\Database\\Models\\Attachment', 351, '18f9a9ab-85eb-44b9-93f4-d00d0371b150', 'default', 'Rectangle 779', 'Rectangle-779.png', 'image/png', 's3', 's3', 30987, '[]', '{\"thumbnail\": true}', '[]', '[]', 351, '2022-01-27 23:55:38', '2022-01-27 23:55:38'),
(352, 'Marvel\\Database\\Models\\Attachment', 352, '3e7e0079-3156-4b3e-83ad-b96678125698', 'default', 'Rectangle 779', 'Rectangle-779.png', 'image/png', 's3', 's3', 30987, '[]', '{\"thumbnail\": true}', '[]', '[]', 352, '2022-01-27 23:55:48', '2022-01-27 23:55:48'),
(353, 'Marvel\\Database\\Models\\Attachment', 353, 'c499c179-89d3-4dc2-badd-a4643343a955', 'default', 'Rectangle 789', 'Rectangle-789.png', 'image/png', 's3', 's3', 37131, '[]', '{\"thumbnail\": true}', '[]', '[]', 353, '2022-01-27 23:55:48', '2022-01-27 23:55:48'),
(354, 'Marvel\\Database\\Models\\Attachment', 354, '01722823-5780-472f-b8e5-af9f5020077d', 'default', 'Rectangle 790', 'Rectangle-790.png', 'image/png', 's3', 's3', 73860, '[]', '{\"thumbnail\": true}', '[]', '[]', 354, '2022-01-27 23:55:48', '2022-01-27 23:55:48'),
(355, 'Marvel\\Database\\Models\\Attachment', 355, '8c2252ce-7aec-4891-925a-e144bd5313b9', 'default', 'Rectangle 797', 'Rectangle-797.png', 'image/png', 's3', 's3', 45164, '[]', '{\"thumbnail\": true}', '[]', '[]', 355, '2022-01-27 23:55:48', '2022-01-27 23:55:48'),
(356, 'Marvel\\Database\\Models\\Attachment', 356, 'a3d35282-a117-4117-9eab-37930dcbe680', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 356, '2022-01-27 23:57:39', '2022-01-27 23:57:39'),
(357, 'Marvel\\Database\\Models\\Attachment', 357, '1f41c8e9-93b7-4cd3-aa9d-063c4af6cbcd', 'default', 'Rectangle 777', 'Rectangle-777.png', 'image/png', 's3', 's3', 77487, '[]', '{\"thumbnail\": true}', '[]', '[]', 357, '2022-01-27 23:59:35', '2022-01-27 23:59:35'),
(358, 'Marvel\\Database\\Models\\Attachment', 358, 'ed5b3caf-8240-4fb7-90f1-8cf828c30a33', 'default', 'Rectangle 777', 'Rectangle-777.png', 'image/png', 's3', 's3', 77487, '[]', '{\"thumbnail\": true}', '[]', '[]', 358, '2022-01-28 00:00:09', '2022-01-28 00:00:10'),
(359, 'Marvel\\Database\\Models\\Attachment', 359, 'cd6e5e67-ddd8-4d5b-9a1d-def36597ec55', 'default', 'Rectangle 791', 'Rectangle-791.png', 'image/png', 's3', 's3', 52916, '[]', '{\"thumbnail\": true}', '[]', '[]', 359, '2022-01-28 00:00:10', '2022-01-28 00:00:10'),
(360, 'Marvel\\Database\\Models\\Attachment', 360, '67dc7dc9-f6fb-44ec-b29a-9996485cde11', 'default', 'Rectangle 796', 'Rectangle-796.png', 'image/png', 's3', 's3', 53467, '[]', '{\"thumbnail\": true}', '[]', '[]', 360, '2022-01-28 00:00:10', '2022-01-28 00:00:10'),
(361, 'Marvel\\Database\\Models\\Attachment', 361, '22f969aa-2a7b-4a8c-a818-b0118c41fa52', 'default', 'Rectangle 797', 'Rectangle-797.png', 'image/png', 's3', 's3', 45164, '[]', '{\"thumbnail\": true}', '[]', '[]', 361, '2022-01-28 00:00:10', '2022-01-28 00:00:10'),
(362, 'Marvel\\Database\\Models\\Attachment', 362, 'a6979648-abad-485f-9161-f0cc55822069', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 362, '2022-01-28 00:27:44', '2022-01-28 00:27:44'),
(363, 'Marvel\\Database\\Models\\Attachment', 363, 'd838b55f-bd1e-4f86-b621-33af2758218a', 'default', 'Rectangle 776', 'Rectangle-776.png', 'image/png', 's3', 's3', 102428, '[]', '{\"thumbnail\": true}', '[]', '[]', 363, '2022-01-28 00:28:51', '2022-01-28 00:28:51'),
(364, 'Marvel\\Database\\Models\\Attachment', 364, '5f2d03e6-0194-458e-9a1b-e3941859c628', 'default', 'Rectangle 776', 'Rectangle-776.png', 'image/png', 's3', 's3', 102428, '[]', '{\"thumbnail\": true}', '[]', '[]', 364, '2022-01-28 00:29:04', '2022-01-28 00:29:04'),
(365, 'Marvel\\Database\\Models\\Attachment', 365, '1668a448-dca2-4a18-bfb3-57664bffb3db', 'default', 'Rectangle 786', 'Rectangle-786.png', 'image/png', 's3', 's3', 70145, '[]', '{\"thumbnail\": true}', '[]', '[]', 365, '2022-01-28 00:29:04', '2022-01-28 00:29:04'),
(366, 'Marvel\\Database\\Models\\Attachment', 366, '7828c0cf-b241-4a66-9534-45c05401febc', 'default', 'Rectangle 827', 'Rectangle-827.png', 'image/png', 's3', 's3', 91300, '[]', '{\"thumbnail\": true}', '[]', '[]', 366, '2022-01-28 00:29:05', '2022-01-28 00:29:05'),
(367, 'Marvel\\Database\\Models\\Attachment', 367, '0ce86096-d334-4350-b054-e2f8c6252633', 'default', 'Rectangle 829', 'Rectangle-829.png', 'image/png', 's3', 's3', 89430, '[]', '{\"thumbnail\": true}', '[]', '[]', 367, '2022-01-28 00:29:05', '2022-01-28 00:29:05'),
(368, 'Marvel\\Database\\Models\\Attachment', 368, '35bf5dd7-dae0-48ad-b11f-8dd64944c260', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 368, '2022-01-28 00:29:55', '2022-01-28 00:29:55'),
(369, 'Marvel\\Database\\Models\\Attachment', 369, '007c5b7d-551c-4050-822b-584ab9f2355a', 'default', 'Group 14289', 'Group-14289.png', 'image/png', 's3', 's3', 140078, '[]', '{\"thumbnail\": true}', '[]', '[]', 369, '2022-01-28 00:30:10', '2022-01-28 00:30:10'),
(370, 'Marvel\\Database\\Models\\Attachment', 370, '58a1bdac-5fc7-4865-948a-00f45314d680', 'default', 'Group 14289', 'Group-14289.png', 'image/png', 's3', 's3', 140078, '[]', '{\"thumbnail\": true}', '[]', '[]', 370, '2022-01-28 00:30:18', '2022-01-28 00:30:19'),
(371, 'Marvel\\Database\\Models\\Attachment', 371, '9b3fc12a-7232-4e35-9317-a794e8e5f7e6', 'default', 'Rectangle 781', 'Rectangle-781.png', 'image/png', 's3', 's3', 67432, '[]', '{\"thumbnail\": true}', '[]', '[]', 371, '2022-01-28 00:30:19', '2022-01-28 00:30:19'),
(372, 'Marvel\\Database\\Models\\Attachment', 372, 'efdc5818-4411-441d-ba33-18f5e52fb000', 'default', 'Rectangle 782', 'Rectangle-782.png', 'image/png', 's3', 's3', 84601, '[]', '{\"thumbnail\": true}', '[]', '[]', 372, '2022-01-28 00:30:19', '2022-01-28 00:30:19'),
(373, 'Marvel\\Database\\Models\\Attachment', 373, 'adfbb233-38f6-4e1a-a296-7402824a8f11', 'default', 'Rectangle 826', 'Rectangle-826.png', 'image/png', 's3', 's3', 36896, '[]', '{\"thumbnail\": true}', '[]', '[]', 373, '2022-01-28 00:30:19', '2022-01-28 00:30:19'),
(374, 'Marvel\\Database\\Models\\Attachment', 374, '3157ba1e-3f89-40af-a90f-5b48016ba55d', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 374, '2022-01-28 00:31:10', '2022-01-28 00:31:10'),
(375, 'Marvel\\Database\\Models\\Attachment', 375, '441d8223-0756-4f6b-ac7f-45eb690e8e6a', 'default', 'Mask Group', 'Mask-Group.png', 'image/png', 's3', 's3', 58213, '[]', '{\"thumbnail\": true}', '[]', '[]', 375, '2022-01-28 00:31:20', '2022-01-28 00:31:20'),
(376, 'Marvel\\Database\\Models\\Attachment', 376, '125a8aa0-fa44-4364-b69f-df1ab0853f6d', 'default', 'Mask Group', 'Mask-Group.png', 'image/png', 's3', 's3', 58213, '[]', '{\"thumbnail\": true}', '[]', '[]', 376, '2022-01-28 00:31:31', '2022-01-28 00:31:32'),
(377, 'Marvel\\Database\\Models\\Attachment', 377, '33a3e7a1-18f4-4e81-9f3f-fd1f8aca155d', 'default', 'Rectangle 833', 'Rectangle-833.png', 'image/png', 's3', 's3', 66797, '[]', '{\"thumbnail\": true}', '[]', '[]', 377, '2022-01-28 00:31:32', '2022-01-28 00:31:32'),
(378, 'Marvel\\Database\\Models\\Attachment', 378, 'b1f0289e-7db4-4c9d-a7e3-762d5d09289f', 'default', 'Rectangle 840', 'Rectangle-840.png', 'image/png', 's3', 's3', 51337, '[]', '{\"thumbnail\": true}', '[]', '[]', 378, '2022-01-28 00:31:32', '2022-01-28 00:31:32'),
(379, 'Marvel\\Database\\Models\\Attachment', 379, 'bc6a10f0-9bde-4974-a1fc-d241cd7ad916', 'default', 'Rectangle 844', 'Rectangle-844.png', 'image/png', 's3', 's3', 83764, '[]', '{\"thumbnail\": true}', '[]', '[]', 379, '2022-01-28 00:31:32', '2022-01-28 00:31:32');
INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `generated_conversions`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(380, 'Marvel\\Database\\Models\\Attachment', 380, '99ded84c-8b3d-43cf-bbb5-8f8e3a934ee0', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 380, '2022-01-28 00:32:43', '2022-01-28 00:32:43'),
(381, 'Marvel\\Database\\Models\\Attachment', 381, '7f250f69-c346-4211-b66a-22f77aa1677b', 'default', 'Mask Group-1', 'Mask-Group-1.png', 'image/png', 's3', 's3', 143783, '[]', '{\"thumbnail\": true}', '[]', '[]', 381, '2022-01-28 00:33:09', '2022-01-28 00:33:09'),
(382, 'Marvel\\Database\\Models\\Attachment', 382, '12562394-16be-4947-a6b7-632a12516e47', 'default', 'Mask Group-1', 'Mask-Group-1.png', 'image/png', 's3', 's3', 143783, '[]', '{\"thumbnail\": true}', '[]', '[]', 382, '2022-01-28 00:33:19', '2022-01-28 00:33:19'),
(383, 'Marvel\\Database\\Models\\Attachment', 383, '0ab1f096-39a8-4a58-8093-84d5fd077384', 'default', 'Rectangle 786', 'Rectangle-786.png', 'image/png', 's3', 's3', 70145, '[]', '{\"thumbnail\": true}', '[]', '[]', 383, '2022-01-28 00:33:19', '2022-01-28 00:33:19'),
(384, 'Marvel\\Database\\Models\\Attachment', 384, '14cee219-e605-4438-bc24-ab09527bc372', 'default', 'Rectangle 790', 'Rectangle-790.png', 'image/png', 's3', 's3', 73860, '[]', '{\"thumbnail\": true}', '[]', '[]', 384, '2022-01-28 00:33:19', '2022-01-28 00:33:19'),
(385, 'Marvel\\Database\\Models\\Attachment', 385, '4bd39f40-4718-4101-9cb7-c7d0d11aa764', 'default', 'Rectangle 791', 'Rectangle-791.png', 'image/png', 's3', 's3', 52916, '[]', '{\"thumbnail\": true}', '[]', '[]', 385, '2022-01-28 00:33:19', '2022-01-28 00:33:19'),
(386, 'Marvel\\Database\\Models\\Attachment', 386, '610357f8-e1f8-4a31-8e17-4c1dc6ba4552', 'default', 'Rectangle 792', 'Rectangle-792.png', 'image/png', 's3', 's3', 37547, '[]', '{\"thumbnail\": true}', '[]', '[]', 386, '2022-01-28 00:33:19', '2022-01-28 00:33:20'),
(387, 'Marvel\\Database\\Models\\Attachment', 387, 'd7acd1c3-1bcd-4f6d-b7db-e593be60ff03', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 387, '2022-01-28 00:33:58', '2022-01-28 00:33:58'),
(388, 'Marvel\\Database\\Models\\Attachment', 388, 'f247db43-cb98-4ca8-a195-b56090d28a00', 'default', 'Mask Group-2', 'Mask-Group-2.png', 'image/png', 's3', 's3', 55901, '[]', '{\"thumbnail\": true}', '[]', '[]', 388, '2022-01-28 00:34:29', '2022-01-28 00:34:29'),
(389, 'Marvel\\Database\\Models\\Attachment', 389, 'd66b397d-77a1-4a84-856f-f972f91a0198', 'default', 'Mask Group-2', 'Mask-Group-2.png', 'image/png', 's3', 's3', 55901, '[]', '{\"thumbnail\": true}', '[]', '[]', 389, '2022-01-28 00:34:37', '2022-01-28 00:34:38'),
(390, 'Marvel\\Database\\Models\\Attachment', 390, '3b4dbb27-70db-47a9-8740-a8686cbb7077', 'default', 'Rectangle 792', 'Rectangle-792.png', 'image/png', 's3', 's3', 37547, '[]', '{\"thumbnail\": true}', '[]', '[]', 390, '2022-01-28 00:34:38', '2022-01-28 00:34:38'),
(391, 'Marvel\\Database\\Models\\Attachment', 391, 'f0dd4494-36ed-4de6-9286-f5ec868a5a19', 'default', 'Rectangle 827', 'Rectangle-827.png', 'image/png', 's3', 's3', 91300, '[]', '{\"thumbnail\": true}', '[]', '[]', 391, '2022-01-28 00:34:38', '2022-01-28 00:34:38'),
(392, 'Marvel\\Database\\Models\\Attachment', 392, '2ce051df-2a7b-42a2-9103-390bd594f87e', 'default', 'Rectangle 828', 'Rectangle-828.png', 'image/png', 's3', 's3', 45088, '[]', '{\"thumbnail\": true}', '[]', '[]', 392, '2022-01-28 00:34:38', '2022-01-28 00:34:38'),
(393, 'Marvel\\Database\\Models\\Attachment', 393, 'ad2f5b69-a56e-4338-90e1-3518b6fe6461', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 393, '2022-01-28 00:36:04', '2022-01-28 00:36:04'),
(394, 'Marvel\\Database\\Models\\Attachment', 394, '3d60b156-5ead-409b-892b-bb566639445b', 'default', 'Rectangle 773', 'Rectangle-773.png', 'image/png', 's3', 's3', 92451, '[]', '{\"thumbnail\": true}', '[]', '[]', 394, '2022-01-28 00:36:15', '2022-01-28 00:36:16'),
(395, 'Marvel\\Database\\Models\\Attachment', 395, '51bc1ec7-ecfe-4bf5-aa9d-142b81fbb723', 'default', 'Rectangle 773', 'Rectangle-773.png', 'image/png', 's3', 's3', 92451, '[]', '{\"thumbnail\": true}', '[]', '[]', 395, '2022-01-28 00:36:24', '2022-01-28 00:36:24'),
(396, 'Marvel\\Database\\Models\\Attachment', 396, '1a4a5058-6208-4d37-842e-f2b4307190ca', 'default', 'Rectangle 778', 'Rectangle-778.png', 'image/png', 's3', 's3', 56295, '[]', '{\"thumbnail\": true}', '[]', '[]', 396, '2022-01-28 00:36:24', '2022-01-28 00:36:24'),
(397, 'Marvel\\Database\\Models\\Attachment', 397, '3e3e5047-b26f-46fd-b517-f9118c3785de', 'default', 'Rectangle 782', 'Rectangle-782.png', 'image/png', 's3', 's3', 84601, '[]', '{\"thumbnail\": true}', '[]', '[]', 397, '2022-01-28 00:36:24', '2022-01-28 00:36:24'),
(398, 'Marvel\\Database\\Models\\Attachment', 398, '6813af02-fa06-401e-a3bd-2d04da89f1c7', 'default', 'Rectangle 785', 'Rectangle-785.png', 'image/png', 's3', 's3', 35364, '[]', '{\"thumbnail\": true}', '[]', '[]', 398, '2022-01-28 00:36:24', '2022-01-28 00:36:24'),
(399, 'Marvel\\Database\\Models\\Attachment', 399, 'e4b27357-28ae-450a-9f53-e443585cc45c', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 399, '2022-01-28 00:37:27', '2022-01-28 00:37:27'),
(400, 'Marvel\\Database\\Models\\Attachment', 400, 'b041fc4c-c5e4-42e5-8749-1b8705e4933c', 'default', 'Rectangle 774', 'Rectangle-774.png', 'image/png', 's3', 's3', 71922, '[]', '{\"thumbnail\": true}', '[]', '[]', 400, '2022-01-28 00:37:43', '2022-01-28 00:37:43'),
(401, 'Marvel\\Database\\Models\\Attachment', 401, 'e460bc6f-ed47-42ae-a902-964c5beabca4', 'default', 'Mask Group-2', 'Mask-Group-2.png', 'image/png', 's3', 's3', 55901, '[]', '{\"thumbnail\": true}', '[]', '[]', 401, '2022-01-28 00:37:51', '2022-01-28 00:37:52'),
(402, 'Marvel\\Database\\Models\\Attachment', 402, '433419f0-3936-4d7f-b2ea-de553e66397d', 'default', 'Rectangle 773', 'Rectangle-773.png', 'image/png', 's3', 's3', 92451, '[]', '{\"thumbnail\": true}', '[]', '[]', 402, '2022-01-28 00:37:52', '2022-01-28 00:37:52'),
(403, 'Marvel\\Database\\Models\\Attachment', 403, '5b8ea8e5-cf36-456e-8aff-ede7e7003b88', 'default', 'Rectangle 774', 'Rectangle-774.png', 'image/png', 's3', 's3', 71922, '[]', '{\"thumbnail\": true}', '[]', '[]', 403, '2022-01-28 00:37:52', '2022-01-28 00:37:52'),
(404, 'Marvel\\Database\\Models\\Attachment', 404, '33f07f0d-c095-4797-a6cb-afca6362037a', 'default', 'Rectangle 776', 'Rectangle-776.png', 'image/png', 's3', 's3', 102428, '[]', '{\"thumbnail\": true}', '[]', '[]', 404, '2022-01-28 00:37:52', '2022-01-28 00:37:52'),
(405, 'Marvel\\Database\\Models\\Attachment', 405, '90c7772f-ee04-4785-971b-303e89e65008', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 405, '2022-01-28 00:38:41', '2022-01-28 00:38:41'),
(406, 'Marvel\\Database\\Models\\Attachment', 406, '813d7e10-a439-4243-8c12-e0c10d4e322e', 'default', 'Rectangle 775', 'Rectangle-775.png', 'image/png', 's3', 's3', 152662, '[]', '{\"thumbnail\": true}', '[]', '[]', 406, '2022-01-28 00:38:55', '2022-01-28 00:38:55'),
(407, 'Marvel\\Database\\Models\\Attachment', 407, '632d63a6-1001-4e9f-a103-45d5a95b4ae0', 'default', 'Mask Group-1', 'Mask-Group-1.png', 'image/png', 's3', 's3', 143783, '[]', '{\"thumbnail\": true}', '[]', '[]', 407, '2022-01-28 00:39:04', '2022-01-28 00:39:04'),
(408, 'Marvel\\Database\\Models\\Attachment', 408, 'ee4a5ad1-2ca8-4d23-8ede-565d0d3be119', 'default', 'Rectangle 773', 'Rectangle-773.png', 'image/png', 's3', 's3', 92451, '[]', '{\"thumbnail\": true}', '[]', '[]', 408, '2022-01-28 00:39:04', '2022-01-28 00:39:05'),
(409, 'Marvel\\Database\\Models\\Attachment', 409, '6d9a1f4d-7498-4520-9c53-262600389636', 'default', 'Rectangle 774', 'Rectangle-774.png', 'image/png', 's3', 's3', 71922, '[]', '{\"thumbnail\": true}', '[]', '[]', 409, '2022-01-28 00:39:05', '2022-01-28 00:39:05'),
(410, 'Marvel\\Database\\Models\\Attachment', 410, '559d60d6-e5d3-42d3-bdd2-cdc74cc76ca1', 'default', 'Rectangle 775', 'Rectangle-775.png', 'image/png', 's3', 's3', 152662, '[]', '{\"thumbnail\": true}', '[]', '[]', 410, '2022-01-28 00:39:05', '2022-01-28 00:39:05'),
(411, 'Marvel\\Database\\Models\\Attachment', 411, '27296303-ca42-43f3-9f2a-d2f1b3fb4394', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 411, '2022-01-28 00:40:12', '2022-01-28 00:40:12'),
(412, 'Marvel\\Database\\Models\\Attachment', 412, '67926546-e378-4941-aa64-08837b865e71', 'default', 'Rectangle 776', 'Rectangle-776.png', 'image/png', 's3', 's3', 102428, '[]', '{\"thumbnail\": true}', '[]', '[]', 412, '2022-01-28 00:40:28', '2022-01-28 00:40:28'),
(413, 'Marvel\\Database\\Models\\Attachment', 413, '2b087d56-3b1f-41fe-b834-d5e4769e155a', 'default', 'Rectangle 773', 'Rectangle-773.png', 'image/png', 's3', 's3', 92451, '[]', '{\"thumbnail\": true}', '[]', '[]', 413, '2022-01-28 00:40:40', '2022-01-28 00:40:40'),
(414, 'Marvel\\Database\\Models\\Attachment', 414, 'a68f6625-1583-4325-ba0e-8281116b3470', 'default', 'Rectangle 774', 'Rectangle-774.png', 'image/png', 's3', 's3', 71922, '[]', '{\"thumbnail\": true}', '[]', '[]', 414, '2022-01-28 00:40:40', '2022-01-28 00:40:40'),
(415, 'Marvel\\Database\\Models\\Attachment', 415, '94e0f47e-3cd3-4db5-889e-3ba31ae29fb9', 'default', 'Rectangle 775', 'Rectangle-775.png', 'image/png', 's3', 's3', 152662, '[]', '{\"thumbnail\": true}', '[]', '[]', 415, '2022-01-28 00:40:40', '2022-01-28 00:40:40'),
(416, 'Marvel\\Database\\Models\\Attachment', 416, '44214bbf-d3f3-4818-a931-529ab94ac8aa', 'default', 'Rectangle 776', 'Rectangle-776.png', 'image/png', 's3', 's3', 102428, '[]', '{\"thumbnail\": true}', '[]', '[]', 416, '2022-01-28 00:40:40', '2022-01-28 00:40:40'),
(417, 'Marvel\\Database\\Models\\Attachment', 417, '28563eb4-3540-40d9-b36e-bdc97c977840', 'default', 'DOCUMENTATION', 'DOCUMENTATION.pdf', 'application/pdf', 's3', 's3', 191763, '[]', '[]', '[]', '[]', 417, '2022-01-28 00:41:44', '2022-01-28 00:41:44'),
(418, 'Marvel\\Database\\Models\\Attachment', 418, '69a815e0-f139-416e-b722-e6e6a3e1981d', 'default', 'blaze-fashion-bg', 'blaze-fashion-bg.jpg', 'image/jpeg', 's3', 's3', 92903, '[]', '{\"thumbnail\": true}', '[]', '[]', 418, '2022-01-30 13:59:43', '2022-01-30 13:59:43'),
(419, 'Marvel\\Database\\Models\\Attachment', 419, 'bfda0a1e-de0f-4396-a43b-35a80fff64f6', 'default', 'Cover 1', 'Cover-1.png', 'image/png', 's3', 's3', 253320, '[]', '{\"thumbnail\": true}', '[]', '[]', 419, '2022-02-02 15:59:34', '2022-02-02 15:59:34'),
(420, 'Marvel\\Database\\Models\\Attachment', 420, 'bd2d1f50-d7b9-4fe8-96ca-833c03fa6ce6', 'default', 'glimpse-html', 'glimpse-html.pdf', 'application/pdf', 's3', 's3', 439657, '[]', '[]', '[]', '[]', 420, '2022-02-03 13:51:24', '2022-02-03 13:51:24'),
(421, 'Marvel\\Database\\Models\\Attachment', 421, 'cb9389c5-4790-44a0-9669-a95fc4bb5f0d', 'default', 'glimpse-html', 'glimpse-html.pdf', 'application/pdf', 's3', 's3', 439657, '[]', '[]', '[]', '[]', 421, '2022-02-03 15:59:47', '2022-02-03 15:59:47'),
(422, 'Marvel\\Database\\Models\\Attachment', 422, 'bd60208a-3643-4be8-a068-4be55047a20d', 'default', 'Group-14393-thumbnail', 'Group-14393-thumbnail.jpg', 'image/jpeg', 's3', 's3', 7192, '[]', '{\"thumbnail\": true}', '[]', '[]', 422, '2022-02-09 14:14:50', '2022-02-09 14:14:50'),
(423, 'Marvel\\Database\\Models\\Attachment', 423, '651af785-de81-41b4-a0aa-c25f7e46ef2c', 'default', 'Cover-4-thumbnail', 'Cover-4-thumbnail.jpg', 'image/jpeg', 's3', 's3', 8743, '[]', '{\"thumbnail\": true}', '[]', '[]', 423, '2022-02-09 14:14:55', '2022-02-09 14:14:55'),
(424, 'Marvel\\Database\\Models\\Attachment', 424, 'f808ae62-067d-487c-976b-5f0b7754da24', 'default', '150', '150.zip', 'application/zip', 's3', 's3', 20022, '[]', '[]', '[]', '[]', 424, '2022-02-09 15:12:21', '2022-02-09 15:12:21'),
(425, 'Marvel\\Database\\Models\\Attachment', 425, '593cbd6e-a855-484c-895d-8d1e3d4290f8', 'default', 'author img-(11)', 'author-img-(11).jpg', 'image/jpeg', 's3', 's3', 77665, '[]', '{\"thumbnail\": true}', '[]', '[]', 425, '2022-02-09 17:46:29', '2022-02-09 17:46:29'),
(426, 'Marvel\\Database\\Models\\Attachment', 426, 'e07c76f0-ef66-4c06-ab4d-439b6f4f03b6', 'default', 'Wind.River.2017.720p.BluRay.x264-[YTS.AG] 2', 'Wind.River.2017.720p.BluRay.x264-[YTS.AG]-2.srt', 'text/plain', 's3', 's3', 84562, '[]', '[]', '[]', '[]', 426, '2022-02-10 08:06:18', '2022-02-10 08:06:18'),
(427, 'Marvel\\Database\\Models\\Attachment', 427, '7c62760c-7e15-4f21-93db-e2943566f6f4', 'default', 'Group 14379', 'Group-14379.png', 'image/png', 's3', 's3', 830, '[]', '{\"thumbnail\": true}', '[]', '[]', 427, '2022-02-10 17:06:52', '2022-02-10 17:06:52'),
(428, 'Marvel\\Database\\Models\\Attachment', 428, '6db5597a-afd4-4528-bc90-5f5a91c05609', 'default', 'Group 14393', 'Group-14393.png', 'image/png', 's3', 's3', 4023, '[]', '{\"thumbnail\": true}', '[]', '[]', 428, '2022-02-10 17:07:54', '2022-02-10 17:07:54'),
(429, 'Marvel\\Database\\Models\\Attachment', 429, '81792910-f4bb-48e8-ba93-17f71b90a598', 'default', 'alike', 'alike.pdf', 'application/pdf', 's3', 's3', 883723, '[]', '[]', '[]', '[]', 429, '2022-02-14 20:08:00', '2022-02-14 20:08:00'),
(430, 'Marvel\\Database\\Models\\Attachment', 430, '8be0fe14-5d2c-4512-8ff1-bdced6096fd3', 'default', 'headless-graphql', 'headless-graphql.pdf', 'application/pdf', 's3', 's3', 934854, '[]', '[]', '[]', '[]', 430, '2022-02-14 20:18:12', '2022-02-14 20:18:12'),
(431, 'Marvel\\Database\\Models\\Attachment', 431, 'def6a779-cb53-4e39-9d14-44b15ab90a7e', 'default', 'member-feature', 'member-feature.md', 'text/plain', 's3', 's3', 413, '[]', '[]', '[]', '[]', 431, '2022-02-15 12:33:26', '2022-02-15 12:33:26'),
(432, 'Marvel\\Database\\Models\\Attachment', 432, '5ce3d978-1034-48e1-9fcf-804dd2f849bb', 'default', 'test', 'test.md', 'text/html', 's3', 's3', 2584, '[]', '[]', '[]', '[]', 432, '2022-02-15 12:33:57', '2022-02-15 12:33:57'),
(433, 'Marvel\\Database\\Models\\Attachment', 433, '948112e5-340d-4124-8b53-3828f6d1d17f', 'default', 'member-feature', 'member-feature.md', 'text/plain', 's3', 's3', 413, '[]', '[]', '[]', '[]', 433, '2022-02-15 12:48:21', '2022-02-15 12:48:21'),
(434, 'Marvel\\Database\\Models\\Attachment', 434, '5bdecf06-bfb7-4eca-9fec-684b6cd45549', 'default', 'member-feature', 'member-feature.md', 'text/plain', 's3', 's3', 413, '[]', '[]', '[]', '[]', 434, '2022-02-15 12:50:26', '2022-02-15 12:50:26'),
(435, 'Marvel\\Database\\Models\\Attachment', 435, '37bb26c6-f789-4da3-9c41-9216b635d67d', 'default', 'member-feature', 'member-feature.md', 'text/plain', 's3', 's3', 413, '[]', '[]', '[]', '[]', 435, '2022-02-15 12:55:33', '2022-02-15 12:55:33'),
(436, 'Marvel\\Database\\Models\\Attachment', 436, '0c3bd9e7-ba6c-409d-a953-5e54885cd591', 'default', 'member-feature', 'member-feature.md', 'text/plain', 's3', 's3', 413, '[]', '[]', '[]', '[]', 436, '2022-02-15 13:05:33', '2022-02-15 13:05:33'),
(437, 'Marvel\\Database\\Models\\Attachment', 437, '66612455-b69d-4218-a4f3-e91acd8c22e6', 'default', 'userplace', 'userplace.jpg', 'image/jpeg', 's3', 's3', 95989, '[]', '{\"thumbnail\": true}', '[]', '[]', 437, '2022-02-15 13:08:32', '2022-02-15 13:08:32'),
(438, 'Marvel\\Database\\Models\\Attachment', 438, 'd7d1c726-c4ee-47cf-84d7-eeee125806b4', 'default', 'member-feature', 'member-feature.md', 'text/plain', 's3', 's3', 413, '[]', '[]', '[]', '[]', 438, '2022-02-15 13:31:05', '2022-02-15 13:31:05'),
(439, 'Marvel\\Database\\Models\\Attachment', 439, '0cd1dde3-d553-44a6-b6df-f5b74aadd09d', 'default', 'member-feature', 'member-feature.md', 'text/plain', 's3', 's3', 413, '[]', '[]', '[]', '[]', 439, '2022-02-15 13:33:12', '2022-02-15 13:33:12'),
(440, 'Marvel\\Database\\Models\\Attachment', 440, '8854b714-d5af-47fc-ab65-ba532cc57b7b', 'default', '1st standard', '1st-standard.png', 'image/png', 's3', 's3', 64475, '[]', '{\"thumbnail\": true}', '[]', '[]', 440, '2022-02-15 16:02:26', '2022-02-15 16:02:27'),
(441, 'Marvel\\Database\\Models\\Attachment', 441, '7257306c-f2fd-4138-9182-bdd29392ff09', 'default', '1', '1.png', 'image/png', 's3', 's3', 53825, '[]', '{\"thumbnail\": true}', '[]', '[]', 441, '2022-02-15 16:02:46', '2022-02-15 16:02:47'),
(442, 'Marvel\\Database\\Models\\Attachment', 442, '01419926-b1e4-4078-ae1d-3c67b1958699', 'default', 'Rectangle 790', 'Rectangle-790.png', 'image/png', 's3', 's3', 73860, '[]', '{\"thumbnail\": true}', '[]', '[]', 442, '2022-02-15 16:06:14', '2022-02-15 16:06:14'),
(443, 'Marvel\\Database\\Models\\Attachment', 444, '5eeba71a-9c47-4923-9c3e-e53ad8ed39e4', 'default', 'mask', 'mask.png', 'image/png', 's3', 's3', 207165, '[]', '{\"thumbnail\": true}', '[]', '[]', 443, '2022-02-16 02:55:10', '2022-02-16 02:55:10'),
(444, 'Marvel\\Database\\Models\\Attachment', 445, '24415725-1d35-4312-a39e-79fe45d7c3fe', 'default', 'mask', 'mask.png', 'image/png', 's3', 's3', 207165, '[]', '{\"thumbnail\": true}', '[]', '[]', 444, '2022-02-16 03:21:51', '2022-02-16 03:21:51'),
(445, 'Marvel\\Database\\Models\\Attachment', 446, 'a402783b-48d5-4be9-8462-6437afe8747a', 'default', '44', '44.jpg', 'image/jpeg', 's3', 's3', 3539, '[]', '{\"thumbnail\": true}', '[]', '[]', 445, '2022-02-16 11:11:06', '2022-02-16 11:11:07'),
(446, 'Marvel\\Database\\Models\\Attachment', 447, 'c6db488e-2ca8-4b92-9dd4-06694bdf569b', 'default', '44', '44.jpg', 'image/jpeg', 's3', 's3', 3539, '[]', '{\"thumbnail\": true}', '[]', '[]', 446, '2022-02-16 11:17:56', '2022-02-16 11:17:56'),
(447, 'Marvel\\Database\\Models\\Attachment', 448, '4c986185-d309-4afb-976a-ae8db0a3f744', 'default', '3d-avatar', '3d-avatar.svg', 'image/svg', 's3', 's3', 755011, '[]', '[]', '[]', '[]', 447, '2022-02-16 11:18:14', '2022-02-16 11:18:14'),
(448, 'Marvel\\Database\\Models\\Attachment', 449, '7e847fb2-522f-4da4-8bb1-2c35e13fa248', 'default', '44', '44.jpg', 'image/jpeg', 's3', 's3', 3539, '[]', '{\"thumbnail\": true}', '[]', '[]', 448, '2022-02-16 11:20:07', '2022-02-16 11:20:07'),
(449, 'Marvel\\Database\\Models\\Attachment', 450, '63d8d624-2c4b-41f8-b7af-a4d686673e13', 'default', '44', '44.jpg', 'image/jpeg', 's3', 's3', 3539, '[]', '{\"thumbnail\": true}', '[]', '[]', 449, '2022-02-16 11:21:28', '2022-02-16 11:21:28'),
(450, 'Marvel\\Database\\Models\\Attachment', 451, '9c21a387-5fc8-419a-8b7d-24af73f0e635', 'default', '44', '44.jpg', 'image/jpeg', 's3', 's3', 3539, '[]', '{\"thumbnail\": true}', '[]', '[]', 450, '2022-02-16 11:24:31', '2022-02-16 11:24:31'),
(451, 'Marvel\\Database\\Models\\Attachment', 452, 'b1f454fd-b53c-4245-beee-4709433d3798', 'default', '3d-avatar', '3d-avatar.svg', 'image/svg', 's3', 's3', 755011, '[]', '[]', '[]', '[]', 451, '2022-02-16 11:27:53', '2022-02-16 11:27:53'),
(452, 'Marvel\\Database\\Models\\Attachment', 453, 'd0eb0053-bac2-452d-810d-aaaf2b53c1ec', 'default', '44', '44.jpg', 'image/jpeg', 's3', 's3', 3539, '[]', '{\"thumbnail\": true}', '[]', '[]', 452, '2022-02-16 11:29:00', '2022-02-16 11:29:00'),
(453, 'Marvel\\Database\\Models\\Attachment', 454, '0f0cab3a-a65c-4737-9a40-cee57ac2bc51', 'default', '44', '44.jpg', 'image/jpeg', 's3', 's3', 3539, '[]', '{\"thumbnail\": true}', '[]', '[]', 453, '2022-02-16 11:48:35', '2022-02-16 11:48:35'),
(454, 'Marvel\\Database\\Models\\Attachment', 455, '27c53d7c-a8a8-4936-afe3-16b6d2160583', 'default', '3d-avatar', '3d-avatar.svg', 'image/svg', 's3', 's3', 755011, '[]', '[]', '[]', '[]', 454, '2022-02-16 11:48:46', '2022-02-16 11:48:46'),
(455, 'Marvel\\Database\\Models\\Attachment', 456, '3d1d5452-e45c-47d9-992d-bb3397bcc3b1', 'default', '44', '44.jpg', 'image/jpeg', 's3', 's3', 3539, '[]', '{\"thumbnail\": true}', '[]', '[]', 455, '2022-02-16 13:01:58', '2022-02-16 13:01:58'),
(456, 'Marvel\\Database\\Models\\Attachment', 457, '288b7816-bd5d-4dec-a124-d165e1763137', 'default', 'mask', 'mask.png', 'image/png', 's3', 's3', 207165, '[]', '{\"thumbnail\": true}', '[]', '[]', 456, '2022-02-16 14:02:11', '2022-02-16 14:02:11'),
(457, 'Marvel\\Database\\Models\\Attachment', 458, '6dfb014c-295e-4c60-8873-dded6d97485b', 'default', 'glimpse-html', 'glimpse-html.pdf', 'application/pdf', 's3', 's3', 439657, '[]', '[]', '[]', '[]', 457, '2022-02-16 15:28:45', '2022-02-16 15:28:45'),
(458, 'Marvel\\Database\\Models\\Attachment', 459, 'd6cba476-a77d-4a0c-9655-c0f11337b615', 'default', 'mask', 'mask.png', 'image/png', 's3', 's3', 207165, '[]', '{\"thumbnail\": true}', '[]', '[]', 458, '2022-02-16 15:29:22', '2022-02-16 15:29:22'),
(459, 'Marvel\\Database\\Models\\Attachment', 460, '3696740f-912a-4819-81dd-39187d9e3a28', 'default', 'mask', 'mask.png', 'image/png', 's3', 's3', 207165, '[]', '{\"thumbnail\": true}', '[]', '[]', 459, '2022-02-16 15:29:59', '2022-02-16 15:30:00'),
(460, 'Marvel\\Database\\Models\\Attachment', 461, 'c625e5a4-7478-40c6-a619-030aead81089', 'default', 'glimpse-html', 'glimpse-html.pdf', 'application/pdf', 's3', 's3', 439657, '[]', '[]', '[]', '[]', 460, '2022-02-16 15:31:47', '2022-02-16 15:31:47'),
(461, 'Marvel\\Database\\Models\\Attachment', 462, 'f2af2821-f58f-45bd-af0e-e91a8d4d1c9c', 'default', '44', '44.jpg', 'image/jpeg', 's3', 's3', 3539, '[]', '{\"thumbnail\": true}', '[]', '[]', 461, '2022-02-16 19:13:17', '2022-02-16 19:13:18'),
(462, 'Marvel\\Database\\Models\\Attachment', 463, '81dc69a8-db35-4916-8cbc-db386cc5ff26', 'default', '44', '44.jpg', 'image/jpeg', 's3', 's3', 3539, '[]', '{\"thumbnail\": true}', '[]', '[]', 462, '2022-02-16 19:15:41', '2022-02-16 19:15:41'),
(463, 'Marvel\\Database\\Models\\Attachment', 464, 'a2a2dd03-7186-4e45-9983-e277e6314f04', 'default', '44', '44.jpg', 'image/jpeg', 's3', 's3', 3539, '[]', '{\"thumbnail\": true}', '[]', '[]', 463, '2022-02-16 19:18:16', '2022-02-16 19:18:17'),
(464, 'Marvel\\Database\\Models\\Attachment', 465, 'bd489820-949c-4a71-864e-b520e11074dc', 'default', 'SK. ATIK TAJWAR SIHAN', 'SK.-ATIK-TAJWAR-SIHAN.png', 'image/png', 's3', 's3', 776505, '[]', '{\"thumbnail\": true}', '[]', '[]', 464, '2022-02-19 00:22:42', '2022-02-19 00:22:43'),
(465, 'Marvel\\Database\\Models\\Attachment', 467, '594682f0-2b92-4d43-a58d-4002f08a07e5', 'default', 'dp_small', 'dp_small.jpg', 'image/jpeg', 's3', 's3', 668433, '[]', '{\"thumbnail\": true}', '[]', '[]', 465, '2022-02-19 00:23:14', '2022-02-19 00:23:15'),
(466, 'Marvel\\Database\\Models\\Attachment', 468, '02c95c42-8cbb-4619-b5c5-6e2298110081', 'default', 'logo', 'logo.jpg', 'image/jpeg', 's3', 's3', 205062, '[]', '{\"thumbnail\": true}', '[]', '[]', 466, '2022-02-19 23:00:45', '2022-02-19 23:00:45'),
(467, 'Marvel\\Database\\Models\\Attachment', 469, 'dc38264e-82ae-4438-bb59-180650a5b21a', 'default', 'logo', 'logo.jpg', 'image/jpeg', 's3', 's3', 205062, '[]', '{\"thumbnail\": true}', '[]', '[]', 467, '2022-02-19 23:02:45', '2022-02-19 23:02:45'),
(468, 'Marvel\\Database\\Models\\Attachment', 470, '4fa5ca8c-3f74-46aa-bbff-335c1521708e', 'default', 'logo', 'logo.jpg', 'image/jpeg', 's3', 's3', 205062, '[]', '{\"thumbnail\": true}', '[]', '[]', 468, '2022-02-19 23:02:49', '2022-02-19 23:02:50'),
(469, 'Marvel\\Database\\Models\\Attachment', 471, '220fe39e-c33f-475c-83f0-bfc44c591f42', 'default', 'logo', 'logo.jpg', 'image/jpeg', 's3', 's3', 205062, '[]', '{\"thumbnail\": true}', '[]', '[]', 469, '2022-02-19 23:03:30', '2022-02-19 23:03:30'),
(470, 'Marvel\\Database\\Models\\Attachment', 472, '1fb97f50-db7b-45bb-855e-001e49f94c02', 'default', 'logo', 'logo.jpg', 'image/jpeg', 's3', 's3', 205062, '[]', '{\"thumbnail\": true}', '[]', '[]', 470, '2022-02-19 23:21:32', '2022-02-19 23:21:32'),
(471, 'Marvel\\Database\\Models\\Attachment', 473, '1c00d2b0-1c18-47d6-9f49-515814ef73ae', 'default', 'delbp9p-8a3973c0-19f5-4b23-a301-8d868dcc08fe', 'delbp9p-8a3973c0-19f5-4b23-a301-8d868dcc08fe.jpg', 'image/jpeg', 's3', 's3', 267533, '[]', '{\"thumbnail\": true}', '[]', '[]', 471, '2022-02-20 00:11:29', '2022-02-20 00:11:29'),
(472, 'Marvel\\Database\\Models\\Attachment', 474, '6d847221-93a5-4944-a9b5-5aa36c096b40', 'default', 'houston-online-hotel-booking-html-template', 'houston-online-hotel-booking-html-template.pdf', 'application/pdf', 's3', 's3', 202265, '[]', '[]', '[]', '[]', 472, '2022-02-20 13:41:27', '2022-02-20 13:41:27'),
(473, 'Marvel\\Database\\Models\\Attachment', 475, '78cd4812-357f-4174-b08d-373572991be5', 'default', 'logo', 'logo.svg', 'image/svg', 's3', 's3', 4786, '[]', '[]', '[]', '[]', 473, '2022-02-22 09:03:09', '2022-02-22 09:03:09'),
(474, 'Marvel\\Database\\Models\\Attachment', 476, '4b97b1e9-3cde-448e-9b0e-73e9cdc51682', 'default', 'logo', 'logo.jpg', 'image/jpeg', 's3', 's3', 205062, '[]', '{\"thumbnail\": true}', '[]', '[]', 474, '2022-02-23 15:45:33', '2022-02-23 15:45:33'),
(475, 'Marvel\\Database\\Models\\Attachment', 477, '1f01547a-4093-48c1-b690-0047e091fb86', 'default', 'image01', 'image01.png', 'image/png', 's3', 's3', 82769, '[]', '{\"thumbnail\": true}', '[]', '[]', 475, '2022-03-05 19:32:15', '2022-03-05 19:32:15'),
(476, 'Marvel\\Database\\Models\\Attachment', 478, '528836bb-3a55-426b-b7a3-d8d166277be7', 'default', 'image05', 'image05.png', 'image/png', 's3', 's3', 94668, '[]', '{\"thumbnail\": true}', '[]', '[]', 476, '2022-03-05 19:32:24', '2022-03-05 19:32:24'),
(477, 'Marvel\\Database\\Models\\Attachment', 479, '8bd16da9-bbfc-4177-a146-8fee176c0594', 'default', 'image12', 'image12.png', 'image/png', 's3', 's3', 32730, '[]', '{\"thumbnail\": true}', '[]', '[]', 477, '2022-03-05 19:32:24', '2022-03-05 19:32:24'),
(478, 'Marvel\\Database\\Models\\Attachment', 480, '4bd68895-627d-4934-81c1-6f5858480704', 'default', 'image14', 'image14.png', 'image/png', 's3', 's3', 28593, '[]', '{\"thumbnail\": true}', '[]', '[]', 478, '2022-03-05 19:32:24', '2022-03-05 19:32:24'),
(479, 'Marvel\\Database\\Models\\Attachment', 481, '9f29fc27-8f4f-48ec-8e87-5042968dd53b', 'default', 'image28', 'image28.png', 'image/png', 's3', 's3', 33758, '[]', '{\"thumbnail\": true}', '[]', '[]', 479, '2022-03-05 19:32:25', '2022-03-05 19:32:25'),
(480, 'Marvel\\Database\\Models\\Attachment', 482, 'fd034ac2-554c-4d0e-ac9e-e26d10975865', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 480, '2022-03-05 19:33:09', '2022-03-05 19:33:09'),
(481, 'Marvel\\Database\\Models\\Attachment', 483, '3e5bc885-bcfc-4129-98dc-aecb44eb9188', 'default', 'image02', 'image02.png', 'image/png', 's3', 's3', 58253, '[]', '{\"thumbnail\": true}', '[]', '[]', 481, '2022-03-05 19:34:03', '2022-03-05 19:34:03'),
(482, 'Marvel\\Database\\Models\\Attachment', 484, '6aa30755-aa00-41a6-bca2-72ab3ed1e805', 'default', 'image35', 'image35.png', 'image/png', 's3', 's3', 34675, '[]', '{\"thumbnail\": true}', '[]', '[]', 482, '2022-03-05 19:34:13', '2022-03-05 19:34:14'),
(483, 'Marvel\\Database\\Models\\Attachment', 485, '56011f6d-43bb-4917-b263-8334ee667482', 'default', 'image43', 'image43.png', 'image/png', 's3', 's3', 28282, '[]', '{\"thumbnail\": true}', '[]', '[]', 483, '2022-03-05 19:34:14', '2022-03-05 19:34:14'),
(484, 'Marvel\\Database\\Models\\Attachment', 486, '30230abe-9076-465c-8a41-534bd6ee7135', 'default', 'image45', 'image45.png', 'image/png', 's3', 's3', 25087, '[]', '{\"thumbnail\": true}', '[]', '[]', 484, '2022-03-05 19:34:14', '2022-03-05 19:34:14'),
(485, 'Marvel\\Database\\Models\\Attachment', 487, 'ec24db23-d4a3-4693-bd72-491d0b824d3d', 'default', 'image52', 'image52.png', 'image/png', 's3', 's3', 67036, '[]', '{\"thumbnail\": true}', '[]', '[]', 485, '2022-03-05 19:34:14', '2022-03-05 19:34:14'),
(486, 'Marvel\\Database\\Models\\Attachment', 488, 'bba9dcc1-ce2d-452b-b650-0e851fafc773', 'default', 'image52', 'image52.png', 'image/png', 's3', 's3', 67036, '[]', '{\"thumbnail\": true}', '[]', '[]', 486, '2022-03-05 19:34:36', '2022-03-05 19:34:36'),
(487, 'Marvel\\Database\\Models\\Attachment', 489, '682982bd-cafc-46fd-89a5-df50912e47b3', 'default', 'image03', 'image03.png', 'image/png', 's3', 's3', 53741, '[]', '{\"thumbnail\": true}', '[]', '[]', 487, '2022-03-05 19:34:44', '2022-03-05 19:34:44'),
(488, 'Marvel\\Database\\Models\\Attachment', 490, 'a4db51ff-37a0-4328-8f7b-291035fdb49a', 'default', 'image04', 'image04.png', 'image/png', 's3', 's3', 30435, '[]', '{\"thumbnail\": true}', '[]', '[]', 488, '2022-03-05 19:34:44', '2022-03-05 19:34:44'),
(489, 'Marvel\\Database\\Models\\Attachment', 491, '219d47f3-115c-497c-8596-52cfb47c6b13', 'default', 'image11', 'image11.png', 'image/png', 's3', 's3', 32058, '[]', '{\"thumbnail\": true}', '[]', '[]', 489, '2022-03-05 19:34:44', '2022-03-05 19:34:45'),
(490, 'Marvel\\Database\\Models\\Attachment', 492, 'c9019c7a-f05e-4fdf-86f1-f12c526cb878', 'default', 'image28', 'image28.png', 'image/png', 's3', 's3', 33758, '[]', '{\"thumbnail\": true}', '[]', '[]', 490, '2022-03-05 19:34:45', '2022-03-05 19:34:45'),
(491, 'Marvel\\Database\\Models\\Attachment', 493, '8b270f36-1127-40bb-bf53-f186ae614873', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 491, '2022-03-05 19:35:07', '2022-03-05 19:35:07'),
(492, 'Marvel\\Database\\Models\\Attachment', 494, 'd643c0a4-479d-45db-ab0f-45672db4192a', 'default', 'image52', 'image52.png', 'image/png', 's3', 's3', 67036, '[]', '{\"thumbnail\": true}', '[]', '[]', 492, '2022-03-05 19:36:18', '2022-03-05 19:36:18'),
(493, 'Marvel\\Database\\Models\\Attachment', 495, '3181227b-69a6-4545-a495-585b08bc15c8', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 493, '2022-03-05 19:52:57', '2022-03-05 19:52:57'),
(494, 'Marvel\\Database\\Models\\Attachment', 496, 'b048a59b-3063-4dd4-a78a-f7eeb4284324', 'default', 'image02', 'image02.png', 'image/png', 's3', 's3', 58253, '[]', '{\"thumbnail\": true}', '[]', '[]', 494, '2022-03-05 20:08:55', '2022-03-05 20:08:55'),
(495, 'Marvel\\Database\\Models\\Attachment', 497, '1e10ab17-2e6c-4901-aa4a-046bc258fb3e', 'default', 'image03', 'image03.png', 'image/png', 's3', 's3', 53741, '[]', '{\"thumbnail\": true}', '[]', '[]', 495, '2022-03-05 20:09:10', '2022-03-05 20:09:10'),
(496, 'Marvel\\Database\\Models\\Attachment', 498, '917bd8ba-8f43-494b-8810-69d089888da1', 'default', 'image04', 'image04.png', 'image/png', 's3', 's3', 30435, '[]', '{\"thumbnail\": true}', '[]', '[]', 496, '2022-03-05 20:09:10', '2022-03-05 20:09:10'),
(497, 'Marvel\\Database\\Models\\Attachment', 499, '9682f176-ef24-4518-9e20-2d2186f35af0', 'default', 'image11', 'image11.png', 'image/png', 's3', 's3', 32058, '[]', '{\"thumbnail\": true}', '[]', '[]', 497, '2022-03-05 20:09:10', '2022-03-05 20:09:10'),
(498, 'Marvel\\Database\\Models\\Attachment', 500, '83685a2b-ab6f-41dc-80f4-b5beb6531959', 'default', 'image20', 'image20.png', 'image/png', 's3', 's3', 34100, '[]', '{\"thumbnail\": true}', '[]', '[]', 498, '2022-03-05 20:09:10', '2022-03-05 20:09:11'),
(499, 'Marvel\\Database\\Models\\Attachment', 501, '46c87db0-2b87-4eec-a723-a157c76e63be', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 499, '2022-03-05 20:09:38', '2022-03-05 20:09:38'),
(500, 'Marvel\\Database\\Models\\Attachment', 502, '0344f028-ecae-4965-b711-3305d1ff175e', 'default', 'image04', 'image04.png', 'image/png', 's3', 's3', 30435, '[]', '{\"thumbnail\": true}', '[]', '[]', 500, '2022-03-05 20:30:48', '2022-03-05 20:30:49'),
(501, 'Marvel\\Database\\Models\\Attachment', 503, 'f02dcb24-bcba-42d0-98cf-101099859f6c', 'default', 'image03', 'image03.png', 'image/png', 's3', 's3', 53741, '[]', '{\"thumbnail\": true}', '[]', '[]', 501, '2022-03-05 20:30:58', '2022-03-05 20:30:58'),
(502, 'Marvel\\Database\\Models\\Attachment', 504, '3b6818fb-63bf-40ea-af8f-ead6777348f8', 'default', 'image04', 'image04.png', 'image/png', 's3', 's3', 30435, '[]', '{\"thumbnail\": true}', '[]', '[]', 502, '2022-03-05 20:30:58', '2022-03-05 20:30:58'),
(503, 'Marvel\\Database\\Models\\Attachment', 505, 'b5ceff0c-5d9f-4259-b50b-0ccc0ed4e306', 'default', 'image08', 'image08.png', 'image/png', 's3', 's3', 41284, '[]', '{\"thumbnail\": true}', '[]', '[]', 503, '2022-03-05 20:30:58', '2022-03-05 20:30:58'),
(504, 'Marvel\\Database\\Models\\Attachment', 506, '11914829-9905-4f26-8081-bdd1dca6931a', 'default', 'image11', 'image11.png', 'image/png', 's3', 's3', 32058, '[]', '{\"thumbnail\": true}', '[]', '[]', 504, '2022-03-05 20:30:58', '2022-03-05 20:30:58'),
(505, 'Marvel\\Database\\Models\\Attachment', 507, '659d92f6-4bf0-4b5a-bff2-491567d20258', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 505, '2022-03-05 20:31:11', '2022-03-05 20:31:11'),
(506, 'Marvel\\Database\\Models\\Attachment', 508, '5362cb33-aaf3-44b5-99bd-be1a4ae9938b', 'default', 'image06', 'image06.png', 'image/png', 's3', 's3', 86713, '[]', '{\"thumbnail\": true}', '[]', '[]', 506, '2022-03-05 20:31:23', '2022-03-05 20:31:23'),
(507, 'Marvel\\Database\\Models\\Attachment', 509, 'ae2c6a2d-5171-408f-97a3-878dafb3ca1d', 'default', 'image02', 'image02.png', 'image/png', 's3', 's3', 58253, '[]', '{\"thumbnail\": true}', '[]', '[]', 507, '2022-03-05 20:31:36', '2022-03-05 20:31:36'),
(508, 'Marvel\\Database\\Models\\Attachment', 510, 'd2a1e6f8-9925-40aa-8116-738ad00845b2', 'default', 'image03', 'image03.png', 'image/png', 's3', 's3', 53741, '[]', '{\"thumbnail\": true}', '[]', '[]', 508, '2022-03-05 20:31:36', '2022-03-05 20:31:36'),
(509, 'Marvel\\Database\\Models\\Attachment', 511, '051d330f-8d81-4fa3-9b4a-f87c23a5ef1b', 'default', 'image04', 'image04.png', 'image/png', 's3', 's3', 30435, '[]', '{\"thumbnail\": true}', '[]', '[]', 509, '2022-03-05 20:31:36', '2022-03-05 20:31:36'),
(510, 'Marvel\\Database\\Models\\Attachment', 512, 'c92f694e-6ade-4c22-b068-591ce4103920', 'default', 'image06', 'image06.png', 'image/png', 's3', 's3', 86713, '[]', '{\"thumbnail\": true}', '[]', '[]', 510, '2022-03-05 20:31:36', '2022-03-05 20:31:37'),
(511, 'Marvel\\Database\\Models\\Attachment', 513, '80d16abd-5c07-44e1-8842-a72d2316b193', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 511, '2022-03-05 20:31:53', '2022-03-05 20:31:53'),
(512, 'Marvel\\Database\\Models\\Attachment', 514, '0bf3f754-d381-421b-886d-b696e5beac5a', 'default', 'image07', 'image07.png', 'image/png', 's3', 's3', 40262, '[]', '{\"thumbnail\": true}', '[]', '[]', 512, '2022-03-05 20:32:04', '2022-03-05 20:32:04'),
(513, 'Marvel\\Database\\Models\\Attachment', 515, '75ed2b01-507b-4837-a68b-371a26bc4387', 'default', 'image07', 'image07.png', 'image/png', 's3', 's3', 40262, '[]', '{\"thumbnail\": true}', '[]', '[]', 513, '2022-03-05 20:32:21', '2022-03-05 20:32:21'),
(514, 'Marvel\\Database\\Models\\Attachment', 516, '7001b89f-5c16-442f-9e06-e1e1262d86aa', 'default', 'image11', 'image11.png', 'image/png', 's3', 's3', 32058, '[]', '{\"thumbnail\": true}', '[]', '[]', 514, '2022-03-05 20:32:21', '2022-03-05 20:32:21'),
(515, 'Marvel\\Database\\Models\\Attachment', 517, '63063928-804b-484f-9067-2fc2980f4309', 'default', 'image18', 'image18.png', 'image/png', 's3', 's3', 53256, '[]', '{\"thumbnail\": true}', '[]', '[]', 515, '2022-03-05 20:32:21', '2022-03-05 20:32:21'),
(516, 'Marvel\\Database\\Models\\Attachment', 518, '8ed2fdc3-9d3e-4ac9-8b15-ea5d32c32962', 'default', 'image27', 'image27.png', 'image/png', 's3', 's3', 44687, '[]', '{\"thumbnail\": true}', '[]', '[]', 516, '2022-03-05 20:32:21', '2022-03-05 20:32:21'),
(517, 'Marvel\\Database\\Models\\Attachment', 519, 'e59929b9-b189-447d-9c2b-e374867bea2d', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 517, '2022-03-05 20:32:27', '2022-03-05 20:32:27'),
(518, 'Marvel\\Database\\Models\\Attachment', 520, '32426d16-c457-4b8d-bb98-a6f3b32c82d5', 'default', 'image05', 'image05.png', 'image/png', 's3', 's3', 94668, '[]', '{\"thumbnail\": true}', '[]', '[]', 518, '2022-03-05 20:32:43', '2022-03-05 20:32:43'),
(519, 'Marvel\\Database\\Models\\Attachment', 521, '9552ffe0-183a-493f-b92f-e2a624b6bf81', 'default', 'image05', 'image05.png', 'image/png', 's3', 's3', 94668, '[]', '{\"thumbnail\": true}', '[]', '[]', 519, '2022-03-05 20:32:55', '2022-03-05 20:32:55'),
(520, 'Marvel\\Database\\Models\\Attachment', 522, 'b508778d-77cd-4b7f-ac5d-a252eac39170', 'default', 'image27', 'image27.png', 'image/png', 's3', 's3', 44687, '[]', '{\"thumbnail\": true}', '[]', '[]', 520, '2022-03-05 20:32:55', '2022-03-05 20:32:55'),
(521, 'Marvel\\Database\\Models\\Attachment', 523, '100ac7be-2b90-48e5-88b5-dba212f5464f', 'default', 'image36', 'image36.png', 'image/png', 's3', 's3', 38997, '[]', '{\"thumbnail\": true}', '[]', '[]', 521, '2022-03-05 20:32:55', '2022-03-05 20:32:55'),
(522, 'Marvel\\Database\\Models\\Attachment', 524, 'e153e54c-761b-4436-ad33-bd6876c24c6e', 'default', 'image43', 'image43.png', 'image/png', 's3', 's3', 28282, '[]', '{\"thumbnail\": true}', '[]', '[]', 522, '2022-03-05 20:32:55', '2022-03-05 20:32:55'),
(523, 'Marvel\\Database\\Models\\Attachment', 525, 'f501a192-9864-4f65-8f92-0b2d71abe120', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 523, '2022-03-05 20:33:02', '2022-03-05 20:33:02'),
(524, 'Marvel\\Database\\Models\\Attachment', 526, '2b2e008a-ba0d-4a72-aaf1-11b7125d06cd', 'default', 'image01', 'image01.png', 'image/png', 's3', 's3', 82769, '[]', '{\"thumbnail\": true}', '[]', '[]', 524, '2022-03-05 20:33:25', '2022-03-05 20:33:25'),
(525, 'Marvel\\Database\\Models\\Attachment', 527, '706c5916-708f-4b5b-bf99-7ffd93354aa6', 'default', 'image01', 'image01.png', 'image/png', 's3', 's3', 82769, '[]', '{\"thumbnail\": true}', '[]', '[]', 525, '2022-03-05 20:33:37', '2022-03-05 20:33:37'),
(526, 'Marvel\\Database\\Models\\Attachment', 528, '0d195593-4711-4965-bc4c-d22ac3146101', 'default', 'image02', 'image02.png', 'image/png', 's3', 's3', 58253, '[]', '{\"thumbnail\": true}', '[]', '[]', 526, '2022-03-05 20:33:37', '2022-03-05 20:33:37'),
(527, 'Marvel\\Database\\Models\\Attachment', 529, '0ff70663-1ea8-4b5a-bc1c-add7e53dfe30', 'default', 'image45', 'image45.png', 'image/png', 's3', 's3', 25087, '[]', '{\"thumbnail\": true}', '[]', '[]', 527, '2022-03-05 20:33:37', '2022-03-05 20:33:38'),
(528, 'Marvel\\Database\\Models\\Attachment', 530, '2057ab5f-6546-4c51-9d75-1bbfeb245c3f', 'default', 'image52', 'image52.png', 'image/png', 's3', 's3', 67036, '[]', '{\"thumbnail\": true}', '[]', '[]', 528, '2022-03-05 20:33:38', '2022-03-05 20:33:38'),
(529, 'Marvel\\Database\\Models\\Attachment', 531, 'f4c7b987-31a5-436a-b33e-f6c0762eaf95', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 529, '2022-03-05 20:33:49', '2022-03-05 20:33:49'),
(530, 'Marvel\\Database\\Models\\Attachment', 532, 'b58be0eb-df50-4e14-a160-a9a2c784f876', 'default', 'image50', 'image50.png', 'image/png', 's3', 's3', 60182, '[]', '{\"thumbnail\": true}', '[]', '[]', 530, '2022-03-05 20:34:09', '2022-03-05 20:34:09'),
(531, 'Marvel\\Database\\Models\\Attachment', 533, '86c19d08-a041-40f5-a3cd-3199872258dc', 'default', 'image27', 'image27.png', 'image/png', 's3', 's3', 44687, '[]', '{\"thumbnail\": true}', '[]', '[]', 531, '2022-03-05 20:34:18', '2022-03-05 20:34:19'),
(532, 'Marvel\\Database\\Models\\Attachment', 534, '29b67059-9778-435b-b632-5b24523e33a5', 'default', 'image35', 'image35.png', 'image/png', 's3', 's3', 34675, '[]', '{\"thumbnail\": true}', '[]', '[]', 532, '2022-03-05 20:34:19', '2022-03-05 20:34:19'),
(533, 'Marvel\\Database\\Models\\Attachment', 535, 'a06cca2d-39fd-4779-9ba5-dc7191528da3', 'default', 'image42-2', 'image42-2.png', 'image/png', 's3', 's3', 35304, '[]', '{\"thumbnail\": true}', '[]', '[]', 533, '2022-03-05 20:34:19', '2022-03-05 20:34:19'),
(534, 'Marvel\\Database\\Models\\Attachment', 536, '71b5ceb0-8b86-4deb-b594-85f612e33425', 'default', 'image50', 'image50.png', 'image/png', 's3', 's3', 60182, '[]', '{\"thumbnail\": true}', '[]', '[]', 534, '2022-03-05 20:34:19', '2022-03-05 20:34:19'),
(535, 'Marvel\\Database\\Models\\Attachment', 537, '68e30c22-3ef0-429f-8ad2-22362b0f7a76', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 535, '2022-03-05 20:34:25', '2022-03-05 20:34:25'),
(536, 'Marvel\\Database\\Models\\Attachment', 538, 'c47bd782-2039-4a87-94da-c9e1330cb39d', 'default', 'image26', 'image26.png', 'image/png', 's3', 's3', 24741, '[]', '{\"thumbnail\": true}', '[]', '[]', 536, '2022-03-05 20:35:17', '2022-03-05 20:35:17'),
(537, 'Marvel\\Database\\Models\\Attachment', 539, '8aa40d07-1fea-4bd9-8da3-d3d27706a146', 'default', 'image14', 'image14.png', 'image/png', 's3', 's3', 28593, '[]', '{\"thumbnail\": true}', '[]', '[]', 537, '2022-03-05 20:35:26', '2022-03-05 20:35:26'),
(538, 'Marvel\\Database\\Models\\Attachment', 540, '025fa25b-1643-4049-a984-8b898b73c3fa', 'default', 'image21', 'image21.png', 'image/png', 's3', 's3', 31010, '[]', '{\"thumbnail\": true}', '[]', '[]', 538, '2022-03-05 20:35:26', '2022-03-05 20:35:27'),
(539, 'Marvel\\Database\\Models\\Attachment', 541, '94e6f6bc-0a4a-4f98-a5ca-cec82b70ac51', 'default', 'image26', 'image26.png', 'image/png', 's3', 's3', 24741, '[]', '{\"thumbnail\": true}', '[]', '[]', 539, '2022-03-05 20:35:27', '2022-03-05 20:35:27'),
(540, 'Marvel\\Database\\Models\\Attachment', 542, 'f380ebb2-646d-4b70-baf8-af5d87047c83', 'default', 'image27', 'image27.png', 'image/png', 's3', 's3', 44687, '[]', '{\"thumbnail\": true}', '[]', '[]', 540, '2022-03-05 20:35:27', '2022-03-05 20:35:27'),
(541, 'Marvel\\Database\\Models\\Attachment', 543, '0625d6e5-2ef3-4b40-964a-7f261690adf0', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 541, '2022-03-05 20:35:48', '2022-03-05 20:35:48'),
(542, 'Marvel\\Database\\Models\\Attachment', 544, '3ff84976-799a-4787-8166-d5d7f540566e', 'default', 'image10', 'image10.png', 'image/png', 's3', 's3', 79367, '[]', '{\"thumbnail\": true}', '[]', '[]', 542, '2022-03-05 20:36:38', '2022-03-05 20:36:38'),
(543, 'Marvel\\Database\\Models\\Attachment', 545, 'af380659-1d89-46b2-965b-3836a0d78eda', 'default', 'image10', 'image10.png', 'image/png', 's3', 's3', 79367, '[]', '{\"thumbnail\": true}', '[]', '[]', 543, '2022-03-05 20:36:45', '2022-03-05 20:36:46'),
(544, 'Marvel\\Database\\Models\\Attachment', 546, '4226ff52-886c-4d2f-b0b3-064eb5e103a8', 'default', 'image12', 'image12.png', 'image/png', 's3', 's3', 32730, '[]', '{\"thumbnail\": true}', '[]', '[]', 544, '2022-03-05 20:36:46', '2022-03-05 20:36:46'),
(545, 'Marvel\\Database\\Models\\Attachment', 547, '65698682-cd4b-4368-8915-85e0adb8a2c0', 'default', 'image13', 'image13.png', 'image/png', 's3', 's3', 42830, '[]', '{\"thumbnail\": true}', '[]', '[]', 545, '2022-03-05 20:36:46', '2022-03-05 20:36:46'),
(546, 'Marvel\\Database\\Models\\Attachment', 548, '2b7d6c78-85f5-45f1-8b32-2757a26c2dda', 'default', 'image14', 'image14.png', 'image/png', 's3', 's3', 28593, '[]', '{\"thumbnail\": true}', '[]', '[]', 546, '2022-03-05 20:36:46', '2022-03-05 20:36:46'),
(547, 'Marvel\\Database\\Models\\Attachment', 549, '3ff963e0-90cc-4b81-85fc-79d68b8126c0', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 547, '2022-03-05 20:36:53', '2022-03-05 20:36:53'),
(548, 'Marvel\\Database\\Models\\Attachment', 550, '8fabb3e9-7bc3-4141-8e16-77de949ecc67', 'default', 'image47', 'image47.png', 'image/png', 's3', 's3', 42648, '[]', '{\"thumbnail\": true}', '[]', '[]', 548, '2022-03-05 20:37:11', '2022-03-05 20:37:12'),
(549, 'Marvel\\Database\\Models\\Attachment', 551, '5372d817-adc2-47e1-b793-79baa189be38', 'default', 'image37', 'image37.png', 'image/png', 's3', 's3', 34520, '[]', '{\"thumbnail\": true}', '[]', '[]', 549, '2022-03-05 20:37:27', '2022-03-05 20:37:27'),
(550, 'Marvel\\Database\\Models\\Attachment', 552, 'f94914d4-c00f-4304-9f08-baf6cbd5b4d2', 'default', 'image42', 'image42.png', 'image/png', 's3', 's3', 35304, '[]', '{\"thumbnail\": true}', '[]', '[]', 550, '2022-03-05 20:37:27', '2022-03-05 20:37:27'),
(551, 'Marvel\\Database\\Models\\Attachment', 553, '588d1c23-ca45-49bc-ab71-2d13c96c0972', 'default', 'image42-2', 'image42-2.png', 'image/png', 's3', 's3', 35304, '[]', '{\"thumbnail\": true}', '[]', '[]', 551, '2022-03-05 20:37:28', '2022-03-05 20:37:28'),
(552, 'Marvel\\Database\\Models\\Attachment', 554, 'f3c1d18e-236e-40c9-b596-c3d5716b3e0c', 'default', 'image47', 'image47.png', 'image/png', 's3', 's3', 42648, '[]', '{\"thumbnail\": true}', '[]', '[]', 552, '2022-03-05 20:37:28', '2022-03-05 20:37:28'),
(553, 'Marvel\\Database\\Models\\Attachment', 555, '0d51afc2-1e7c-47f7-83d4-d5a43b428815', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 553, '2022-03-05 20:38:13', '2022-03-05 20:38:13'),
(554, 'Marvel\\Database\\Models\\Attachment', 556, '76c37b86-fbeb-4d69-ae33-a975ceda792f', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 554, '2022-03-05 20:38:42', '2022-03-05 20:38:42'),
(555, 'Marvel\\Database\\Models\\Attachment', 557, '58a034d3-bde2-4316-9754-ae7b2becb416', 'default', 'image23', 'image23.png', 'image/png', 's3', 's3', 58245, '[]', '{\"thumbnail\": true}', '[]', '[]', 555, '2022-03-05 20:38:55', '2022-03-05 20:38:55'),
(556, 'Marvel\\Database\\Models\\Attachment', 558, 'c228815b-61e1-47ac-83a2-85fc3e3a59a7', 'default', 'image18', 'image18.png', 'image/png', 's3', 's3', 53256, '[]', '{\"thumbnail\": true}', '[]', '[]', 556, '2022-03-05 20:39:06', '2022-03-05 20:39:06'),
(557, 'Marvel\\Database\\Models\\Attachment', 559, 'e4cd2901-8ec2-4662-884f-05b066f322a3', 'default', 'image22', 'image22.png', 'image/png', 's3', 's3', 48249, '[]', '{\"thumbnail\": true}', '[]', '[]', 557, '2022-03-05 20:39:06', '2022-03-05 20:39:06'),
(558, 'Marvel\\Database\\Models\\Attachment', 560, 'ef49df32-43b1-459a-bc9e-3b1b3fd0bcdf', 'default', 'image23', 'image23.png', 'image/png', 's3', 's3', 58245, '[]', '{\"thumbnail\": true}', '[]', '[]', 558, '2022-03-05 20:39:06', '2022-03-05 20:39:07'),
(559, 'Marvel\\Database\\Models\\Attachment', 561, 'c17df1a1-b52c-4235-92f6-88c5d2d7c63b', 'default', 'image41', 'image41.png', 'image/png', 's3', 's3', 55788, '[]', '{\"thumbnail\": true}', '[]', '[]', 559, '2022-03-05 20:39:07', '2022-03-05 20:39:07'),
(560, 'Marvel\\Database\\Models\\Attachment', 562, 'a6d30ae1-68af-4bd4-b0d0-ff2f2d5ee653', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 560, '2022-03-05 20:39:11', '2022-03-05 20:39:11'),
(561, 'Marvel\\Database\\Models\\Attachment', 563, '7a5f47ee-fe54-4b72-a3a5-94c382fffa2d', 'default', 'image29', 'image29.png', 'image/png', 's3', 's3', 34705, '[]', '{\"thumbnail\": true}', '[]', '[]', 561, '2022-03-05 20:41:25', '2022-03-05 20:41:26'),
(562, 'Marvel\\Database\\Models\\Attachment', 564, '3c06b19d-f72e-43d9-91f9-f27d74d82ca3', 'default', 'image22', 'image22.png', 'image/png', 's3', 's3', 48249, '[]', '{\"thumbnail\": true}', '[]', '[]', 562, '2022-03-05 20:41:34', '2022-03-05 20:41:35'),
(563, 'Marvel\\Database\\Models\\Attachment', 565, '69a220d7-ca42-431c-bfe4-4f5fcb5bc90b', 'default', 'image29', 'image29.png', 'image/png', 's3', 's3', 34705, '[]', '{\"thumbnail\": true}', '[]', '[]', 563, '2022-03-05 20:41:35', '2022-03-05 20:41:35'),
(564, 'Marvel\\Database\\Models\\Attachment', 566, '4a785b6b-0dc1-4181-85da-c782f3e9c734', 'default', 'image30', 'image30.png', 'image/png', 's3', 's3', 43235, '[]', '{\"thumbnail\": true}', '[]', '[]', 564, '2022-03-05 20:41:35', '2022-03-05 20:41:35'),
(565, 'Marvel\\Database\\Models\\Attachment', 567, '2287763e-b50d-4f36-b5e0-9d1ff81ecbf6', 'default', 'image31', 'image31.png', 'image/png', 's3', 's3', 28106, '[]', '{\"thumbnail\": true}', '[]', '[]', 565, '2022-03-05 20:41:35', '2022-03-05 20:41:35'),
(566, 'Marvel\\Database\\Models\\Attachment', 568, 'c4bf9a10-eadd-49d2-b0c3-00f1bc9fc46c', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 566, '2022-03-05 20:41:50', '2022-03-05 20:41:50'),
(567, 'Marvel\\Database\\Models\\Attachment', 569, 'b72f548b-6769-4314-b558-c7088abcfd9e', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 567, '2022-03-05 20:47:23', '2022-03-05 20:47:23'),
(568, 'Marvel\\Database\\Models\\Attachment', 570, 'e1a142f1-e5e6-40e8-8d77-0eebe373cfdc', 'default', 'image14', 'image14.png', 'image/png', 's3', 's3', 28593, '[]', '{\"thumbnail\": true}', '[]', '[]', 568, '2022-03-05 20:47:37', '2022-03-05 20:47:38'),
(569, 'Marvel\\Database\\Models\\Attachment', 571, 'dc6222f6-3636-421d-bec2-ce8c577edf53', 'default', 'image23', 'image23.png', 'image/png', 's3', 's3', 58245, '[]', '{\"thumbnail\": true}', '[]', '[]', 569, '2022-03-05 20:47:38', '2022-03-05 20:47:38'),
(570, 'Marvel\\Database\\Models\\Attachment', 572, '430752fc-a4b7-4271-b826-f0332d8375c8', 'default', 'image29', 'image29.png', 'image/png', 's3', 's3', 34705, '[]', '{\"thumbnail\": true}', '[]', '[]', 570, '2022-03-05 20:47:38', '2022-03-05 20:47:38'),
(571, 'Marvel\\Database\\Models\\Attachment', 573, '8e4fe7d5-ed8e-4234-b861-c8695c317c2c', 'default', 'image30', 'image30.png', 'image/png', 's3', 's3', 43235, '[]', '{\"thumbnail\": true}', '[]', '[]', 571, '2022-03-05 20:47:38', '2022-03-05 20:47:38'),
(572, 'Marvel\\Database\\Models\\Attachment', 574, 'c7b89536-3bd7-4456-8a54-ca09cd2e5ad1', 'default', 'image28', 'image28.png', 'image/png', 's3', 's3', 33758, '[]', '{\"thumbnail\": true}', '[]', '[]', 572, '2022-03-05 20:47:53', '2022-03-05 20:47:54'),
(573, 'Marvel\\Database\\Models\\Attachment', 575, '332858fc-2bf9-4f1c-a958-9058b6135a2e', 'default', 'image03', 'image03.png', 'image/png', 's3', 's3', 53741, '[]', '{\"thumbnail\": true}', '[]', '[]', 573, '2022-03-05 20:48:11', '2022-03-05 20:48:11');
INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `generated_conversions`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(574, 'Marvel\\Database\\Models\\Attachment', 576, '98f8c7b1-39ff-417d-baae-946df56e78e6', 'default', 'image04', 'image04.png', 'image/png', 's3', 's3', 30435, '[]', '{\"thumbnail\": true}', '[]', '[]', 574, '2022-03-05 20:48:11', '2022-03-05 20:48:11'),
(575, 'Marvel\\Database\\Models\\Attachment', 577, '068aaae9-f303-4679-b109-0f10ab4d43d4', 'default', 'image28', 'image28.png', 'image/png', 's3', 's3', 33758, '[]', '{\"thumbnail\": true}', '[]', '[]', 575, '2022-03-05 20:48:11', '2022-03-05 20:48:11'),
(576, 'Marvel\\Database\\Models\\Attachment', 578, 'd25e9c32-3924-4e68-93d6-76ae9e5e94c3', 'default', 'image52', 'image52.png', 'image/png', 's3', 's3', 67036, '[]', '{\"thumbnail\": true}', '[]', '[]', 576, '2022-03-05 20:48:11', '2022-03-05 20:48:11'),
(577, 'Marvel\\Database\\Models\\Attachment', 579, '1c5c0d13-3c36-4e46-a307-59ad88f13a11', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 577, '2022-03-05 20:48:31', '2022-03-05 20:48:31'),
(578, 'Marvel\\Database\\Models\\Attachment', 580, '89f3f629-b169-4799-843f-02eae9b98f01', 'default', 'image48', 'image48.png', 'image/png', 's3', 's3', 54327, '[]', '{\"thumbnail\": true}', '[]', '[]', 578, '2022-03-05 20:48:49', '2022-03-05 20:48:49'),
(579, 'Marvel\\Database\\Models\\Attachment', 581, 'b817c3f7-451a-4a79-99f5-4de5d6bdf24a', 'default', 'image11', 'image11.png', 'image/png', 's3', 's3', 32058, '[]', '{\"thumbnail\": true}', '[]', '[]', 579, '2022-03-05 20:49:04', '2022-03-05 20:49:04'),
(580, 'Marvel\\Database\\Models\\Attachment', 582, 'ca6caad9-3ddf-4133-ad73-58ed7b984c56', 'default', 'image18', 'image18.png', 'image/png', 's3', 's3', 53256, '[]', '{\"thumbnail\": true}', '[]', '[]', 580, '2022-03-05 20:49:04', '2022-03-05 20:49:05'),
(581, 'Marvel\\Database\\Models\\Attachment', 583, 'd64cfcfa-24f2-4dca-afa4-7e6d9122e9c0', 'default', 'image22', 'image22.png', 'image/png', 's3', 's3', 48249, '[]', '{\"thumbnail\": true}', '[]', '[]', 581, '2022-03-05 20:49:05', '2022-03-05 20:49:05'),
(582, 'Marvel\\Database\\Models\\Attachment', 584, '6e38d2b5-5551-4eb8-812d-b617fd7f6a1f', 'default', 'image48', 'image48.png', 'image/png', 's3', 's3', 54327, '[]', '{\"thumbnail\": true}', '[]', '[]', 582, '2022-03-05 20:49:05', '2022-03-05 20:49:05'),
(583, 'Marvel\\Database\\Models\\Attachment', 585, '86c6d289-fc4e-46fb-85f1-4adac2718b38', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 583, '2022-03-05 20:49:30', '2022-03-05 20:49:30'),
(584, 'Marvel\\Database\\Models\\Attachment', 586, 'fec43d7e-7a52-4e23-8cf6-9dbfe2fd8778', 'default', 'image19', 'image19.png', 'image/png', 's3', 's3', 30198, '[]', '{\"thumbnail\": true}', '[]', '[]', 584, '2022-03-05 20:50:52', '2022-03-05 20:50:52'),
(585, 'Marvel\\Database\\Models\\Attachment', 587, 'a6989ec7-76f2-4f83-a4dd-e1c62274e5c7', 'default', 'image16', 'image16.png', 'image/png', 's3', 's3', 44414, '[]', '{\"thumbnail\": true}', '[]', '[]', 585, '2022-03-05 20:51:03', '2022-03-05 20:51:03'),
(586, 'Marvel\\Database\\Models\\Attachment', 588, '71bcbfbf-8645-43ce-8dcd-06194aae81ff', 'default', 'image17', 'image17.png', 'image/png', 's3', 's3', 85873, '[]', '{\"thumbnail\": true}', '[]', '[]', 586, '2022-03-05 20:51:03', '2022-03-05 20:51:04'),
(587, 'Marvel\\Database\\Models\\Attachment', 589, 'e7c32296-4c78-4cf7-93e1-f06245887242', 'default', 'image18', 'image18.png', 'image/png', 's3', 's3', 53256, '[]', '{\"thumbnail\": true}', '[]', '[]', 587, '2022-03-05 20:51:04', '2022-03-05 20:51:04'),
(588, 'Marvel\\Database\\Models\\Attachment', 590, '1f75f11e-705f-4059-9c1f-abfa5ab38cf9', 'default', 'image19', 'image19.png', 'image/png', 's3', 's3', 30198, '[]', '{\"thumbnail\": true}', '[]', '[]', 588, '2022-03-05 20:51:04', '2022-03-05 20:51:04'),
(589, 'Marvel\\Database\\Models\\Attachment', 591, '2ac7eba0-6572-447d-9495-97b47617bb44', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 589, '2022-03-05 20:51:27', '2022-03-05 20:51:27'),
(590, 'Marvel\\Database\\Models\\Attachment', 592, 'c66b2f17-b705-4e40-b7ab-5f2be239a072', 'default', 'image24', 'image24.png', 'image/png', 's3', 's3', 27964, '[]', '{\"thumbnail\": true}', '[]', '[]', 590, '2022-03-05 20:51:41', '2022-03-05 20:51:41'),
(591, 'Marvel\\Database\\Models\\Attachment', 593, 'ade1af8b-00ac-4ffc-9dd7-6d9f85bd7a69', 'default', 'image24', 'image24.png', 'image/png', 's3', 's3', 27964, '[]', '{\"thumbnail\": true}', '[]', '[]', 591, '2022-03-05 20:51:51', '2022-03-05 20:51:52'),
(592, 'Marvel\\Database\\Models\\Attachment', 594, 'cc5b87e0-9bf8-4497-875f-6eee5e6e5aa2', 'default', 'image29', 'image29.png', 'image/png', 's3', 's3', 34705, '[]', '{\"thumbnail\": true}', '[]', '[]', 592, '2022-03-05 20:51:52', '2022-03-05 20:51:52'),
(593, 'Marvel\\Database\\Models\\Attachment', 595, '87e05b7a-413b-4c54-8164-c6a4b8421cfc', 'default', 'image39', 'image39.png', 'image/png', 's3', 's3', 77477, '[]', '{\"thumbnail\": true}', '[]', '[]', 593, '2022-03-05 20:51:52', '2022-03-05 20:51:52'),
(594, 'Marvel\\Database\\Models\\Attachment', 596, '0edfe896-fe61-497d-a4ba-914ceef4add8', 'default', 'image46', 'image46.png', 'image/png', 's3', 's3', 43986, '[]', '{\"thumbnail\": true}', '[]', '[]', 594, '2022-03-05 20:51:52', '2022-03-05 20:51:52'),
(595, 'Marvel\\Database\\Models\\Attachment', 597, '97ec6a4c-8a1e-47b1-8f31-5ba88d6cb25a', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 595, '2022-03-05 20:52:26', '2022-03-05 20:52:26'),
(596, 'Marvel\\Database\\Models\\Attachment', 598, 'f1fcf45a-32b7-40d8-b043-87f539404dc7', 'default', 'image10', 'image10.png', 'image/png', 's3', 's3', 79367, '[]', '{\"thumbnail\": true}', '[]', '[]', 596, '2022-03-07 19:43:47', '2022-03-07 19:43:48'),
(597, 'Marvel\\Database\\Models\\Attachment', 599, '9732891d-fdff-4032-a966-c856ffad39f0', 'default', 'image10', 'image10.png', 'image/png', 's3', 's3', 79367, '[]', '{\"thumbnail\": true}', '[]', '[]', 597, '2022-03-07 19:43:57', '2022-03-07 19:43:57'),
(598, 'Marvel\\Database\\Models\\Attachment', 600, 'c36b6edc-b602-44f2-8609-0e89aa25672a', 'default', 'image13', 'image13.png', 'image/png', 's3', 's3', 42830, '[]', '{\"thumbnail\": true}', '[]', '[]', 598, '2022-03-07 19:43:57', '2022-03-07 19:43:58'),
(599, 'Marvel\\Database\\Models\\Attachment', 601, '14e982d2-f14a-40a2-8aa8-1c6dea4d751b', 'default', 'image19', 'image19.png', 'image/png', 's3', 's3', 30198, '[]', '{\"thumbnail\": true}', '[]', '[]', 599, '2022-03-07 19:43:58', '2022-03-07 19:43:58'),
(600, 'Marvel\\Database\\Models\\Attachment', 602, 'c6cd7933-d3eb-4f78-9056-4745d8116321', 'default', 'image21', 'image21.png', 'image/png', 's3', 's3', 31010, '[]', '{\"thumbnail\": true}', '[]', '[]', 600, '2022-03-07 19:43:58', '2022-03-07 19:43:58'),
(601, 'Marvel\\Database\\Models\\Attachment', 603, '01e505e1-5b26-44a1-ac0c-62a8e5a9472a', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 601, '2022-03-07 19:44:05', '2022-03-07 19:44:05'),
(602, 'Marvel\\Database\\Models\\Attachment', 604, '57bc2681-f7fe-490e-9de5-987704491684', 'default', 'image31', 'image31.png', 'image/png', 's3', 's3', 28106, '[]', '{\"thumbnail\": true}', '[]', '[]', 602, '2022-03-07 19:44:23', '2022-03-07 19:44:23'),
(603, 'Marvel\\Database\\Models\\Attachment', 605, '5a130f9a-45ad-4e1f-bf8b-fa0cbdfa762e', 'default', 'image19', 'image19.png', 'image/png', 's3', 's3', 30198, '[]', '{\"thumbnail\": true}', '[]', '[]', 603, '2022-03-07 19:44:28', '2022-03-07 19:44:28'),
(604, 'Marvel\\Database\\Models\\Attachment', 606, '8b78a4f4-739e-42ab-889e-3ae2fffb65de', 'default', 'image21', 'image21.png', 'image/png', 's3', 's3', 31010, '[]', '{\"thumbnail\": true}', '[]', '[]', 604, '2022-03-07 19:44:28', '2022-03-07 19:44:28'),
(605, 'Marvel\\Database\\Models\\Attachment', 607, '51315fe3-5306-4db7-b4f3-7bc5125e45f7', 'default', 'image30', 'image30.png', 'image/png', 's3', 's3', 43235, '[]', '{\"thumbnail\": true}', '[]', '[]', 605, '2022-03-07 19:44:28', '2022-03-07 19:44:28'),
(606, 'Marvel\\Database\\Models\\Attachment', 608, 'bd0490d7-531f-4d72-a64d-a0d2692d51c6', 'default', 'image31', 'image31.png', 'image/png', 's3', 's3', 28106, '[]', '{\"thumbnail\": true}', '[]', '[]', 606, '2022-03-07 19:44:28', '2022-03-07 19:44:28'),
(607, 'Marvel\\Database\\Models\\Attachment', 609, 'c1b5388d-5f72-431e-8a80-af825ba9ec45', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 607, '2022-03-07 19:44:38', '2022-03-07 19:44:38'),
(608, 'Marvel\\Database\\Models\\Attachment', 610, '7d081a3c-ec24-4f43-b9ea-d815fe87e091', 'default', 'image33', 'image33.png', 'image/png', 's3', 's3', 61748, '[]', '{\"thumbnail\": true}', '[]', '[]', 608, '2022-03-07 19:45:22', '2022-03-07 19:45:23'),
(609, 'Marvel\\Database\\Models\\Attachment', 611, 'ace0ed48-4167-4677-9bab-15bff1a2e794', 'default', 'image27', 'image27.png', 'image/png', 's3', 's3', 44687, '[]', '{\"thumbnail\": true}', '[]', '[]', 609, '2022-03-07 19:45:45', '2022-03-07 19:45:46'),
(610, 'Marvel\\Database\\Models\\Attachment', 612, 'c7ad8f60-af35-4a01-b310-7739c78a5c78', 'default', 'image33', 'image33.png', 'image/png', 's3', 's3', 61748, '[]', '{\"thumbnail\": true}', '[]', '[]', 610, '2022-03-07 19:45:46', '2022-03-07 19:45:46'),
(611, 'Marvel\\Database\\Models\\Attachment', 613, '88baf59b-e7d2-4388-b99d-69baf86588bc', 'default', 'image35', 'image35.png', 'image/png', 's3', 's3', 34675, '[]', '{\"thumbnail\": true}', '[]', '[]', 611, '2022-03-07 19:45:46', '2022-03-07 19:45:46'),
(612, 'Marvel\\Database\\Models\\Attachment', 614, '9e6f05b9-f29b-4dd8-ac5b-b73532f4ae92', 'default', 'image36', 'image36.png', 'image/png', 's3', 's3', 38997, '[]', '{\"thumbnail\": true}', '[]', '[]', 612, '2022-03-07 19:45:46', '2022-03-07 19:45:46'),
(613, 'Marvel\\Database\\Models\\Attachment', 615, '28e91d94-c3a4-4508-b89d-0581edbd978c', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 613, '2022-03-07 19:45:55', '2022-03-07 19:45:55'),
(614, 'Marvel\\Database\\Models\\Attachment', 616, '79751830-5cbf-4d4c-87d8-324cbfc6f74e', 'default', 'image12', 'image12.png', 'image/png', 's3', 's3', 32730, '[]', '{\"thumbnail\": true}', '[]', '[]', 614, '2022-03-07 19:47:17', '2022-03-07 19:47:17'),
(615, 'Marvel\\Database\\Models\\Attachment', 617, '20f7a4ed-e4b2-4e19-a6f2-a70a145a1c34', 'default', 'image12', 'image12.png', 'image/png', 's3', 's3', 32730, '[]', '{\"thumbnail\": true}', '[]', '[]', 615, '2022-03-07 19:47:33', '2022-03-07 19:47:34'),
(616, 'Marvel\\Database\\Models\\Attachment', 618, 'f354222e-0c81-433a-a04e-c199bcce9efa', 'default', 'image13', 'image13.png', 'image/png', 's3', 's3', 42830, '[]', '{\"thumbnail\": true}', '[]', '[]', 616, '2022-03-07 19:47:34', '2022-03-07 19:47:34'),
(617, 'Marvel\\Database\\Models\\Attachment', 619, '2fa7716b-25bc-4543-86a3-7290535112bd', 'default', 'image21', 'image21.png', 'image/png', 's3', 's3', 31010, '[]', '{\"thumbnail\": true}', '[]', '[]', 617, '2022-03-07 19:47:34', '2022-03-07 19:47:34'),
(618, 'Marvel\\Database\\Models\\Attachment', 620, 'ddcbf851-2888-41c1-b3af-dbe63ebcc70a', 'default', 'image37', 'image37.png', 'image/png', 's3', 's3', 34520, '[]', '{\"thumbnail\": true}', '[]', '[]', 618, '2022-03-07 19:47:34', '2022-03-07 19:47:34'),
(619, 'Marvel\\Database\\Models\\Attachment', 621, '4fe37663-b468-4b6c-9fc5-e6b74a8c1d1f', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 619, '2022-03-07 19:47:45', '2022-03-07 19:47:45'),
(620, 'Marvel\\Database\\Models\\Attachment', 622, 'd590512f-68fb-4814-a751-11e937c84dea', 'default', 'image32', 'image32.png', 'image/png', 's3', 's3', 52728, '[]', '{\"thumbnail\": true}', '[]', '[]', 620, '2022-03-07 19:47:59', '2022-03-07 19:48:00'),
(621, 'Marvel\\Database\\Models\\Attachment', 623, '57a935b9-b61d-4e41-a70f-a6fc8348ac67', 'default', 'image32', 'image32.png', 'image/png', 's3', 's3', 52728, '[]', '{\"thumbnail\": true}', '[]', '[]', 621, '2022-03-07 19:48:10', '2022-03-07 19:48:10'),
(622, 'Marvel\\Database\\Models\\Attachment', 624, 'f2a3dba7-d828-4ce2-9236-c2a1754d3307', 'default', 'image34', 'image34.png', 'image/png', 's3', 's3', 31450, '[]', '{\"thumbnail\": true}', '[]', '[]', 622, '2022-03-07 19:48:10', '2022-03-07 19:48:10'),
(623, 'Marvel\\Database\\Models\\Attachment', 625, 'ef96251f-acaf-473d-a86a-96fc65f8a251', 'default', 'image35', 'image35.png', 'image/png', 's3', 's3', 34675, '[]', '{\"thumbnail\": true}', '[]', '[]', 623, '2022-03-07 19:48:10', '2022-03-07 19:48:10'),
(624, 'Marvel\\Database\\Models\\Attachment', 626, '878a2b41-8fa1-4d6e-a428-333f08f2fa9b', 'default', 'image42', 'image42.png', 'image/png', 's3', 's3', 35304, '[]', '{\"thumbnail\": true}', '[]', '[]', 624, '2022-03-07 19:48:10', '2022-03-07 19:48:10'),
(625, 'Marvel\\Database\\Models\\Attachment', 627, 'efff9db4-c6c1-4c3a-b7c9-b26814e2a341', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 625, '2022-03-07 19:48:20', '2022-03-07 19:48:20'),
(626, 'Marvel\\Database\\Models\\Attachment', 628, '90d35ab9-2420-4572-86cf-3a61fee19dbe', 'default', 'image13', 'image13.png', 'image/png', 's3', 's3', 42830, '[]', '{\"thumbnail\": true}', '[]', '[]', 626, '2022-03-07 19:48:49', '2022-03-07 19:48:49'),
(627, 'Marvel\\Database\\Models\\Attachment', 629, '86bca07f-f420-4f51-8890-55a7642ad208', 'default', 'image13', 'image13.png', 'image/png', 's3', 's3', 42830, '[]', '{\"thumbnail\": true}', '[]', '[]', 627, '2022-03-07 19:49:09', '2022-03-07 19:49:10'),
(628, 'Marvel\\Database\\Models\\Attachment', 630, '7c195645-f640-4ea2-9fcc-f1957ae4f7c9', 'default', 'image19', 'image19.png', 'image/png', 's3', 's3', 30198, '[]', '{\"thumbnail\": true}', '[]', '[]', 628, '2022-03-07 19:49:10', '2022-03-07 19:49:10'),
(629, 'Marvel\\Database\\Models\\Attachment', 631, 'b7095980-4c30-4d59-8d8b-396991773d5b', 'default', 'image21', 'image21.png', 'image/png', 's3', 's3', 31010, '[]', '{\"thumbnail\": true}', '[]', '[]', 629, '2022-03-07 19:49:10', '2022-03-07 19:49:10'),
(630, 'Marvel\\Database\\Models\\Attachment', 632, '85a56a8d-e57e-4377-ba08-799f7bcc2886', 'default', 'image27', 'image27.png', 'image/png', 's3', 's3', 44687, '[]', '{\"thumbnail\": true}', '[]', '[]', 630, '2022-03-07 19:49:10', '2022-03-07 19:49:10'),
(631, 'Marvel\\Database\\Models\\Attachment', 633, '38145d73-664c-454b-826f-297a1aa99dad', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 631, '2022-03-07 19:49:22', '2022-03-07 19:49:22'),
(632, 'Marvel\\Database\\Models\\Attachment', 634, 'b23f87c8-ce0e-42bb-9fae-48fd5f02efff', 'default', 'image35', 'image35.png', 'image/png', 's3', 's3', 34675, '[]', '{\"thumbnail\": true}', '[]', '[]', 632, '2022-03-07 20:01:35', '2022-03-07 20:01:35'),
(633, 'Marvel\\Database\\Models\\Attachment', 635, '50581d9c-e734-4669-9933-b8343ce5a947', 'default', 'image17', 'image17.png', 'image/png', 's3', 's3', 85873, '[]', '{\"thumbnail\": true}', '[]', '[]', 633, '2022-03-07 20:01:53', '2022-03-07 20:01:53'),
(634, 'Marvel\\Database\\Models\\Attachment', 636, '1c42f0c1-cd90-41cf-9d14-6d0c7bd7316d', 'default', 'image25', 'image25.png', 'image/png', 's3', 's3', 27499, '[]', '{\"thumbnail\": true}', '[]', '[]', 634, '2022-03-07 20:01:53', '2022-03-07 20:01:53'),
(635, 'Marvel\\Database\\Models\\Attachment', 637, 'b0119b76-6637-497b-bd22-77aa466595db', 'default', 'image34', 'image34.png', 'image/png', 's3', 's3', 31450, '[]', '{\"thumbnail\": true}', '[]', '[]', 635, '2022-03-07 20:01:53', '2022-03-07 20:01:54'),
(636, 'Marvel\\Database\\Models\\Attachment', 638, 'fa208f82-0562-49bf-8d7c-c58e4a11e715', 'default', 'image35', 'image35.png', 'image/png', 's3', 's3', 34675, '[]', '{\"thumbnail\": true}', '[]', '[]', 636, '2022-03-07 20:01:54', '2022-03-07 20:01:54'),
(637, 'Marvel\\Database\\Models\\Attachment', 639, 'bf2bb056-1299-4063-94b7-ed18092285ff', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 637, '2022-03-07 20:02:01', '2022-03-07 20:02:01'),
(638, 'Marvel\\Database\\Models\\Attachment', 640, '1758e23b-fab2-4b62-9326-9ecab7d2414d', 'default', 'image14', 'image14.png', 'image/png', 's3', 's3', 28593, '[]', '{\"thumbnail\": true}', '[]', '[]', 638, '2022-03-07 20:12:09', '2022-03-07 20:12:10'),
(639, 'Marvel\\Database\\Models\\Attachment', 641, '433c1160-57ea-4c85-9da4-9703b64ff1b2', 'default', 'image09', 'image09.png', 'image/png', 's3', 's3', 64270, '[]', '{\"thumbnail\": true}', '[]', '[]', 639, '2022-03-07 20:12:21', '2022-03-07 20:12:21'),
(640, 'Marvel\\Database\\Models\\Attachment', 642, '9f851726-b264-4758-9027-da7db6958aa1', 'default', 'image14', 'image14.png', 'image/png', 's3', 's3', 28593, '[]', '{\"thumbnail\": true}', '[]', '[]', 640, '2022-03-07 20:12:21', '2022-03-07 20:12:21'),
(641, 'Marvel\\Database\\Models\\Attachment', 643, '9b43f337-d41d-43a0-bca6-3a3c9fb7338b', 'default', 'image16', 'image16.png', 'image/png', 's3', 's3', 44414, '[]', '{\"thumbnail\": true}', '[]', '[]', 641, '2022-03-07 20:12:21', '2022-03-07 20:12:22'),
(642, 'Marvel\\Database\\Models\\Attachment', 644, 'a14f3245-099e-4fe7-ae60-7408c61f8926', 'default', 'image30', 'image30.png', 'image/png', 's3', 's3', 43235, '[]', '{\"thumbnail\": true}', '[]', '[]', 642, '2022-03-07 20:12:22', '2022-03-07 20:12:22'),
(643, 'Marvel\\Database\\Models\\Attachment', 645, '959238c9-1114-48b5-abf4-4a31510e8cb1', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 643, '2022-03-07 20:12:36', '2022-03-07 20:12:36'),
(644, 'Marvel\\Database\\Models\\Attachment', 646, '4b607547-1cce-476c-91f2-9798980ad00d', 'default', 'image36', 'image36.png', 'image/png', 's3', 's3', 38997, '[]', '{\"thumbnail\": true}', '[]', '[]', 644, '2022-03-07 20:13:34', '2022-03-07 20:13:34'),
(645, 'Marvel\\Database\\Models\\Attachment', 647, '49efe2cb-e2c4-429c-9c59-67214906d943', 'default', 'image32', 'image32.png', 'image/png', 's3', 's3', 52728, '[]', '{\"thumbnail\": true}', '[]', '[]', 645, '2022-03-07 20:13:44', '2022-03-07 20:13:44'),
(646, 'Marvel\\Database\\Models\\Attachment', 648, '272af011-25aa-4d7a-9828-dfc7057e5bc0', 'default', 'image36', 'image36.png', 'image/png', 's3', 's3', 38997, '[]', '{\"thumbnail\": true}', '[]', '[]', 646, '2022-03-07 20:13:44', '2022-03-07 20:13:44'),
(647, 'Marvel\\Database\\Models\\Attachment', 649, 'ce1fa7e9-d345-4788-9dea-506bdfad2d99', 'default', 'image37', 'image37.png', 'image/png', 's3', 's3', 34520, '[]', '{\"thumbnail\": true}', '[]', '[]', 647, '2022-03-07 20:13:45', '2022-03-07 20:13:45'),
(648, 'Marvel\\Database\\Models\\Attachment', 650, 'fe94ff61-c773-4e9d-a8ce-ab7bc0aff176', 'default', 'image42-2', 'image42-2.png', 'image/png', 's3', 's3', 35304, '[]', '{\"thumbnail\": true}', '[]', '[]', 648, '2022-03-07 20:13:45', '2022-03-07 20:13:45'),
(649, 'Marvel\\Database\\Models\\Attachment', 651, 'be4058c7-241e-416d-85a2-ed4b5ff0059f', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 649, '2022-03-07 20:13:59', '2022-03-07 20:13:59'),
(650, 'Marvel\\Database\\Models\\Attachment', 652, 'd25cdc33-5bd0-47bb-b78f-98ac5ecab950', 'default', 'image15', 'image15.png', 'image/png', 's3', 's3', 56180, '[]', '{\"thumbnail\": true}', '[]', '[]', 650, '2022-03-07 20:14:12', '2022-03-07 20:14:12'),
(651, 'Marvel\\Database\\Models\\Attachment', 653, 'eabf66c2-78f4-4bb3-8687-ff27fa5a1815', 'default', 'image09', 'image09.png', 'image/png', 's3', 's3', 64270, '[]', '{\"thumbnail\": true}', '[]', '[]', 651, '2022-03-07 20:14:25', '2022-03-07 20:14:25'),
(652, 'Marvel\\Database\\Models\\Attachment', 654, '75181334-92b9-4e02-a4c9-d18f3a2e2d57', 'default', 'image13', 'image13.png', 'image/png', 's3', 's3', 42830, '[]', '{\"thumbnail\": true}', '[]', '[]', 652, '2022-03-07 20:14:25', '2022-03-07 20:14:25'),
(653, 'Marvel\\Database\\Models\\Attachment', 655, '14d021e0-33d1-403f-8e25-79b3d618dc35', 'default', 'image15', 'image15.png', 'image/png', 's3', 's3', 56180, '[]', '{\"thumbnail\": true}', '[]', '[]', 653, '2022-03-07 20:14:25', '2022-03-07 20:14:25'),
(654, 'Marvel\\Database\\Models\\Attachment', 656, 'adf323fc-7d70-4929-98c9-2906965e5561', 'default', 'image17', 'image17.png', 'image/png', 's3', 's3', 85873, '[]', '{\"thumbnail\": true}', '[]', '[]', 654, '2022-03-07 20:14:25', '2022-03-07 20:14:25'),
(655, 'Marvel\\Database\\Models\\Attachment', 657, '782a9edd-1dd7-406b-afb0-ac54bc455f56', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 655, '2022-03-07 20:14:33', '2022-03-07 20:14:33'),
(656, 'Marvel\\Database\\Models\\Attachment', 658, 'c5b363ee-678e-4277-a0e9-034e2c9de1bf', 'default', 'image37', 'image37.png', 'image/png', 's3', 's3', 34520, '[]', '{\"thumbnail\": true}', '[]', '[]', 656, '2022-03-07 20:14:45', '2022-03-07 20:14:45'),
(657, 'Marvel\\Database\\Models\\Attachment', 659, '3e71c2f8-1514-44d5-80c4-411bbe9bd391', 'default', 'image37', 'image37.png', 'image/png', 's3', 's3', 34520, '[]', '{\"thumbnail\": true}', '[]', '[]', 657, '2022-03-07 20:14:51', '2022-03-07 20:14:52'),
(658, 'Marvel\\Database\\Models\\Attachment', 660, 'fad563b7-ce51-412d-b1b5-5e893449f771', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 658, '2022-03-07 20:15:01', '2022-03-07 20:15:01'),
(659, 'Marvel\\Database\\Models\\Attachment', 661, 'a95f2b4e-8cee-470e-9224-97c05fcf4e77', 'default', 'image22', 'image22.png', 'image/png', 's3', 's3', 48249, '[]', '{\"thumbnail\": true}', '[]', '[]', 659, '2022-03-07 20:17:10', '2022-03-07 20:17:11'),
(660, 'Marvel\\Database\\Models\\Attachment', 662, '0db4f582-6193-49a0-a940-2eb2c89e7c04', 'default', 'image06', 'image06.png', 'image/png', 's3', 's3', 86713, '[]', '{\"thumbnail\": true}', '[]', '[]', 660, '2022-03-07 20:17:24', '2022-03-07 20:17:25'),
(661, 'Marvel\\Database\\Models\\Attachment', 663, 'd4f8b083-79e1-451a-a135-f81b86aa8456', 'default', 'image18', 'image18.png', 'image/png', 's3', 's3', 53256, '[]', '{\"thumbnail\": true}', '[]', '[]', 661, '2022-03-07 20:17:25', '2022-03-07 20:17:25'),
(662, 'Marvel\\Database\\Models\\Attachment', 664, '5964af45-46e3-4d10-b73b-5942718c137b', 'default', 'image22', 'image22.png', 'image/png', 's3', 's3', 48249, '[]', '{\"thumbnail\": true}', '[]', '[]', 662, '2022-03-07 20:17:25', '2022-03-07 20:17:25'),
(663, 'Marvel\\Database\\Models\\Attachment', 665, '51c0b693-8f3e-4355-a994-1215069917dc', 'default', 'image27', 'image27.png', 'image/png', 's3', 's3', 44687, '[]', '{\"thumbnail\": true}', '[]', '[]', 663, '2022-03-07 20:17:25', '2022-03-07 20:17:25'),
(664, 'Marvel\\Database\\Models\\Attachment', 666, '2208cc5a-39b0-48a1-895f-8a9fd8f5bddd', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 664, '2022-03-07 20:17:33', '2022-03-07 20:17:33'),
(665, 'Marvel\\Database\\Models\\Attachment', 667, 'df986b51-9b80-4044-a87a-9e0953994d1d', 'default', 'image27', 'image27.png', 'image/png', 's3', 's3', 44687, '[]', '{\"thumbnail\": true}', '[]', '[]', 665, '2022-03-07 20:18:16', '2022-03-07 20:18:16'),
(666, 'Marvel\\Database\\Models\\Attachment', 668, '6db08eef-7039-4791-98e7-34f4796d879a', 'default', 'image14', 'image14.png', 'image/png', 's3', 's3', 28593, '[]', '{\"thumbnail\": true}', '[]', '[]', 666, '2022-03-07 20:18:26', '2022-03-07 20:18:26'),
(667, 'Marvel\\Database\\Models\\Attachment', 669, '7f0a8875-8e82-4000-8219-eacba318804e', 'default', 'image17', 'image17.png', 'image/png', 's3', 's3', 85873, '[]', '{\"thumbnail\": true}', '[]', '[]', 667, '2022-03-07 20:18:26', '2022-03-07 20:18:26'),
(668, 'Marvel\\Database\\Models\\Attachment', 670, '3c3dd1e2-3981-4cc2-8a43-a9f8fa59308b', 'default', 'image21', 'image21.png', 'image/png', 's3', 's3', 31010, '[]', '{\"thumbnail\": true}', '[]', '[]', 668, '2022-03-07 20:18:26', '2022-03-07 20:18:26'),
(669, 'Marvel\\Database\\Models\\Attachment', 671, 'e24cf05a-739f-4ea9-a570-671bba897dc0', 'default', 'image27', 'image27.png', 'image/png', 's3', 's3', 44687, '[]', '{\"thumbnail\": true}', '[]', '[]', 669, '2022-03-07 20:18:26', '2022-03-07 20:18:26'),
(670, 'Marvel\\Database\\Models\\Attachment', 672, '7e32dc26-2819-4b8d-84de-b49ed4a40d97', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 670, '2022-03-07 20:18:37', '2022-03-07 20:18:37'),
(671, 'Marvel\\Database\\Models\\Attachment', 673, '262f63b1-47d3-4ce5-a307-ef7fe9ed2c17', 'default', 'image44', 'image44.png', 'image/png', 's3', 's3', 62265, '[]', '{\"thumbnail\": true}', '[]', '[]', 671, '2022-03-07 20:21:06', '2022-03-07 20:21:06'),
(672, 'Marvel\\Database\\Models\\Attachment', 674, '9a6bc8ff-1810-4125-97a4-339d127d36d1', 'default', 'image05', 'image05.png', 'image/png', 's3', 's3', 94668, '[]', '{\"thumbnail\": true}', '[]', '[]', 672, '2022-03-07 20:21:23', '2022-03-07 20:21:23'),
(673, 'Marvel\\Database\\Models\\Attachment', 675, 'c36b84fb-e619-4277-9e66-9eaa3e3c34b4', 'default', 'image07', 'image07.png', 'image/png', 's3', 's3', 40262, '[]', '{\"thumbnail\": true}', '[]', '[]', 673, '2022-03-07 20:21:23', '2022-03-07 20:21:23'),
(674, 'Marvel\\Database\\Models\\Attachment', 676, '2e0e32a6-e7a2-45ad-bac5-73b195f900f1', 'default', 'image42-2', 'image42-2.png', 'image/png', 's3', 's3', 35304, '[]', '{\"thumbnail\": true}', '[]', '[]', 674, '2022-03-07 20:21:23', '2022-03-07 20:21:23'),
(675, 'Marvel\\Database\\Models\\Attachment', 677, 'a87131d2-afc6-49ed-8c72-482ac04c7c40', 'default', 'image44', 'image44.png', 'image/png', 's3', 's3', 62265, '[]', '{\"thumbnail\": true}', '[]', '[]', 675, '2022-03-07 20:21:23', '2022-03-07 20:21:24'),
(676, 'Marvel\\Database\\Models\\Attachment', 678, '39c84288-0bfa-4bc5-95ae-7cc7260ebf47', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 676, '2022-03-07 20:21:46', '2022-03-07 20:21:46'),
(677, 'Marvel\\Database\\Models\\Attachment', 679, '4ccaeef1-268a-47e5-a50f-9f592fd7e96f', 'default', 'image21', 'image21.png', 'image/png', 's3', 's3', 31010, '[]', '{\"thumbnail\": true}', '[]', '[]', 677, '2022-03-07 20:22:03', '2022-03-07 20:22:03'),
(678, 'Marvel\\Database\\Models\\Attachment', 680, 'da63ddd9-a22c-4ba3-80f2-8b653d6110f9', 'default', 'image21', 'image21.png', 'image/png', 's3', 's3', 31010, '[]', '{\"thumbnail\": true}', '[]', '[]', 678, '2022-03-07 20:22:11', '2022-03-07 20:22:11'),
(679, 'Marvel\\Database\\Models\\Attachment', 681, '530ec7a4-627f-4f6a-9e08-3e4f98e3739f', 'default', 'image27', 'image27.png', 'image/png', 's3', 's3', 44687, '[]', '{\"thumbnail\": true}', '[]', '[]', 679, '2022-03-07 20:22:11', '2022-03-07 20:22:12'),
(680, 'Marvel\\Database\\Models\\Attachment', 682, '77e09a17-e524-4f20-b3a6-181415aaefe8', 'default', 'image35', 'image35.png', 'image/png', 's3', 's3', 34675, '[]', '{\"thumbnail\": true}', '[]', '[]', 680, '2022-03-07 20:22:12', '2022-03-07 20:22:12'),
(681, 'Marvel\\Database\\Models\\Attachment', 683, '7f8f6b09-d4eb-4695-b90b-d063df03eb09', 'default', 'image42-2', 'image42-2.png', 'image/png', 's3', 's3', 35304, '[]', '{\"thumbnail\": true}', '[]', '[]', 681, '2022-03-07 20:22:12', '2022-03-07 20:22:12'),
(682, 'Marvel\\Database\\Models\\Attachment', 684, 'a7ed4195-334e-45e7-a757-4222b511b486', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 682, '2022-03-07 20:22:22', '2022-03-07 20:22:22'),
(683, 'Marvel\\Database\\Models\\Attachment', 685, '112b5a07-6572-4d19-9911-5ba9f2071edc', 'default', 'image28', 'image28.png', 'image/png', 's3', 's3', 33758, '[]', '{\"thumbnail\": true}', '[]', '[]', 683, '2022-03-07 20:22:37', '2022-03-07 20:22:37'),
(684, 'Marvel\\Database\\Models\\Attachment', 686, 'e723d7b1-1632-47be-9a6d-80876a79ccba', 'default', 'image08', 'image08.png', 'image/png', 's3', 's3', 41284, '[]', '{\"thumbnail\": true}', '[]', '[]', 684, '2022-03-07 20:22:45', '2022-03-07 20:22:45'),
(685, 'Marvel\\Database\\Models\\Attachment', 687, '6ecc793d-df88-41a8-b0c1-e44e9058d846', 'default', 'image11', 'image11.png', 'image/png', 's3', 's3', 32058, '[]', '{\"thumbnail\": true}', '[]', '[]', 685, '2022-03-07 20:22:45', '2022-03-07 20:22:46'),
(686, 'Marvel\\Database\\Models\\Attachment', 688, 'f33d1e2e-8061-4714-9001-15d0f39ff3a4', 'default', 'image26', 'image26.png', 'image/png', 's3', 's3', 24741, '[]', '{\"thumbnail\": true}', '[]', '[]', 686, '2022-03-07 20:22:46', '2022-03-07 20:22:46'),
(687, 'Marvel\\Database\\Models\\Attachment', 689, '79ff5646-f47d-4cba-8a64-2f4d1b301a52', 'default', 'image28', 'image28.png', 'image/png', 's3', 's3', 33758, '[]', '{\"thumbnail\": true}', '[]', '[]', 687, '2022-03-07 20:22:46', '2022-03-07 20:22:46'),
(688, 'Marvel\\Database\\Models\\Attachment', 690, '07029c9c-b5ac-4f67-bf45-376cf7189f92', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 688, '2022-03-07 20:22:54', '2022-03-07 20:22:54'),
(689, 'Marvel\\Database\\Models\\Attachment', 691, 'b9b19efd-0b6e-44f6-90be-8514c1098110', 'default', 'image45', 'image45.png', 'image/png', 's3', 's3', 25087, '[]', '{\"thumbnail\": true}', '[]', '[]', 689, '2022-03-07 20:23:11', '2022-03-07 20:23:11'),
(690, 'Marvel\\Database\\Models\\Attachment', 692, '96e9514b-7f84-4527-b083-89da7e4c3dbf', 'default', 'image28', 'image28.png', 'image/png', 's3', 's3', 33758, '[]', '{\"thumbnail\": true}', '[]', '[]', 690, '2022-03-07 20:23:22', '2022-03-07 20:23:22'),
(691, 'Marvel\\Database\\Models\\Attachment', 693, '6fdf0681-ca6e-4c66-84ff-34b38f01a338', 'default', 'image41', 'image41.png', 'image/png', 's3', 's3', 55788, '[]', '{\"thumbnail\": true}', '[]', '[]', 691, '2022-03-07 20:23:22', '2022-03-07 20:23:22'),
(692, 'Marvel\\Database\\Models\\Attachment', 694, '3416aa8d-26fa-4947-8163-0c5adb272a71', 'default', 'image45', 'image45.png', 'image/png', 's3', 's3', 25087, '[]', '{\"thumbnail\": true}', '[]', '[]', 692, '2022-03-07 20:23:22', '2022-03-07 20:23:22'),
(693, 'Marvel\\Database\\Models\\Attachment', 695, 'eb07350b-3793-49c2-868e-79f62ea7da65', 'default', 'image52', 'image52.png', 'image/png', 's3', 's3', 67036, '[]', '{\"thumbnail\": true}', '[]', '[]', 693, '2022-03-07 20:23:22', '2022-03-07 20:23:22'),
(694, 'Marvel\\Database\\Models\\Attachment', 696, '297ca1a8-0125-4569-96da-1059a0abd3b9', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 694, '2022-03-07 20:23:32', '2022-03-07 20:23:32'),
(695, 'Marvel\\Database\\Models\\Attachment', 697, '4add1fd1-6003-4b0d-ad6e-8d1b66af5410', 'default', 'image42-2', 'image42-2.png', 'image/png', 's3', 's3', 35304, '[]', '{\"thumbnail\": true}', '[]', '[]', 695, '2022-03-07 20:23:48', '2022-03-07 20:23:48'),
(696, 'Marvel\\Database\\Models\\Attachment', 698, '76bdd54b-7b64-4071-8ca4-5a04d59dad26', 'default', 'image35', 'image35.png', 'image/png', 's3', 's3', 34675, '[]', '{\"thumbnail\": true}', '[]', '[]', 696, '2022-03-07 20:23:56', '2022-03-07 20:23:57'),
(697, 'Marvel\\Database\\Models\\Attachment', 699, '8b2f8547-4e61-42e5-95e9-da850faa4898', 'default', 'image36', 'image36.png', 'image/png', 's3', 's3', 38997, '[]', '{\"thumbnail\": true}', '[]', '[]', 697, '2022-03-07 20:23:57', '2022-03-07 20:23:57'),
(698, 'Marvel\\Database\\Models\\Attachment', 700, 'a7b46f54-dfb3-4f92-b2cd-a2a93019e525', 'default', 'image37', 'image37.png', 'image/png', 's3', 's3', 34520, '[]', '{\"thumbnail\": true}', '[]', '[]', 698, '2022-03-07 20:23:57', '2022-03-07 20:23:57'),
(699, 'Marvel\\Database\\Models\\Attachment', 701, 'b29b7253-4cc8-42b2-8619-445dbbbe9ded', 'default', 'image42-2', 'image42-2.png', 'image/png', 's3', 's3', 35304, '[]', '{\"thumbnail\": true}', '[]', '[]', 699, '2022-03-07 20:23:57', '2022-03-07 20:23:57'),
(700, 'Marvel\\Database\\Models\\Attachment', 702, '61792e9d-8d7f-42c0-98ae-2776210be8a4', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 700, '2022-03-07 20:24:04', '2022-03-07 20:24:04'),
(701, 'Marvel\\Database\\Models\\Attachment', 703, 'e57a3092-344b-4741-b7e3-05189b59d73b', 'default', 'image19', 'image19.png', 'image/png', 's3', 's3', 30198, '[]', '{\"thumbnail\": true}', '[]', '[]', 701, '2022-03-07 20:24:48', '2022-03-07 20:24:49'),
(702, 'Marvel\\Database\\Models\\Attachment', 704, '2b61986a-8c75-4f9a-8eea-2dda0c27dc67', 'default', 'image13', 'image13.png', 'image/png', 's3', 's3', 42830, '[]', '{\"thumbnail\": true}', '[]', '[]', 702, '2022-03-07 20:24:59', '2022-03-07 20:24:59'),
(703, 'Marvel\\Database\\Models\\Attachment', 705, '0c5a388e-d47e-4d0d-97ef-6a5b8b2525a9', 'default', 'image19', 'image19.png', 'image/png', 's3', 's3', 30198, '[]', '{\"thumbnail\": true}', '[]', '[]', 703, '2022-03-07 20:24:59', '2022-03-07 20:25:00'),
(704, 'Marvel\\Database\\Models\\Attachment', 706, 'c7a22acc-28b7-44cb-8f92-75fab46ebf36', 'default', 'image27', 'image27.png', 'image/png', 's3', 's3', 44687, '[]', '{\"thumbnail\": true}', '[]', '[]', 704, '2022-03-07 20:25:00', '2022-03-07 20:25:00'),
(705, 'Marvel\\Database\\Models\\Attachment', 707, 'e83b8398-b36d-4972-a9b7-37447434d497', 'default', 'image31', 'image31.png', 'image/png', 's3', 's3', 28106, '[]', '{\"thumbnail\": true}', '[]', '[]', 705, '2022-03-07 20:25:00', '2022-03-07 20:25:00'),
(706, 'Marvel\\Database\\Models\\Attachment', 708, 'a4bc7a0d-6009-470a-bb85-4108119e1788', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 706, '2022-03-07 20:25:12', '2022-03-07 20:25:12'),
(707, 'Marvel\\Database\\Models\\Attachment', 709, 'd117fd74-c3a7-456a-9bb1-889b7e45fb5e', 'default', 'image43', 'image43.png', 'image/png', 's3', 's3', 28282, '[]', '{\"thumbnail\": true}', '[]', '[]', 707, '2022-03-07 20:25:27', '2022-03-07 20:25:27'),
(708, 'Marvel\\Database\\Models\\Attachment', 710, '00ee980f-dba4-4ec3-96e2-4953a36e8f79', 'default', 'image27', 'image27.png', 'image/png', 's3', 's3', 44687, '[]', '{\"thumbnail\": true}', '[]', '[]', 708, '2022-03-07 20:25:36', '2022-03-07 20:25:36'),
(709, 'Marvel\\Database\\Models\\Attachment', 711, 'bc382910-0865-4c94-ac30-dbc8c78a3fcc', 'default', 'image36', 'image36.png', 'image/png', 's3', 's3', 38997, '[]', '{\"thumbnail\": true}', '[]', '[]', 709, '2022-03-07 20:25:36', '2022-03-07 20:25:36'),
(710, 'Marvel\\Database\\Models\\Attachment', 712, 'b4edc2dd-1e4c-49ab-94e6-07aec50cdce1', 'default', 'image39', 'image39.png', 'image/png', 's3', 's3', 77477, '[]', '{\"thumbnail\": true}', '[]', '[]', 710, '2022-03-07 20:25:36', '2022-03-07 20:25:37'),
(711, 'Marvel\\Database\\Models\\Attachment', 713, 'd34166ec-349d-47e1-96b2-e5c0e2b42648', 'default', 'image43', 'image43.png', 'image/png', 's3', 's3', 28282, '[]', '{\"thumbnail\": true}', '[]', '[]', 711, '2022-03-07 20:25:37', '2022-03-07 20:25:37'),
(712, 'Marvel\\Database\\Models\\Attachment', 714, '8d35f76a-78e3-4238-8ef6-fa0cf250d61a', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 712, '2022-03-07 20:25:52', '2022-03-07 20:25:52'),
(713, 'Marvel\\Database\\Models\\Attachment', 715, 'c9d959c7-34af-4307-8987-b7112796219e', 'default', 'image46', 'image46.png', 'image/png', 's3', 's3', 43986, '[]', '{\"thumbnail\": true}', '[]', '[]', 713, '2022-03-07 20:26:10', '2022-03-07 20:26:10'),
(714, 'Marvel\\Database\\Models\\Attachment', 716, 'dc311f30-d584-4382-bfbd-edc13c980282', 'default', 'image25', 'image25.png', 'image/png', 's3', 's3', 27499, '[]', '{\"thumbnail\": true}', '[]', '[]', 714, '2022-03-07 20:26:21', '2022-03-07 20:26:21'),
(715, 'Marvel\\Database\\Models\\Attachment', 717, '6fe96c89-d0ad-48ba-8de0-98ce5976e4d9', 'default', 'image33', 'image33.png', 'image/png', 's3', 's3', 61748, '[]', '{\"thumbnail\": true}', '[]', '[]', 715, '2022-03-07 20:26:21', '2022-03-07 20:26:22'),
(716, 'Marvel\\Database\\Models\\Attachment', 718, 'b81e02c9-9a83-4eeb-851f-b15638091472', 'default', 'image46', 'image46.png', 'image/png', 's3', 's3', 43986, '[]', '{\"thumbnail\": true}', '[]', '[]', 716, '2022-03-07 20:26:22', '2022-03-07 20:26:22'),
(717, 'Marvel\\Database\\Models\\Attachment', 719, '859ef6f5-1503-431a-a4a8-8e6b00331e4a', 'default', 'image50', 'image50.png', 'image/png', 's3', 's3', 60182, '[]', '{\"thumbnail\": true}', '[]', '[]', 717, '2022-03-07 20:26:22', '2022-03-07 20:26:22'),
(718, 'Marvel\\Database\\Models\\Attachment', 720, 'a312096e-b2f3-49e1-9b16-4445a1b63f65', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 718, '2022-03-07 20:26:32', '2022-03-07 20:26:32'),
(719, 'Marvel\\Database\\Models\\Attachment', 721, '3d04f078-9b65-40a9-936a-a6e462b6e955', 'default', 'image20', 'image20.png', 'image/png', 's3', 's3', 34100, '[]', '{\"thumbnail\": true}', '[]', '[]', 719, '2022-03-07 20:27:20', '2022-03-07 20:27:20'),
(720, 'Marvel\\Database\\Models\\Attachment', 722, '24aaf2dd-a7b9-421b-9180-4b0bbf5a036f', 'default', 'image20', 'image20.png', 'image/png', 's3', 's3', 34100, '[]', '{\"thumbnail\": true}', '[]', '[]', 720, '2022-03-07 20:27:32', '2022-03-07 20:27:32'),
(721, 'Marvel\\Database\\Models\\Attachment', 723, 'c740ab08-fe71-46bd-8afe-ee81e432d553', 'default', 'image26', 'image26.png', 'image/png', 's3', 's3', 24741, '[]', '{\"thumbnail\": true}', '[]', '[]', 721, '2022-03-07 20:27:32', '2022-03-07 20:27:33'),
(722, 'Marvel\\Database\\Models\\Attachment', 724, 'fda9fa0e-fcd5-4ab1-9140-8ddd54765a6d', 'default', 'image30', 'image30.png', 'image/png', 's3', 's3', 43235, '[]', '{\"thumbnail\": true}', '[]', '[]', 722, '2022-03-07 20:27:33', '2022-03-07 20:27:33'),
(723, 'Marvel\\Database\\Models\\Attachment', 725, '2955c5c9-85bc-4224-8725-346714476eb3', 'default', 'image33', 'image33.png', 'image/png', 's3', 's3', 61748, '[]', '{\"thumbnail\": true}', '[]', '[]', 723, '2022-03-07 20:27:33', '2022-03-07 20:27:33'),
(724, 'Marvel\\Database\\Models\\Attachment', 726, 'a9467a26-4625-405b-967c-ebc7790ce7de', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 724, '2022-03-07 20:27:48', '2022-03-07 20:27:48'),
(725, 'Marvel\\Database\\Models\\Attachment', 727, '62a52f77-4861-4afe-bc11-adb7cbdbecde', 'default', 'image41', 'image41.png', 'image/png', 's3', 's3', 55788, '[]', '{\"thumbnail\": true}', '[]', '[]', 725, '2022-03-07 20:28:04', '2022-03-07 20:28:04'),
(726, 'Marvel\\Database\\Models\\Attachment', 728, 'ca7cd8c1-7386-4086-acfa-7b266fe58a57', 'default', 'image28', 'image28.png', 'image/png', 's3', 's3', 33758, '[]', '{\"thumbnail\": true}', '[]', '[]', 726, '2022-03-07 20:28:22', '2022-03-07 20:28:23'),
(727, 'Marvel\\Database\\Models\\Attachment', 729, '601c824f-9c69-4983-b355-7350a320fb40', 'default', 'image29', 'image29.png', 'image/png', 's3', 's3', 34705, '[]', '{\"thumbnail\": true}', '[]', '[]', 727, '2022-03-07 20:28:23', '2022-03-07 20:28:23'),
(728, 'Marvel\\Database\\Models\\Attachment', 730, 'f3e9e5e8-de65-454f-baa7-2d55e82b2b74', 'default', 'image35', 'image35.png', 'image/png', 's3', 's3', 34675, '[]', '{\"thumbnail\": true}', '[]', '[]', 728, '2022-03-07 20:28:23', '2022-03-07 20:28:23'),
(729, 'Marvel\\Database\\Models\\Attachment', 731, '9b101e60-ae7b-47ef-8df7-70748813433f', 'default', 'image41', 'image41.png', 'image/png', 's3', 's3', 55788, '[]', '{\"thumbnail\": true}', '[]', '[]', 729, '2022-03-07 20:28:23', '2022-03-07 20:28:23'),
(730, 'Marvel\\Database\\Models\\Attachment', 732, '881ecd2c-1b20-42b4-8e5b-20800718fa41', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 730, '2022-03-07 20:28:36', '2022-03-07 20:28:36'),
(731, 'Marvel\\Database\\Models\\Attachment', 733, '56a7e4b1-ed99-4102-9ba9-a4a3ab074fb6', 'default', 'image10', 'image10.png', 'image/png', 's3', 's3', 79367, '[]', '{\"thumbnail\": true}', '[]', '[]', 731, '2022-03-07 20:28:51', '2022-03-07 20:28:52'),
(732, 'Marvel\\Database\\Models\\Attachment', 734, 'b27d2e55-a38e-4a70-9ce9-451d20a789a2', 'default', 'image10', 'image10.png', 'image/png', 's3', 's3', 79367, '[]', '{\"thumbnail\": true}', '[]', '[]', 732, '2022-03-07 20:28:59', '2022-03-07 20:29:00'),
(733, 'Marvel\\Database\\Models\\Attachment', 735, '56d75230-3451-45ff-8809-eac4a06205a5', 'default', 'image19', 'image19.png', 'image/png', 's3', 's3', 30198, '[]', '{\"thumbnail\": true}', '[]', '[]', 733, '2022-03-07 20:29:00', '2022-03-07 20:29:00'),
(734, 'Marvel\\Database\\Models\\Attachment', 736, '33c30391-f9e3-4d59-8880-2f669dd88827', 'default', 'image27', 'image27.png', 'image/png', 's3', 's3', 44687, '[]', '{\"thumbnail\": true}', '[]', '[]', 734, '2022-03-07 20:29:00', '2022-03-07 20:29:00'),
(735, 'Marvel\\Database\\Models\\Attachment', 737, 'f8b318de-d2c7-4737-98e8-ab5fe375c115', 'default', 'image36', 'image36.png', 'image/png', 's3', 's3', 38997, '[]', '{\"thumbnail\": true}', '[]', '[]', 735, '2022-03-07 20:29:00', '2022-03-07 20:29:00'),
(736, 'Marvel\\Database\\Models\\Attachment', 738, '0f6f2c15-e359-4a72-a73a-8439c150dbdd', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 736, '2022-03-07 20:29:09', '2022-03-07 20:29:09'),
(737, 'Marvel\\Database\\Models\\Attachment', 739, 'ab1a259b-2c51-4723-a5be-b81d70ce6e9c', 'default', 'image18', 'image18.png', 'image/png', 's3', 's3', 53256, '[]', '{\"thumbnail\": true}', '[]', '[]', 737, '2022-03-07 20:29:25', '2022-03-07 20:29:25'),
(738, 'Marvel\\Database\\Models\\Attachment', 740, '07ac803b-3861-425b-8828-14a21ddde590', 'default', 'image06', 'image06.png', 'image/png', 's3', 's3', 86713, '[]', '{\"thumbnail\": true}', '[]', '[]', 738, '2022-03-07 20:29:35', '2022-03-07 20:29:35'),
(739, 'Marvel\\Database\\Models\\Attachment', 741, '45ec61dc-4abe-4c3a-8eff-04d23f4ab24b', 'default', 'image18', 'image18.png', 'image/png', 's3', 's3', 53256, '[]', '{\"thumbnail\": true}', '[]', '[]', 739, '2022-03-07 20:29:35', '2022-03-07 20:29:35'),
(740, 'Marvel\\Database\\Models\\Attachment', 742, 'e82d6b80-af29-43ef-a15c-677a9647888e', 'default', 'image22', 'image22.png', 'image/png', 's3', 's3', 48249, '[]', '{\"thumbnail\": true}', '[]', '[]', 740, '2022-03-07 20:29:35', '2022-03-07 20:29:36'),
(741, 'Marvel\\Database\\Models\\Attachment', 743, 'e35352de-3c0a-49b0-968c-3eb7ab29d21a', 'default', 'image24', 'image24.png', 'image/png', 's3', 's3', 27964, '[]', '{\"thumbnail\": true}', '[]', '[]', 741, '2022-03-07 20:29:36', '2022-03-07 20:29:36'),
(742, 'Marvel\\Database\\Models\\Attachment', 744, '45c792f4-f470-4ba8-9dbf-bec3bd56e1a0', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 742, '2022-03-07 20:29:52', '2022-03-07 20:29:52'),
(743, 'Marvel\\Database\\Models\\Attachment', 745, '55c4b82b-a0ca-409b-913a-1f8e18d9015a', 'default', 'image40', 'image40.png', 'image/png', 's3', 's3', 25418, '[]', '{\"thumbnail\": true}', '[]', '[]', 743, '2022-03-07 20:30:27', '2022-03-07 20:30:27'),
(744, 'Marvel\\Database\\Models\\Attachment', 746, 'e17320d5-1e7d-48c0-b7b0-5c78595e0bb8', 'default', 'image25', 'image25.png', 'image/png', 's3', 's3', 27499, '[]', '{\"thumbnail\": true}', '[]', '[]', 744, '2022-03-07 20:30:37', '2022-03-07 20:30:38'),
(745, 'Marvel\\Database\\Models\\Attachment', 747, '8ffb0c13-ab58-4a9f-940e-a9d7bd09387c', 'default', 'image27', 'image27.png', 'image/png', 's3', 's3', 44687, '[]', '{\"thumbnail\": true}', '[]', '[]', 745, '2022-03-07 20:30:38', '2022-03-07 20:30:38'),
(746, 'Marvel\\Database\\Models\\Attachment', 748, 'ca5e6573-0f96-43ea-9660-da16a2f71b5d', 'default', 'image32', 'image32.png', 'image/png', 's3', 's3', 52728, '[]', '{\"thumbnail\": true}', '[]', '[]', 746, '2022-03-07 20:30:38', '2022-03-07 20:30:38'),
(747, 'Marvel\\Database\\Models\\Attachment', 749, '070bb6e4-7342-4490-80b9-34d970c315b1', 'default', 'image40', 'image40.png', 'image/png', 's3', 's3', 25418, '[]', '{\"thumbnail\": true}', '[]', '[]', 747, '2022-03-07 20:30:38', '2022-03-07 20:30:38'),
(748, 'Marvel\\Database\\Models\\Attachment', 750, '12c4a58b-e23a-4004-b850-0372f7f3ce5e', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 748, '2022-03-07 20:30:47', '2022-03-07 20:30:47'),
(749, 'Marvel\\Database\\Models\\Attachment', 751, 'fe0e0426-2d53-4d0b-9b0f-aee4604f2ff7', 'default', 'image49', 'image49.png', 'image/png', 's3', 's3', 37264, '[]', '{\"thumbnail\": true}', '[]', '[]', 749, '2022-03-07 20:31:09', '2022-03-07 20:31:09'),
(750, 'Marvel\\Database\\Models\\Attachment', 752, 'bd8a4076-b6f6-44f5-ad1d-c932a4f13b44', 'default', 'image39', 'image39.png', 'image/png', 's3', 's3', 77477, '[]', '{\"thumbnail\": true}', '[]', '[]', 750, '2022-03-07 20:31:17', '2022-03-07 20:31:17'),
(751, 'Marvel\\Database\\Models\\Attachment', 753, '1ca9de31-5b99-4c5b-8a09-bdf9cbc6eadf', 'default', 'image41', 'image41.png', 'image/png', 's3', 's3', 55788, '[]', '{\"thumbnail\": true}', '[]', '[]', 751, '2022-03-07 20:31:17', '2022-03-07 20:31:17'),
(752, 'Marvel\\Database\\Models\\Attachment', 754, '8728544a-3412-41fc-a989-f6641d00dc07', 'default', 'image45', 'image45.png', 'image/png', 's3', 's3', 25087, '[]', '{\"thumbnail\": true}', '[]', '[]', 752, '2022-03-07 20:31:17', '2022-03-07 20:31:17'),
(753, 'Marvel\\Database\\Models\\Attachment', 755, 'e2f10553-95a2-4e92-8fff-4fd445342797', 'default', 'image49', 'image49.png', 'image/png', 's3', 's3', 37264, '[]', '{\"thumbnail\": true}', '[]', '[]', 753, '2022-03-07 20:31:17', '2022-03-07 20:31:18'),
(754, 'Marvel\\Database\\Models\\Attachment', 756, '650635e0-be6c-474d-b576-8f1fb09a63cf', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 754, '2022-03-07 20:31:25', '2022-03-07 20:31:25'),
(755, 'Marvel\\Database\\Models\\Attachment', 757, '80a41896-157f-485c-8d58-82b8b04a433e', 'default', 'image17', 'image17.png', 'image/png', 's3', 's3', 85873, '[]', '{\"thumbnail\": true}', '[]', '[]', 755, '2022-03-07 20:31:38', '2022-03-07 20:31:38'),
(756, 'Marvel\\Database\\Models\\Attachment', 758, 'd40b85cd-67bb-4328-9935-284b7e9c2a52', 'default', 'image09', 'image09.png', 'image/png', 's3', 's3', 64270, '[]', '{\"thumbnail\": true}', '[]', '[]', 756, '2022-03-07 20:31:46', '2022-03-07 20:31:47'),
(757, 'Marvel\\Database\\Models\\Attachment', 759, '7cd65878-aa81-4fce-ac71-bae96413bb64', 'default', 'image14', 'image14.png', 'image/png', 's3', 's3', 28593, '[]', '{\"thumbnail\": true}', '[]', '[]', 757, '2022-03-07 20:31:47', '2022-03-07 20:31:47'),
(758, 'Marvel\\Database\\Models\\Attachment', 760, '271c7a6f-6dc0-42c9-82d2-969493bf5204', 'default', 'image16', 'image16.png', 'image/png', 's3', 's3', 44414, '[]', '{\"thumbnail\": true}', '[]', '[]', 758, '2022-03-07 20:31:47', '2022-03-07 20:31:47'),
(759, 'Marvel\\Database\\Models\\Attachment', 761, '071ab67c-3220-472e-9ae6-0eabb8040d24', 'default', 'image17', 'image17.png', 'image/png', 's3', 's3', 85873, '[]', '{\"thumbnail\": true}', '[]', '[]', 759, '2022-03-07 20:31:47', '2022-03-07 20:31:47'),
(760, 'Marvel\\Database\\Models\\Attachment', 762, '4393c92c-e0a3-4dd5-acdc-5a7aba01b0f7', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 760, '2022-03-07 20:31:54', '2022-03-07 20:31:54'),
(761, 'Marvel\\Database\\Models\\Attachment', 763, '83020842-d6cb-4b0e-80fd-eac2a55b4b90', 'default', 'image39', 'image39.png', 'image/png', 's3', 's3', 77477, '[]', '{\"thumbnail\": true}', '[]', '[]', 761, '2022-03-07 20:32:25', '2022-03-07 20:32:25'),
(762, 'Marvel\\Database\\Models\\Attachment', 764, '5ee68010-f59a-459b-b6a9-932d5f762909', 'default', 'image03', 'image03.png', 'image/png', 's3', 's3', 53741, '[]', '{\"thumbnail\": true}', '[]', '[]', 762, '2022-03-07 20:32:35', '2022-03-07 20:32:36'),
(763, 'Marvel\\Database\\Models\\Attachment', 765, '1deb23fb-c6ce-4faf-94f6-fb6ec716a270', 'default', 'image28', 'image28.png', 'image/png', 's3', 's3', 33758, '[]', '{\"thumbnail\": true}', '[]', '[]', 763, '2022-03-07 20:32:36', '2022-03-07 20:32:36'),
(764, 'Marvel\\Database\\Models\\Attachment', 766, 'c47c9e6c-6484-4200-b344-a26fea55a61d', 'default', 'image39', 'image39.png', 'image/png', 's3', 's3', 77477, '[]', '{\"thumbnail\": true}', '[]', '[]', 764, '2022-03-07 20:32:36', '2022-03-07 20:32:36'),
(765, 'Marvel\\Database\\Models\\Attachment', 767, 'a942b5b4-4798-456d-bfb7-3d9653450cc2', 'default', 'image41', 'image41.png', 'image/png', 's3', 's3', 55788, '[]', '{\"thumbnail\": true}', '[]', '[]', 765, '2022-03-07 20:32:36', '2022-03-07 20:32:36'),
(766, 'Marvel\\Database\\Models\\Attachment', 768, 'b246f0fe-b78e-4559-a689-6634533f490d', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 766, '2022-03-07 20:32:44', '2022-03-07 20:32:44'),
(767, 'Marvel\\Database\\Models\\Attachment', 769, 'd3d64794-0b05-420f-9ef4-73a82c2f1230', 'default', 'image32', 'image32.png', 'image/png', 's3', 's3', 52728, '[]', '{\"thumbnail\": true}', '[]', '[]', 767, '2022-03-07 20:33:03', '2022-03-07 20:33:03'),
(768, 'Marvel\\Database\\Models\\Attachment', 770, '29fddb28-b63e-48fa-b3de-cf303e9b27d7', 'default', 'image13', 'image13.png', 'image/png', 's3', 's3', 42830, '[]', '{\"thumbnail\": true}', '[]', '[]', 768, '2022-03-07 20:33:34', '2022-03-07 20:33:35');
INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `generated_conversions`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(769, 'Marvel\\Database\\Models\\Attachment', 771, '998b8759-50c1-4d91-9a03-d014412b5720', 'default', 'image12', 'image12.png', 'image/png', 's3', 's3', 32730, '[]', '{\"thumbnail\": true}', '[]', '[]', 769, '2022-03-07 20:33:47', '2022-03-07 20:33:47'),
(770, 'Marvel\\Database\\Models\\Attachment', 772, 'bfc28f88-c080-49d2-ab72-839b19f29fbd', 'default', 'image13', 'image13.png', 'image/png', 's3', 's3', 42830, '[]', '{\"thumbnail\": true}', '[]', '[]', 770, '2022-03-07 20:33:47', '2022-03-07 20:33:47'),
(771, 'Marvel\\Database\\Models\\Attachment', 773, '7fabf3ca-0722-475a-a322-06b94663d8ea', 'default', 'image14', 'image14.png', 'image/png', 's3', 's3', 28593, '[]', '{\"thumbnail\": true}', '[]', '[]', 771, '2022-03-07 20:33:47', '2022-03-07 20:33:47'),
(772, 'Marvel\\Database\\Models\\Attachment', 774, '36e93122-4d3f-4800-bf4b-a7e28bd8a2c2', 'default', 'image19', 'image19.png', 'image/png', 's3', 's3', 30198, '[]', '{\"thumbnail\": true}', '[]', '[]', 772, '2022-03-07 20:33:47', '2022-03-07 20:33:47'),
(773, 'Marvel\\Database\\Models\\Attachment', 775, '770e3964-f15d-4cdf-bed7-93a99e449973', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 773, '2022-03-07 20:33:54', '2022-03-07 20:33:54'),
(774, 'Marvel\\Database\\Models\\Attachment', 776, '7ffd4b4b-69cc-4631-a0d7-64ee3681a5b9', 'default', 'image09', 'image09.png', 'image/png', 's3', 's3', 64270, '[]', '{\"thumbnail\": true}', '[]', '[]', 774, '2022-03-07 20:34:26', '2022-03-07 20:34:27'),
(775, 'Marvel\\Database\\Models\\Attachment', 777, 'c92f889e-9098-46ee-ac2f-2c68271f2b98', 'default', 'image09', 'image09.png', 'image/png', 's3', 's3', 64270, '[]', '{\"thumbnail\": true}', '[]', '[]', 775, '2022-03-07 20:34:37', '2022-03-07 20:34:38'),
(776, 'Marvel\\Database\\Models\\Attachment', 778, 'b9c87a17-f24e-42b4-87e7-fd89cc7d70c8', 'default', 'image15', 'image15.png', 'image/png', 's3', 's3', 56180, '[]', '{\"thumbnail\": true}', '[]', '[]', 776, '2022-03-07 20:34:38', '2022-03-07 20:34:38'),
(777, 'Marvel\\Database\\Models\\Attachment', 779, 'f209ef85-064d-459e-8218-bf6efbb2b34a', 'default', 'image17', 'image17.png', 'image/png', 's3', 's3', 85873, '[]', '{\"thumbnail\": true}', '[]', '[]', 777, '2022-03-07 20:34:38', '2022-03-07 20:34:38'),
(778, 'Marvel\\Database\\Models\\Attachment', 780, '08ffb2c2-0753-442a-b0e4-19db56713096', 'default', 'image30', 'image30.png', 'image/png', 's3', 's3', 43235, '[]', '{\"thumbnail\": true}', '[]', '[]', 778, '2022-03-07 20:34:38', '2022-03-07 20:34:38'),
(779, 'Marvel\\Database\\Models\\Attachment', 781, '5ac612f3-7f27-4a31-8a66-fbc0d1a938cf', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 779, '2022-03-07 20:34:46', '2022-03-07 20:34:46'),
(780, 'Marvel\\Database\\Models\\Attachment', 782, '29015bab-9658-4d0d-ba61-e13841cc3a39', 'default', 'image30', 'image30.png', 'image/png', 's3', 's3', 43235, '[]', '{\"thumbnail\": true}', '[]', '[]', 780, '2022-03-07 20:35:17', '2022-03-07 20:35:17'),
(781, 'Marvel\\Database\\Models\\Attachment', 783, '4c1e15ea-5b93-4312-a20c-5c1eac9abc0c', 'default', 'image30', 'image30.png', 'image/png', 's3', 's3', 43235, '[]', '{\"thumbnail\": true}', '[]', '[]', 781, '2022-03-07 20:35:29', '2022-03-07 20:35:30'),
(782, 'Marvel\\Database\\Models\\Attachment', 784, '53c83fa5-319b-457a-9c57-696ed01d7909', 'default', 'image32', 'image32.png', 'image/png', 's3', 's3', 52728, '[]', '{\"thumbnail\": true}', '[]', '[]', 782, '2022-03-07 20:35:30', '2022-03-07 20:35:30'),
(783, 'Marvel\\Database\\Models\\Attachment', 785, 'ece05711-cb2d-4690-b6f2-f30ab652420b', 'default', 'image35', 'image35.png', 'image/png', 's3', 's3', 34675, '[]', '{\"thumbnail\": true}', '[]', '[]', 783, '2022-03-07 20:35:30', '2022-03-07 20:35:30'),
(784, 'Marvel\\Database\\Models\\Attachment', 786, 'dfd77295-de3e-4a71-b9fe-cb8be63a980a', 'default', 'image42-2', 'image42-2.png', 'image/png', 's3', 's3', 35304, '[]', '{\"thumbnail\": true}', '[]', '[]', 784, '2022-03-07 20:35:30', '2022-03-07 20:35:31'),
(785, 'Marvel\\Database\\Models\\Attachment', 787, '6423a65b-b0d6-426e-be9c-6da7d5ec27e3', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 785, '2022-03-07 20:35:37', '2022-03-07 20:35:37'),
(786, 'Marvel\\Database\\Models\\Attachment', 788, 'cf09c815-aa9c-4c7e-893a-7a99afa5b36b', 'default', 'image11', 'image11.png', 'image/png', 's3', 's3', 32058, '[]', '{\"thumbnail\": true}', '[]', '[]', 786, '2022-03-07 20:36:07', '2022-03-07 20:36:08'),
(787, 'Marvel\\Database\\Models\\Attachment', 789, 'e3269975-ec94-41ad-9b46-da600d861184', 'default', 'image03', 'image03.png', 'image/png', 's3', 's3', 53741, '[]', '{\"thumbnail\": true}', '[]', '[]', 787, '2022-03-07 20:36:14', '2022-03-07 20:36:14'),
(788, 'Marvel\\Database\\Models\\Attachment', 790, '90c12756-279a-499d-9642-1892346b11ef', 'default', 'image04', 'image04.png', 'image/png', 's3', 's3', 30435, '[]', '{\"thumbnail\": true}', '[]', '[]', 788, '2022-03-07 20:36:14', '2022-03-07 20:36:14'),
(789, 'Marvel\\Database\\Models\\Attachment', 791, '6829922c-27fa-4e5b-8614-4bb6d160d3ab', 'default', 'image08', 'image08.png', 'image/png', 's3', 's3', 41284, '[]', '{\"thumbnail\": true}', '[]', '[]', 789, '2022-03-07 20:36:14', '2022-03-07 20:36:14'),
(790, 'Marvel\\Database\\Models\\Attachment', 792, '892834d0-1944-43bc-b841-c6532f1bab5b', 'default', 'image11', 'image11.png', 'image/png', 's3', 's3', 32058, '[]', '{\"thumbnail\": true}', '[]', '[]', 790, '2022-03-07 20:36:14', '2022-03-07 20:36:15'),
(791, 'Marvel\\Database\\Models\\Attachment', 793, '9e1f7ad8-718a-4b9a-9198-73c4dc11be96', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 791, '2022-03-07 20:36:28', '2022-03-07 20:36:28'),
(792, 'Marvel\\Database\\Models\\Attachment', 794, 'afa9ebb4-bc65-414f-a8d9-d3c8518d4656', 'default', 'image40', 'image40.png', 'image/png', 's3', 's3', 25418, '[]', '{\"thumbnail\": true}', '[]', '[]', 792, '2022-03-07 20:36:39', '2022-03-07 20:36:40'),
(793, 'Marvel\\Database\\Models\\Attachment', 795, '7218fbaa-96b9-47d4-a23b-d9ee3c23c3a0', 'default', 'image10', 'image10.png', 'image/png', 's3', 's3', 79367, '[]', '{\"thumbnail\": true}', '[]', '[]', 793, '2022-03-07 20:37:01', '2022-03-07 20:37:01'),
(794, 'Marvel\\Database\\Models\\Attachment', 796, '2b8381fc-dd06-404a-b601-0d7ed11cecb2', 'default', 'image22', 'image22.png', 'image/png', 's3', 's3', 48249, '[]', '{\"thumbnail\": true}', '[]', '[]', 794, '2022-03-07 20:37:01', '2022-03-07 20:37:01'),
(795, 'Marvel\\Database\\Models\\Attachment', 797, '08bda9cc-39c1-4d3b-bd75-7a673bd2343b', 'default', 'image25', 'image25.png', 'image/png', 's3', 's3', 27499, '[]', '{\"thumbnail\": true}', '[]', '[]', 795, '2022-03-07 20:37:01', '2022-03-07 20:37:02'),
(796, 'Marvel\\Database\\Models\\Attachment', 798, '9bb4ac81-0f25-48c4-9bbf-69b60051eb4d', 'default', 'image40', 'image40.png', 'image/png', 's3', 's3', 25418, '[]', '{\"thumbnail\": true}', '[]', '[]', 796, '2022-03-07 20:37:02', '2022-03-07 20:37:02'),
(797, 'Marvel\\Database\\Models\\Attachment', 799, 'f9316a66-5f9f-4037-baff-600037bb6e4b', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 797, '2022-03-07 20:37:10', '2022-03-07 20:37:10'),
(798, 'Marvel\\Database\\Models\\Attachment', 800, '4f0f0f5a-b039-45a7-ac9a-7cee4590a5f7', 'default', 'image03', 'image03.png', 'image/png', 's3', 's3', 53741, '[]', '{\"thumbnail\": true}', '[]', '[]', 798, '2022-03-08 15:00:55', '2022-03-08 15:00:55'),
(799, 'Marvel\\Database\\Models\\Attachment', 801, 'c7d2c701-6313-4244-91c6-a552c7e15c00', 'default', 'image03', 'image03.png', 'image/png', 's3', 's3', 53741, '[]', '{\"thumbnail\": true}', '[]', '[]', 799, '2022-03-08 15:01:06', '2022-03-08 15:01:06'),
(800, 'Marvel\\Database\\Models\\Attachment', 802, '8e823623-fb66-4503-82e0-4db7a4b5e683', 'default', 'image16', 'image16.png', 'image/png', 's3', 's3', 44414, '[]', '{\"thumbnail\": true}', '[]', '[]', 800, '2022-03-08 15:01:06', '2022-03-08 15:01:06'),
(801, 'Marvel\\Database\\Models\\Attachment', 803, 'f1085339-a651-432c-b7c6-cf2098e6183d', 'default', 'image27', 'image27.png', 'image/png', 's3', 's3', 44687, '[]', '{\"thumbnail\": true}', '[]', '[]', 801, '2022-03-08 15:01:06', '2022-03-08 15:01:07'),
(802, 'Marvel\\Database\\Models\\Attachment', 804, '3c346f60-89f1-4d1b-a1f3-6389658e9673', 'default', 'image28', 'image28.png', 'image/png', 's3', 's3', 33758, '[]', '{\"thumbnail\": true}', '[]', '[]', 802, '2022-03-08 15:01:07', '2022-03-08 15:01:07'),
(803, 'Marvel\\Database\\Models\\Attachment', 805, 'd7c5b017-8f37-451b-bd7f-3435126f5a28', 'default', 'image16', 'image16.png', 'image/png', 's3', 's3', 44414, '[]', '{\"thumbnail\": true}', '[]', '[]', 803, '2022-03-08 15:01:18', '2022-03-08 15:01:19'),
(804, 'Marvel\\Database\\Models\\Attachment', 806, 'fc8d5fa5-fbca-49bb-b49e-5c297290f6c2', 'default', 'image05', 'image05.png', 'image/png', 's3', 's3', 94668, '[]', '{\"thumbnail\": true}', '[]', '[]', 804, '2022-03-08 15:01:28', '2022-03-08 15:01:28'),
(805, 'Marvel\\Database\\Models\\Attachment', 807, '832743ae-d3ef-4654-9064-ec7bf87f56b9', 'default', 'image13', 'image13.png', 'image/png', 's3', 's3', 42830, '[]', '{\"thumbnail\": true}', '[]', '[]', 805, '2022-03-08 15:01:28', '2022-03-08 15:01:28'),
(806, 'Marvel\\Database\\Models\\Attachment', 808, 'b0e28766-1c07-4233-b613-d305b40f8cc0', 'default', 'image16', 'image16.png', 'image/png', 's3', 's3', 44414, '[]', '{\"thumbnail\": true}', '[]', '[]', 806, '2022-03-08 15:01:28', '2022-03-08 15:01:29'),
(807, 'Marvel\\Database\\Models\\Attachment', 809, '188fd9a6-b942-436e-b464-8d4a3cae12b5', 'default', 'image22', 'image22.png', 'image/png', 's3', 's3', 48249, '[]', '{\"thumbnail\": true}', '[]', '[]', 807, '2022-03-08 15:01:29', '2022-03-08 15:01:29'),
(808, 'Marvel\\Database\\Models\\Attachment', 810, '0062cb11-3a61-4bc8-955b-06e453665072', 'default', 'cartsy-lite.1.4.6', 'cartsy-lite.1.4.6.zip', 'application/zip', 's3', 's3', 973005, '[]', '[]', '[]', '[]', 808, '2022-03-08 15:01:35', '2022-03-08 15:01:35'),
(809, 'Marvel\\Database\\Models\\Attachment', 811, '6c9b51fc-5d80-411c-9ca9-c4ec9f23fcae', 'default', '257242127_934412297201696_5986540812823071661_n', '257242127_934412297201696_5986540812823071661_n.jpg', 'image/jpeg', 's3', 's3', 49315, '[]', '{\"thumbnail\": true}', '[]', '[]', 809, '2022-03-27 23:59:38', '2022-03-27 23:59:38'),
(810, 'Marvel\\Database\\Models\\Attachment', 812, '7b5aed3e-7b0a-404f-915c-df44a82a2cad', 'default', '242618903_191307029711468_6046758900536032697_n', '242618903_191307029711468_6046758900536032697_n.jpg', 'image/jpeg', 's3', 's3', 152631, '[]', '{\"thumbnail\": true}', '[]', '[]', 810, '2022-03-28 00:02:26', '2022-03-28 00:02:27'),
(811, 'Marvel\\Database\\Models\\Attachment', 813, 'f2f235b9-3e9b-4786-b5c4-357a3c27b31d', 'default', '257242127_934412297201696_5986540812823071661_n', '257242127_934412297201696_5986540812823071661_n.jpg', 'image/jpeg', 's3', 's3', 49315, '[]', '{\"thumbnail\": true}', '[]', '[]', 811, '2022-03-28 00:02:27', '2022-03-28 00:02:27'),
(812, 'Marvel\\Database\\Models\\Attachment', 814, 'c7eb9b5d-b1b6-49b8-9bdf-d35194a7be73', 'default', '242618903_191307029711468_6046758900536032697_n', '242618903_191307029711468_6046758900536032697_n.jpg', 'image/jpeg', 's3', 's3', 152631, '[]', '{\"thumbnail\": true}', '[]', '[]', 812, '2022-03-28 00:04:34', '2022-03-28 00:04:35'),
(813, 'Marvel\\Database\\Models\\Attachment', 815, '979b2087-0f03-448e-85b2-7c975aae1848', 'default', '257242127_934412297201696_5986540812823071661_n', '257242127_934412297201696_5986540812823071661_n.jpg', 'image/jpeg', 's3', 's3', 49315, '[]', '{\"thumbnail\": true}', '[]', '[]', 813, '2022-03-28 00:04:35', '2022-03-28 00:04:35'),
(814, 'Marvel\\Database\\Models\\Attachment', 816, 'cf51e86c-0af5-4f69-901c-ebdc8396c8a4', 'default', '257242127_934412297201696_5986540812823071661_n', '257242127_934412297201696_5986540812823071661_n.jpg', 'image/jpeg', 's3', 's3', 49315, '[]', '{\"thumbnail\": true}', '[]', '[]', 814, '2022-03-28 09:30:34', '2022-03-28 09:30:34'),
(815, 'Marvel\\Database\\Models\\Attachment', 817, '26d873af-8ba1-4b3a-8989-fea8ad2b4c29', 'default', '242618903_191307029711468_6046758900536032697_n', '242618903_191307029711468_6046758900536032697_n.jpg', 'image/jpeg', 's3', 's3', 152631, '[]', '{\"thumbnail\": true}', '[]', '[]', 815, '2022-03-28 09:40:46', '2022-03-28 09:40:46'),
(816, 'Marvel\\Database\\Models\\Attachment', 818, '769eb68c-e868-4c1b-a648-5c57d6c93c76', 'default', '257242127_934412297201696_5986540812823071661_n', '257242127_934412297201696_5986540812823071661_n.jpg', 'image/jpeg', 's3', 's3', 49315, '[]', '{\"thumbnail\": true}', '[]', '[]', 816, '2022-03-28 09:40:46', '2022-03-28 09:40:47'),
(817, 'Marvel\\Database\\Models\\Attachment', 819, '26ec8c2d-8e76-43de-8d5b-9042b4fcc65e', 'default', '242618903_191307029711468_6046758900536032697_n', '242618903_191307029711468_6046758900536032697_n.jpg', 'image/jpeg', 's3', 's3', 152631, '[]', '{\"thumbnail\": true}', '[]', '[]', 817, '2022-03-28 10:25:58', '2022-03-28 10:25:58'),
(818, 'Marvel\\Database\\Models\\Attachment', 820, '53bd9d5a-258f-4be6-857a-b9e96a553bd1', 'default', '257242127_934412297201696_5986540812823071661_n', '257242127_934412297201696_5986540812823071661_n.jpg', 'image/jpeg', 's3', 's3', 49315, '[]', '{\"thumbnail\": true}', '[]', '[]', 818, '2022-03-28 10:25:58', '2022-03-28 10:25:58'),
(819, 'Marvel\\Database\\Models\\Attachment', 821, 'a4050246-3b90-4967-9656-974947457316', 'default', '257242127_934412297201696_5986540812823071661_n', '257242127_934412297201696_5986540812823071661_n.jpg', 'image/jpeg', 's3', 's3', 49315, '[]', '{\"thumbnail\": true}', '[]', '[]', 819, '2022-03-28 10:26:19', '2022-03-28 10:26:20'),
(820, 'Marvel\\Database\\Models\\Attachment', 822, '53566772-ed04-4fb8-b665-4f797b3486b5', 'default', '242618903_191307029711468_6046758900536032697_n', '242618903_191307029711468_6046758900536032697_n.jpg', 'image/jpeg', 's3', 's3', 152631, '[]', '{\"thumbnail\": true}', '[]', '[]', 820, '2022-03-28 10:48:03', '2022-03-28 10:48:03'),
(821, 'Marvel\\Database\\Models\\Attachment', 823, 'c42bcf01-6e5c-46ba-9bbd-3da9598611f1', 'default', '257242127_934412297201696_5986540812823071661_n', '257242127_934412297201696_5986540812823071661_n.jpg', 'image/jpeg', 's3', 's3', 49315, '[]', '{\"thumbnail\": true}', '[]', '[]', 821, '2022-03-28 10:48:03', '2022-03-28 10:48:04'),
(822, 'Marvel\\Database\\Models\\Attachment', 824, '75993abe-3aae-43ab-8fb5-a89596f29599', 'default', '242618903_191307029711468_6046758900536032697_n', '242618903_191307029711468_6046758900536032697_n.jpg', 'image/jpeg', 's3', 's3', 152631, '[]', '{\"thumbnail\": true}', '[]', '[]', 822, '2022-03-28 10:50:36', '2022-03-28 10:50:36'),
(823, 'Marvel\\Database\\Models\\Attachment', 825, '6dea4942-2cef-4c69-8d27-f7c53435571d', 'default', 'backblue', 'backblue.gif', 'image/gif', 's3', 's3', 4243, '[]', '{\"thumbnail\": true}', '[]', '[]', 823, '2022-03-28 10:54:15', '2022-03-28 10:54:15'),
(824, 'Marvel\\Database\\Models\\Attachment', 826, 'ebc887a1-8e7c-470c-b2c6-496394cfcb02', 'default', 'backblue', 'backblue.gif', 'image/gif', 's3', 's3', 4243, '[]', '{\"thumbnail\": true}', '[]', '[]', 824, '2022-03-28 10:57:33', '2022-03-28 10:57:33'),
(825, 'Marvel\\Database\\Models\\Attachment', 827, '4baf7133-096a-43d4-a4f6-2ba305ec0469', 'default', '1', '1.jpg', 'image/jpeg', 's3', 's3', 9707, '[]', '{\"thumbnail\": true}', '[]', '[]', 825, '2022-03-28 10:58:18', '2022-03-28 10:58:18'),
(826, 'Marvel\\Database\\Models\\Attachment', 828, '57dea26f-e2c5-4ffb-8551-a0549b11cb67', 'default', '2', '2.jpg', 'image/jpeg', 's3', 's3', 11470, '[]', '{\"thumbnail\": true}', '[]', '[]', 826, '2022-03-28 10:58:18', '2022-03-28 10:58:19'),
(827, 'Marvel\\Database\\Models\\Attachment', 829, '787d0704-b09a-4852-8509-7e5891c3de13', 'default', '3', '3.jpg', 'image/jpeg', 's3', 's3', 14539, '[]', '{\"thumbnail\": true}', '[]', '[]', 827, '2022-03-28 10:58:19', '2022-03-28 10:58:19'),
(828, 'Marvel\\Database\\Models\\Attachment', 830, 'bc89628f-cb9f-4302-bd59-3952d1075f24', 'default', '4', '4.jpg', 'image/jpeg', 's3', 's3', 14839, '[]', '{\"thumbnail\": true}', '[]', '[]', 828, '2022-03-28 10:58:19', '2022-03-28 10:58:19'),
(829, 'Marvel\\Database\\Models\\Attachment', 831, '3f7c5329-a68d-4826-b93d-e9d57b361f5b', 'default', '5', '5.jpg', 'image/jpeg', 's3', 's3', 17813, '[]', '{\"thumbnail\": true}', '[]', '[]', 829, '2022-03-28 10:58:19', '2022-03-28 10:58:19'),
(830, 'Marvel\\Database\\Models\\Attachment', 832, '0d29d553-4f5b-416a-816c-c7740765f633', 'default', '6', '6.jpg', 'image/jpeg', 's3', 's3', 14928, '[]', '{\"thumbnail\": true}', '[]', '[]', 830, '2022-03-28 10:58:19', '2022-03-28 10:58:19'),
(831, 'Marvel\\Database\\Models\\Attachment', 833, '3af19710-9846-4fbd-a63a-3b4aee467682', 'default', '6', '6.jpg', 'image/jpeg', 's3', 's3', 14928, '[]', '{\"thumbnail\": true}', '[]', '[]', 831, '2022-03-28 11:17:27', '2022-03-28 11:17:28'),
(832, 'Marvel\\Database\\Models\\Attachment', 834, '9daa8dfd-521e-4da4-abe6-263829e06e67', 'default', '6', '6.jpg', 'image/jpeg', 's3', 's3', 14928, '[]', '{\"thumbnail\": true}', '[]', '[]', 832, '2022-03-28 11:19:03', '2022-03-28 11:19:03'),
(833, 'Marvel\\Database\\Models\\Attachment', 835, 'f23221f0-4e70-4ec3-b5d0-255771d533e5', 'default', '1', '1.jpg', 'image/jpeg', 's3', 's3', 9707, '[]', '{\"thumbnail\": true}', '[]', '[]', 833, '2022-03-28 11:22:01', '2022-03-28 11:22:01'),
(834, 'Marvel\\Database\\Models\\Attachment', 836, '6b595121-e89c-4a1f-b94c-3a466ce1b289', 'default', '2', '2.jpg', 'image/jpeg', 's3', 's3', 11470, '[]', '{\"thumbnail\": true}', '[]', '[]', 834, '2022-03-28 11:22:01', '2022-03-28 11:22:02'),
(835, 'Marvel\\Database\\Models\\Attachment', 837, '724d1103-b8c1-4312-95da-98e0a4a3497e', 'default', '3', '3.jpg', 'image/jpeg', 's3', 's3', 14539, '[]', '{\"thumbnail\": true}', '[]', '[]', 835, '2022-03-28 11:22:02', '2022-03-28 11:22:02'),
(836, 'Marvel\\Database\\Models\\Attachment', 838, '87f17a39-bf3c-4090-b042-7ecc6c2d0363', 'default', '4', '4.jpg', 'image/jpeg', 's3', 's3', 14839, '[]', '{\"thumbnail\": true}', '[]', '[]', 836, '2022-03-28 11:22:02', '2022-03-28 11:22:02'),
(837, 'Marvel\\Database\\Models\\Attachment', 839, '40d855e4-9f01-470b-8d41-317b70b368d1', 'default', '5', '5.jpg', 'image/jpeg', 's3', 's3', 17813, '[]', '{\"thumbnail\": true}', '[]', '[]', 837, '2022-03-28 11:22:02', '2022-03-28 11:22:02'),
(838, 'Marvel\\Database\\Models\\Attachment', 840, '1fdb6bc2-65ce-427b-a14c-42607181e403', 'default', '6', '6.jpg', 'image/jpeg', 's3', 's3', 14928, '[]', '{\"thumbnail\": true}', '[]', '[]', 838, '2022-03-28 11:22:34', '2022-03-28 11:22:34'),
(839, 'Marvel\\Database\\Models\\Attachment', 841, '8786fcd6-f463-4f02-836a-fa6a39a54069', 'default', '4', '4.jpg', 'image/jpeg', 's3', 's3', 14839, '[]', '{\"thumbnail\": true}', '[]', '[]', 839, '2022-03-28 11:23:29', '2022-03-28 11:23:29'),
(840, 'Marvel\\Database\\Models\\Attachment', 842, 'b9773d50-2bd6-44e4-b7f4-a145c0e848dd', 'default', '5', '5.jpg', 'image/jpeg', 's3', 's3', 17813, '[]', '{\"thumbnail\": true}', '[]', '[]', 840, '2022-03-28 11:23:34', '2022-03-28 11:23:34'),
(841, 'Marvel\\Database\\Models\\Attachment', 843, '416a92d8-5d27-499f-a45d-3c3f7a048af9', 'default', '2', '2.jpg', 'image/jpeg', 's3', 's3', 11470, '[]', '{\"thumbnail\": true}', '[]', '[]', 841, '2022-03-28 11:24:06', '2022-03-28 11:24:06'),
(842, 'Marvel\\Database\\Models\\Attachment', 844, '7b59edbe-0c4d-41b1-9844-5173998b931c', 'default', '2', '2.jpg', 'image/jpeg', 's3', 's3', 11470, '[]', '{\"thumbnail\": true}', '[]', '[]', 842, '2022-03-28 11:24:40', '2022-03-28 11:24:41'),
(843, 'Marvel\\Database\\Models\\Attachment', 845, '2d206259-9e12-40e0-88e8-23148469c609', 'default', '4', '4.jpg', 'image/jpeg', 's3', 's3', 14839, '[]', '{\"thumbnail\": true}', '[]', '[]', 843, '2022-03-28 11:24:45', '2022-03-28 11:24:46'),
(844, 'Marvel\\Database\\Models\\Attachment', 846, '9ba3fe96-cd45-4b26-af8a-dbf0c8170eb3', 'default', '5', '5.jpg', 'image/jpeg', 's3', 's3', 17813, '[]', '{\"thumbnail\": true}', '[]', '[]', 844, '2022-03-28 11:24:46', '2022-03-28 11:24:46'),
(845, 'Marvel\\Database\\Models\\Attachment', 847, '85a18b77-4689-4328-9500-a5fa8e6bc6ca', 'default', '3', '3.jpg', 'image/jpeg', 's3', 's3', 14539, '[]', '{\"thumbnail\": true}', '[]', '[]', 845, '2022-03-28 11:26:15', '2022-03-28 11:26:15'),
(846, 'Marvel\\Database\\Models\\Attachment', 848, '082d9770-b3bd-4b3c-93ff-2b744776bbbd', 'default', '5', '5.jpg', 'image/jpeg', 's3', 's3', 17813, '[]', '{\"thumbnail\": true}', '[]', '[]', 846, '2022-03-28 11:26:19', '2022-03-28 11:26:19'),
(847, 'Marvel\\Database\\Models\\Attachment', 849, '607d98f8-b18c-4890-ae42-5d9505986526', 'default', '5', '5.jpg', 'image/jpeg', 's3', 's3', 17813, '[]', '{\"thumbnail\": true}', '[]', '[]', 847, '2022-03-28 11:26:29', '2022-03-28 11:26:29'),
(848, 'Marvel\\Database\\Models\\Attachment', 850, 'ddbba431-c78d-4602-bab0-eef7714d5fbc', 'default', '3', '3.jpg', 'image/jpeg', 's3', 's3', 14539, '[]', '{\"thumbnail\": true}', '[]', '[]', 848, '2022-03-28 11:26:43', '2022-03-28 11:26:43'),
(849, 'Marvel\\Database\\Models\\Attachment', 851, '00ef74d2-5326-49ca-976f-0b3c0a1edbe9', 'default', '3', '3.jpg', 'image/jpeg', 's3', 's3', 14539, '[]', '{\"thumbnail\": true}', '[]', '[]', 849, '2022-03-28 11:26:48', '2022-03-28 11:26:48'),
(850, 'Marvel\\Database\\Models\\Attachment', 852, 'a7436dd0-ff97-491c-8bf6-e63e8b17aaab', 'default', '4', '4.jpg', 'image/jpeg', 's3', 's3', 14839, '[]', '{\"thumbnail\": true}', '[]', '[]', 850, '2022-03-28 11:26:48', '2022-03-28 11:26:48'),
(851, 'Marvel\\Database\\Models\\Attachment', 853, '19a8c5a6-3361-4fda-a980-2c4ee83bfea4', 'default', '5', '5.jpg', 'image/jpeg', 's3', 's3', 17813, '[]', '{\"thumbnail\": true}', '[]', '[]', 851, '2022-03-28 11:26:48', '2022-03-28 11:26:48'),
(852, 'Marvel\\Database\\Models\\Attachment', 854, '7a39a99d-04d1-4084-b8d4-c6b7b28dff3d', 'default', '6', '6.jpg', 'image/jpeg', 's3', 's3', 14928, '[]', '{\"thumbnail\": true}', '[]', '[]', 852, '2022-03-28 11:26:48', '2022-03-28 11:26:49'),
(853, 'Marvel\\Database\\Models\\Attachment', 855, 'ac5fd176-58d2-4cba-9daa-35ecbae79c97', 'default', '5', '5.jpg', 'image/jpeg', 's3', 's3', 17813, '[]', '{\"thumbnail\": true}', '[]', '[]', 853, '2022-03-28 11:26:57', '2022-03-28 11:26:57'),
(854, 'Marvel\\Database\\Models\\Attachment', 856, '0b871c68-74e0-48e7-b69d-ba723ff3b406', 'default', '3', '3.jpg', 'image/jpeg', 's3', 's3', 14539, '[]', '{\"thumbnail\": true}', '[]', '[]', 854, '2022-03-28 11:27:47', '2022-03-28 11:27:47'),
(855, 'Marvel\\Database\\Models\\Attachment', 857, 'f2dee50c-0198-4093-8614-573595058645', 'default', '4', '4.jpg', 'image/jpeg', 's3', 's3', 14839, '[]', '{\"thumbnail\": true}', '[]', '[]', 855, '2022-03-28 11:27:47', '2022-03-28 11:27:47'),
(856, 'Marvel\\Database\\Models\\Attachment', 858, '8d404b41-f77f-47b4-941c-c617907d09de', 'default', '5', '5.jpg', 'image/jpeg', 's3', 's3', 17813, '[]', '{\"thumbnail\": true}', '[]', '[]', 856, '2022-03-28 11:27:47', '2022-03-28 11:27:48'),
(857, 'Marvel\\Database\\Models\\Attachment', 859, 'aacca973-4098-4730-9aa1-7c3e70cd4c23', 'default', '6', '6.jpg', 'image/jpeg', 's3', 's3', 14928, '[]', '{\"thumbnail\": true}', '[]', '[]', 857, '2022-03-28 11:27:48', '2022-03-28 11:27:48'),
(858, 'Marvel\\Database\\Models\\Attachment', 860, '4cc9b77a-1520-4a97-a160-c8603ec7a0eb', 'default', 'ChawkbazarWp', 'ChawkbazarWp.png', 'image/png', 's3', 's3', 487673, '[]', '{\"thumbnail\": true}', '[]', '[]', 858, '2022-05-11 11:27:24', '2022-05-11 11:27:25'),
(859, 'Marvel\\Database\\Models\\Attachment', 861, 'fb2c5a06-daba-45da-9b70-4a068531a23c', 'default', 'ChawkbazarWp', 'ChawkbazarWp.png', 'image/png', 's3', 's3', 487673, '[]', '{\"thumbnail\": true}', '[]', '[]', 859, '2022-05-11 11:27:40', '2022-05-11 11:27:40'),
(860, 'Marvel\\Database\\Models\\Attachment', 862, '59e08c78-5012-434b-8b00-a08b4205dfd4', 'default', 'Turbo', 'Turbo.png', 'image/png', 's3', 's3', 217215, '[]', '{\"thumbnail\": true}', '[]', '[]', 860, '2022-05-11 11:29:45', '2022-05-11 11:29:45'),
(861, 'Marvel\\Database\\Models\\Attachment', 863, '88a5c6dd-d262-4e6d-bedd-134ddab21ef8', 'default', 'Rectangle-778-thumbnail', 'Rectangle-778-thumbnail.webp', 'image/webp', 's3', 's3', 11262, '[]', '{\"thumbnail\": true}', '[]', '[]', 861, '2022-05-11 11:40:05', '2022-05-11 11:40:06'),
(862, 'Marvel\\Database\\Models\\Attachment', 864, '602c8e56-c4c8-4dba-8cfc-985b6881990d', 'default', 'Rectangle-778-thumbnail', 'Rectangle-778-thumbnail.webp', 'image/webp', 's3', 's3', 11262, '[]', '{\"thumbnail\": true}', '[]', '[]', 862, '2022-05-11 11:40:15', '2022-05-11 11:40:15'),
(863, 'Marvel\\Database\\Models\\Attachment', 865, '4ecbda5f-0b27-4d97-8751-630a4eadd277', 'default', 'Rectangle-778-thumbnail', 'Rectangle-778-thumbnail.webp', 'image/webp', 's3', 's3', 11262, '[]', '{\"thumbnail\": true}', '[]', '[]', 863, '2022-05-11 11:41:17', '2022-05-11 11:41:17'),
(864, 'Marvel\\Database\\Models\\Attachment', 866, '03c0f8ef-6bba-441a-9400-62f35345c1a2', 'default', 'ChawkbazarWp', 'ChawkbazarWp.png', 'image/png', 's3', 's3', 487673, '[]', '{\"thumbnail\": true}', '[]', '[]', 864, '2022-05-11 11:45:34', '2022-05-11 11:45:34'),
(865, 'Marvel\\Database\\Models\\Attachment', 867, 'baf07a5f-fc1a-4486-b31c-5ee4e799620f', 'default', 'Turbo', 'Turbo.png', 'image/png', 's3', 's3', 217215, '[]', '{\"thumbnail\": true}', '[]', '[]', 865, '2022-05-11 11:46:52', '2022-05-11 11:46:52'),
(866, 'Marvel\\Database\\Models\\Attachment', 868, 'ec60714f-425b-4e9b-88be-1cb9b2277a35', 'default', 'BorobazarWP', 'BorobazarWP.png', 'image/png', 's3', 's3', 590372, '[]', '{\"thumbnail\": true}', '[]', '[]', 866, '2022-05-11 12:19:50', '2022-05-11 12:19:50'),
(867, 'Marvel\\Database\\Models\\Attachment', 869, '14eb3777-fe90-4fe4-bbe1-2a0dd812f28c', 'default', 'PickBazar_laravel', 'PickBazar_laravel.png', 'image/png', 's3', 's3', 280601, '[]', '{\"thumbnail\": true}', '[]', '[]', 867, '2022-05-11 12:20:22', '2022-05-11 12:20:22'),
(868, 'Marvel\\Database\\Models\\Attachment', 870, 'cc5719d0-a20b-467b-b073-86b7fbed0b5a', 'default', 'ChawkbazarLaravel', 'ChawkbazarLaravel.png', 'image/png', 's3', 's3', 559592, '[]', '{\"thumbnail\": true}', '[]', '[]', 868, '2022-05-11 12:21:11', '2022-05-11 12:21:11'),
(869, 'Marvel\\Database\\Models\\Attachment', 871, 'cd274495-c3ce-4c0d-8abe-ba9f8117eeaa', 'default', 'PickBazar React', 'PickBazar-React.png', 'image/png', 's3', 's3', 243957, '[]', '{\"thumbnail\": true}', '[]', '[]', 869, '2022-05-11 12:21:45', '2022-05-11 12:21:45'),
(870, 'Marvel\\Database\\Models\\Attachment', 872, 'c3b9a391-c953-4f22-be04-530d6530eb90', 'default', 'StoryHub', 'StoryHub.png', 'image/png', 's3', 's3', 484378, '[]', '{\"thumbnail\": true}', '[]', '[]', 870, '2022-05-11 12:22:19', '2022-05-11 12:22:20'),
(871, 'Marvel\\Database\\Models\\Attachment', 873, 'd8b8d7b6-56a0-41a8-8c55-a335e7239e24', 'default', 'Superprops', 'Superprops.png', 'image/png', 's3', 's3', 422070, '[]', '{\"thumbnail\": true}', '[]', '[]', 871, '2022-05-11 12:24:42', '2022-05-11 12:24:43'),
(872, 'Marvel\\Database\\Models\\Attachment', 874, '48299734-9406-4da0-9fd8-116133fdc61c', 'default', 'Superprops', 'Superprops.png', 'image/png', 's3', 's3', 422070, '[]', '{\"thumbnail\": true}', '[]', '[]', 872, '2022-05-11 12:24:58', '2022-05-11 12:24:59'),
(873, 'Marvel\\Database\\Models\\Attachment', 875, 'c7686c18-0581-4005-8a9e-48c66f5df0fa', 'default', 'Chawkbazar react', 'Chawkbazar-react.png', 'image/png', 's3', 's3', 442632, '[]', '{\"thumbnail\": true}', '[]', '[]', 873, '2022-05-11 12:25:31', '2022-05-11 12:25:32'),
(874, 'Marvel\\Database\\Models\\Attachment', 876, '2360efd4-d3ed-4efe-be81-1db3aa5fbedd', 'default', 'Isomorphic', 'Isomorphic.png', 'image/png', 's3', 's3', 216883, '[]', '{\"thumbnail\": true}', '[]', '[]', 874, '2022-05-11 14:11:23', '2022-05-11 14:11:23'),
(875, 'Marvel\\Database\\Models\\Attachment', 877, '46a42066-e3ca-4032-a405-631b63a2047b', 'default', 'Isomorphic', 'Isomorphic.png', 'image/png', 's3', 's3', 216883, '[]', '{\"thumbnail\": true}', '[]', '[]', 875, '2022-05-11 14:11:36', '2022-05-11 14:11:37'),
(876, 'Marvel\\Database\\Models\\Attachment', 879, '1c94c4da-dcca-4c88-af61-6a27976b62a7', 'default', 'Isomorphic', 'Isomorphic.png', 'image/png', 's3', 's3', 216883, '[]', '{\"thumbnail\": true}', '[]', '[]', 876, '2022-05-11 14:16:06', '2022-05-11 14:16:07'),
(877, 'Marvel\\Database\\Models\\Attachment', 881, '784a10c7-33b4-4dea-a501-dfa971b54a3d', 'default', 'Isomorphic', 'Isomorphic.png', 'image/png', 's3', 's3', 216883, '[]', '{\"thumbnail\": true}', '[]', '[]', 877, '2022-05-11 14:16:48', '2022-05-11 14:16:48'),
(878, 'Marvel\\Database\\Models\\Attachment', 882, '3dddd312-eb44-4c56-b2ea-6ab78fffa2e4', 'default', 'Chawkbazar react', 'Chawkbazar-react.png', 'image/png', 's3', 's3', 442632, '[]', '{\"thumbnail\": true}', '[]', '[]', 878, '2022-05-11 14:17:34', '2022-05-11 14:17:34'),
(879, 'Marvel\\Database\\Models\\Attachment', 883, '8833d75e-fbb9-4770-83f4-d3bdb60f0566', 'default', 'Chawkbazar react', 'Chawkbazar-react.png', 'image/png', 's3', 's3', 442632, '[]', '{\"thumbnail\": true}', '[]', '[]', 879, '2022-05-11 14:17:44', '2022-05-11 14:17:45');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_04_17_194830_create_permission_tables', 1),
(6, '2020_06_02_051901_create_marvel_tables', 1),
(7, '2020_10_26_163529_create_media_table', 1),
(8, '2021_04_17_051901_create_new_marvel_tables', 1),
(9, '2021_08_08_051901_create_wallet_table', 1),
(10, '2021_09_26_051901_create_product_type_table', 1),
(11, '2021_10_12_193855_create_reviews_table', 1),
(12, '2022_01_19_051901_create_rental_tables', 1),
(13, '2022_01_31_051901_create_marvel_languages_tables', 1),
(14, '2022_03_23_051901_create_marvel_delivery_time_tables', 1),
(15, '2022_03_24_124527_add_columns_to_table', 1),
(16, '2022_04_11_094659_create_jobs_table', 1),
(17, '2023_06_07_085113_add_transaction_reference', 2),
(18, '2023_06_22_071122_create_images_table', 2),
(19, '2023_06_30_153147_add_category_id_products_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(2, 'Marvel\\Database\\Models\\User', 1),
(3, 'Marvel\\Database\\Models\\User', 1),
(2, 'Marvel\\Database\\Models\\User', 3),
(2, 'Marvel\\Database\\Models\\User', 5),
(2, 'Marvel\\Database\\Models\\User', 6),
(1, 'Marvel\\Database\\Models\\User', 7),
(2, 'Marvel\\Database\\Models\\User', 7),
(3, 'Marvel\\Database\\Models\\User', 7),
(2, 'Marvel\\Database\\Models\\User', 8),
(3, 'Marvel\\Database\\Models\\User', 8),
(1, 'Marvel\\Database\\Models\\User', 9),
(2, 'Marvel\\Database\\Models\\User', 9),
(3, 'Marvel\\Database\\Models\\User', 9),
(2, 'Marvel\\Database\\Models\\User', 10),
(3, 'Marvel\\Database\\Models\\User', 10),
(2, 'Marvel\\Database\\Models\\User', 11),
(3, 'Marvel\\Database\\Models\\User', 11),
(2, 'Marvel\\Database\\Models\\User', 14),
(3, 'Marvel\\Database\\Models\\User', 14),
(2, 'Marvel\\Database\\Models\\User', 15),
(3, 'Marvel\\Database\\Models\\User', 15),
(2, 'Marvel\\Database\\Models\\User', 16),
(3, 'Marvel\\Database\\Models\\User', 16),
(2, 'Marvel\\Database\\Models\\User', 17),
(2, 'Marvel\\Database\\Models\\User', 18),
(3, 'Marvel\\Database\\Models\\User', 18),
(2, 'Marvel\\Database\\Models\\User', 19),
(3, 'Marvel\\Database\\Models\\User', 19),
(2, 'Marvel\\Database\\Models\\User', 20),
(3, 'Marvel\\Database\\Models\\User', 20),
(2, 'Marvel\\Database\\Models\\User', 21);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ordered_files`
--

CREATE TABLE `ordered_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `digital_file_id` bigint(20) UNSIGNED NOT NULL,
  `tracking_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tracking_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_contact` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL,
  `sales_tax` double DEFAULT NULL,
  `paid_total` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `cancelled_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `payment_gateway` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` json DEFAULT NULL,
  `billing_address` json DEFAULT NULL,
  `logistics_provider` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_fee` double DEFAULT NULL,
  `delivery_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_status` enum('order-pending','order-processing','order-completed','order-refunded','order-failed','order-cancelled','order-at-local-facility','order-out-for-delivery') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'order-pending',
  `payment_status` enum('payment-pending','payment-processing','payment-success','payment-failed','payment-reversal','payment-cash-on-delivery','payment-cash','payment-wallet','payment-awaiting-for-approval') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'payment-pending',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `tracking_number`, `customer_id`, `customer_contact`, `customer_name`, `amount`, `sales_tax`, `paid_total`, `total`, `cancelled_amount`, `language`, `coupon_id`, `parent_id`, `shop_id`, `discount`, `payment_gateway`, `shipping_address`, `billing_address`, `logistics_provider`, `delivery_fee`, `delivery_time`, `order_status`, `payment_status`, `deleted_at`, `created_at`, `updated_at`, `transaction_reference`) VALUES
(94, '20230606207641', 7, '1', 'Victor Oseji', 150000, 7500, 157500, 157500, 0.00, 'en', NULL, NULL, NULL, NULL, 'PAYSTACK', NULL, NULL, NULL, NULL, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 03:00:36', '2023-06-07 03:00:36', NULL),
(95, '20230606786710', 7, '1', 'Victor Oseji', 150000, 0, 150000, 150000, 0.00, 'en', NULL, 94, 8, 0, 'PAYSTACK', NULL, NULL, NULL, 0, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 03:00:36', '2023-06-07 03:00:36', NULL),
(96, '20230606895568', 7, '1', 'Victor Oseji', 8900, 445, 9345, 9345, 0.00, 'en', NULL, NULL, NULL, NULL, 'PAYSTACK', NULL, NULL, NULL, NULL, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 03:03:03', '2023-06-07 03:03:03', NULL),
(97, '20230606539663', 7, '1', 'Victor Oseji', 8900, 0, 8900, 8900, 0.00, 'en', NULL, 96, 9, 0, 'PAYSTACK', NULL, NULL, NULL, 0, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 03:03:03', '2023-06-07 03:03:03', NULL),
(98, '20230606643323', 7, '1', 'Victor Oseji', 165500, 8275, 173775, 173775, 0.00, 'en', NULL, NULL, NULL, NULL, 'PAYSTACK', NULL, NULL, NULL, NULL, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 03:11:52', '2023-06-07 03:11:52', NULL),
(99, '20230606668215', 7, '1', 'Victor Oseji', 165500, 0, 165500, 165500, 0.00, 'en', NULL, 98, 5, 0, 'PAYSTACK', NULL, NULL, NULL, 0, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 03:11:52', '2023-06-07 03:11:52', NULL),
(100, '20230606895705', 7, '1', 'Victor Oseji', 7600, 380, 7980, 7980, 0.00, 'en', NULL, NULL, NULL, NULL, 'PAYSTACK', NULL, NULL, NULL, NULL, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 03:52:30', '2023-06-07 03:52:30', NULL),
(101, '20230606627298', 7, '1', 'Victor Oseji', 7600, 0, 7600, 7600, 0.00, 'en', NULL, 100, 8, 0, 'PAYSTACK', NULL, NULL, NULL, 0, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 03:52:30', '2023-06-07 03:52:30', NULL),
(102, '20230606737926', 7, '1', 'Victor Oseji', 7999, 399.95, 8398.95, 8398.95, 0.00, 'en', NULL, NULL, NULL, NULL, 'PAYSTACK', NULL, NULL, NULL, NULL, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 04:00:24', '2023-06-07 04:00:24', NULL),
(103, '20230606520793', 7, '1', 'Victor Oseji', 7999, 0, 7999, 7999, 0.00, 'en', NULL, 102, 4, 0, 'PAYSTACK', NULL, NULL, NULL, 0, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 04:00:24', '2023-06-07 04:00:24', NULL),
(104, '20230606966397', 7, '1', 'Victor Oseji', 7999, 399.95, 8398.95, 8398.95, 0.00, 'en', NULL, NULL, NULL, NULL, 'PAYSTACK', NULL, NULL, NULL, NULL, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 04:00:27', '2023-06-07 04:00:27', NULL),
(105, '20230606388899', 7, '1', 'Victor Oseji', 7999, 0, 7999, 7999, 0.00, 'en', NULL, 104, 4, 0, 'PAYSTACK', NULL, NULL, NULL, 0, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 04:00:27', '2023-06-07 04:00:27', NULL),
(106, '20230606118464', 7, '1', 'Victor Oseji', 7999, 399.95, 8398.95, 8398.95, 0.00, 'en', NULL, NULL, NULL, NULL, 'PAYSTACK', NULL, NULL, NULL, NULL, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 04:00:37', '2023-06-07 04:00:37', NULL),
(107, '20230606841977', 7, '1', 'Victor Oseji', 7999, 0, 7999, 7999, 0.00, 'en', NULL, 106, 4, 0, 'PAYSTACK', NULL, NULL, NULL, 0, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 04:00:37', '2023-06-07 04:00:37', NULL),
(108, '20230606126638', 7, '1', 'Victor Oseji', 7999, 399.95, 8398.95, 8398.95, 0.00, 'en', NULL, NULL, NULL, NULL, 'PAYSTACK', NULL, NULL, NULL, NULL, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 04:02:15', '2023-06-07 04:02:15', NULL),
(109, '20230606306808', 7, '1', 'Victor Oseji', 7999, 0, 7999, 7999, 0.00, 'en', NULL, 108, 4, 0, 'PAYSTACK', NULL, NULL, NULL, 0, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 04:02:15', '2023-06-07 04:02:15', NULL),
(110, '20230606389817', 7, '1', 'Victor Oseji', 7999, 399.95, 8398.95, 8398.95, 0.00, 'en', NULL, NULL, NULL, NULL, 'PAYSTACK', NULL, NULL, NULL, NULL, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 04:02:20', '2023-06-07 04:02:20', NULL),
(111, '20230606921223', 7, '1', 'Victor Oseji', 7999, 0, 7999, 7999, 0.00, 'en', NULL, 110, 4, 0, 'PAYSTACK', NULL, NULL, NULL, 0, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 04:02:20', '2023-06-07 04:02:20', NULL),
(112, '20230606452723', 7, '1', 'Victor Oseji', 7999, 399.95, 8398.95, 8398.95, 0.00, 'en', NULL, NULL, NULL, NULL, 'PAYSTACK', NULL, NULL, NULL, NULL, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 04:04:18', '2023-06-07 04:04:18', NULL),
(113, '20230606186041', 7, '1', 'Victor Oseji', 7999, 0, 7999, 7999, 0.00, 'en', NULL, 112, 4, 0, 'PAYSTACK', NULL, NULL, NULL, 0, NULL, 'order-pending', 'payment-pending', NULL, '2023-06-07 04:04:18', '2023-06-07 04:04:18', NULL),
(114, '20230717725996', 9, '1', 'Test', 29998, 1499.9, 31497.9, 31497.9, 0.00, 'en', NULL, NULL, NULL, NULL, 'PAYSTACK', NULL, NULL, NULL, NULL, NULL, 'order-pending', 'payment-pending', NULL, '2023-07-17 16:50:56', '2023-07-17 16:50:56', 'ododododododo'),
(115, '20230717452939', 9, '1', 'Test', 29998, 0, 29998, 29998, 0.00, 'en', NULL, 114, 14, 0, 'PAYSTACK', NULL, NULL, NULL, 0, NULL, 'order-pending', 'payment-pending', NULL, '2023-07-17 16:50:58', '2023-07-17 16:50:58', 'ododododododo'),
(116, '20230726709329', 9, '1', 'Test', 5999, 299.95, 6298.95, 6298.95, 0.00, 'en', NULL, NULL, NULL, NULL, 'PAYSTACK', NULL, NULL, NULL, NULL, NULL, 'order-pending', 'payment-pending', NULL, '2023-07-26 15:24:04', '2023-07-26 15:24:04', 'ododododododo'),
(117, '20230726555053', 9, '1', 'Test', 5999, 0, 5999, 5999, 0.00, 'en', NULL, 116, 14, 0, 'PAYSTACK', NULL, NULL, NULL, 0, NULL, 'order-pending', 'payment-pending', NULL, '2023-07-26 15:24:06', '2023-07-26 15:24:06', 'ododododododo'),
(118, '20230829713685', 7, '2348137054875', 'Victor Oseji', 20000, 1000, 21000, 21000, 0.00, 'en', NULL, NULL, NULL, NULL, 'PAYSTACK', NULL, NULL, NULL, NULL, NULL, 'order-pending', 'payment-pending', NULL, '2023-08-29 20:31:01', '2023-08-29 20:31:01', 'ododododododo'),
(119, '20230829643491', 7, '2348137054875', 'Victor Oseji', 20000, 0, 20000, 20000, 0.00, 'en', NULL, 118, 12, 0, 'PAYSTACK', NULL, NULL, NULL, 0, NULL, 'order-pending', 'payment-pending', NULL, '2023-08-29 20:31:04', '2023-08-29 20:31:04', 'ododododododo'),
(120, '20230829713810', 7, '2348137054875', 'Victor Oseji', 14999, 749.95, 15748.95, 15748.95, 0.00, 'en', NULL, NULL, NULL, NULL, 'PAYSTACK', NULL, NULL, NULL, NULL, NULL, 'order-pending', 'payment-pending', NULL, '2023-08-29 20:47:17', '2023-08-29 20:47:17', 'ododododododo'),
(121, '20230829585183', 7, '2348137054875', 'Victor Oseji', 14999, 0, 14999, 14999, 0.00, 'en', NULL, 120, 14, 0, 'PAYSTACK', NULL, NULL, NULL, 0, NULL, 'order-pending', 'payment-pending', NULL, '2023-08-29 20:47:32', '2023-08-29 20:47:32', 'ododododododo'),
(122, '20230829422437', 7, '2348137054875', 'Victor Oseji', 6000, 300, 6300, 6300, 0.00, 'en', NULL, NULL, NULL, NULL, 'PAYSTACK', NULL, NULL, NULL, NULL, NULL, 'order-pending', 'payment-pending', NULL, '2023-08-29 21:08:11', '2023-08-29 21:08:11', 'ododododododo'),
(123, '20230829602005', 7, '2348137054875', 'Victor Oseji', 6000, 0, 6000, 6000, 0.00, 'en', NULL, 122, 14, 0, 'PAYSTACK', NULL, NULL, NULL, 0, NULL, 'order-pending', 'payment-pending', NULL, '2023-08-29 21:08:14', '2023-08-29 21:08:14', 'ododododododo'),
(124, '20230829778918', 7, '2348137054875', 'Victor Oseji', 6000, 300, 6300, 6300, 0.00, 'en', NULL, NULL, NULL, NULL, 'PAYSTACK', NULL, NULL, NULL, NULL, NULL, 'order-pending', 'payment-pending', NULL, '2023-08-29 21:16:33', '2023-08-29 21:16:33', 'ododododododo'),
(125, '20230829857840', 7, '2348137054875', 'Victor Oseji', 6000, 0, 6000, 6000, 0.00, 'en', NULL, 124, 14, 0, 'PAYSTACK', NULL, NULL, NULL, 0, NULL, 'order-pending', 'payment-pending', NULL, '2023-08-29 21:16:36', '2023-08-29 21:16:36', 'ododododododo'),
(126, '20230829490703', 7, '2348137054875', 'Victor Oseji', 20000, 1000, 21000, 21000, 0.00, 'en', NULL, NULL, NULL, NULL, 'PAYSTACK', NULL, NULL, NULL, NULL, NULL, 'order-pending', 'payment-pending', NULL, '2023-08-29 21:19:12', '2023-08-29 21:19:12', 'ododododododo'),
(127, '20230829925845', 7, '2348137054875', 'Victor Oseji', 20000, 0, 20000, 20000, 0.00, 'en', NULL, 126, 12, 0, 'PAYSTACK', NULL, NULL, NULL, 0, NULL, 'order-pending', 'payment-pending', NULL, '2023-08-29 21:19:14', '2023-08-29 21:19:14', 'ododododododo'),
(128, '20230829239382', 7, '2348137054875', 'Victor Oseji', 20000, 1000, 21000, 21000, 0.00, 'en', NULL, NULL, NULL, NULL, 'PAYSTACK', NULL, NULL, NULL, NULL, NULL, 'order-processing', 'payment-pending', NULL, '2023-08-29 21:23:15', '2023-08-30 17:19:41', 'ododododododo'),
(129, '20230829451367', 7, '2348137054875', 'Victor Oseji', 20000, 0, 20000, 20000, 0.00, 'en', NULL, 128, 12, 0, 'PAYSTACK', NULL, NULL, NULL, 0, NULL, 'order-pending', 'payment-pending', NULL, '2023-08-29 21:23:18', '2023-08-29 21:23:18', 'ododododododo'),
(130, '20230830891002', 21, '1', 'Victor Oseji', 5999, 299.95, 6298.95, 6298.95, 0.00, 'en', NULL, NULL, NULL, NULL, 'PAYSTACK', NULL, NULL, NULL, NULL, NULL, 'order-pending', 'payment-pending', NULL, '2023-08-30 17:25:22', '2023-08-30 17:25:22', 'ododododododo'),
(131, '20230830948872', 21, '1', 'Victor Oseji', 5999, 0, 5999, 5999, 0.00, 'en', NULL, 130, 14, 0, 'PAYSTACK', NULL, NULL, NULL, 0, NULL, 'order-pending', 'payment-pending', NULL, '2023-08-30 17:25:25', '2023-08-30 17:25:25', 'ododododododo');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variation_option_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_quantity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` double NOT NULL,
  `subtotal` double NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `variation_option_id`, `order_quantity`, `unit_price`, `subtotal`, `deleted_at`, `created_at`, `updated_at`) VALUES
(115, 114, 94, NULL, '2', 14999, 29998, NULL, '2023-07-17 16:50:57', '2023-07-17 16:50:57'),
(116, 115, 94, NULL, '2', 14999, 29998, NULL, '2023-07-17 16:50:58', '2023-07-17 16:50:58'),
(117, 116, 99, NULL, '1', 5999, 5999, NULL, '2023-07-26 15:24:05', '2023-07-26 15:24:05'),
(118, 117, 99, NULL, '1', 5999, 5999, NULL, '2023-07-26 15:24:06', '2023-07-26 15:24:06'),
(119, 118, 92, NULL, '1', 20000, 20000, NULL, '2023-08-29 20:31:02', '2023-08-29 20:31:02'),
(120, 119, 92, NULL, '1', 20000, 20000, NULL, '2023-08-29 20:31:04', '2023-08-29 20:31:04'),
(121, 120, 94, NULL, '1', 14999, 14999, NULL, '2023-08-29 20:47:18', '2023-08-29 20:47:18'),
(122, 121, 94, NULL, '1', 14999, 14999, NULL, '2023-08-29 20:47:32', '2023-08-29 20:47:32'),
(123, 122, 101, NULL, '1', 6000, 6000, NULL, '2023-08-29 21:08:13', '2023-08-29 21:08:13'),
(124, 123, 101, NULL, '1', 6000, 6000, NULL, '2023-08-29 21:08:14', '2023-08-29 21:08:14'),
(125, 124, 101, NULL, '1', 6000, 6000, NULL, '2023-08-29 21:16:34', '2023-08-29 21:16:34'),
(126, 125, 101, NULL, '1', 6000, 6000, NULL, '2023-08-29 21:16:36', '2023-08-29 21:16:36'),
(127, 126, 92, NULL, '1', 20000, 20000, NULL, '2023-08-29 21:19:13', '2023-08-29 21:19:13'),
(128, 127, 92, NULL, '1', 20000, 20000, NULL, '2023-08-29 21:19:14', '2023-08-29 21:19:14'),
(129, 128, 92, NULL, '1', 20000, 20000, NULL, '2023-08-29 21:23:16', '2023-08-29 21:23:16'),
(130, 129, 92, NULL, '1', 20000, 20000, NULL, '2023-08-29 21:23:18', '2023-08-29 21:23:18'),
(131, 130, 99, NULL, '1', 5999, 5999, NULL, '2023-08-30 17:25:23', '2023-08-30 17:25:23'),
(132, 131, 99, NULL, '1', 5999, 5999, NULL, '2023-08-30 17:25:26', '2023-08-30 17:25:26');

-- --------------------------------------------------------

--
-- Table structure for table `order_wallet_points`
--

CREATE TABLE `order_wallet_points` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_intents`
--

CREATE TABLE `payment_intents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tracking_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_gateway` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_intent_info` json DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_intents`
--

INSERT INTO `payment_intents` (`id`, `order_id`, `tracking_number`, `payment_gateway`, `payment_intent_info`, `deleted_at`, `created_at`, `updated_at`) VALUES
(14, 94, '20230606207641', 'paystack', '{\"is_redirect\": true, \"redirect_url\": \"https://checkout.paystack.com/fsq1cp5xjktfh1p\"}', NULL, '2023-06-07 03:00:39', '2023-06-07 03:00:39'),
(15, 96, '20230606895568', 'paystack', '{\"is_redirect\": true, \"redirect_url\": \"https://checkout.paystack.com/fxmupheijpg07oy\"}', NULL, '2023-06-07 03:03:05', '2023-06-07 03:03:05'),
(16, 98, '20230606643323', 'paystack', '{\"is_redirect\": true, \"redirect_url\": \"https://checkout.paystack.com/ycvasatq0a3o5kg\"}', NULL, '2023-06-07 03:11:53', '2023-06-07 03:11:53'),
(17, 100, '20230606895705', 'paystack', '{\"is_redirect\": true, \"redirect_url\": \"https://checkout.paystack.com/54f2dgmiic9imkg\"}', NULL, '2023-06-07 03:52:32', '2023-06-07 03:52:32'),
(18, 112, '20230606452723', 'paystack', '{\"is_redirect\": true, \"redirect_url\": \"https://checkout.paystack.com/93zh1umb8addfgu\"}', NULL, '2023-06-07 04:04:19', '2023-06-07 04:04:19'),
(19, 114, '20230717725996', 'paystack', '{\"is_redirect\": true, \"redirect_url\": \"https://checkout.paystack.com/78wfas5ucxj4fji\"}', NULL, '2023-07-17 16:51:08', '2023-07-17 16:51:08'),
(20, 116, '20230726709329', 'paystack', '{\"is_redirect\": true, \"redirect_url\": \"https://checkout.paystack.com/2sk7qjnkyguazso\"}', NULL, '2023-07-26 15:24:14', '2023-07-26 15:24:14'),
(21, 118, '20230829713685', 'paystack', '{\"is_redirect\": true, \"redirect_url\": \"https://checkout.paystack.com/jl3v49dbljpdywy\"}', NULL, '2023-08-29 20:31:12', '2023-08-29 20:31:12'),
(22, 120, '20230829713810', 'paystack', '{\"is_redirect\": true, \"redirect_url\": \"https://checkout.paystack.com/02phrzj1nainkof\"}', NULL, '2023-08-29 20:47:40', '2023-08-29 20:47:40'),
(23, 122, '20230829422437', 'paystack', '{\"is_redirect\": true, \"redirect_url\": \"https://checkout.paystack.com/9jrx9lwi4yvttt2\"}', NULL, '2023-08-29 21:08:23', '2023-08-29 21:08:23'),
(24, 124, '20230829778918', 'paystack', '{\"is_redirect\": true, \"redirect_url\": \"https://checkout.paystack.com/35ddyv127dz3jc4\"}', NULL, '2023-08-29 21:16:44', '2023-08-29 21:16:44'),
(25, 126, '20230829490703', 'paystack', '{\"is_redirect\": true, \"redirect_url\": \"https://checkout.paystack.com/vg9civh4j8yctgr\"}', NULL, '2023-08-29 21:19:22', '2023-08-29 21:19:22'),
(26, 128, '20230829239382', 'paystack', '{\"is_redirect\": true, \"redirect_url\": \"https://checkout.paystack.com/mfvnh8dy9wwg8a6\"}', NULL, '2023-08-29 21:23:26', '2023-08-29 21:23:26'),
(27, 130, '20230830891002', 'paystack', '{\"is_redirect\": true, \"redirect_url\": \"https://checkout.paystack.com/zzl1ip21h74le34\"}', NULL, '2023-08-30 17:25:34', '2023-08-30 17:25:34');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_gateway_id` bigint(20) UNSIGNED DEFAULT NULL,
  `default_card` tinyint(1) DEFAULT '0',
  `fingerprint` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `network` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification_check` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'api', '2022-01-20 22:24:23', '2022-01-20 22:24:23'),
(2, 'customer', 'api', '2022-01-20 22:24:23', '2022-01-20 22:24:23'),
(3, 'store_owner', 'api', '2022-01-20 22:24:23', '2022-01-20 22:24:23'),
(4, 'staff', 'api', '2022-01-20 22:24:23', '2022-01-20 22:24:23');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(4, 'Marvel\\Database\\Models\\User', 7, 'auth_token', '5d84f8de1dc3485517854a8c8e5018902e729cd447acfb936bdafabca20b68dc', '[\"*\"]', '2023-05-23 20:59:11', '2023-05-22 17:48:18', '2023-05-23 20:59:11'),
(6, 'Marvel\\Database\\Models\\User', 7, 'auth_token', 'a5c7be81d4cbdbc7cb96554ca4f60b9a46bb2cc67d34337b587b7f62ba2bf8e4', '[\"*\"]', '2023-05-24 17:29:24', '2023-05-23 20:52:21', '2023-05-24 17:29:24'),
(7, 'Marvel\\Database\\Models\\User', 7, 'auth_token', '9d82b42c5820b28dd89950a6dd2577dff1f74b0793ff0613706b8bc7d316da41', '[\"*\"]', '2023-06-07 03:51:30', '2023-05-29 16:45:59', '2023-06-07 03:51:30'),
(8, 'Marvel\\Database\\Models\\User', 7, 'auth_token', 'baa40033b028199479ece33fb8b32733711792d2701857532b91e74979a0e360', '[\"*\"]', '2023-05-30 16:26:11', '2023-05-29 17:22:20', '2023-05-30 16:26:11'),
(9, 'Marvel\\Database\\Models\\User', 7, 'auth_token', '7ae582e5de1a1ee91347d8f088d334d19d994696ab56b61c8328e4448bb7426f', '[\"*\"]', '2023-05-31 21:44:53', '2023-05-31 15:16:43', '2023-05-31 21:44:53'),
(11, 'Marvel\\Database\\Models\\User', 8, 'auth_token', '62125506e4bdcbf0c8ed6932e6b99777f425764a6e23297d6429e81cc2d26d94', '[\"*\"]', '2023-06-01 21:43:19', '2023-06-01 20:44:19', '2023-06-01 21:43:19'),
(12, 'Marvel\\Database\\Models\\User', 7, 'auth_token', 'f7e73dc307fefbcba66173662a1199b1e9de98449d550f526dfa01893a7b7b30', '[\"*\"]', '2023-06-07 04:04:29', '2023-06-06 14:40:19', '2023-06-07 04:04:29'),
(16, 'Marvel\\Database\\Models\\User', 8, 'auth_token', 'e05958ec8d96c619e81fdab99a5ffd5888f7205b57b41776be9acfef3d831c97', '[\"*\"]', '2023-06-26 22:03:43', '2023-06-25 18:14:07', '2023-06-26 22:03:43'),
(18, 'Marvel\\Database\\Models\\User', 9, 'auth_token', 'aba04f1c0d7fb92180952fc53be6a3af5c90027b0d4c8e37b77feec09b6a6d74', '[\"*\"]', '2023-06-25 23:34:01', '2023-06-25 19:34:23', '2023-06-25 23:34:01'),
(19, 'Marvel\\Database\\Models\\User', 7, 'auth_token', 'ccfe0dcb8abc02a7a34a16c76ea785b3df7965848e189099e9d3fce4227f4e31', '[\"*\"]', '2023-06-26 11:43:25', '2023-06-25 19:40:59', '2023-06-26 11:43:25'),
(22, 'Marvel\\Database\\Models\\User', 8, 'auth_token', 'e6d1f0a7734e0233134180946f3b9f6b80683c502fa2215f40c87e5f267055a5', '[\"*\"]', '2023-06-26 12:56:36', '2023-06-26 12:56:19', '2023-06-26 12:56:36'),
(23, 'Marvel\\Database\\Models\\User', 9, 'auth_token', '378cafb377304b4cd39560388a16cda38f158f3c3d97306acb664d3bab4a8795', '[\"*\"]', '2023-07-13 23:04:17', '2023-06-26 15:05:58', '2023-07-13 23:04:17'),
(29, 'Marvel\\Database\\Models\\User', 15, 'auth_token', 'a3f67739988254a34ae0a2a86339b43f1135efe048c196df1053bc63a5a79fca', '[\"*\"]', '2023-06-29 16:03:56', '2023-06-29 15:57:51', '2023-06-29 16:03:56'),
(33, 'Marvel\\Database\\Models\\User', 16, 'auth_token', '17ee64022316de19a82415019a5c488b0cbebb7d61b0a9908946f0f01734aa9a', '[\"*\"]', '2023-06-29 18:42:19', '2023-06-29 18:01:37', '2023-06-29 18:42:19'),
(34, 'Marvel\\Database\\Models\\User', 17, 'auth_token', '5c98b9d5e415a09300e86ee5b30271e8f28f749a0881ed4469bbfcfa2ec76762', '[\"*\"]', '2023-07-01 00:34:21', '2023-06-30 23:45:50', '2023-07-01 00:34:21'),
(36, 'Marvel\\Database\\Models\\User', 7, 'auth_token', 'd2d740397e35a54f41620f99747e09fb381746eeb7631dc68b8b3473b1381801', '[\"*\"]', '2023-07-03 20:52:56', '2023-07-03 20:48:55', '2023-07-03 20:52:56'),
(37, 'Marvel\\Database\\Models\\User', 8, 'auth_token', '02a45a0b6ed3da7630f578278883555915e2ef3e2ee7fd233b6bc0d5b3d155a1', '[\"*\"]', '2023-07-09 22:15:29', '2023-07-06 04:57:40', '2023-07-09 22:15:29'),
(38, 'Marvel\\Database\\Models\\User', 8, 'auth_token', 'f64146a7aad255c49e0f4cb742b4b16b5ac281388000cafffe74258e7b670c8a', '[\"*\"]', '2023-07-12 15:27:56', '2023-07-06 21:24:26', '2023-07-12 15:27:56'),
(39, 'Marvel\\Database\\Models\\User', 9, 'auth_token', 'a4745c17ba8cbf3321749016c466e1309f51d1820e8949c3ac950392e02590a3', '[\"*\"]', '2023-07-07 14:46:38', '2023-07-07 14:46:36', '2023-07-07 14:46:38'),
(41, 'Marvel\\Database\\Models\\User', 8, 'auth_token', 'b6bf83225d783a73f2fb0b7367e6aedaef50d1c54f8b13cc0d02597ee38f2391', '[\"*\"]', '2023-07-17 18:55:05', '2023-07-17 04:37:18', '2023-07-17 18:55:05'),
(42, 'Marvel\\Database\\Models\\User', 9, 'auth_token', 'edb9aa20a86d7bc6db18ef515c7f120974fef29ce7160ede0cf443de36d238b5', '[\"*\"]', '2023-07-17 16:53:58', '2023-07-17 16:47:00', '2023-07-17 16:53:58'),
(43, 'Marvel\\Database\\Models\\User', 8, 'auth_token', '5334795cf7d6bd07402852f52ccece7777b003833ea10748b5ecd95fa0e0b9f5', '[\"*\"]', '2023-07-21 15:40:26', '2023-07-20 00:37:25', '2023-07-21 15:40:26'),
(45, 'Marvel\\Database\\Models\\User', 8, 'auth_token', '817f656d933196db89a2a2bde3edd91842c4bc8c4e3ba8603b213eb0e37e79f4', '[\"*\"]', '2023-07-20 00:42:10', '2023-07-20 00:42:07', '2023-07-20 00:42:10'),
(46, 'Marvel\\Database\\Models\\User', 8, 'auth_token', 'd945260e6c84ae50182e1f319a9547297c4c081e58e2f904751dc953be88ac3b', '[\"*\"]', '2023-07-20 22:06:07', '2023-07-20 00:42:09', '2023-07-20 22:06:07'),
(47, 'Marvel\\Database\\Models\\User', 18, 'auth_token', 'eda2e06be56f5282ec8feab687af2b3b21bd6c848e99c48a5a7ac19557ae7d63', '[\"*\"]', '2023-07-21 00:33:49', '2023-07-21 00:33:34', '2023-07-21 00:33:49'),
(48, 'Marvel\\Database\\Models\\User', 19, 'auth_token', '88671c5729210ea45308253b55d802e3a154eb1ea3db999679446d1a9c44934a', '[\"*\"]', '2023-07-24 14:55:17', '2023-07-21 04:17:45', '2023-07-24 14:55:17'),
(49, 'Marvel\\Database\\Models\\User', 9, 'auth_token', '6d67a0ce62813eed09fd40e0c8cd2da4ffcb77384ada5b96435aff62cecc044d', '[\"*\"]', '2023-07-26 15:01:58', '2023-07-26 15:01:55', '2023-07-26 15:01:58'),
(51, 'Marvel\\Database\\Models\\User', 9, 'auth_token', '654893b60e8940bed1b4603a245a358e88e58861b25f3840e4d97e7e68958092', '[\"*\"]', '2023-07-26 15:25:28', '2023-07-26 15:17:43', '2023-07-26 15:25:28'),
(52, 'Marvel\\Database\\Models\\User', 9, 'auth_token', 'a94510ec1fab02efbc99716ee65374e706fac0a2d7ce8d5f476800b425877b94', '[\"*\"]', '2023-07-26 15:24:39', '2023-07-26 15:23:42', '2023-07-26 15:24:39'),
(53, 'Marvel\\Database\\Models\\User', 9, 'auth_token', 'ab6b8ac1295cc3ddad4f09517af4ef07eeec2ee38c1d52f5bc5e964f94732118', '[\"*\"]', '2023-07-26 15:27:56', '2023-07-26 15:25:43', '2023-07-26 15:27:56'),
(54, 'Marvel\\Database\\Models\\User', 8, 'auth_token', 'fc9ae58b201c472ef3d10e9d36a9b58ebd26cf606bb69ebf203e3072d9774b6f', '[\"*\"]', '2023-08-01 12:34:29', '2023-07-31 18:39:32', '2023-08-01 12:34:29'),
(55, 'Marvel\\Database\\Models\\User', 7, 'auth_token', '22ecb79bd39ee097b88308d3ab0005f84b6db1c6473a0a1b1f35f949aa70680d', '[\"*\"]', '2023-07-31 20:35:39', '2023-07-31 18:39:58', '2023-07-31 20:35:39'),
(56, 'Marvel\\Database\\Models\\User', 8, 'auth_token', 'ac6109689420f35c408b45ce85a6c99bff6efb42e0158fc862144ca33d00f397', '[\"*\"]', '2023-08-02 19:53:31', '2023-08-01 22:23:14', '2023-08-02 19:53:31'),
(58, 'Marvel\\Database\\Models\\User', 7, 'auth_token', 'c07dd4bb69ed042a1e3c9ff687dc75ad2e92893fb437ca6dee1d20282d06b179', '[\"*\"]', '2023-08-30 19:30:09', '2023-08-29 20:30:37', '2023-08-30 19:30:09'),
(60, 'Marvel\\Database\\Models\\User', 7, 'auth_token', 'bc68a53f5c48f879d3f863acca2271f325add0f667a5755bf70fadce5e4c2744', '[\"*\"]', '2023-10-03 03:45:56', '2023-08-30 17:16:03', '2023-10-03 03:45:56'),
(61, 'Marvel\\Database\\Models\\User', 21, 'auth_token', '3c9ec9e24965ae45c9f0516e14be4613c23b03b5d9052aee6ff81cd92681324d', '[\"*\"]', '2023-08-30 20:00:25', '2023-08-30 17:23:54', '2023-08-30 20:00:25'),
(62, 'Marvel\\Database\\Models\\User', 9, 'auth_token', '9476a86a115c2bfa9f39695429be847348ca0cf010f8edc4fe7238455b251075', '[\"*\"]', '2023-08-30 18:25:52', '2023-08-30 18:25:50', '2023-08-30 18:25:52'),
(63, 'Marvel\\Database\\Models\\User', 9, 'auth_token', '765dc87f6699a761ccf238c5b9d1d3f87d80a16ad023ed545bba5de984b8ce75', '[\"*\"]', NULL, '2023-08-30 18:25:51', '2023-08-30 18:25:51'),
(67, 'Marvel\\Database\\Models\\User', 9, 'auth_token', 'e972ad2ede04f3c04780b7e4268437cc85ee9f3289125771f1db41a32c0a8b71', '[\"*\"]', '2023-08-31 14:06:46', '2023-08-30 21:31:40', '2023-08-31 14:06:46'),
(68, 'Marvel\\Database\\Models\\User', 9, 'auth_token', '19dcab2a3b8c12f139c61af3081dfb0fd2cbc41f731d464875e4eacad390a0c2', '[\"*\"]', '2023-08-30 21:36:58', '2023-08-30 21:31:54', '2023-08-30 21:36:58'),
(69, 'Marvel\\Database\\Models\\User', 9, 'auth_token', '9fc0c007be568e50fb700dc93344213f4999e1004cd62636684af4d10045a98c', '[\"*\"]', '2023-09-01 16:28:05', '2023-09-01 16:12:02', '2023-09-01 16:28:05'),
(70, 'Marvel\\Database\\Models\\User', 9, 'auth_token', '526e13a47f089a6cf6ae4a1f203d40bfe30cb8cdd67995f3df5c20cb8c12cfcd', '[\"*\"]', '2023-09-01 18:18:06', '2023-09-01 16:36:56', '2023-09-01 18:18:06'),
(71, 'Marvel\\Database\\Models\\User', 9, 'auth_token', '507a3f2bb5cbd46a180a98ef288db2da8a132553a8e5133b432975549c29cbea', '[\"*\"]', '2023-09-07 16:20:38', '2023-09-03 21:45:19', '2023-09-07 16:20:38'),
(72, 'Marvel\\Database\\Models\\User', 9, 'auth_token', '2750e1610427a96d31b464e1387b37d916136afe3b8a343e7b8efb40c25f7304', '[\"*\"]', '2023-09-15 03:09:47', '2023-09-13 18:23:30', '2023-09-15 03:09:47'),
(73, 'Marvel\\Database\\Models\\User', 9, 'auth_token', 'fba8dae07b00bdd61649df74f971db2add1619234025b67b8b9bba89b7525baf', '[\"*\"]', '2023-09-28 20:17:48', '2023-09-25 16:32:54', '2023-09-28 20:17:48');

-- --------------------------------------------------------

--
-- Table structure for table `person_product`
--

CREATE TABLE `person_product` (
  `resource_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pickup_location_product`
--

CREATE TABLE `pickup_location_product` (
  `resource_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `price` double DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sale_price` double DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `min_price` double(8,2) DEFAULT NULL,
  `max_price` double(8,2) DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preview_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `in_stock` tinyint(1) NOT NULL DEFAULT '1',
  `is_taxable` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_class_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('publish','draft') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `product_type` enum('simple','variable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'simple',
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `length` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` json DEFAULT NULL,
  `video` json DEFAULT NULL,
  `gallery` json DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `manufacturer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_digital` tinyint(1) NOT NULL DEFAULT '0',
  `is_external` tinyint(1) NOT NULL DEFAULT '0',
  `external_product_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_product_button_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `description`, `type_id`, `price`, `shop_id`, `sale_price`, `language`, `min_price`, `max_price`, `sku`, `preview_url`, `quantity`, `in_stock`, `is_taxable`, `shipping_class_id`, `status`, `product_type`, `unit`, `height`, `width`, `length`, `image`, `video`, `gallery`, `deleted_at`, `created_at`, `updated_at`, `author_id`, `manufacturer_id`, `is_digital`, `is_external`, `external_product_url`, `external_product_button_text`, `category_id`) VALUES
(92, 'Suede Shoe', 'suede-shoe', 'Blue suede shoe. The best design from Italy', 1, 25000, 12, 20000, 'en', NULL, NULL, NULL, NULL, 38, 1, 0, NULL, 'publish', 'simple', 'size', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16886572601.jpeg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16886572601.jpeg\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16886572612.jpeg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16886572612.jpeg\"}, {\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16886572614.jpeg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16886572614.jpeg\"}]', '2023-09-04 16:12:47', '2023-07-06 21:27:41', '2023-09-04 16:12:47', NULL, NULL, 0, 0, NULL, NULL, NULL),
(93, 'Leather Laptop Bag', 'leather-laptop-bag', 'Sleek leather laptop bag for Mac book', 1, 20000, 14, 15000, 'en', NULL, NULL, NULL, NULL, 49, 1, 0, NULL, 'publish', 'simple', 'Inches', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887198761.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887198761.jpg\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887198772.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887198772.jpg\"}, {\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887198775.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887198775.jpg\"}, {\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1688719877403 error.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1688719877403 error.jpg\"}]', '2023-07-07 14:55:05', '2023-07-07 14:51:17', '2023-07-07 14:55:05', NULL, NULL, 0, 0, NULL, NULL, NULL),
(94, 'Leather Laptop Bag', 'leather-laptop-bag-g', 'Sleek leather laptop bag for Mac book.', 1, 20000, 14, 14999, 'en', NULL, NULL, NULL, NULL, 38, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887202395.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887202395.jpg\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887202392.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887202392.jpg\"}, {\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887202405.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887202405.jpg\"}, {\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1688720240403 error.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1688720240403 error.jpg\"}]', NULL, '2023-07-07 14:57:20', '2023-08-30 17:25:35', NULL, NULL, 0, 0, NULL, NULL, NULL),
(99, 'Solid Color Men Hoodies Fleece Warm Mens Sweatshirt Fashion Streetwear Casual Men\'s Loose Breathable Pullovers Brand Hoody', 'solid-men-hoodies-fleece', 'Solid Color Men Hoodies Fleece Warm Mens Sweatshirt Fashion Streetwear Casual Men\'s Loose Breathable Pullovers Brand Hoody', 1, 9999, 14, 5999, 'en', NULL, NULL, NULL, NULL, 38, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887287013a.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887287013a.jpg\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887287011a.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887287011a.jpg\"}, {\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887287022a.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887287022a.jpg\"}, {\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887287023a.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887287023a.jpg\"}]', NULL, '2023-07-07 17:18:22', '2023-08-30 17:25:35', NULL, NULL, 0, 0, NULL, NULL, NULL),
(100, 'Jianpai Adult Black White Classic Acoustic Electric Toothbrush Adult 5-gear Mode USB Charging IPX7 Waterproof Acoustic Electric', 'jianpai-adult-black-white', 'Jianpai Adult Black White Classic Acoustic Electric Toothbrush Adult 5-gear Mode USB Charging IPX7 Waterproof Acoustic Electric', 1, 15000, 14, 10000, 'en', NULL, NULL, NULL, NULL, 38, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887291995T.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887291995T.jpg\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887291991T.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887291991T.jpg\"}, {\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887292002T.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887292002T.jpg\"}, {\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887292003T.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887292003T.jpg\"}, {\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887292004T.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887292004T.jpg\"}, {\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887292005T.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16887292005T.jpg\"}]', NULL, '2023-07-07 17:26:40', '2023-08-30 17:25:35', NULL, NULL, 0, 0, NULL, NULL, NULL),
(101, 'I12 Macaron Bluetooth Headset Matte Sports Binaural Wireless I12tws Bluetooth Headset 5.0', 'i12-macaron-blootooth', 'I12 Macaron Bluetooth Headset Matte Sports Binaural Wireless I12tws Bluetooth Headset 5.0', 1, 12000, 14, 6000, 'en', NULL, NULL, NULL, NULL, 38, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1688729595A3.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1688729595A3.jpg\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1688729596A1.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1688729596A1.jpg\"}, {\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1688729596A2.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1688729596A2.jpg\"}]', NULL, '2023-07-07 17:33:16', '2023-08-30 17:25:35', NULL, NULL, 0, 0, NULL, NULL, NULL),
(102, 'Ladies Hand Bag', 'ladies-hand-bag', 'Ladies Hand Bag', 1, 30000, 18, 25000, 'en', NULL, NULL, NULL, NULL, 20, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693570480IMG_5203.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693570480IMG_5203.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693570482IMG_5204.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693570482IMG_5204.JPG\"}]', NULL, '2023-09-01 18:14:42', '2023-09-01 18:14:42', NULL, NULL, 0, 0, NULL, NULL, 34),
(103, 'Test', 'test', 'iii', 1, 1100, 12, 1000, 'en', NULL, NULL, NULL, NULL, 20, 1, 0, NULL, 'publish', 'simple', 'size', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693571913oil-drilling-rig-sign-white-icon-vector-13437814.jpeg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693571913oil-drilling-rig-sign-white-icon-vector-13437814.jpeg\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693571914Gogetit Logo Paul@4x.png\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693571914Gogetit Logo Paul@4x.png\"}]', '2023-09-03 21:55:59', '2023-09-01 18:38:34', '2023-09-03 21:55:59', NULL, NULL, 0, 0, NULL, NULL, 43),
(104, 'Ladies Designer Hand Bag', 'ladies-designer-hand-bag', 'Ladies Designer Hand Bag', 1, 50000, 18, 35000, 'en', NULL, NULL, NULL, NULL, 3, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693756764IMG_5163.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693756764IMG_5163.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693756765IMG_5165.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693756765IMG_5165.JPG\"}]', NULL, '2023-09-03 21:59:26', '2023-09-03 21:59:26', NULL, NULL, 0, 0, NULL, NULL, 34),
(105, 'Channel Hand Bag', 'channel-hand-bag', 'Channel Hand Bag', 1, 25000, 18, 35000, 'en', NULL, NULL, NULL, NULL, 5, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693757134IMG_5172.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693757134IMG_5172.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693757136IMG_5174.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693757136IMG_5174.JPG\"}]', NULL, '2023-09-03 22:05:36', '2023-09-03 22:05:36', NULL, NULL, 0, 0, NULL, NULL, 34),
(106, 'ladies classy Designer shoe', 'ladies-classy-designer-shoe', 'ladies classy Designer shoe', 1, 29000, 18, 25000, 'en', NULL, NULL, NULL, NULL, 10, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693773369IMG_5240.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693773369IMG_5240.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693773370IMG_5241.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693773370IMG_5241.JPG\"}]', NULL, '2023-09-04 02:36:10', '2023-09-04 02:36:10', NULL, NULL, 0, 0, NULL, NULL, 34),
(107, 'Ladies Hand bag', 'ladies-hand-bag', 'Ladies Hand bag', 1, 15000, 18, 25000, 'en', NULL, NULL, NULL, NULL, 7, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693774656IMG_5242.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693774656IMG_5242.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693774657IMG_5243.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693774657IMG_5243.JPG\"}]', '2023-09-04 03:02:10', '2023-09-04 02:57:37', '2023-09-04 03:02:10', NULL, NULL, 0, 0, NULL, NULL, 34),
(108, 'Ladies Designer Shoe', 'ladies-designer-shoe', 'Ladies Designer Shoe', 1, 15000, 18, 25000, 'en', NULL, NULL, NULL, NULL, 5, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693774857IMG_5242.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693774857IMG_5242.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693774858IMG_5243.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693774858IMG_5243.JPG\"}]', NULL, '2023-09-04 03:00:58', '2023-09-04 03:00:58', NULL, NULL, 0, 0, NULL, NULL, 34),
(109, 'Michael Kors Handbag pale blue', 'michael-kors-handbag-pale-blue', 'MICHAEL Michael Kors CINDY Handbag pale blue ❤ liked on Polyvore featuring bags, handbags, purses, light blue, blue handbags, leather purse, hand bags, blue leather purse and blue purse', 1, 45000, 18, 30000, 'en', NULL, NULL, NULL, NULL, 4, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693823794IMG_5257.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693823794IMG_5257.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693823796IMG_5259.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693823796IMG_5259.JPG\"}]', NULL, '2023-09-04 16:36:36', '2023-09-04 16:36:36', NULL, NULL, 0, 0, NULL, NULL, 34),
(110, 'Susen Ladies Hand Bag', 'susen-ladies-hand-bag', 'Product sellpoints\r\nstrong carrying capacity: Pu leather material, large capacity, casual and portable.\r\nhigh quality and durable: Made with high quality material, this handbag can protect your hand or on the go. The shoulder straps are made from high quality, durable plastic, and highly waterproof.\r\neasy to carry and store: Portable, light weight, easy to carry.', 1, 34997, 18, 40000, 'en', NULL, NULL, NULL, NULL, 3, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693824515IMG_5268.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693824515IMG_5268.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693824516IMG_5270.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693824516IMG_5270.JPG\"}]', NULL, '2023-09-04 16:48:36', '2023-09-04 16:48:36', NULL, NULL, 0, 0, NULL, NULL, 34),
(111, 'LV Ladies Hand Bag', 'lv-ladies-hand-bag', 'This limited edition of the NéoNoé bucket bag in Damier Azur canvas captures the very spirit of summer with its pastel leather trim and colorful coordinated lining. It will bring a sunny, seasonal touch to any beach-to-city outfit, either slung over the shoulder or worn cross-body, thanks to the removable, adjustable strap.10.24 x 10.24 x 6.89 inches(Length x Height x Width)•L 10.2 x H 10.2 x W 6.9 inches•Eau de Rose Pink•Damier Azur coated canvas•Smooth cowhide trim•Microfiber bonded lining•Gold-color hardware•Removable, adjustable leather strap with press button (drop: min. 33 cm/13 inches, max. 56 cm/22 inches) shoulder or cross-body carry•Drawstring closure•Inside zipped pocketMore Information\r\n\r\nBrand:Louis Vuitton\r\n\r\nGender:Women\r\n\r\nType:Shoulder Bags\r\n\r\nCollection:Néonoé', 1, 70000, 18, 40000, 'en', NULL, NULL, NULL, NULL, 5, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693824988IMG_5288.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693824988IMG_5288.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693824989IMG_5287.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693824989IMG_5287.JPG\"}, {\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693824989IMG_5289.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693824989IMG_5289.JPG\"}]', NULL, '2023-09-04 16:56:29', '2023-09-04 16:56:29', NULL, NULL, 0, 0, NULL, NULL, 34),
(112, 'Susen Ladies Hand bag', 'susen-ladies-hand-bag', 'The versatile day to day bag, only fully lined with central dividing zipped centre pocket. Internal back pocket and Metal Base studs to protect the underside of your fabulous purchase. Snap shut lock and hidden magnets under the flap to keep it closed\r\nif you don’t want to use the lock fitting.\r\n\r\nBag will arrive with Fully Adjustable Shoulder Strap.\r\n\r\nDimensions- W 14” x H 10” x D 5.25”', 1, 39998, 18, 25000, 'en', NULL, NULL, NULL, NULL, 9997, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693831338IMG_5263.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693831338IMG_5263.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693831339IMG_5264.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693831339IMG_5264.JPG\"}]', NULL, '2023-09-04 18:42:19', '2023-09-04 18:42:19', NULL, NULL, 0, 0, NULL, NULL, 34),
(113, 'Susen Ladies Handbag', 'susen-ladies-handbag', 'The versatile day to day bag, only fully lined with central dividing zipped centre pocket. Internal back pocket and Metal Base studs to protect the underside of your fabulous purchase. Snap shut lock and hidden magnets under the flap to keep it closed\r\nif you don’t want to use the lock fitting.\r\n\r\nBag will arrive with Fully Adjustable Shoulder Strap.\r\n\r\nDimensions- W 14” x H 10” x D 5.25”', 1, 25000, 18, 20000, 'en', NULL, NULL, NULL, NULL, 2, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693834596IMG_5265.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693834596IMG_5265.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693834597IMG_5266.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1693834597IMG_5266.JPG\"}]', NULL, '2023-09-04 19:36:37', '2023-09-04 19:36:37', NULL, NULL, 0, 0, NULL, NULL, 34),
(114, 'Men\'s casual footwear', 'mens-casual-footwear', 'High quality made in Nigeria foot wear', 1, 20000, 19, 3000, 'en', NULL, NULL, NULL, NULL, 5, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16938390322.png\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16938390322.png\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16938390341.png\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16938390341.png\"}]', NULL, '2023-09-04 20:50:34', '2023-09-04 20:50:34', NULL, NULL, 0, 0, NULL, NULL, 36),
(115, 'Ladies Yellow foot wear', 'ladies-yellow-foot-wear', 'Ladies Yellow foot wear', 1, 18000, 19, 15000, 'en', NULL, NULL, NULL, NULL, 25, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694608194_Y4B8698 A.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694608194_Y4B8698 A.jpg\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694608195_Y4B8697 A.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694608195_Y4B8697 A.jpg\"}, {\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694608195_Y4B8699 A.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694608195_Y4B8699 A.jpg\"}]', NULL, '2023-09-13 18:29:55', '2023-09-13 18:29:55', NULL, NULL, 0, 0, NULL, NULL, 36),
(116, 'Ladies Orange foot wear', 'ladies-orange-foot-wear', 'Ladies Orange foot wear', 1, 15000, 19, 12000, 'en', NULL, NULL, NULL, NULL, 28, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694608388_Y4B8700 A.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694608388_Y4B8700 A.jpg\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694608389_Y4B8702 A.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694608389_Y4B8702 A.jpg\"}]', NULL, '2023-09-13 18:33:09', '2023-09-13 18:33:09', NULL, NULL, 0, 0, NULL, NULL, 36),
(117, 'men\'s foot wear', 'mens-foot-wear', 'men\'s foot wear', 1, 15000, 19, 12002, 'en', NULL, NULL, NULL, NULL, 29, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694608668_Y4B8703 A.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694608668_Y4B8703 A.jpg\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694608669_Y4B8705.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694608669_Y4B8705.JPG\"}]', NULL, '2023-09-13 18:37:50', '2023-09-13 18:37:50', NULL, NULL, 0, 0, NULL, NULL, 36),
(118, 'Ladies foot wear', 'ladies-foot-wear', 'Ladies foot wear', 1, 15000, 19, 12001, 'en', NULL, NULL, NULL, NULL, 30, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694608794_Y4B8707.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694608794_Y4B8707.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694608794_Y4B8708.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694608794_Y4B8708.JPG\"}]', NULL, '2023-09-13 18:39:55', '2023-09-13 18:39:55', NULL, NULL, 0, 0, NULL, NULL, 36),
(119, 'Ladies foot wear', 'ladies-foot-wear', 'Ladies foot wear', 1, 15000, 19, 12000, 'en', NULL, NULL, NULL, NULL, 30, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694609733_Y4B8710.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694609733_Y4B8710.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694609733_Y4B8711.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694609733_Y4B8711.JPG\"}]', NULL, '2023-09-13 18:55:34', '2023-09-13 18:55:34', NULL, NULL, 0, 0, NULL, NULL, 36),
(120, 'Ladies foot wear', 'ladies-foot-wear', 'Ladies foot wear', 1, 14998, 19, 11999, 'en', NULL, NULL, NULL, NULL, 30, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694609812_Y4B8714.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694609812_Y4B8714.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694609813_Y4B8713.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694609813_Y4B8713.JPG\"}]', NULL, '2023-09-13 18:56:53', '2023-09-13 18:56:53', NULL, NULL, 0, 0, NULL, NULL, 36),
(121, 'Ladies foot wear', 'ladies-foot-wear', 'Ladies foot wear', 1, 15000, 19, 12001, 'en', NULL, NULL, NULL, NULL, 30, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694609903_Y4B8715.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694609903_Y4B8715.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694609904_Y4B8716.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694609904_Y4B8716.JPG\"}]', '2023-09-13 21:30:02', '2023-09-13 18:58:24', '2023-09-13 21:30:02', NULL, NULL, 0, 0, NULL, NULL, 36),
(122, 'Ladies foot wear', 'ladies-foot-wear', 'Ladies foot wear', 1, 15000, 19, 12000, 'en', NULL, NULL, NULL, NULL, 29, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694610641_Y4B8722.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694610641_Y4B8722.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694610642_Y4B8721.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694610642_Y4B8721.JPG\"}]', NULL, '2023-09-13 19:10:42', '2023-09-13 19:10:42', NULL, NULL, 0, 0, NULL, NULL, 36),
(123, 'Ladies foot wear', 'ladies-foot-wear', 'Ladies foot wear', 1, 14999, 19, 12000, 'en', NULL, NULL, NULL, NULL, 30, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618363_Y4B8714.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618363_Y4B8714.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618364_Y4B8713.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618364_Y4B8713.JPG\"}]', NULL, '2023-09-13 21:19:24', '2023-09-13 21:19:24', NULL, NULL, 0, 0, NULL, NULL, 36),
(124, 'Ladies foot wear', 'ladies-foot-wear', 'Ladies foot wear', 1, 15000, 19, 12000, 'en', NULL, NULL, NULL, NULL, 29, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618439_Y4B8715.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618439_Y4B8715.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618439_Y4B8716.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618439_Y4B8716.JPG\"}]', NULL, '2023-09-13 21:20:39', '2023-09-13 21:20:39', NULL, NULL, 0, 0, NULL, NULL, 36),
(125, 'Ladies foot wear', 'ladies-foot-wear', 'Ladies foot wear', 1, 15000, 19, 12000, 'en', NULL, NULL, NULL, NULL, 30, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618523_Y4B8717.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618523_Y4B8717.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618524_Y4B8719.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618524_Y4B8719.JPG\"}]', NULL, '2023-09-13 21:22:04', '2023-09-13 21:22:04', NULL, NULL, 0, 0, NULL, NULL, 36),
(126, 'Ladies foot wear', 'ladies-foot-wear', 'Ladies foot wear', 1, 15000, 19, 12000, 'en', NULL, NULL, NULL, NULL, 20, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618612_Y4B8722.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618612_Y4B8722.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618613_Y4B8721.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618613_Y4B8721.JPG\"}]', NULL, '2023-09-13 21:23:33', '2023-09-13 21:23:33', NULL, NULL, 0, 0, NULL, NULL, 36),
(127, 'Ladies foot wear', 'ladies-foot-wear', 'Ladies foot wear', 1, 15000, 19, 12002, 'en', NULL, NULL, NULL, NULL, 25, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618848_Y4B8725.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618848_Y4B8725.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618849_Y4B8724.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618849_Y4B8724.JPG\"}]', NULL, '2023-09-13 21:27:29', '2023-09-13 21:27:29', NULL, NULL, 0, 0, NULL, NULL, 36),
(128, 'Ladies foot wear', 'ladies-foot-wear', 'Ladies foot wear', 1, 15000, 19, 12000, 'en', NULL, NULL, NULL, NULL, 28, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618985_Y4B8728.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618985_Y4B8728.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618986_Y4B8726.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694618986_Y4B8726.JPG\"}]', NULL, '2023-09-13 21:29:46', '2023-09-13 21:29:46', NULL, NULL, 0, 0, NULL, NULL, 36),
(129, 'mens foot wear', 'mens-foot-wear', 'mens foot wear', 1, 15000, 19, 12000, 'en', NULL, NULL, NULL, NULL, 19, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694619591_Y4B8731.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694619591_Y4B8731.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694619592_Y4B8732.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694619592_Y4B8732.JPG\"}]', NULL, '2023-09-13 21:39:52', '2023-09-13 21:39:52', NULL, NULL, 0, 0, NULL, NULL, 36),
(130, 'Ladies foot wear', 'ladies-foot-wear', 'Ladies foot wear', 1, 14999, 19, 12000, 'en', NULL, NULL, NULL, NULL, 30, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694619993_Y4B8733.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694619993_Y4B8733.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694619994_Y4B8734.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694619994_Y4B8734.JPG\"}]', NULL, '2023-09-13 21:46:34', '2023-09-13 21:46:34', NULL, NULL, 0, 0, NULL, NULL, 36),
(131, 'mens foot wear', 'mens-foot-wear', 'mens foot wear', 1, 15000, 19, 12000, 'en', NULL, NULL, NULL, NULL, 26, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694620155_Y4B8735.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694620155_Y4B8735.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694620155_Y4B8737.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694620155_Y4B8737.JPG\"}]', NULL, '2023-09-13 21:49:16', '2023-09-13 21:49:16', NULL, NULL, 0, 0, NULL, NULL, 36),
(132, 'mens foot wear', 'mens-foot-wear', 'mens foot wear', 1, 15000, 19, 12000, 'en', NULL, NULL, NULL, NULL, 19, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694620237_Y4B8739.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694620237_Y4B8739.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694620238_Y4B8741.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694620238_Y4B8741.JPG\"}]', NULL, '2023-09-13 21:50:38', '2023-09-13 21:50:38', NULL, NULL, 0, 0, NULL, NULL, 36),
(133, 'mens foot wear', 'mens-foot-wear', 'mens foot wear', 1, 15000, 19, 12000, 'en', NULL, NULL, NULL, NULL, 24, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694620326_Y4B8745.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694620326_Y4B8745.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694620326_Y4B8746.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694620326_Y4B8746.JPG\"}]', NULL, '2023-09-13 21:52:06', '2023-09-13 21:52:06', NULL, NULL, 0, 0, NULL, NULL, 36),
(134, 'mens foot wear', 'mens-foot-wear', 'mens foot wear', 1, 15000, 19, 12000, 'en', NULL, NULL, NULL, NULL, 19, 1, 0, NULL, 'publish', 'simple', 'cm', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694620525_Y4B8747.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694620525_Y4B8747.JPG\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694620525_Y4B8748.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1694620525_Y4B8748.JPG\"}]', NULL, '2023-09-13 21:55:26', '2023-09-13 21:55:26', NULL, NULL, 0, 0, NULL, NULL, 36),
(135, '4th Street', '4th-street', '4th Street – 75CL red wine is a naturally sweet and fresh wine made from high quality grapes obtained from vineyards in the western cape of south Africa.\r\n\r\nA perfect rare blend, the grapes are harvested early in the year when they are at peak ripeness so they can give the highest possible amount of nectar.\r\n\r\nThis is the perfect Rare Red Blend. The 4th Street Sweet Red wine has a fruity sweetness which comes from preserving fresh grape juice, allowing no fermentation. It combines its sophisticated taste perfectly with the playful fruity taste.\r\n\r\nThe fruity sweetness is obtained by preserving fresh grape juice, preventing it from fermenting. 4th Street – 75CL is uncomplicated, easy drinking and versatile, it combines its sophisticated taste perfectly with the playful fruity taste, the perfect combination of playful and edgy.\r\n\r\n4th Street – 75CL red wine has a dark red colour and it has scents of cherries, fresh raspberries with notes of cinnamon, jasmine and cloves. Inspired by friendship and sharing, you can get maximum satisfaction on an affordable budget with 4th street.', 1, 5999, 19, 4000, 'en', NULL, NULL, NULL, NULL, 20, 1, 0, NULL, 'publish', 'simple', 'Cl', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16956433224TH STREET.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16956433224TH STREET.jpg\"}', NULL, NULL, NULL, '2023-09-25 18:02:03', '2023-09-25 18:02:03', NULL, NULL, 0, 0, NULL, NULL, 48),
(136, '8 Pm', '8-pm', '8PM Whisky: A rich and smooth blend, perfect for those looking to unwind and savor the evening. Crafted with precision and aged to perfection, it\'s the ideal companion for your 8 PM relaxation ritual. Cheers to a good night!', 1, 12000, 19, 8000, 'en', NULL, NULL, NULL, NULL, 50, 1, 0, NULL, 'publish', 'simple', 'cl', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16956441628 PM.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16956441628 PM.jpg\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16956441638 PM FIRE.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16956441638 PM FIRE.jpg\"}, {\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16956441638 PM HONEY.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16956441638 PM HONEY.jpg\"}]', NULL, '2023-09-25 18:16:03', '2023-09-25 18:16:03', NULL, NULL, 0, 0, NULL, NULL, 48),
(137, 'Boll', 'boll', 'Non Alcoholic Wine', 1, 6000, 19, 4000, 'en', NULL, NULL, NULL, NULL, 33, 1, 0, NULL, 'publish', 'simple', 'cl', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/16956452778Y4B8809.JPG\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/16956452778Y4B8809.JPG\"}', NULL, NULL, NULL, '2023-09-25 18:34:38', '2023-09-25 18:34:38', NULL, NULL, 0, 0, NULL, NULL, 48),
(138, 'ABSOLUT MANDRIN', 'absolut-mandrin', 'ABSOLUT MANDRIN', 1, 9000, 19, 8000, 'en', NULL, NULL, NULL, NULL, 14, 1, 0, NULL, 'publish', 'simple', 'cl', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695645409ABSOLUT MANDRIN.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695645409ABSOLUT MANDRIN.jpg\"}', NULL, NULL, NULL, '2023-09-25 18:36:50', '2023-09-25 18:36:50', NULL, NULL, 0, 0, NULL, NULL, 48),
(139, 'ANDRE', 'andre', 'ANDRE', 1, 7500, 19, 6000, 'en', NULL, NULL, NULL, NULL, 22, 1, 0, NULL, 'publish', 'simple', 'cl', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695645570ANDRE.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695645570ANDRE.jpg\"}', NULL, NULL, NULL, '2023-09-25 18:39:31', '2023-09-25 18:39:31', NULL, NULL, 0, 0, NULL, NULL, 48),
(140, 'BAILEYS', 'baileys', 'BAILEYS', 1, 10000, 19, 10000, 'en', NULL, NULL, NULL, NULL, 20, 1, 0, NULL, 'publish', 'simple', 'cl', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695645885BAILEYS.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695645885BAILEYS.jpg\"}', NULL, NULL, NULL, '2023-09-25 18:44:46', '2023-09-25 18:44:46', NULL, NULL, 0, 0, NULL, NULL, 48),
(141, 'BLACK RAM', 'black-ram', 'BLACK RAM', 1, 11999, 19, 10000, 'en', NULL, NULL, NULL, NULL, 15, 1, 0, NULL, 'publish', 'simple', 'cl', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695646111BLACK RAM.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695646111BLACK RAM.jpg\"}', NULL, NULL, NULL, '2023-09-25 18:48:32', '2023-09-25 18:48:32', NULL, NULL, 0, 0, NULL, NULL, 48),
(142, 'DECLAN', 'declan', 'DECLAN', 1, 8999, 19, 7000, 'en', NULL, NULL, NULL, NULL, 17, 1, 0, NULL, 'publish', 'simple', 'cl', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695646320DECLAN.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695646320DECLAN.jpg\"}', NULL, NULL, NULL, '2023-09-25 18:52:01', '2023-09-25 18:52:01', NULL, NULL, 0, 0, NULL, NULL, 48),
(143, 'DOMINO', 'domino', 'DOMINO', 1, 6000, 19, 4000, 'en', NULL, NULL, NULL, NULL, 24, 1, 0, NULL, 'publish', 'simple', 'cl', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695646451DOMINO.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695646451DOMINO.jpg\"}', NULL, NULL, NULL, '2023-09-25 18:54:12', '2023-09-25 18:54:12', NULL, NULL, 0, 0, NULL, NULL, 48),
(144, 'Flirt', 'flirt', 'Flirt', 1, 7000, 20, 4000, 'en', NULL, NULL, NULL, NULL, 10, 1, 0, NULL, 'publish', 'simple', 'cl', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695906063FLIRT VODKA 2.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695906063FLIRT VODKA 2.jpg\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695906064FLIRT VODKA.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695906064FLIRT VODKA.jpg\"}, {\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695906064FLIRT VOKDA.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695906064FLIRT VOKDA.jpg\"}]', NULL, '2023-09-28 19:01:04', '2023-09-28 19:01:04', NULL, NULL, 0, 0, NULL, NULL, NULL),
(145, 'FOUR COUSINS', 'four-cousins', 'FOUR COUSINS', 1, 6998, 20, 5000, 'en', NULL, NULL, NULL, NULL, 10, 1, 0, NULL, 'publish', 'simple', 'cl', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695906138FOUR COUSINS 2.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695906138FOUR COUSINS 2.jpg\"}', NULL, '[{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695906139FOUR COUSINS.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695906139FOUR COUSINS.jpg\"}]', NULL, '2023-09-28 19:02:19', '2023-09-28 19:02:19', NULL, NULL, 0, 0, NULL, NULL, 48),
(146, 'GLOVANI', 'glovani', 'GLOVANI', 1, 11998, 20, 7000, 'en', NULL, NULL, NULL, NULL, 15, 1, 0, NULL, 'publish', 'simple', 'cl', NULL, NULL, NULL, '{\"id\": 477, \"original\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695910629GLOVANI.jpg\", \"thumbnail\": \"https://goboss-ng.s3.amazonaws.com/uploads/1695910629GLOVANI.jpg\"}', NULL, NULL, NULL, '2023-09-28 20:17:10', '2023-09-28 20:17:10', NULL, NULL, 0, 0, NULL, NULL, 48);

-- --------------------------------------------------------

--
-- Table structure for table `products_meta`
--

CREATE TABLE `products_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'null',
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `provider_user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `images` json DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `image` json DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `price` double DEFAULT NULL,
  `type` enum('DROPOFF_LOCATION','PICKUP_LOCATION','PERSON','DEPOSIT','FEATURES') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variation_option_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` double DEFAULT NULL,
  `photos` json DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `options` json NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `options`, `language`, `created_at`, `updated_at`) VALUES
(1, '{\"seo\": {\"ogImage\": [], \"ogTitle\": null, \"metaTags\": null, \"metaTitle\": \"GoBoss\", \"canonicalUrl\": null, \"ogDescription\": null, \"twitterHandle\": null, \"metaDescription\": null, \"twitterCardType\": null}, \"logo\": \"/image/logo.jpeg\", \"useOtp\": false, \"currency\": \"NGN\", \"taxClass\": 1, \"dark_logo\": [], \"siteTitle\": \"GoBoss\", \"deliveryTime\": [{\"title\": \"On Time\", \"description\": \"You\'ll get it instant\"}], \"signupPoints\": 0, \"siteSubtitle\": null, \"contactDetails\": {\"contact\": \"+2348036576494\", \"socials\": [], \"website\": \"https://goboss.com.ng\", \"location\": {\"lat\": 48.2016556, \"lng\": 16.3378535, \"zip\": \"1070\", \"city\": \"FCT\", \"state\": \"Abuja\", \"country\": \"Nigeria\", \"formattedAddress\": \"Plot 2233 Idu Industrial Layout, Abuja\"}}, \"paymentGateway\": \"paystack\", \"freeShippingAmount\": null, \"minimumOrderAmount\": null, \"maximumQuestionLimit\": 5, \"currencyToWalletRatio\": 100}', 'en', '2022-01-27 00:38:04', '2023-05-22 17:09:58');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_classes`
--

CREATE TABLE `shipping_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `is_global` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `type` enum('fixed','percentage','free_shipping') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `cover_image` json DEFAULT NULL,
  `logo` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `address` json DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `owner_id`, `name`, `slug`, `description`, `cover_image`, `logo`, `is_active`, `address`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Bella Fey Shop', 'bella-fey', 'Along With Wordpress Themes & Plugins, We always try to use latest trending techs like React, Next Js, Gatsby Js, GraphQl, Shopify etc to make our products special. Our rich tech choice will help you to build high performance applications. We are also known to provide great customer supports to our customers.', '{\"id\": 103, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/103/Cover-3.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/103/conversions/Cover-3-thumbnail.jpg\"}', '{\"id\": 102, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/102/Group-14405.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/102/conversions/Group-14405-thumbnail.jpg\"}', 1, '{\"zip\": \"37072\", \"city\": \"Goodlettsville\", \"state\": \"Tennessee\", \"country\": \"USA\", \"street_address\": \"3399 Buffalo Creek Road\"}', '{\"contact\": \"0799302967\", \"socials\": [{\"url\": \"https://www.facebook.com/redqinc/\", \"icon\": \"FacebookIcon\"}, {\"url\": \"https://www.youtube.com/channel/UCjld1tyVHRNy_pe3ROLiLhw\", \"icon\": \"YouTubeIcon\"}], \"website\": \"https://redq.io/\", \"location\": []}', '2022-01-22 23:30:50', '2022-02-24 11:56:16'),
(2, 1, 'GoBoss', 'goboss', 'Along With Wordpress Themes & Plugins, We always try to use latest trending techs like React, Next Js, Gatsby Js, GraphQl, Shopify etc to make our products special. Our rich tech choice will help you to build high performance applications. We are also known to provide great customer supports to our customers.', '{\"id\": 100, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/100/Cover-2.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/100/conversions/Cover-2-thumbnail.jpg\"}', '{\"id\": 101, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/101/Group-14392.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/101/conversions/Group-14392-thumbnail.jpg\"}', 1, '{\"zip\": \"06103\", \"city\": \"Hartford\", \"state\": \"Connecticut\", \"country\": \"USA\", \"street_address\": \"2711 Meadow View Drive\"}', '{\"contact\": \"+659033724396\", \"socials\": [{\"url\": \"https://www.facebook.com/redqinc/\", \"icon\": \"FacebookIcon\"}, {\"url\": \"https://www.instagram.com/redqinc/\", \"icon\": \"InstagramIcon\"}, {\"url\": \"https://www.youtube.com/channel/UCjld1tyVHRNy_pe3ROLiLhw\", \"icon\": \"YouTubeIcon\"}], \"website\": \"https://redq.io/\", \"location\": []}', '2022-01-22 23:51:34', '2022-02-15 13:06:45'),
(3, 1, 'Qubitron Solutions', 'qubitron-solutions', 'Along With Wordpress Themes & Plugins, We always try to use latest trending techs like React, Next Js, Gatsby Js, GraphQl, Shopify etc to make our products special. Our rich tech choice will help you to build high performance applications. We are also known to provide great customer supports to our customers.', '{\"id\": 99, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/99/Cover-1.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/99/conversions/Cover-1-thumbnail.jpg\"}', '{\"id\": 98, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/98/Group-14400.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/98/conversions/Group-14400-thumbnail.jpg\"}', 1, '{\"zip\": \"90017\", \"city\": \"Los Angeles\", \"state\": \"California\", \"country\": \"United States\", \"street_address\": \"396  Glendale Avenue\"}', '{\"contact\": \"0799302967\", \"socials\": [{\"url\": \"https://www.facebook.com/redqinc/\", \"icon\": \"FacebookIcon\"}, {\"url\": \"https://www.youtube.com/channel/UCjld1tyVHRNy_pe3ROLiLhw\", \"icon\": \"YouTubeIcon\"}, {\"url\": \"https://www.instagram.com/redqinc/\", \"icon\": \"InstagramIcon\"}], \"website\": \"https://redq.io/\", \"location\": []}', '2022-01-22 23:53:14', '2022-01-26 15:56:24'),
(4, 1, 'Bitronic', 'bitronic', 'Along With Wordpress Themes & Plugins, We always try to use latest trending techs like React, Next Js, Gatsby Js, GraphQl, Shopify etc to make our products special. Our rich tech choice will help you to build high performance applications. We are also known to provide great customer supports to our customers.', '{\"id\": 423, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/423/Cover-4-thumbnail.jpg\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/423/conversions/Cover-4-thumbnail-thumbnail.jpg\"}', '{\"id\": 428, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/428/Group-14393.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/428/conversions/Group-14393-thumbnail.jpg\"}', 1, '{\"zip\": \"02215\", \"city\": \"Boston\", \"state\": \"Massachusetts\", \"country\": \"USA\", \"street_address\": \"1981 Metz Lane\"}', '{\"contact\": \"0799302967\", \"socials\": [{\"url\": \"https://www.instagram.com/redqinc/\", \"icon\": \"InstagramIcon\"}, {\"url\": \"https://www.youtube.com/channel/UCjld1tyVHRNy_pe3ROLiLhw\", \"icon\": \"YouTubeIcon\"}, {\"url\": \"https://www.facebook.com/redqinc/\", \"icon\": \"FacebookIcon\"}], \"website\": null, \"location\": []}', '2022-01-26 15:55:45', '2022-02-15 13:08:31'),
(5, 1, 'Omatron', 'omatron', 'Along With Wordpress Themes & Plugins, We always try to use latest trending techs like React, Next Js, Gatsby Js, GraphQl, Shopify etc to make our products special. Our rich tech choice will help you to build high performance applications. We are also known to provide great customer supports to our customers.', '{\"id\": 108, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/108/Cover-5.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/108/conversions/Cover-5-thumbnail.jpg\"}', '{\"id\": 109, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/109/Group-14395.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/109/conversions/Group-14395-thumbnail.jpg\"}', 1, '{\"zip\": \"07071\", \"city\": \"Lyndhurst\", \"state\": \"New Jersey\", \"country\": \"USA\", \"street_address\": \"4329 Deer Ridge Drive\"}', '{\"contact\": \"0799302967\", \"socials\": [{\"url\": \"https://www.instagram.com/redqinc/\", \"icon\": \"InstagramIcon\"}, {\"url\": \"https://www.youtube.com/channel/UCjld1tyVHRNy_pe3ROLiLhw\", \"icon\": \"YouTubeIcon\"}, {\"url\": \"https://www.facebook.com/redqinc/\", \"icon\": \"FacebookIcon\"}], \"website\": \"https://redq.io/\", \"location\": []}', '2022-01-26 16:00:06', '2022-02-15 13:10:05'),
(6, 1, 'Imagineco', 'imagineco', 'Along With Wordpress Themes & Plugins, We always try to use latest trending techs like React, Next Js, Gatsby Js, GraphQl, Shopify etc to make our products special. Our rich tech choice will help you to build high performance applications. We are also known to provide great customer supports to our customers.', '{\"id\": 192, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/192/Cover-1.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/192/conversions/Cover-1-thumbnail.jpg\"}', '{\"id\": 191, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/191/Group-14394.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/191/conversions/Group-14394-thumbnail.jpg\"}', 0, '{\"zip\": \"07071\", \"city\": \"Lyndhurst\", \"state\": \"California\", \"country\": \"USA\", \"street_address\": \"4329 Deer Ridge Drive\"}', '{\"contact\": \"0799302967\", \"socials\": [{\"url\": \"https://www.facebook.com/redqinc/\", \"icon\": \"FacebookIcon\"}, {\"url\": \"https://www.instagram.com/redqinc/\", \"icon\": \"InstagramIcon\"}, {\"url\": \"https://www.youtube.com/channel/UCjld1tyVHRNy_pe3ROLiLhw\", \"icon\": \"YouTubeIcon\"}], \"website\": \"https://redq.io/\", \"location\": []}', '2022-01-26 22:51:40', '2023-07-05 18:52:00'),
(7, 1, 'Omnico Team', 'omnico-team', 'Along With Wordpress Themes & Plugins, We always try to use latest trending techs like React, Next Js, Gatsby Js, GraphQl, Shopify etc to make our products special. Our rich tech choice will help you to build high performance applications. We are also known to provide great customer supports to our customers.', '{\"id\": 193, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/193/Cover-2.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/193/conversions/Cover-2-thumbnail.jpg\"}', '{\"id\": 194, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/194/Group-14398.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/194/conversions/Group-14398-thumbnail.jpg\"}', 0, '{\"zip\": \"36104\", \"city\": \"Montgomery\", \"state\": \"Alabama\", \"country\": \"USA\", \"street_address\": \"2834 Fleming Street\"}', '{\"contact\": \"0799302967\", \"socials\": [{\"url\": \"https://www.facebook.com/redqinc/\", \"icon\": \"FacebookIcon\"}, {\"url\": \"https://www.youtube.com/channel/UCjld1tyVHRNy_pe3ROLiLhw\", \"icon\": \"YouTubeIcon\"}, {\"url\": \"https://www.instagram.com/redqinc/\", \"icon\": \"InstagramIcon\"}], \"website\": \"https://redq.io/\", \"location\": []}', '2022-01-26 22:53:03', '2023-07-05 18:52:15'),
(8, 1, 'BentaSoft', 'bentasoft', 'Along With Wordpress Themes & Plugins, We always try to use latest trending techs like React, Next Js, Gatsby Js, GraphQl, Shopify etc to make our products special. Our rich tech choice will help you to build high performance applications. We are also known to provide great customer supports to our customers.', '{\"id\": 196, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/196/Cover-3.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/196/conversions/Cover-3-thumbnail.jpg\"}', '{\"id\": 195, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/195/Group-14404.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/195/conversions/Group-14404-thumbnail.jpg\"}', 0, '{\"zip\": \"02138\", \"city\": \"Cambridge\", \"state\": \"Massachusetts\", \"country\": \"USA\", \"street_address\": \"4408 Hinkle Lake Road\"}', '{\"contact\": \"+659033724396\", \"socials\": [{\"url\": \"https://www.facebook.com/redqinc/\", \"icon\": \"FacebookIcon\"}, {\"url\": \"https://www.instagram.com/redqinc/\", \"icon\": \"InstagramIcon\"}, {\"url\": \"https://www.youtube.com/channel/UCjld1tyVHRNy_pe3ROLiLhw\", \"icon\": \"YouTubeIcon\"}], \"website\": \"https://redq.io/\", \"location\": []}', '2022-01-26 22:54:49', '2023-07-05 18:52:22'),
(9, 1, 'Maxicon Soft Tech', 'maxicon-soft-tech', 'Along With Wordpress Themes & Plugins, We always try to use latest trending techs like React, Next Js, Gatsby Js, GraphQl, Shopify etc to make our products special. Our rich tech choice will help you to build high performance applications. We are also known to provide great customer supports to our customers.', '{\"id\": 419, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/419/Cover-1.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/419/conversions/Cover-1-thumbnail.jpg\"}', '{\"id\": 199, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/199/Group-14403.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/199/conversions/Group-14403-thumbnail.jpg\"}', 0, '{\"zip\": \"53703\", \"city\": \"Madison\", \"state\": \"Wisconsin\", \"country\": \"USA\", \"street_address\": \"3405 Browning Lane\"}', '{\"contact\": \"0799302967\", \"socials\": [{\"url\": \"https://www.facebook.com/redqinc/\", \"icon\": \"FacebookIcon\"}, {\"url\": \"https://www.youtube.com/channel/UCjld1tyVHRNy_pe3ROLiLhw\", \"icon\": \"YouTubeIcon\"}, {\"url\": \"https://www.instagram.com/redqinc/\", \"icon\": \"InstagramIcon\"}], \"website\": \"https://redq.io/about-us\", \"location\": []}', '2022-01-26 22:56:04', '2023-07-05 18:52:33'),
(11, 1, 'Demo shop', 'demo-shop', 'Just for demo purpuse', '[]', '{\"id\": 468, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/466/logo.jpg\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/466/conversions/logo-thumbnail.jpg\"}', 0, '{\"zip\": \"1204\", \"city\": \"Dhaka\", \"state\": \"Dhaka\", \"country\": \"Bangladesh\", \"street_address\": \"Dhaka\"}', '{\"contact\": \"1234678\", \"socials\": [{\"url\": \"facebook.com\", \"icon\": \"FacebookIcon\"}], \"website\": \"www.demo.com\", \"location\": {\"lat\": 12.9479059, \"lng\": 77.6025907, \"city\": \"Bengaluru\", \"state\": \"KA\", \"country\": \"India\", \"formattedAddress\": \"Bannerghatta Main Rd, Chinnayanpalya, Wilson Garden, Bengaluru, Karnataka, India\"}}', '2022-02-19 23:01:23', '2022-02-23 22:34:11'),
(12, 7, 'Victor Oseji', 'victor-ogorchukwu-oseji', NULL, '[]', '[]', 1, '{\"zip\": \"900109\", \"city\": \"FCT\", \"state\": \"Abuja\", \"country\": \"Nigeria\", \"street_address\": \"Yola\"}', '{\"contact\": \"08137054875\", \"socials\": [], \"website\": null, \"location\": []}', '2023-05-22 18:20:34', '2023-05-29 17:08:21'),
(13, 8, 'VICTOR', 'victor', NULL, '[]', '[]', 1, '{\"zip\": \"12\", \"city\": \"YL\", \"state\": \"AD\", \"country\": \"NG\", \"street_address\": \"Kwankwaso Mini Estate\\nKurudu Army Housing Estate\"}', '{\"contact\": null, \"socials\": [], \"website\": null, \"location\": []}', '2023-06-25 18:10:37', '2023-06-25 18:12:09'),
(14, 9, 'Pallys Collectibles', 'test', 'This is a Test', '[]', '[]', 1, '{\"zip\": \"123456\", \"city\": \"test\", \"state\": \"Test\", \"country\": \"Federal Republic of Test\", \"street_address\": \"1 Test Avenue\"}', '{\"contact\": null, \"socials\": [], \"website\": null, \"location\": []}', '2023-06-25 19:36:52', '2023-07-11 15:59:20'),
(15, 16, 'Victor Oseji', 'victor-oseji', '00', '[]', '[]', 1, '{\"zip\": \"1234\", \"city\": \"Abuja\", \"state\": \"Abj\", \"country\": \"Nigeria\", \"street_address\": \"Yola\"}', '{\"contact\": \"08137054985\", \"socials\": [], \"website\": null, \"location\": []}', '2023-06-29 16:28:52', '2023-08-30 21:26:26'),
(17, 16, 'Amanda Shop', 'amanda-shop', 'Your best shop for everything consumables', '[]', '[]', 1, '{\"zip\": \"900109\", \"city\": \"FCT\", \"state\": \"Abuja\", \"country\": \"Nigeria\", \"street_address\": \"Kwankwaso Mini Estate\\nKurudu Army Housing Estate\"}', '{\"contact\": \"08137054875\", \"socials\": [], \"website\": null, \"location\": []}', '2023-06-29 17:32:34', '2023-06-29 18:01:12'),
(18, 9, 'Vogue Top Collections', 'vogue-top-collections', 'We sell Designer wears for ladies', '[]', '[]', 1, '{\"zip\": null, \"city\": \"Abuja\", \"state\": \"FCT\", \"country\": \"Nigeria\", \"street_address\": \"1st Avenue Gwarimpa\"}', '{\"contact\": null, \"socials\": [], \"website\": null, \"location\": []}', '2023-09-01 16:14:15', '2023-09-01 16:15:02'),
(19, 9, 'Glam Africa Luxury', 'mrs-paul', 'High Quality Made-in-Nigeria foot wears.', '[]', '[]', 1, '{\"zip\": null, \"city\": \"Dawaki, Abuja.\", \"state\": \"FCT\", \"country\": \"Nigeria\", \"street_address\": \"Shop D1 - 35, Dawaki Morden Market Abuja.\"}', '{\"contact\": \"08088265955\", \"socials\": [], \"website\": null, \"location\": []}', '2023-09-04 20:42:16', '2023-09-04 20:44:38'),
(20, 9, 'Wines & Spirits', 'wines-spirits', 'We sell all kinds of premium wines and spirits.', '[]', '[]', 1, '{\"zip\": null, \"city\": \"Gwarimpa\", \"state\": \"FCT\", \"country\": \"Nigeria\", \"street_address\": \"21 Gambari CLose, gwarimpa.\"}', '{\"contact\": null, \"socials\": [], \"website\": null, \"location\": []}', '2023-09-28 18:58:25', '2023-09-28 18:58:53');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` json DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `language`, `icon`, `image`, `details`, `type_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'WooCommerce', 'woocommerce', 'en', NULL, '[]', NULL, 3, '2022-01-22 21:07:38', '2022-01-23 00:18:46', NULL),
(2, 'E-commerce', 'ecommerce', 'en', NULL, '[]', NULL, 3, '2022-01-22 21:08:06', '2022-02-12 19:21:44', NULL),
(3, 'Elementor', 'elementor', 'en', NULL, '[]', NULL, 3, '2022-01-22 21:08:15', '2022-01-23 00:22:41', NULL),
(4, 'Laravel', 'laravel', 'en', NULL, '[]', NULL, 3, '2022-01-22 21:08:28', '2022-01-23 00:22:30', NULL),
(5, 'Blog', 'blog', 'en', NULL, '[]', NULL, 3, '2022-01-22 21:10:22', '2022-01-23 00:22:04', NULL),
(6, 'Magazine', 'magazine', 'en', NULL, '[]', NULL, 3, '2022-01-22 21:10:34', '2022-01-23 00:21:56', NULL),
(7, 'Multipurpose', 'multipurpose', 'en', NULL, '[]', NULL, 3, '2022-01-22 21:11:23', '2022-01-23 00:21:48', NULL),
(8, 'Crypto', 'crypto', 'en', NULL, '[]', NULL, 3, '2022-01-22 21:11:57', '2022-01-23 00:21:41', NULL),
(9, 'Retail', 'retail', 'en', NULL, '[]', NULL, 3, '2022-01-22 21:13:02', '2022-01-23 00:21:33', NULL),
(10, 'Education', 'education', 'en', NULL, '[]', NULL, 3, '2022-01-22 21:13:10', '2022-01-23 00:21:24', NULL),
(11, 'Landing Page', 'landing-page', 'en', NULL, '[]', NULL, 3, '2022-01-23 00:23:21', '2022-01-23 00:23:21', NULL),
(12, 'Lifestyle', 'lifestyle', 'en', NULL, '[]', NULL, 3, '2022-01-23 00:24:46', '2022-01-23 00:24:46', NULL),
(13, 'Dashboard', 'dashboard', 'en', NULL, '[]', NULL, 3, '2022-01-23 01:29:21', '2022-01-23 01:29:21', NULL),
(14, 'Rental', 'rental', 'en', NULL, '[]', NULL, 3, '2022-01-23 01:29:39', '2022-01-23 01:29:39', NULL),
(15, 'Business', 'business', 'en', NULL, '[]', NULL, 3, '2022-01-23 01:29:55', '2022-01-23 01:29:55', NULL),
(16, 'modern', 'modern', 'en', NULL, '[]', NULL, 3, '2022-01-23 17:21:54', '2022-01-23 17:21:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tax_classes`
--

CREATE TABLE `tax_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` double NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_global` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `on_shipping` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tax_classes`
--

INSERT INTO `tax_classes` (`id`, `country`, `state`, `zip`, `city`, `rate`, `name`, `is_global`, `priority`, `on_shipping`, `created_at`, `updated_at`) VALUES
(1, 'United States', 'California', '90017', 'Los Angeles', 5, 'Qubitron Solutions', NULL, NULL, 1, '2022-02-19 23:55:46', '2022-02-20 13:45:40');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `translation_item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `language_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_language_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` json DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promotional_sliders` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `name`, `settings`, `slug`, `language`, `icon`, `promotional_sliders`, `created_at`, `updated_at`) VALUES
(1, 'Fixed', '{\"isHome\": false, \"layoutType\": \"classic\", \"productCard\": \"helium\"}', 'fixed', 'en', 'FixedIcon', '[]', '2022-01-22 20:04:37', '2022-02-03 01:35:29'),
(2, 'Liquid', '{\"isHome\": false, \"layoutType\": \"classic\", \"productCard\": \"helium\"}', 'liquid', 'en', 'LiquidIcon', '[]', '2022-01-22 20:05:05', '2022-02-03 01:35:15'),
(3, 'Responsive', '{\"isHome\": false, \"layoutType\": \"classic\", \"productCard\": \"helium\"}', 'responsive', 'en', 'ResponsiveIcon', '[]', '2022-01-22 20:05:32', '2022-02-03 01:35:03'),
(4, 'N/A', '{\"isHome\": false, \"layoutType\": \"classic\", \"productCard\": \"helium\"}', 'n-a', 'en', 'NoTypeIcon', '[]', '2022-01-22 20:05:52', '2022-02-03 01:34:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_active`, `shop_id`) VALUES
(1, 'admin', 'vendor@demo.com', NULL, '$2y$10$zl1gWpOujA6lARlGbP6ZpOvops76lv9c46rZCCKR/l6.ZbNS6pxwa', NULL, '2022-01-20 22:24:42', '2022-01-20 22:24:42', 1, NULL),
(3, 'Customer', 'customer@demo.com', NULL, '$2y$10$Th4h9IBHPhtgeY7AAz5ZtOLrCT.EEXjnP.r/YiKXQyrv4uWOwBHeu', NULL, '2022-02-02 18:00:07', '2022-02-02 18:00:07', 1, NULL),
(5, 'customer 2', 'customer1@demo.com', NULL, '$2y$10$72j4PzWJk56K3R92ixnFiOb6qvKi/59LD3nwHybK42mGBPqSSVAUK', NULL, '2022-05-11 11:46:04', '2022-05-11 11:46:04', 1, NULL),
(6, 'customer 3', 'customer2@demo.com', NULL, '$2y$10$.tHNeinDXbB5pS9QkYOTJeHhmhG.wjJFb9J0BsLANqa5b7iyIAHVa', NULL, '2022-05-11 13:20:42', '2022-05-11 13:20:42', 1, NULL),
(7, 'Victor Oseji', 'vctroseji@gmail.com', NULL, '$2y$10$u/KzD1Y5W6IxULTODgeaJ.CXwID0sXmfMWnysxCCo..vBXRzcbmDi', NULL, '2023-05-19 21:04:38', '2023-05-19 21:04:38', 1, NULL),
(8, 'Victor', 'vctroseji2@gmail.com', NULL, '$2y$10$yBG1ZT1CYk4oCKni.wtPvO9SbDVYcYY8Wizl4Ua9ID.Iaqa2pwJMm', NULL, '2023-05-19 21:18:41', '2023-05-19 21:18:41', 1, NULL),
(9, 'Test', 'sol.iny@hotmail.com', NULL, '$2y$10$oaXAcXeN8YSP.MzlzOJwCOKQ5E17XVrZSdzafodUD.LiZtUVubPLu', NULL, '2023-06-25 19:34:21', '2023-06-25 19:34:21', 1, NULL),
(10, 'v', 'vctroseji21@gmail.com', NULL, '$2y$10$BX8EOSSVewXVvAN7eA0lm.TtvX.Q8uV2OTWz5hqgPwg79GnXPlhTW', NULL, '2023-06-29 13:13:34', '2023-06-29 13:13:34', 1, NULL),
(16, 'Victor', 'sir.victoroseji@gmail.com', NULL, '$2y$10$ccO5R1mu2BSw3V8TpqXZ2espDrWc2/WaGri/fAqyej8phVKNdRvqG', NULL, '2023-06-29 16:04:44', '2023-06-29 16:04:44', 1, NULL),
(17, 'Glamafrica krafts', 'glamafrica10@yahoo.com', NULL, '$2y$10$PK3loQxpo0Vs4ODievEY8O9qhHRDjqjUmD8Nsu.GkrxYSIsXljWHG', NULL, '2023-06-30 23:45:47', '2023-06-30 23:45:47', 1, NULL),
(18, 'admin', 'ad@g.com', NULL, '$2y$10$Idf5NKpicx2Yv2LfNzBnX.DC9hIvGJJyMczswimoefu.bsMTlvHeW', NULL, '2023-07-21 00:33:30', '2023-07-21 00:33:30', 1, NULL),
(19, 'Glam Africa Luxury Krafts', 'blessingmnena@ymail.com', NULL, '$2y$10$unuewm1a7YhdgXZNnHXzCOFOYSopWQm1EWBl6a1u7/..kWXzYPy5u', NULL, '2023-07-21 04:17:41', '2023-07-21 04:17:41', 1, NULL),
(20, 'ORKUMA KENNETH HEMBE', 'orkumahembe@gmail.com', NULL, '$2y$10$f.v8zGblncNljmspf00CC.4ZmOZqtnKKqlokhGM/YVPzGcR0NQ7A2', NULL, '2023-08-29 17:11:30', '2023-08-29 17:11:30', 1, NULL),
(21, 'Victor Oseji', 'v@v.com', NULL, '$2y$10$Ef4lXYWfXji2VSGQC6utEOmH9oaJmp9gM7.cgC0XnLs7wHzKYTaRe', NULL, '2023-08-30 17:23:51', '2023-08-30 17:23:51', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `avatar` json DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `socials` json DEFAULT NULL,
  `contact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `avatar`, `bio`, `socials`, `contact`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, '{\"id\": 460, \"original\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/459/mask.png\", \"thumbnail\": \"https://pixarlaravel.s3.ap-southeast-1.amazonaws.com/459/conversions/mask-thumbnail.jpg\"}', NULL, NULL, NULL, 1, '2022-01-30 13:59:51', '2022-02-16 15:30:28'),
(2, NULL, '', NULL, '19365141641631', 3, '2021-08-18 19:17:53', '2021-08-18 19:17:53'),
(3, '[]', NULL, NULL, '2348137054875', 7, '2023-07-20 00:41:01', '2023-07-20 00:41:01');

-- --------------------------------------------------------

--
-- Table structure for table `user_shop`
--

CREATE TABLE `user_shop` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_options`
--

CREATE TABLE `variation_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` json DEFAULT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `quantity` bigint(20) UNSIGNED NOT NULL,
  `is_disable` tinyint(1) NOT NULL DEFAULT '0',
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` json NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_digital` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total_points` double NOT NULL DEFAULT '0',
  `points_used` double NOT NULL DEFAULT '0',
  `available_points` double NOT NULL DEFAULT '0',
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `total_points`, `points_used`, `available_points`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 0, 8, '2023-05-19 21:18:41', '2023-05-19 21:18:41'),
(2, 0, 0, 0, 9, '2023-06-25 19:34:23', '2023-06-25 19:34:23'),
(3, 0, 0, 0, 10, '2023-06-29 13:13:36', '2023-06-29 13:13:37'),
(7, 0, 0, 0, 16, '2023-06-29 16:04:46', '2023-06-29 16:04:47'),
(8, 0, 0, 0, 17, '2023-06-30 23:45:50', '2023-06-30 23:45:50'),
(9, 0, 0, 0, 18, '2023-07-21 00:33:33', '2023-07-21 00:33:33'),
(10, 0, 0, 0, 19, '2023-07-21 04:17:44', '2023-07-21 04:17:45'),
(11, 0, 0, 0, 20, '2023-08-29 17:11:33', '2023-08-29 17:11:33'),
(12, 0, 0, 0, 21, '2023-08-30 17:23:53', '2023-08-30 17:23:54');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variation_option_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('approved','processing','rejected','pending','on_hold') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `details` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abusive_reports`
--
ALTER TABLE `abusive_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `abusive_reports_user_id_foreign` (`user_id`),
  ADD KEY `abusive_reports_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attributes_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_product_attribute_value_id_foreign` (`attribute_value_id`),
  ADD KEY `attribute_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `availabilities`
--
ALTER TABLE `availabilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `availabilities_order_id_foreign` (`order_id`),
  ADD KEY `availabilities_product_id_foreign` (`product_id`);

--
-- Indexes for table `balances`
--
ALTER TABLE `balances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `balances_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_type_id_foreign` (`type_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_foreign` (`parent`),
  ADD KEY `categories_type_id_foreign` (`type_id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_product_product_id_foreign` (`product_id`),
  ADD KEY `category_product_category_id_foreign` (`category_id`);

--
-- Indexes for table `category_shop`
--
ALTER TABLE `category_shop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_shop_shop_id_foreign` (`shop_id`),
  ADD KEY `category_shop_category_id_foreign` (`category_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_times`
--
ALTER TABLE `delivery_times`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_product`
--
ALTER TABLE `deposit_product`
  ADD KEY `deposit_product_resource_id_foreign` (`resource_id`),
  ADD KEY `deposit_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `digital_files`
--
ALTER TABLE `digital_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `download_tokens`
--
ALTER TABLE `download_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `download_tokens_digital_file_id_foreign` (`digital_file_id`);

--
-- Indexes for table `dropoff_location_product`
--
ALTER TABLE `dropoff_location_product`
  ADD KEY `dropoff_location_product_resource_id_foreign` (`resource_id`),
  ADD KEY `dropoff_location_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feature_product`
--
ALTER TABLE `feature_product`
  ADD KEY `feature_product_resource_id_foreign` (`resource_id`),
  ADD KEY `feature_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedbacks_user_id_foreign` (`user_id`),
  ADD KEY `feedbacks_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manufacturers_type_id_foreign` (`type_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `ordered_files`
--
ALTER TABLE `ordered_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ordered_files_digital_file_id_foreign` (`digital_file_id`),
  ADD KEY `ordered_files_tracking_number_foreign` (`tracking_number`),
  ADD KEY `ordered_files_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_tracking_number_unique` (`tracking_number`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`),
  ADD KEY `orders_shop_id_foreign` (`shop_id`),
  ADD KEY `orders_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_order_id_foreign` (`order_id`),
  ADD KEY `order_product_product_id_foreign` (`product_id`),
  ADD KEY `order_product_variation_option_id_foreign` (`variation_option_id`);

--
-- Indexes for table `order_wallet_points`
--
ALTER TABLE `order_wallet_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_wallet_points_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_gateways_user_id_foreign` (`user_id`);

--
-- Indexes for table `payment_intents`
--
ALTER TABLE `payment_intents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_intents_order_id_foreign` (`order_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_methods_method_key_unique` (`method_key`),
  ADD UNIQUE KEY `payment_methods_fingerprint_unique` (`fingerprint`),
  ADD KEY `payment_methods_payment_gateway_id_foreign` (`payment_gateway_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `person_product`
--
ALTER TABLE `person_product`
  ADD KEY `person_product_resource_id_foreign` (`resource_id`),
  ADD KEY `person_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `pickup_location_product`
--
ALTER TABLE `pickup_location_product`
  ADD KEY `pickup_location_product_resource_id_foreign` (`resource_id`),
  ADD KEY `pickup_location_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_type_id_foreign` (`type_id`),
  ADD KEY `products_shipping_class_id_foreign` (`shipping_class_id`),
  ADD KEY `products_shop_id_foreign` (`shop_id`),
  ADD KEY `products_author_id_foreign` (`author_id`),
  ADD KEY `products_manufacturer_id_foreign` (`manufacturer_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `products_meta`
--
ALTER TABLE `products_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_meta_product_id_foreign` (`product_id`),
  ADD KEY `products_meta_key_index` (`key`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_tag_product_id_foreign` (`product_id`),
  ADD KEY `product_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `providers_user_id_foreign` (`user_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_user_id_foreign` (`user_id`),
  ADD KEY `questions_shop_id_foreign` (`shop_id`),
  ADD KEY `questions_product_id_foreign` (`product_id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refunds_order_id_foreign` (`order_id`),
  ADD KEY `refunds_customer_id_foreign` (`customer_id`),
  ADD KEY `refunds_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_shop_id_foreign` (`shop_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`),
  ADD KEY `reviews_order_id_foreign` (`order_id`),
  ADD KEY `reviews_variation_option_id_foreign` (`variation_option_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_language_unique` (`language`);

--
-- Indexes for table `shipping_classes`
--
ALTER TABLE `shipping_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shops_owner_id_foreign` (`owner_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_type_id_foreign` (`type_id`);

--
-- Indexes for table `tax_classes`
--
ALTER TABLE `tax_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_profiles_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `user_shop`
--
ALTER TABLE `user_shop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_shop_shop_id_foreign` (`shop_id`),
  ADD KEY `user_shop_user_id_foreign` (`user_id`);

--
-- Indexes for table `variation_options`
--
ALTER TABLE `variation_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_options_product_id_foreign` (`product_id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_variation_option_id_foreign` (`variation_option_id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraws_shop_id_foreign` (`shop_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abusive_reports`
--
ALTER TABLE `abusive_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_product`
--
ALTER TABLE `attribute_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `availabilities`
--
ALTER TABLE `availabilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `balances`
--
ALTER TABLE `balances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT for table `category_shop`
--
ALTER TABLE `category_shop`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_times`
--
ALTER TABLE `delivery_times`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `digital_files`
--
ALTER TABLE `digital_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `download_tokens`
--
ALTER TABLE `download_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=880;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ordered_files`
--
ALTER TABLE `ordered_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `order_wallet_points`
--
ALTER TABLE `order_wallet_points`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_intents`
--
ALTER TABLE `payment_intents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `products_meta`
--
ALTER TABLE `products_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shipping_classes`
--
ALTER TABLE `shipping_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tax_classes`
--
ALTER TABLE `tax_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_shop`
--
ALTER TABLE `user_shop`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_options`
--
ALTER TABLE `variation_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `abusive_reports`
--
ALTER TABLE `abusive_reports`
  ADD CONSTRAINT `abusive_reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `attributes`
--
ALTER TABLE `attributes`
  ADD CONSTRAINT `attributes_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD CONSTRAINT `attribute_product_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `availabilities`
--
ALTER TABLE `availabilities`
  ADD CONSTRAINT `availabilities_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `availabilities_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `balances`
--
ALTER TABLE `balances`
  ADD CONSTRAINT `balances_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_shop`
--
ALTER TABLE `category_shop`
  ADD CONSTRAINT `category_shop_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_shop_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deposit_product`
--
ALTER TABLE `deposit_product`
  ADD CONSTRAINT `deposit_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deposit_product_resource_id_foreign` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `download_tokens`
--
ALTER TABLE `download_tokens`
  ADD CONSTRAINT `download_tokens_digital_file_id_foreign` FOREIGN KEY (`digital_file_id`) REFERENCES `digital_files` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dropoff_location_product`
--
ALTER TABLE `dropoff_location_product`
  ADD CONSTRAINT `dropoff_location_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dropoff_location_product_resource_id_foreign` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `feature_product`
--
ALTER TABLE `feature_product`
  ADD CONSTRAINT `feature_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `feature_product_resource_id_foreign` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `feedbacks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD CONSTRAINT `manufacturers_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ordered_files`
--
ALTER TABLE `ordered_files`
  ADD CONSTRAINT `ordered_files_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ordered_files_digital_file_id_foreign` FOREIGN KEY (`digital_file_id`) REFERENCES `digital_files` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ordered_files_tracking_number_foreign` FOREIGN KEY (`tracking_number`) REFERENCES `orders` (`tracking_number`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_product_variation_option_id_foreign` FOREIGN KEY (`variation_option_id`) REFERENCES `variation_options` (`id`);

--
-- Constraints for table `order_wallet_points`
--
ALTER TABLE `order_wallet_points`
  ADD CONSTRAINT `order_wallet_points_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD CONSTRAINT `payment_gateways_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_intents`
--
ALTER TABLE `payment_intents`
  ADD CONSTRAINT `payment_intents_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD CONSTRAINT `payment_methods_payment_gateway_id_foreign` FOREIGN KEY (`payment_gateway_id`) REFERENCES `payment_gateways` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `person_product`
--
ALTER TABLE `person_product`
  ADD CONSTRAINT `person_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `person_product_resource_id_foreign` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pickup_location_product`
--
ALTER TABLE `pickup_location_product`
  ADD CONSTRAINT `pickup_location_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pickup_location_product_resource_id_foreign` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_manufacturer_id_foreign` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_shipping_class_id_foreign` FOREIGN KEY (`shipping_class_id`) REFERENCES `shipping_classes` (`id`),
  ADD CONSTRAINT `products_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products_meta`
--
ALTER TABLE `products_meta`
  ADD CONSTRAINT `products_meta_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `providers`
--
ALTER TABLE `providers`
  ADD CONSTRAINT `providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `questions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `refunds`
--
ALTER TABLE `refunds`
  ADD CONSTRAINT `refunds_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refunds_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_variation_option_id_foreign` FOREIGN KEY (`variation_option_id`) REFERENCES `variation_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_shop`
--
ALTER TABLE `user_shop`
  ADD CONSTRAINT `user_shop_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_shop_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_options`
--
ALTER TABLE `variation_options`
  ADD CONSTRAINT `variation_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_variation_option_id_foreign` FOREIGN KEY (`variation_option_id`) REFERENCES `variation_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD CONSTRAINT `withdraws_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
