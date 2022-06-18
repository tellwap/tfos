-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 18, 2022 at 12:00 PM
-- Server version: 8.0.29-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scm`
--

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Kinondoni', 'T019', '2022-05-31 16:02:04', '2022-05-31 16:02:04'),
(2, 'Mpakani', 'T85864', '2022-06-01 07:37:46', '2022-06-01 07:38:13');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `details`, `created_at`, `updated_at`) VALUES
(1, 'Fast Food', 'fast food', '2022-05-31 15:55:03', '2022-05-31 15:55:03'),
(6, 'Bread Buns', 'Bread Buns', '2022-06-13 09:23:08', '2022-06-13 09:23:08'),
(7, 'Counter Cakes', 'Counter cakes details', '2022-06-13 09:25:56', '2022-06-13 09:25:56');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_05_31_183156_create_units_table', 2),
(6, '2022_05_31_184946_create_categories_table', 3),
(7, '2022_05_31_185558_create_areas_table', 4),
(8, '2022_05_31_190618_create_products_table', 5),
(9, '2014_10_12_000000_create_users_table', 6),
(10, '2022_06_06_113322_create_orders_table', 7),
(11, '2022_06_06_113337_create_order_items_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `retailer_id` int NOT NULL,
  `approved` int NOT NULL,
  `status` int NOT NULL,
  `total_amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `retailer_id`, `approved`, `status`, `total_amount`, `created_at`, `updated_at`) VALUES
(10, 1, 1, 1, 250, '2022-06-13 09:39:29', '2022-06-14 07:24:53'),
(11, 1, 1, 1, 250, '2022-06-14 05:11:58', '2022-06-14 07:24:27'),
(12, 1, 1, 1, 1000, '2022-06-14 05:12:31', '2022-06-14 07:04:20'),
(13, 1, 1, 1, 750, '2022-06-14 07:19:23', '2022-06-14 11:18:42'),
(14, 1, 0, 0, 750, '2022-06-14 11:18:16', '2022-06-14 11:18:16');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(17, 10, 37, 1, '2022-06-13 09:39:29', '2022-06-13 09:39:29'),
(18, 11, 37, 1, '2022-06-14 05:11:58', '2022-06-14 05:11:58'),
(19, 12, 37, 4, '2022-06-14 05:12:32', '2022-06-14 05:12:32'),
(20, 13, 37, 3, '2022-06-14 07:19:23', '2022-06-14 07:19:23'),
(21, 14, 37, 3, '2022-06-14 11:18:16', '2022-06-14 11:18:16');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, 'App\\Models\\User', 1, 'myapptoken', '9182348d58eaedc9df21e1903926f97cf61a0bcd31bade6e5be5e40f9a75ab67', '[\"*\"]', NULL, '2022-05-31 15:27:10', '2022-05-31 15:27:10'),
(2, 'App\\Models\\User', 4, 'myapptoken', '624e7735ebb2e5eb1950869021dfd9451d63f9190b8ff2b29245ba62c0fdf739', '[\"*\"]', NULL, '2022-06-01 18:50:06', '2022-06-01 18:50:06'),
(3, 'App\\Models\\User', 4, 'myapptoken', '4d2cee5da61c3de9ef1f6867fa037c2284e62df271f0b009ed3297ac67ccb607', '[\"*\"]', NULL, '2022-06-01 18:55:35', '2022-06-01 18:55:35'),
(4, 'App\\Models\\User', 4, 'myapptoken', 'a6ed297a9c3cb82ef653b32216be66eb4bbe940615740a0ba7138112c70a18d9', '[\"*\"]', NULL, '2022-06-01 19:00:31', '2022-06-01 19:00:31'),
(5, 'App\\Models\\User', 4, 'myapptoken', '5d41fe30341f80a24ad05f4e13100c85298bc4ce052fbf72e7f01d24fdf2749c', '[\"*\"]', NULL, '2022-06-01 19:02:30', '2022-06-01 19:02:30'),
(6, 'App\\Models\\User', 4, 'myapptoken', '9e6ca2caec5f2be75068fc6352d27ed0f7f79683fb37e746729b3139e83b846c', '[\"*\"]', NULL, '2022-06-01 19:03:36', '2022-06-01 19:03:36'),
(7, 'App\\Models\\User', 4, 'myapptoken', '40b9f55d1ba48d8d73e79e90cbddd4668601d67c00d25480546011c072e63d3a', '[\"*\"]', NULL, '2022-06-01 19:05:24', '2022-06-01 19:05:24'),
(8, 'App\\Models\\User', 4, 'myapptoken', '483f0acc54dc6b2f93ba96cf903cfb5b1679fdd2f85b63b8248c38a675a43233', '[\"*\"]', NULL, '2022-06-01 19:07:08', '2022-06-01 19:07:08'),
(9, 'App\\Models\\User', 4, 'myapptoken', '07328464850377f82798c7710d9292b8e90b3dfa39baa8cf84ffceefcdf56974', '[\"*\"]', NULL, '2022-06-02 02:14:37', '2022-06-02 02:14:37'),
(10, 'App\\Models\\User', 4, 'myapptoken', 'a983783ee2e9d24a1c1669a972baa0a66d875141a30b592dd1ede27e901c7aed', '[\"*\"]', NULL, '2022-06-02 02:22:36', '2022-06-02 02:22:36'),
(11, 'App\\Models\\User', 4, 'myapptoken', 'bb7046b21abe4cc4006dc9fcdfc9bab03e176b6ce1adc5e1b412c8bfa2c5d7bd', '[\"*\"]', NULL, '2022-06-02 02:23:34', '2022-06-02 02:23:34'),
(12, 'App\\Models\\User', 4, 'myapptoken', '72474bf382e45e99b86c426e512be636a81caf35a3405e5f8a6b30e0f9564c97', '[\"*\"]', NULL, '2022-06-02 02:29:20', '2022-06-02 02:29:20'),
(13, 'App\\Models\\User', 4, 'myapptoken', '84e456b6008733fcfde91ee86d30aea3e0cc25c56ae45f25dd7142959b40488a', '[\"*\"]', NULL, '2022-06-02 02:37:39', '2022-06-02 02:37:39'),
(14, 'App\\Models\\User', 4, 'myapptoken', '6d3802cf3301916847b5ab910f204ca3e7f241a1b0bb3b14e0fdd7fc4446bc6d', '[\"*\"]', NULL, '2022-06-02 02:38:58', '2022-06-02 02:38:58'),
(15, 'App\\Models\\User', 4, 'myapptoken', '0d5dc3fa40f4f61953531e8abcb4e4ddf95f061722073b4cb9cbb4001fc3d36c', '[\"*\"]', NULL, '2022-06-02 02:42:39', '2022-06-02 02:42:39'),
(16, 'App\\Models\\User', 4, 'myapptoken', '257bb3b1091c6326928c6df99a030f149c7a740ed932d3b530b632d662f1dd3f', '[\"*\"]', NULL, '2022-06-02 02:43:37', '2022-06-02 02:43:37'),
(17, 'App\\Models\\User', 5, 'myapptoken', '495671e8829fd449abfbdccf0e4a0a122281a522dc424e0eccc34873b5a8c5b0', '[\"*\"]', NULL, '2022-06-02 02:46:50', '2022-06-02 02:46:50'),
(18, 'App\\Models\\User', 4, 'myapptoken', '5dd21cb35cc3124dbcabdaf4b46f32598b828164deab92fc2d69062117461bfe', '[\"*\"]', NULL, '2022-06-02 02:50:41', '2022-06-02 02:50:41'),
(19, 'App\\Models\\User', 4, 'myapptoken', '6b716a5b79f94967322f8511a0b26e2ca518f7755c51c27110747c244782334f', '[\"*\"]', NULL, '2022-06-02 02:52:46', '2022-06-02 02:52:46'),
(20, 'App\\Models\\User', 4, 'myapptoken', 'e1e26b523af0c3890a254bd806a23b6c8336c718f032d37aa8bb00ab518d6a02', '[\"*\"]', NULL, '2022-06-02 03:05:16', '2022-06-02 03:05:16'),
(21, 'App\\Models\\User', 6, 'myapptoken', 'b5bf17a8822b7d587f6d6c395be9e0324c738fb1560183a9d8b37e6622702b8c', '[\"*\"]', NULL, '2022-06-02 03:09:50', '2022-06-02 03:09:50'),
(22, 'App\\Models\\User', 6, 'myapptoken', '4ba32f631b955ffaa18db48c7612933b5f73eda4034235f81ae2550d86920aea', '[\"*\"]', NULL, '2022-06-02 03:44:10', '2022-06-02 03:44:10'),
(23, 'App\\Models\\User', 6, 'myapptoken', 'a4a865e8560bc29c804c2408617aff815f2afce5f21ee54009aa526cde0ce9f9', '[\"*\"]', NULL, '2022-06-06 08:26:08', '2022-06-06 08:26:08'),
(24, 'App\\Models\\User', 6, 'myapptoken', 'a5b07cbada70de320e0177cf9f9a50763d0fadf98488d0ab6bd1d60998b88453', '[\"*\"]', NULL, '2022-06-06 09:06:22', '2022-06-06 09:06:22'),
(25, 'App\\Models\\User', 6, 'myapptoken', '8e7aed93dd773ed6ec9fff8d4c3ec17a9a05b0d42afe506b060b2918a11c7f69', '[\"*\"]', NULL, '2022-06-06 09:48:49', '2022-06-06 09:48:49'),
(26, 'App\\Models\\User', 6, 'myapptoken', '1f5a826071d53621a37c2e0eb45a036a7dc32e4d531ab9b660eba2100ffc7958', '[\"*\"]', NULL, '2022-06-07 10:40:11', '2022-06-07 10:40:11'),
(27, 'App\\Models\\User', 6, 'myapptoken', '275f16347b3baa34755763fa1b6258af3b413656afa10b71d8564a9f5fe8876f', '[\"*\"]', NULL, '2022-06-07 10:59:25', '2022-06-07 10:59:25'),
(28, 'App\\Models\\User', 6, 'myapptoken', 'c5da572b7f5072804c6112f0f5b3851d172b0d4d0afca29a6ba663e9efc19479', '[\"*\"]', NULL, '2022-06-07 17:47:47', '2022-06-07 17:47:47'),
(29, 'App\\Models\\User', 4, 'myapptoken', 'c5568f9db54a1a2fb4e4ea0bdb5d84858e6aa18e851ac8d908d926b2a9245e2a', '[\"*\"]', NULL, '2022-06-08 02:16:19', '2022-06-08 02:16:19'),
(30, 'App\\Models\\User', 4, 'myapptoken', '8741c438cbb623e67061c2ae7e4085c6be0b77707f12131992c3330ec697f1c9', '[\"*\"]', NULL, '2022-06-08 03:28:54', '2022-06-08 03:28:54'),
(31, 'App\\Models\\User', 4, 'myapptoken', '2b8022919762f8413fdbf276d293b6fd4608bcdda79cb8d7dd1d9b96a8b57842', '[\"*\"]', NULL, '2022-06-08 04:02:08', '2022-06-08 04:02:08'),
(32, 'App\\Models\\User', 4, 'myapptoken', '96cb64f7b000c66bfc574969e8d325b4da990fc1262221c8cbefe92a96c6d2c7', '[\"*\"]', NULL, '2022-06-10 07:29:26', '2022-06-10 07:29:26'),
(33, 'App\\Models\\User', 4, 'myapptoken', '438cb7db3ea3348c643716ad731270020940f7e4d2369b4ed85185e9387cec1f', '[\"*\"]', NULL, '2022-06-10 08:46:05', '2022-06-10 08:46:05'),
(34, 'App\\Models\\User', 4, 'myapptoken', '27f05d07c33ee5307d0e9237c67a5fbecf6b8b41ba65cb8e0eece0d28c059621', '[\"*\"]', NULL, '2022-06-10 08:56:46', '2022-06-10 08:56:46'),
(35, 'App\\Models\\User', 4, 'myapptoken', 'eaa022e92e68d9653df3e25eda948b783b6d603de038bcc2897e48d8a6f5e0d8', '[\"*\"]', NULL, '2022-06-10 09:04:43', '2022-06-10 09:04:43'),
(36, 'App\\Models\\User', 4, 'myapptoken', 'c01d426528c6304882074b6a740d1e84899e338cfc13b2f2b46a2cf1da435be4', '[\"*\"]', NULL, '2022-06-10 09:44:53', '2022-06-10 09:44:53'),
(37, 'App\\Models\\User', 6, 'myapptoken', '46d0ddfca7b500c72e43bb99e1f6c2675d5679848c5d18730b68f5830857ecd4', '[\"*\"]', NULL, '2022-06-10 09:46:44', '2022-06-10 09:46:44'),
(38, 'App\\Models\\User', 4, 'myapptoken', 'a7080b694189679e4e0917a4306ac44efb37fe942a8d7c1cf010e942bf996364', '[\"*\"]', NULL, '2022-06-10 09:50:51', '2022-06-10 09:50:51'),
(39, 'App\\Models\\User', 9, 'myapptoken', '40044fe615ae467bb4423de433eab9e4d30299626a04b04ce29c5dfa26bc541a', '[\"*\"]', NULL, '2022-06-10 09:52:04', '2022-06-10 09:52:04'),
(40, 'App\\Models\\User', 6, 'myapptoken', 'babe744b3037d7b139fdecdc5c379cf672db71fe171d11ab282278790c9ffb1e', '[\"*\"]', NULL, '2022-06-10 09:56:03', '2022-06-10 09:56:03'),
(41, 'App\\Models\\User', 6, 'myapptoken', '72cce157c74bc35e9277bf869520a0ad8b75bbcf6e9058e7c168fbb1b3eb369d', '[\"*\"]', NULL, '2022-06-10 10:26:53', '2022-06-10 10:26:53'),
(42, 'App\\Models\\User', 6, 'myapptoken', '4b59b11ba3ea6ac965e1ad2776339ce4cd2b84b8127fb64193ecd96fcc4f4f40', '[\"*\"]', NULL, '2022-06-10 10:53:57', '2022-06-10 10:53:57'),
(43, 'App\\Models\\User', 4, 'myapptoken', 'c5516c8055de59a9438c445c7498c51b9f35aee50fa91dd97a81cdfd2d694577', '[\"*\"]', NULL, '2022-06-11 04:36:00', '2022-06-11 04:36:00'),
(44, 'App\\Models\\User', 4, 'myapptoken', '4088e165e60f4ff7ce9452197ce51d9c9aaac5fe5ca36984328e86ac037ecd37', '[\"*\"]', NULL, '2022-06-11 05:13:04', '2022-06-11 05:13:04'),
(45, 'App\\Models\\User', 4, 'myapptoken', 'ec5faf0e03f3f6e026f95f5ff6aa67bc48efa678107834df8b6716591a18ca60', '[\"*\"]', NULL, '2022-06-11 05:34:37', '2022-06-11 05:34:37'),
(46, 'App\\Models\\User', 4, 'myapptoken', '2b51145d6ac091e437e7f6a2a7fb8770da33d0650e39838af223e9e1d86e7012', '[\"*\"]', NULL, '2022-06-11 05:41:09', '2022-06-11 05:41:09'),
(47, 'App\\Models\\User', 4, 'myapptoken', '0477fd11b2d1f9e92ef5893caaf1fbf09fd0cc7eb4bc24369558d75cf176c634', '[\"*\"]', NULL, '2022-06-11 05:46:57', '2022-06-11 05:46:57'),
(48, 'App\\Models\\User', 4, 'myapptoken', '209576812ac697085453b840686a6b2600b49cd60fdcde35344aafba51c04d67', '[\"*\"]', NULL, '2022-06-11 05:54:27', '2022-06-11 05:54:27'),
(49, 'App\\Models\\User', 4, 'myapptoken', '2cca5954fee2cc4041e4d33227728f10c3cc9da9cea83d9fa6b270eb2c22e85c', '[\"*\"]', NULL, '2022-06-11 05:58:59', '2022-06-11 05:58:59'),
(50, 'App\\Models\\User', 4, 'myapptoken', '203bc9c47a7e74ab3175a6f16cfb3800752ca7d0305da43fc8089b5741690c71', '[\"*\"]', NULL, '2022-06-11 06:03:07', '2022-06-11 06:03:07'),
(51, 'App\\Models\\User', 4, 'myapptoken', '9b4cf6787c1ae8aea7ff615f91f9c2347f016fcea82fd9b3c8e53f4b1168ea1a', '[\"*\"]', NULL, '2022-06-12 09:04:45', '2022-06-12 09:04:45'),
(52, 'App\\Models\\User', 4, 'myapptoken', 'f96c75be466b606de66bf87f64f5fc54dc122787b0f9f1b800ec390482e82722', '[\"*\"]', NULL, '2022-06-13 09:12:08', '2022-06-13 09:12:08'),
(53, 'App\\Models\\User', 4, 'myapptoken', 'ba8e6616e7319f6d11800b47537a3d2643f8aba89b877d5fe0beaf4f42e400ed', '[\"*\"]', NULL, '2022-06-13 09:12:16', '2022-06-13 09:12:16'),
(54, 'App\\Models\\User', 4, 'myapptoken', '333603942789441d0ac2726f66742ee1a66c69ce745d741d7c54522c0d9d65c7', '[\"*\"]', NULL, '2022-06-13 09:18:34', '2022-06-13 09:18:34'),
(55, 'App\\Models\\User', 4, 'myapptoken', '5da61673605ea44a6d61705393f0a2777aad67d183eedebf5b790d1bcd91633c', '[\"*\"]', NULL, '2022-06-13 09:29:07', '2022-06-13 09:29:07'),
(56, 'App\\Models\\User', 10, 'myapptoken', '2abd9a7b22cc27671ed2a8175adfa14591c1fb29f0dd726a6914452485cc3bb5', '[\"*\"]', NULL, '2022-06-13 09:38:06', '2022-06-13 09:38:06'),
(57, 'App\\Models\\User', 2, 'myapptoken', '24c084be8441c5a0b95eb5c6e58198738c7a5fdf43d1f6354e1250b514454eb6', '[\"*\"]', NULL, '2022-06-13 09:48:16', '2022-06-13 09:48:16'),
(58, 'App\\Models\\User', 4, 'myapptoken', '7f2392ae301f95295d558937d61edb2cf1a21a1a2616400b0f1d7ad5ffee0cfe', '[\"*\"]', NULL, '2022-06-14 04:33:04', '2022-06-14 04:33:04'),
(59, 'App\\Models\\User', 6, 'myapptoken', '90af0d2f82501b604d848102b480bb939109d831ae8b38b70a4ddd3264103547', '[\"*\"]', NULL, '2022-06-14 04:33:46', '2022-06-14 04:33:46'),
(60, 'App\\Models\\User', 6, 'myapptoken', 'c16831b2477fa74c864ce8e19df575a11bf3de2573f37e9b37ace68fe0413e97', '[\"*\"]', NULL, '2022-06-14 05:00:15', '2022-06-14 05:00:15'),
(61, 'App\\Models\\User', 6, 'myapptoken', '6df3c9ffe8e8fb58194dc77a241faa616d6de94982234a60fbc87851b57cf56c', '[\"*\"]', NULL, '2022-06-14 05:06:29', '2022-06-14 05:06:29'),
(62, 'App\\Models\\User', 4, 'myapptoken', '0d05ba743ae902a72c13ba30a5f4684c01ff39dffdcae5556aa652b8b0767725', '[\"*\"]', NULL, '2022-06-14 05:13:07', '2022-06-14 05:13:07'),
(63, 'App\\Models\\User', 2, 'myapptoken', '472935add71294ea8dbd4fe4ac6ed5b1a94d60c279cd71487a75c11162f9700c', '[\"*\"]', NULL, '2022-06-14 05:20:03', '2022-06-14 05:20:03'),
(64, 'App\\Models\\User', 4, 'myapptoken', '4de22c7a739b63c15cd5cb1699f752519e2ea33aaeba7144006fd4bd0f9dc470', '[\"*\"]', NULL, '2022-06-14 06:21:39', '2022-06-14 06:21:39'),
(65, 'App\\Models\\User', 2, 'myapptoken', '47eac85283be62ddbda8cefdc94e6eba42ae5bc5179249c356e468ca9b359f42', '[\"*\"]', NULL, '2022-06-14 06:22:16', '2022-06-14 06:22:16'),
(66, 'App\\Models\\User', 2, 'myapptoken', 'd934f364ca32f600c5e098762e24d7a4d61156cdfd24a89699f7772c8436fb3d', '[\"*\"]', NULL, '2022-06-14 07:03:40', '2022-06-14 07:03:40'),
(67, 'App\\Models\\User', 6, 'myapptoken', 'f4c10cd9d31cef4403c25eab0483316688d840b8f20a8da9f2dfdcb7bc1d1069', '[\"*\"]', NULL, '2022-06-14 07:05:10', '2022-06-14 07:05:10'),
(68, 'App\\Models\\User', 2, 'myapptoken', '65df49c08b6f02cc2ce54db2f506c95f80782816b482c10ed1210fd29ca3bfea', '[\"*\"]', NULL, '2022-06-14 07:24:06', '2022-06-14 07:24:06'),
(69, 'App\\Models\\User', 4, 'myapptoken', '37b351bd1b2891ed456602bb0eecb36deefa7fdc149eba0d23250895a1162d63', '[\"*\"]', NULL, '2022-06-14 09:23:26', '2022-06-14 09:23:26'),
(70, 'App\\Models\\User', 2, 'myapptoken', '51d71a03777b5614fe53f3fbf6e51cd2a54049deb3f518713d8ddb96bda1cff2', '[\"*\"]', NULL, '2022-06-14 09:24:24', '2022-06-14 09:24:24'),
(71, 'App\\Models\\User', 2, 'myapptoken', '1f130255999af2016f59ef8dd7c6e2f88fd3032318a7a66fea243f97f18596c0', '[\"*\"]', NULL, '2022-06-14 09:41:48', '2022-06-14 09:41:48'),
(72, 'App\\Models\\User', 2, 'myapptoken', 'cd16fa4ac4cac4ce81d1fb9060632561012473ac6cfa1c431fe88f5376676cde', '[\"*\"]', NULL, '2022-06-14 10:08:30', '2022-06-14 10:08:30'),
(73, 'App\\Models\\User', 2, 'myapptoken', '01db216bd73b27f6274252185759e68013fec683977f41f17a8e9b600ee9d6c0', '[\"*\"]', NULL, '2022-06-14 10:09:51', '2022-06-14 10:09:51'),
(74, 'App\\Models\\User', 2, 'myapptoken', '31d09d75c1ad97759b8445115eb569524d36b6d02070c4e7e37ed69f61dfb7da', '[\"*\"]', NULL, '2022-06-14 10:32:50', '2022-06-14 10:32:50'),
(75, 'App\\Models\\User', 4, 'myapptoken', '8e32727c4e0ece18fa060c0eed450ed7bf8284a1e3b52e6e19717f6d42a9eee9', '[\"*\"]', NULL, '2022-06-14 10:44:50', '2022-06-14 10:44:50'),
(76, 'App\\Models\\User', 2, 'myapptoken', '32b6938e88e595f8b0bf26ec300a4498d82f69b56c219b791a28a6720d2dd7da', '[\"*\"]', NULL, '2022-06-14 11:07:48', '2022-06-14 11:07:48'),
(77, 'App\\Models\\User', 6, 'myapptoken', '7b3288bb8504cac65be0af2d80afd2f7ace68102ad7ceb83039eee56f284eb05', '[\"*\"]', NULL, '2022-06-14 11:14:54', '2022-06-14 11:14:54'),
(78, 'App\\Models\\User', 2, 'myapptoken', '216cdea0fb2d5241c85c4be49259ad029bee3c55ac1209c77d5c80b9b0037401', '[\"*\"]', NULL, '2022-06-14 11:18:35', '2022-06-14 11:18:35'),
(79, 'App\\Models\\User', 6, 'myapptoken', 'dabfedafdf4261629c5f84c2d7b4e3fa87cb7e753f9a25da567d6683487d86f2', '[\"*\"]', NULL, '2022-06-14 11:19:27', '2022-06-14 11:19:27'),
(80, 'App\\Models\\User', 2, 'myapptoken', '767d5d04251c9737a8f8c04c585158927aaf8c733f566f70ba553c10142de027', '[\"*\"]', NULL, '2022-06-14 15:17:32', '2022-06-14 15:17:32');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `unit_id` int NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `quantity` int NOT NULL,
  `stock` tinyint(1) NOT NULL DEFAULT '1',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `unit_id`, `price`, `quantity`, `stock`, `description`, `created_at`, `updated_at`) VALUES
(37, 'Butter Puff', 1, 6, '250', 111, 1, 'Description of product', '2022-06-13 09:34:04', '2022-06-14 10:28:31');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `details`, `created_at`, `updated_at`) VALUES
(1, 'KG', 'Kilogram', '2022-05-31 15:46:59', '2022-05-31 15:48:17'),
(6, 'PACK', 'Package', '2022-06-01 02:58:56', '2022-06-01 02:58:56'),
(8, 'Ml', 'Mills', '2022-06-01 03:45:26', '2022-06-01 03:45:47'),
(10, 'LTR', 'Litre', '2022-06-13 09:20:18', '2022-06-13 09:20:18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `phone_number`, `address`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'chami', 'chami@epimac.tech', 'manufacture', '0766073149', 'Kijitonya Dar es salaam', NULL, '$2y$10$hHY4Tpi0.bFFBYS4mFl5geYhxsTMVXcM7JidGRvjADmtFxrpbHp9K', NULL, '2022-06-01 14:56:24', '2022-06-01 14:56:24'),
(2, 'Manufacture', 'manufacture@gmail.com', 'manufacture', '0766073149', 'Mabatini, Dar es salaam', NULL, '$2y$10$T955fEifrLn.ScHIj6Wjvu31vlcJieviKhHGnuIguCXrSd0wFveke', NULL, '2022-06-01 16:59:28', '2022-06-01 16:59:28'),
(3, 'Distributor', 'distributor@scm.com', 'distributor', '0766073149', 'Mabatini, Dar es salaam', NULL, '$2y$10$A81eVgN.tIu7mSBrU5K4/uy5jr0IwFK9KU7l6k2/sElsf6Cy0tA9O', NULL, '2022-06-01 17:17:15', '2022-06-01 17:17:15'),
(4, 'chami epimac', 'chami@epimac.com', 'admin', '7549504', 'Kijitonyama', NULL, '$2y$10$.fbCWOBcAItIBh9C.LeNMePX.1FIWFrt0DS86y3aKB5rTcaj3lqJa', NULL, '2022-06-01 18:49:34', '2022-06-01 18:49:34'),
(5, 'Manufacture One', 'manufacture@scm.com', 'manufacture', '0764546374644', 'Manufacture address', NULL, '$2y$10$W5oKOhk2pu1t3C5DoZdfteJSMpUgj0xf.7ANe4Ie6k95VV9ckGT6a', NULL, '2022-06-02 02:45:11', '2022-06-02 02:45:11'),
(6, 'Retailer One', 'retailer@scm.com', 'retailer', '09877766677', 'Retailer address', NULL, '$2y$10$vEarYrx7b5Pulad.jYAmQeUs/H9uwo/AqaQBUuVeHuzmgG9YcIb7i', NULL, '2022-06-02 03:01:52', '2022-06-02 03:01:52'),
(7, 'Test reta', 'testretailer@scm.com', 'retailer', '0000000000', 'address', NULL, '$2y$10$7cevZz8n9rHKRZqZepZDIeZ3fnyTbQ6ejqxz.AuSrBXhh4aaAE8nK', NULL, '2022-06-10 09:01:24', '2022-06-10 09:01:24'),
(8, 'test', 'testt@manu.com', 'manufacture', '09876890', 'Mabatini', NULL, '$2y$10$90yVhJgFQqMzts.Ib2K6Ju/S3LxlR4iWwzUOQxZu8i3UrVxppKYzW', NULL, '2022-06-10 09:22:41', '2022-06-10 09:22:41'),
(9, 'Manufacture', 'm@scm.com', 'manufacture', '08989898', 'Dar es salaam', NULL, '$2y$10$D6E4FTQV9DyG5wK02/R4QOhOolsa46ZA4EwM2HHEDavsClBSlHyo.', NULL, '2022-06-10 09:51:43', '2022-06-10 09:51:43'),
(10, 'Sophie', 'soph@gmail.com', 'retailer', '074467543', 'Mabatini Police', NULL, '$2y$10$B/lJnbezNijyN1eE9dSbjuR9V.tLEekAEyv4M1l.g2YM14kqrSsrC', NULL, '2022-06-13 09:37:07', '2022-06-13 09:37:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
