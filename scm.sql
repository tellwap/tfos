-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 28, 2022 at 03:32 PM
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
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `retailer_id` int NOT NULL,
  `approved` int NOT NULL,
  `status` int NOT NULL,
  `distributor_id` int DEFAULT NULL,
  `total_amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `retailer_id`, `approved`, `status`, `distributor_id`, `total_amount`, `created_at`, `updated_at`) VALUES
(10, 1, 1, 1, 0, 250, '2022-06-13 09:39:29', '2022-06-14 07:24:53'),
(11, 1, 1, 1, 0, 250, '2022-06-14 05:11:58', '2022-06-14 07:24:27'),
(12, 1, 1, 1, 0, 1000, '2022-06-14 05:12:31', '2022-06-14 07:04:20'),
(13, 1, 1, 1, 0, 750, '2022-06-14 07:19:23', '2022-06-14 11:18:42'),
(14, 1, 1, 1, 0, 750, '2022-06-14 11:18:16', '2022-06-23 07:46:50'),
(15, 1, 0, 0, 1, 31998, '2022-06-23 06:40:18', '2022-06-23 06:40:18'),
(16, 1, 0, 0, 2, 26000, '2022-06-23 07:52:31', '2022-06-23 15:55:22'),
(17, 1, 1, 1, 3, 31998, '2022-06-23 07:54:15', '2022-06-23 16:02:15'),
(18, 1, 1, 1, 3, 23000, '2022-06-23 16:05:05', '2022-06-23 16:06:52'),
(19, 6, 1, 1, 3, 23000, '2022-06-24 05:27:33', '2022-06-24 05:29:59'),
(20, 6, 0, 0, NULL, 23000, '2022-06-24 05:56:23', '2022-06-24 05:56:23');

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
(17, 10, 1, 1, '2022-06-13 09:39:29', '2022-06-13 09:39:29'),
(18, 11, 1, 1, '2022-06-14 05:11:58', '2022-06-14 05:11:58'),
(19, 12, 2, 4, '2022-06-14 05:12:32', '2022-06-14 05:12:32'),
(20, 13, 1, 3, '2022-06-14 07:19:23', '2022-06-14 07:19:23'),
(21, 14, 1, 3, '2022-06-14 11:18:16', '2022-06-14 11:18:16'),
(22, 15, 4, 1, '2022-06-23 06:40:18', '2022-06-23 06:40:18'),
(23, 15, 3, 2, '2022-06-23 06:40:19', '2022-06-23 06:40:19'),
(24, 16, 5, 2, '2022-06-23 07:52:32', '2022-06-23 07:52:32'),
(25, 16, 4, 1, '2022-06-23 07:52:32', '2022-06-23 07:52:32'),
(26, 17, 4, 1, '2022-06-23 07:54:15', '2022-06-23 07:54:15'),
(27, 17, 3, 2, '2022-06-23 07:54:15', '2022-06-23 07:54:15'),
(28, 18, 5, 1, '2022-06-23 16:05:06', '2022-06-23 16:05:06'),
(29, 18, 4, 1, '2022-06-23 16:05:06', '2022-06-23 16:05:06'),
(30, 19, 5, 1, '2022-06-24 05:27:33', '2022-06-24 05:27:33'),
(31, 19, 4, 1, '2022-06-24 05:27:33', '2022-06-24 05:27:33'),
(32, 20, 5, 1, '2022-06-24 05:56:23', '2022-06-24 05:56:23'),
(33, 20, 4, 1, '2022-06-24 05:56:24', '2022-06-24 05:56:24');

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
(80, 'App\\Models\\User', 2, 'myapptoken', '767d5d04251c9737a8f8c04c585158927aaf8c733f566f70ba553c10142de027', '[\"*\"]', NULL, '2022-06-14 15:17:32', '2022-06-14 15:17:32'),
(81, 'App\\Models\\User', 2, 'myapptoken', 'c22936a88ec70f121806bafe4028b09674de8fd21273ef7565039987ef044279', '[\"*\"]', NULL, '2022-06-22 04:19:27', '2022-06-22 04:19:27'),
(82, 'App\\Models\\User', 4, 'myapptoken', '207b030cf50b95a43a5239dbbf27a369eff50e041a317d57ea0b04b8c82ff997', '[\"*\"]', NULL, '2022-06-22 04:22:14', '2022-06-22 04:22:14'),
(83, 'App\\Models\\User', 6, 'myapptoken', '8ade22e658293aac966346179fff96576521f5a3dba2e206e49f906d3e9e8b3d', '[\"*\"]', NULL, '2022-06-22 04:24:28', '2022-06-22 04:24:28'),
(84, 'App\\Models\\User', 2, 'myapptoken', '4c4d76a90b4b6c8c7b9db777c19f7eb209f228da97607bbc94413bc1d1cd3f73', '[\"*\"]', NULL, '2022-06-22 06:55:29', '2022-06-22 06:55:29'),
(85, 'App\\Models\\User', 2, 'myapptoken', '9e5ae113f7f74ff90ba375c893ab6eaebb96ff727445b543a0269b78ad158f67', '[\"*\"]', NULL, '2022-06-22 07:29:22', '2022-06-22 07:29:22'),
(86, 'App\\Models\\User', 2, 'myapptoken', '2941d80d5db50154c887b23b0b363004042b50bf64962b39c530fcb72d261bfe', '[\"*\"]', NULL, '2022-06-23 04:51:32', '2022-06-23 04:51:32'),
(87, 'App\\Models\\User', 2, 'myapptoken', '370c5e7bad8c11f4d0680d0d3b106357046568f91b77a17bff58085829a8b16e', '[\"*\"]', NULL, '2022-06-23 05:58:10', '2022-06-23 05:58:10'),
(88, 'App\\Models\\User', 6, 'myapptoken', '7f5dca93018fad6204a92e2871f85b37a54098fe05026b277a2a932694adb2bb', '[\"*\"]', NULL, '2022-06-23 06:01:28', '2022-06-23 06:01:28'),
(89, 'App\\Models\\User', 6, 'myapptoken', 'de4e633130cc9997a9ffded4d680010dece7684adaf91b7348dddaaa9698b2b5', '[\"*\"]', NULL, '2022-06-23 06:39:51', '2022-06-23 06:39:51'),
(90, 'App\\Models\\User', 2, 'myapptoken', '669342976f036ab6952c5ce52ccb1d9467b6fa7fc3291efe476a3c6280c0f325', '[\"*\"]', NULL, '2022-06-23 06:40:56', '2022-06-23 06:40:56'),
(91, 'App\\Models\\User', 2, 'myapptoken', '2e52643c7ec16a567a1e210ea3e0af39e7649143295a70e6da2efbe49f090a5d', '[\"*\"]', NULL, '2022-06-23 07:32:10', '2022-06-23 07:32:10'),
(92, 'App\\Models\\User', 2, 'myapptoken', 'bc4d0b079049010e854334d60a022dd0335c98086366b09cbc3aa7db999a12b0', '[\"*\"]', NULL, '2022-06-23 07:37:17', '2022-06-23 07:37:17'),
(93, 'App\\Models\\User', 2, 'myapptoken', '0bae1eb812b6a6ed29902405a1dcc975ef9a13c1f00ea083a49d0e0b1030ed16', '[\"*\"]', NULL, '2022-06-23 07:47:42', '2022-06-23 07:47:42'),
(94, 'App\\Models\\User', 6, 'myapptoken', 'de2480e109f223d2bbc5bbff05058ce4cd271206583b229335a1b6f2a19f93f5', '[\"*\"]', NULL, '2022-06-23 07:51:52', '2022-06-23 07:51:52'),
(95, 'App\\Models\\User', 2, 'myapptoken', '34b1fbdb2b4d3518ce8f67ed6e112152eccfc4691ced09802bea9a098dd71888', '[\"*\"]', NULL, '2022-06-23 08:00:13', '2022-06-23 08:00:13'),
(96, 'App\\Models\\User', 4, 'myapptoken', '6bf0750dbf9ff10a2b64d45184e53ccdbe82bb49d200a2b1675971b454cbba34', '[\"*\"]', NULL, '2022-06-23 08:05:44', '2022-06-23 08:05:44'),
(97, 'App\\Models\\User', 2, 'myapptoken', '2883265a77c967e2d3843ccca42ecaddbe4da6f34ece1f91df4fdd050bb11f09', '[\"*\"]', NULL, '2022-06-23 09:36:34', '2022-06-23 09:36:34'),
(98, 'App\\Models\\User', 2, 'myapptoken', '4370279c67a17ebcf93e429de5c7159679e6b6a0b6e7b144e278505e542e942c', '[\"*\"]', NULL, '2022-06-23 15:05:42', '2022-06-23 15:05:42'),
(99, 'App\\Models\\User', 2, 'myapptoken', 'f4d9c1dc209cbd781278987208199d7f32de212b4473828d61854c6810376f64', '[\"*\"]', NULL, '2022-06-23 15:43:58', '2022-06-23 15:43:58'),
(100, 'App\\Models\\User', 2, 'myapptoken', '3710d5f821f98cd8929253943940268aff8106f8f0fd6ddc48f13c92bb058793', '[\"*\"]', NULL, '2022-06-23 15:47:26', '2022-06-23 15:47:26'),
(101, 'App\\Models\\User', 6, 'myapptoken', '3ee5d03881fbc6b4d68fd02d9cee1eb0109a96eb728a214bbec13000965c359d', '[\"*\"]', NULL, '2022-06-23 16:03:12', '2022-06-23 16:03:12'),
(102, 'App\\Models\\User', 2, 'myapptoken', '92fbc98d59fa0c2f8fb25450f04c24130abc74d201d2e37d2f84eb429e862b68', '[\"*\"]', NULL, '2022-06-23 16:06:35', '2022-06-23 16:06:35'),
(103, 'App\\Models\\User', 3, 'myapptoken', '7775774d4070a0624789bf0774e25ad396303a994c99f53a0aa3660cd2f378a3', '[\"*\"]', NULL, '2022-06-23 16:11:04', '2022-06-23 16:11:04'),
(104, 'App\\Models\\User', 2, 'myapptoken', '528152d56e55720fc0806d86f38b652677eac0ffd100afa677ddc1c144f81354', '[\"*\"]', NULL, '2022-06-23 16:21:32', '2022-06-23 16:21:32'),
(105, 'App\\Models\\User', 3, 'myapptoken', '381ed730e6bf473a8c995873789876bc2fe9aeae18470bb073938a2490612f16', '[\"*\"]', NULL, '2022-06-23 16:29:46', '2022-06-23 16:29:46'),
(106, 'App\\Models\\User', 2, 'myapptoken', 'cbd075c2a1115a0ef623c93de6293e1050bc9c742d488df0d5132faf2e978ab8', '[\"*\"]', NULL, '2022-06-24 04:29:51', '2022-06-24 04:29:51'),
(107, 'App\\Models\\User', 3, 'myapptoken', '3b5cb7265da0f81683cdfd77d4598a658f53856ac25e7d4a033c4009e6ac37a4', '[\"*\"]', NULL, '2022-06-24 04:31:56', '2022-06-24 04:31:56'),
(108, 'App\\Models\\User', 2, 'myapptoken', 'b0fbce0d0bfc1c463f9b74af2aa0f72ff8bb983ea318a6f796ec4bac37fd2d0d', '[\"*\"]', NULL, '2022-06-24 05:01:42', '2022-06-24 05:01:42'),
(109, 'App\\Models\\User', 3, 'myapptoken', 'c3c34c45ba22698d79ebf16c3373fc500aa54a71f3431a7ec00d21fbb9b82510', '[\"*\"]', '2022-06-24 05:08:20', '2022-06-24 05:02:17', '2022-06-24 05:08:20'),
(110, 'App\\Models\\User', 3, 'myapptoken', 'f3b86755e14287c756941d23db1e9732958f9e6d0b679aeb2685def9a3114ee8', '[\"*\"]', '2022-06-24 05:11:15', '2022-06-24 05:09:05', '2022-06-24 05:11:15'),
(111, 'App\\Models\\User', 2, 'myapptoken', 'ec24fd9874af36b09b1134f1088d83263ef16ac9c5e2a034131b4795075b27a0', '[\"*\"]', NULL, '2022-06-24 05:11:22', '2022-06-24 05:11:22'),
(112, 'App\\Models\\User', 3, 'myapptoken', '6d942dae75044571a62dab55f4a92f07392604f9121b0649e076a192fba0a447', '[\"*\"]', '2022-06-24 05:12:50', '2022-06-24 05:12:33', '2022-06-24 05:12:50'),
(113, 'App\\Models\\User', 2, 'myapptoken', 'fcc689f2f7bdf0fb1a444bfbad06b238868ca0d78b0279b4672aa51ace055a61', '[\"*\"]', NULL, '2022-06-24 05:13:10', '2022-06-24 05:13:10'),
(114, 'App\\Models\\User', 6, 'myapptoken', '078aac20f8af7c7e7b17e6aa3f1bdcecbd563f15f716eb689fab02da244f4d83', '[\"*\"]', '2022-06-24 05:29:24', '2022-06-24 05:14:05', '2022-06-24 05:29:24'),
(115, 'App\\Models\\User', 2, 'myapptoken', '1e2cfe8f7b67774de2542b576acb3594e4bd0413c19b1ae5325d57e62976d468', '[\"*\"]', '2022-06-24 05:41:01', '2022-06-24 05:29:41', '2022-06-24 05:41:01'),
(116, 'App\\Models\\User', 4, 'myapptoken', '17dead3ea47dcb9ccd8191921777b1d2a5ecbaaa99d77d5ecb8a69576c467a2d', '[\"*\"]', NULL, '2022-06-24 05:41:37', '2022-06-24 05:41:37'),
(117, 'App\\Models\\User', 2, 'myapptoken', '846fabc3aec3c52bd522b11613ece727575e385756fee9e21baacec40fbee0ae', '[\"*\"]', NULL, '2022-06-24 05:42:17', '2022-06-24 05:42:17'),
(118, 'App\\Models\\User', 6, 'myapptoken', 'b2d7ddfac2cd7e70b58fe1a562c113f5c761f274a32148011a98867fe198aa47', '[\"*\"]', '2022-06-24 05:56:46', '2022-06-24 05:42:46', '2022-06-24 05:56:46'),
(119, 'App\\Models\\User', 2, 'myapptoken', 'f697c424bbda931c04a327555d5b6aff384cd1e1d8141786040566ab0b590436', '[\"*\"]', '2022-06-24 05:59:10', '2022-06-24 05:58:09', '2022-06-24 05:59:10'),
(120, 'App\\Models\\User', 6, 'myapptoken', '99f262004276f3e58364921d91213fc382d3c395f23f1012d92cb600d3885171', '[\"*\"]', '2022-06-24 06:01:10', '2022-06-24 06:01:06', '2022-06-24 06:01:10'),
(121, 'App\\Models\\User', 6, 'myapptoken', '39946e89a6024fe284c5ba6d61b95d2496604f5afa37cbaeb6e1abb695097e76', '[\"*\"]', '2022-06-24 06:19:37', '2022-06-24 06:09:57', '2022-06-24 06:19:37');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `category_id` int NOT NULL,
  `unit_id` int NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int NOT NULL,
  `stock` tinyint(1) NOT NULL DEFAULT '1',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `category_id`, `unit_id`, `price`, `quantity`, `stock`, `description`, `created_at`, `updated_at`) VALUES
(1, 'name of', '202206230849Screenshot_1655882460.png', 1, 1, '5999.00', 23, 1, 'desc', '2022-06-23 05:27:44', '2022-06-23 05:27:44'),
(2, 'name of', '202206230849Screenshot_1655882460.png', 1, 1, '5999.00', 23, 1, 'desc', '2022-06-23 05:47:09', '2022-06-23 05:47:09'),
(3, 'name of', '202206230849Screenshot_1655882460.png', 1, 1, '5999.00', 23, 1, 'desc', '2022-06-23 05:49:45', '2022-06-23 05:49:45'),
(4, 'pproduct', '202206230854166d75c1-eb8c-4bf3-8a8f-09116951626e529974722.jpg', 6, 8, '20000.00', 569, 1, 'descrtipot', '2022-06-23 05:54:49', '2022-06-24 05:58:43'),
(5, 'mikate', '202206231041c5f4b302-7d36-464f-90fe-65ddbd9fabf81484080825.jpg', 6, 6, '3000.00', 45, 1, 'escrption', '2022-06-23 07:41:32', '2022-06-24 05:58:59');

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
(10, 'Sophie', 'sophie@gmail.com', 'retailer', '074467543', 'Mabatini Police', NULL, '$2y$10$B/lJnbezNijyN1eE9dSbjuR9V.tLEekAEyv4M1l.g2YM14kqrSsrC', NULL, '2022-06-13 09:37:07', '2022-06-13 09:37:07');

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
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
