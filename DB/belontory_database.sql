-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2019 at 11:50 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `belontory`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(10) UNSIGNED NOT NULL,
  `branch_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Pent', 1, '2019-01-01 08:53:22', '2019-01-01 08:53:22'),
(4, 'Oil', 1, '2019-01-01 08:54:17', '2019-01-01 08:54:17'),
(5, 'Shaban', 1, '2019-01-01 08:54:22', '2019-01-01 08:54:22'),
(6, 'Sandel', 1, '2019-01-01 08:54:31', '2019-01-01 08:54:31'),
(7, 'Murgi', 1, '2019-01-01 08:55:03', '2019-01-01 08:55:03'),
(8, 'Drinks', 1, '2019-01-02 06:15:39', '2019-01-02 06:15:39'),
(9, 'Plates', 1, '2019-01-02 06:16:17', '2019-01-02 06:53:36'),
(10, 'Mobile', 1, '2019-01-02 06:16:30', '2019-01-02 06:16:30'),
(11, 'Computer', 1, '2019-01-02 06:16:36', '2019-02-24 06:52:56'),
(12, 'Crane all category', 1, '2019-01-10 07:53:26', '2019-03-03 07:43:13'),
(13, 'Hello', 1, '2019-05-04 08:25:16', '2019-05-04 08:25:16'),
(14, 'My Category', 1, '2019-05-04 08:25:28', '2019-05-04 08:25:28'),
(15, 'Lol', 1, '2019-05-08 08:21:22', '2019-05-08 08:21:22');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Equipement Solution Ltd.', '0198745465', 'Ashulia,Dhaka', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_name`, `email`, `phone`, `address`, `status`, `created_at`, `updated_at`) VALUES
(20, 'shakhawat hossain', '94shakha.18@gmail.com', '01832944211', 'hellow', 1, '2019-01-14 10:40:54', '2019-01-14 10:40:54'),
(23, 'younus molla', 'molla@gmail.com', '01832995864', 'Chagolnaiyar hagol', 1, '2019-01-14 10:53:24', '2019-01-14 10:53:24'),
(24, 'Mosumi Reza', 'mousumi3@gmail.com', '0186598452', 'Jessore ,Kulna,Bangladeshs', 1, '2019-01-15 05:05:11', '2019-02-26 10:27:58'),
(25, 'Fakhrul Islam Tohids', 'dj@gmail.com', '0189652344', 'Noakhalis', 1, '2019-01-24 07:12:19', '2019-02-26 10:34:19'),
(26, 'Shaon', 'shaon@gmail.com', '0183259755', 'Ashulia', 1, '2019-01-30 10:29:30', '2019-01-30 10:29:30'),
(27, 'Rohmot Ali', 'ali@gmail.com', '0198646555', 'Alinagars', 1, '2019-02-05 10:21:09', '2019-02-26 10:42:12'),
(28, 'Sarmin', 'sarmin@gmail.com', '018956589', 'Lorem Ispum Dolor', 1, '2019-02-11 09:12:58', '2019-02-11 09:12:58'),
(29, 'Rajib HOssain', 'rajib@gmail.com', '018975642', 'DhanMondi Dhaka', 1, '2019-02-25 11:56:27', '2019-02-26 10:31:39'),
(30, 'Monir Sheikh', 'moni@gmial.com', '01895345', 'dd', 1, '2019-05-08 09:02:23', '2019-05-08 09:02:23'),
(31, 'Hello', 'hello@gmail.com', '019856478', 'Lorem Ispum DOlor', 1, '2019-05-08 09:02:44', '2019-05-08 09:02:44'),
(32, 'Hey', 'hey@gmail.com', '0198869566', NULL, 1, '2019-05-08 09:03:05', '2019-05-08 09:03:05');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `name`, `icon`, `menu_url`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Product Manage', 'redeem', NULL, 0, NULL, NULL),
(2, 0, 'Stock Management', 'compare_arrows', NULL, 0, NULL, NULL),
(3, 0, 'Report', 'show_chart', 'report.index', 0, NULL, NULL),
(4, 0, 'Customer', 'account_circle', 'customer.index', 0, NULL, NULL),
(5, 0, 'User Management', 'people', NULL, 0, NULL, NULL),
(6, 0, 'Settings', 'settings_applications', NULL, 0, NULL, NULL),
(7, 1, 'Vendor', NULL, 'supplier.index', 0, NULL, NULL),
(8, 1, 'Product Category', NULL, 'category.index', 0, NULL, NULL),
(9, 1, 'Product', NULL, 'product.index', 0, NULL, NULL),
(10, 2, 'Stock In', NULL, 'stock.index', 0, NULL, NULL),
(11, 2, 'Stock Out / Invoice', NULL, 'invoice.index', 0, NULL, NULL),
(12, 5, 'Role Management', NULL, 'role.index', 0, NULL, NULL),
(13, 5, 'User', NULL, 'user.index', 0, NULL, NULL),
(14, 6, 'Company Settings', NULL, 'company.index', 0, NULL, NULL),
(15, 6, 'Change Password', NULL, 'password.index', 0, NULL, NULL);

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
(3, '2018_12_10_051212_create_products_table', 2),
(4, '2018_12_10_052440_create_vendors_table', 2),
(5, '2018_12_10_052501_create_customers_table', 2),
(6, '2018_12_10_052521_create_stocks_table', 2),
(7, '2018_12_10_052610_create_sells_table', 2),
(8, '2018_12_10_052631_create_sell_details_table', 2),
(9, '2018_12_10_075236_create_branches_table', 2),
(10, '2018_12_31_160432_create_categories_table', 3),
(11, '2019_01_12_163604_create_payments_table', 4),
(12, '2019_01_19_152250_biye--tabl', 5),
(13, '2019_02_10_113651_create_roles_table', 6),
(14, '2019_02_10_114632_create_permissions_table', 6),
(15, '2019_02_10_114735_create_menus_table', 6),
(16, '2019_02_14_130126_create_companies_table', 7);

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
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `sell_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid_in` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_information` text COLLATE utf8mb4_unicode_ci,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `sell_id`, `customer_id`, `user_id`, `date`, `paid_in`, `bank_information`, `amount`, `created_at`, `updated_at`) VALUES
(4, 5, 26, 1, '2019-01-18', 'cash', NULL, 10000, '2019-01-30 10:29:30', '2019-01-30 10:29:30'),
(18, 5, 26, 1, '2019-01-01', 'cash', NULL, 3652, '2019-01-31 05:40:22', '2019-01-31 05:40:22'),
(21, 5, 26, 1, '2019-01-31', 'cash', NULL, 352, '2019-01-31 05:50:02', '2019-01-31 05:50:02'),
(23, 4, 20, 1, '2019-02-03', 'cash', NULL, 638643.64, '2019-02-03 11:59:27', '2019-02-03 11:59:27'),
(24, 12, 25, 1, '2019-02-11', 'cash', NULL, 100000, '2019-02-05 09:29:51', '2019-02-05 09:29:51'),
(25, 13, 24, 1, '2019-02-11', 'cash', NULL, 10000, '2019-02-05 10:20:00', '2019-02-05 10:20:00'),
(26, 15, 26, 1, '2019-02-13', 'cash', NULL, 30000, '2019-02-05 10:22:07', '2019-02-05 10:22:07'),
(27, 17, 25, 1, '2019-02-06', 'cash', NULL, 10000, '2019-02-11 09:10:52', '2019-02-11 09:10:52'),
(28, 18, 28, 1, '2019-02-05', 'cash', NULL, 1000, '2019-02-11 09:12:58', '2019-02-11 09:12:58'),
(30, 33, 25, 1, '2019-03-01', 'cash', NULL, 321, '2019-03-03 10:25:28', '2019-03-03 10:25:28'),
(31, 38, 24, 1, '2019-05-23', 'cash', NULL, 1256, '2019-05-08 08:10:54', '2019-05-08 08:10:54');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(124, 5, 1, '2019-02-23 06:54:16', '2019-02-23 06:54:16'),
(125, 5, 2, '2019-02-23 06:54:16', '2019-02-23 06:54:16'),
(126, 5, 3, '2019-02-23 06:54:16', '2019-02-23 06:54:16'),
(127, 5, 4, '2019-02-23 06:54:16', '2019-02-23 06:54:16'),
(128, 5, 5, '2019-02-23 06:54:16', '2019-02-23 06:54:16'),
(129, 5, 6, '2019-02-23 06:54:16', '2019-02-23 06:54:16'),
(130, 5, 9, '2019-02-23 06:54:16', '2019-02-23 06:54:16'),
(131, 5, 8, '2019-02-23 06:54:16', '2019-02-23 06:54:16'),
(132, 5, 7, '2019-02-23 06:54:16', '2019-02-23 06:54:16'),
(133, 5, 10, '2019-02-23 06:54:16', '2019-02-23 06:54:16'),
(134, 5, 11, '2019-02-23 06:54:16', '2019-02-23 06:54:16'),
(135, 5, 12, '2019-02-23 06:54:16', '2019-02-23 06:54:16'),
(136, 5, 15, '2019-02-23 06:54:16', '2019-02-23 06:54:16'),
(137, 6, 1, '2019-02-23 09:25:01', '2019-02-23 09:25:01'),
(138, 6, 3, '2019-02-23 09:25:01', '2019-02-23 09:25:01'),
(139, 6, 6, '2019-02-23 09:25:01', '2019-02-23 09:25:01'),
(140, 6, 15, '2019-02-23 09:25:01', '2019-02-23 09:25:01'),
(407, 4, 4, '2019-05-08 06:28:54', '2019-05-08 06:28:54'),
(408, 4, 12, '2019-05-08 06:28:54', '2019-05-08 06:28:54'),
(409, 4, 13, '2019-05-08 06:28:54', '2019-05-08 06:28:54'),
(410, 4, 5, '2019-05-08 06:28:54', '2019-05-08 06:28:54'),
(411, 4, 15, '2019-05-08 06:28:54', '2019-05-08 06:28:54'),
(412, 4, 6, '2019-05-08 06:28:54', '2019-05-08 06:28:54'),
(567, 2, 9, '2019-05-09 06:29:32', '2019-05-09 06:29:32'),
(568, 2, 8, '2019-05-09 06:29:32', '2019-05-09 06:29:32'),
(569, 2, 7, '2019-05-09 06:29:32', '2019-05-09 06:29:32'),
(570, 2, 1, '2019-05-09 06:29:32', '2019-05-09 06:29:32'),
(571, 2, 10, '2019-05-09 06:29:32', '2019-05-09 06:29:32'),
(572, 2, 11, '2019-05-09 06:29:32', '2019-05-09 06:29:32'),
(573, 2, 2, '2019-05-09 06:29:32', '2019-05-09 06:29:32'),
(574, 2, 3, '2019-05-09 06:29:32', '2019-05-09 06:29:32'),
(575, 2, 4, '2019-05-09 06:29:32', '2019-05-09 06:29:32'),
(576, 2, 12, '2019-05-09 06:29:32', '2019-05-09 06:29:32'),
(577, 2, 13, '2019-05-09 06:29:32', '2019-05-09 06:29:32'),
(578, 2, 5, '2019-05-09 06:29:32', '2019-05-09 06:29:32'),
(579, 2, 14, '2019-05-09 06:29:32', '2019-05-09 06:29:32'),
(580, 2, 15, '2019-05-09 06:29:32', '2019-05-09 06:29:32'),
(581, 2, 6, '2019-05-09 06:29:32', '2019-05-09 06:29:32'),
(582, 3, 9, '2019-05-09 06:29:43', '2019-05-09 06:29:43'),
(583, 3, 8, '2019-05-09 06:29:43', '2019-05-09 06:29:43'),
(584, 3, 7, '2019-05-09 06:29:43', '2019-05-09 06:29:43'),
(585, 3, 1, '2019-05-09 06:29:43', '2019-05-09 06:29:43'),
(586, 3, 10, '2019-05-09 06:29:43', '2019-05-09 06:29:43'),
(587, 3, 11, '2019-05-09 06:29:43', '2019-05-09 06:29:43'),
(588, 3, 2, '2019-05-09 06:29:43', '2019-05-09 06:29:43'),
(589, 3, 3, '2019-05-09 06:29:43', '2019-05-09 06:29:43'),
(590, 3, 4, '2019-05-09 06:29:43', '2019-05-09 06:29:43'),
(591, 3, 14, '2019-05-09 06:29:43', '2019-05-09 06:29:43'),
(592, 3, 15, '2019-05-09 06:29:43', '2019-05-09 06:29:43'),
(593, 3, 6, '2019-05-09 06:29:43', '2019-05-09 06:29:43');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_name`, `details`, `status`, `created_at`, `updated_at`) VALUES
(1, 8, 'Coca Cola', 'import from chaina', 1, '2019-01-02 07:59:19', '2019-01-02 07:59:19'),
(2, 10, 'Iphone-x', 'dd', 1, '2019-01-02 07:59:30', '2019-01-02 07:59:30'),
(3, 10, 'Iphone-6', NULL, 1, '2019-01-02 07:59:45', '2019-01-02 07:59:45'),
(4, 4, 'Olive Oil', NULL, 1, '2019-01-02 07:59:59', '2019-01-02 07:59:59'),
(5, 2, 'Jeans', NULL, 1, '2019-01-02 08:00:07', '2019-01-02 08:00:07'),
(6, 2, 'Gabading', NULL, 1, '2019-01-02 08:00:24', '2019-01-02 08:00:24'),
(7, 7, 'Layer', NULL, 1, '2019-01-02 08:12:27', '2019-01-02 08:12:27'),
(8, 10, 'Symphoni', NULL, 1, '2019-01-02 08:42:03', '2019-01-02 08:42:03'),
(9, 4, 'Sayabin', NULL, 1, '2019-01-02 08:42:15', '2019-01-02 08:42:15'),
(10, 9, 'Melamain', NULL, 1, '2019-01-02 08:42:26', '2019-01-02 08:42:26'),
(11, 9, 'Ceramic', NULL, 1, '2019-01-02 08:42:39', '2019-01-02 08:42:39'),
(12, 5, 'Keya Saban', NULL, 1, '2019-01-03 05:47:15', '2019-01-03 05:47:15'),
(13, 11, 'I-Mac 8', NULL, 1, '2019-01-05 05:25:37', '2019-01-05 05:25:37'),
(14, 11, 'Lenevo', NULL, 1, '2019-01-05 05:25:55', '2019-01-05 05:25:55'),
(15, 11, 'Dell', 'fail', 1, '2019-01-05 05:26:19', '2019-01-05 07:30:56'),
(16, 11, 'IBM', NULL, 1, '2019-01-05 05:26:26', '2019-01-05 05:26:26'),
(17, 2, 'Jeans Special', NULL, 1, '2019-01-06 04:27:47', '2019-01-06 04:27:47'),
(18, 6, 'Thai-special', NULL, 1, '2019-01-08 06:01:59', '2019-01-08 06:01:59'),
(19, 12, 'Boom-343', 'ddd', 1, '2019-01-10 07:54:01', '2019-01-10 07:54:01'),
(20, 11, 'Accer-234', 'dfsdfsd', 1, '2019-01-30 10:25:16', '2019-01-30 10:25:16');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `created_at`, `updated_at`) VALUES
(2, 'Super Admin', '2019-02-12 09:59:54', '2019-02-12 09:59:54'),
(3, 'Manager', '2019-02-13 06:07:41', '2019-02-13 06:07:41'),
(4, 'Seller', '2019-02-13 07:34:11', '2019-02-13 07:34:11'),
(5, 'Controller', '2019-02-13 11:53:15', '2019-02-13 11:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `sells`
--

CREATE TABLE `sells` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL DEFAULT '1',
  `total_amount` double NOT NULL,
  `paid_amount` double NOT NULL DEFAULT '0',
  `sell_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT '0',
  `payment_method` tinyint(4) NOT NULL DEFAULT '0',
  `payment_status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sells`
--

INSERT INTO `sells` (`id`, `user_id`, `customer_id`, `branch_id`, `total_amount`, `paid_amount`, `sell_date`, `discount_amount`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
(4, 1, 20, 1, 638643.64, 638643.64, '2019-01-18', 0, 2, 1, '2019-01-30 09:16:58', '2019-02-03 11:59:27'),
(5, 1, 26, 1, 390948.57, 14004, '2019-01-18', 0, 2, 0, '2019-01-30 10:29:30', '2019-01-31 05:50:02'),
(12, 1, 25, 1, 1400000, 100000, '2019-02-11', 0, 2, 0, '2019-02-05 09:29:51', '2019-02-05 09:29:51'),
(13, 1, 24, 1, 546423.57, 10000, '2019-02-11', 0, 2, 0, '2019-02-05 10:20:00', '2019-02-05 10:20:00'),
(14, 1, 27, 1, 130505.51999999999, 0, '2019-02-08', 0, 2, 0, '2019-02-05 10:21:10', '2019-02-05 10:21:10'),
(15, 1, 26, 1, 651994, 30000, '2019-02-13', 0, 2, 0, '2019-02-05 10:22:07', '2019-02-05 10:22:07'),
(16, 1, 27, 1, 1387809.29, 0, '2019-02-12', 0, 2, 0, '2019-02-07 05:28:16', '2019-02-07 05:28:16'),
(17, 1, 25, 1, 150139.05, 10000, '2019-02-06', 0, 2, 0, '2019-02-11 09:10:51', '2019-02-11 09:10:51'),
(18, 1, 28, 1, 2520, 1000, '2019-02-05', 0, 2, 0, '2019-02-11 09:12:58', '2019-05-07 05:47:17'),
(32, 1, 28, 1, 420, 0, '2019-03-01', 0, 2, 0, '2019-03-03 09:00:53', '2019-03-03 09:00:53'),
(33, 1, 25, 1, 1272, 321, '2019-03-01', 0, 2, 0, '2019-03-03 10:25:28', '2019-03-03 10:25:28'),
(34, 1, 24, 1, 3880, 0, '2019-03-13', 0, 2, 0, '2019-03-03 10:31:00', '2019-03-03 10:31:00'),
(35, 1, 25, 1, 740, 0, '2019-03-01', 0, 2, 0, '2019-03-04 05:06:25', '2019-03-04 05:06:25'),
(36, 1, 24, 1, 621260, 0, '2019-02-01', 0, 2, 0, '2019-03-07 06:30:35', '2019-03-07 06:30:35'),
(37, 1, 29, 1, 7224, 0, '2019-05-07', 0, 2, 0, '2019-05-07 06:00:06', '2019-05-07 06:00:06'),
(38, 1, 24, 1, 10698.09, 1256, '2019-05-23', 0, 2, 0, '2019-05-08 08:10:54', '2019-05-08 08:10:54');

-- --------------------------------------------------------

--
-- Table structure for table `sell_details`
--

CREATE TABLE `sell_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `stock_id` int(11) NOT NULL,
  `sell_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `chalan_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selling_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sold_quantity` int(11) NOT NULL,
  `buy_price` double NOT NULL,
  `sold_price` double NOT NULL,
  `total_buy_price` double NOT NULL,
  `total_sold_price` double NOT NULL,
  `discount` double NOT NULL,
  `discount_type` tinyint(4) NOT NULL,
  `discount_amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sell_details`
--

INSERT INTO `sell_details` (`id`, `stock_id`, `sell_id`, `product_id`, `category_id`, `vendor_id`, `user_id`, `chalan_no`, `selling_date`, `customer_id`, `sold_quantity`, `buy_price`, `sold_price`, `total_buy_price`, `total_sold_price`, `discount`, `discount_type`, `discount_amount`, `created_at`, `updated_at`) VALUES
(6, 23, 4, 13, 11, 3, 1, '2019-01-24', '2019-01-18', '20', 5, 120000, 140000, 600000, 636363.64, 10, 2, 63636.36, '2019-01-30 09:16:58', '2019-01-30 09:16:58'),
(7, 26, 4, 1, 8, 54, 1, '2019-01-24', '2019-01-18', '20', 5, 220, 456, 1100, 2280, 0, 1, 0, '2019-01-30 09:16:58', '2019-01-30 09:16:58'),
(8, 35, 5, 20, 11, 24, 1, '2019-01-30', '2019-01-18', '26', 5, 1582, 2000, 7910, 10000, 0, 1, 0, '2019-01-30 10:29:30', '2019-01-30 10:29:30'),
(9, 24, 5, 19, 12, 23, 1, '2019-01-24', '2019-01-18', '26', 4, 98522, 99999, 394088, 380948.57, 5, 2, 19047.43, '2019-01-30 10:29:30', '2019-01-30 10:29:30'),
(23, 23, 12, 13, 11, 3, 1, '2019-01-24', '2019-02-11', '25', 10, 120000, 140000, 1200000, 1400000, 0, 1, 0, '2019-02-05 09:29:51', '2019-02-05 09:29:51'),
(24, 33, 13, 13, 11, 19, 1, '2019-01-24', '2019-02-11', '24', 4, 12000, 13000, 48000, 46428.57, 12, 2, 5571.43, '2019-02-05 10:20:00', '2019-02-05 10:20:00'),
(25, 24, 13, 19, 12, 23, 1, '2019-01-24', '2019-02-11', '24', 5, 98522, 99999, 492610, 499995, 0, 1, 0, '2019-02-05 10:20:00', '2019-02-05 10:20:00'),
(26, 25, 14, 7, 7, 3, 1, '2019-01-24', '2019-02-08', '27', 8, 320, 420, 2560, 3054.54, 10, 2, 305.46, '2019-02-05 10:21:10', '2019-02-05 10:21:10'),
(27, 33, 14, 13, 11, 19, 1, '2019-01-24', '2019-02-08', '27', 10, 12000, 13000, 120000, 127450.98, 2, 2, 2549.02, '2019-02-05 10:21:10', '2019-02-05 10:21:10'),
(28, 33, 15, 13, 11, 19, 1, '2019-01-24', '2019-02-13', '26', 4, 12000, 13000, 48000, 52000, 0, 1, 0, '2019-02-05 10:22:07', '2019-02-05 10:22:07'),
(29, 24, 15, 19, 12, 23, 1, '2019-01-24', '2019-02-13', '26', 6, 98522, 99999, 591132, 599994, 1000, 1, 0, '2019-02-05 10:22:07', '2019-02-05 10:22:07'),
(30, 22, 16, 13, 11, 24, 1, '2019-01-24', '2019-02-12', '27', 6, 132000, 155000, 792000, 885714.29, 5, 2, 44285.71, '2019-02-07 05:28:16', '2019-02-07 05:28:16'),
(31, 24, 16, 19, 12, 23, 1, '2019-01-24', '2019-02-12', '27', 5, 98522, 99999, 492610, 499995, 0, 1, 0, '2019-02-07 05:28:16', '2019-02-07 05:28:16'),
(32, 27, 16, 1, 8, 9, 1, '2019-01-24', '2019-02-12', '27', 5, 320, 420, 1600, 2100, 0, 1, 0, '2019-02-07 05:28:16', '2019-02-07 05:28:16'),
(33, 22, 17, 13, 11, 24, 1, '2019-01-24', '2019-02-06', '25', 1, 132000, 155000, 132000, 147619.05, 5, 2, 7380.95, '2019-02-11 09:10:52', '2019-02-11 09:10:52'),
(34, 27, 17, 1, 8, 9, 1, '2019-01-24', '2019-02-06', '25', 6, 320, 420, 1920, 2520, 0, 1, 0, '2019-02-11 09:10:52', '2019-02-11 09:10:52'),
(39, 27, 32, 1, 8, 9, 1, '2019-01-24', '2019-03-01', '28', 1, 320, 420, 320, 420, 0, 1, 0, '2019-03-03 09:00:53', '2019-03-03 09:00:53'),
(40, 36, 33, 19, 12, 51, 1, '2019-02-25', '2019-03-01', '25', 1, 695, 852, 695, 852, 0, 1, 0, '2019-03-03 10:25:28', '2019-03-03 10:25:28'),
(41, 25, 33, 7, 7, 3, 1, '2019-01-24', '2019-03-01', '25', 1, 320, 420, 320, 420, 0, 1, 0, '2019-03-03 10:25:28', '2019-03-03 10:25:28'),
(42, 34, 34, 13, 11, 13, 1, '2019-01-24', '2019-03-13', '24', 4, 455, 655, 1820, 2620, 0, 1, 0, '2019-03-03 10:31:00', '2019-03-03 10:31:00'),
(43, 27, 34, 1, 8, 9, 1, '2019-01-24', '2019-03-13', '24', 3, 320, 420, 960, 1260, 0, 1, 0, '2019-03-03 10:31:00', '2019-03-03 10:31:00'),
(44, 27, 35, 1, 8, 9, 1, '2019-01-24', '2019-03-01', '25', 1, 320, 420, 320, 420, 0, 1, 0, '2019-03-04 05:06:25', '2019-03-04 05:06:25'),
(45, 30, 35, 7, 7, 12, 1, '2019-01-24', '2019-03-01', '25', 1, 120, 320, 120, 320, 0, 1, 0, '2019-03-04 05:06:25', '2019-03-04 05:06:25'),
(46, 22, 36, 13, 11, 24, 1, '2019-01-24', '2019-02-01', '24', 4, 132000, 155000, 528000, 620000, 0, 1, 0, '2019-03-07 06:30:35', '2019-03-07 06:30:35'),
(47, 27, 36, 1, 8, 9, 1, '2019-01-24', '2019-02-01', '24', 3, 320, 420, 960, 1260, 0, 1, 0, '2019-03-07 06:30:35', '2019-03-07 06:30:35'),
(48, 25, 18, 7, 7, 3, 1, '2019-01-24', '2019-02-05', '28', 6, 320, 420, 1920, 2520, 0, 1, 0, '2019-05-07 05:47:17', '2019-05-07 05:47:17'),
(49, 36, 37, 19, 12, 51, 1, '2019-02-25', '2019-05-07', '29', 7, 695, 852, 4865, 5964, 0, 2, 0, '2019-05-07 06:00:06', '2019-05-07 06:00:06'),
(50, 25, 37, 7, 7, 3, 1, '2019-01-24', '2019-05-07', '29', 3, 320, 420, 960, 1260, 0, 1, 0, '2019-05-07 06:00:06', '2019-05-07 06:00:06'),
(51, 25, 38, 7, 7, 3, 1, '2019-01-24', '2019-05-23', '24', 23, 320, 420, 7360, 9660, 0, 1, 0, '2019-05-08 08:10:54', '2019-05-08 08:10:54'),
(52, 37, 38, 13, 11, 51, 1, '2019-03-07', '2019-05-23', '24', 2, 452, 545, 904, 1038.09, 5, 2, 51.91, '2019-05-08 08:10:54', '2019-05-08 08:10:54');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `chalan_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `buying_price` double NOT NULL,
  `selling_price` double NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `stock_quantity` int(11) NOT NULL,
  `current_quantity` int(11) NOT NULL DEFAULT '0',
  `note` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `category_id`, `product_code`, `product_id`, `vendor_id`, `user_id`, `chalan_no`, `buying_price`, `selling_price`, `discount`, `stock_quantity`, `current_quantity`, `note`, `status`, `created_at`, `updated_at`) VALUES
(22, 11, '1548312161', 13, 24, 1, '2019-01-24', 132000, 155000, 0, 120, 109, 'Lorem Ispum Dolor', 1, '2019-01-24 06:42:41', '2019-05-07 05:43:45'),
(23, 11, '1548312198', 13, 3, 1, '2019-01-24', 120000, 140000, 0, 30, 5, NULL, 1, '2019-01-24 06:43:18', '2019-02-05 09:29:51'),
(24, 12, '1548312227', 19, 23, 1, '2019-01-24', 98522, 99999, 0, 19, -14, NULL, 1, '2019-01-24 06:43:47', '2019-02-07 05:28:16'),
(25, 7, '1548312252', 7, 3, 1, '2019-01-24', 320, 420, 0, 45, 0, NULL, 1, '2019-01-24 06:44:12', '2019-05-08 08:10:54'),
(26, 8, '1548312274', 1, 54, 1, '2019-01-24', 220, 456, 0, 10, 5, NULL, 1, '2019-01-24 06:44:34', '2019-01-30 09:16:58'),
(27, 8, '1548312293', 1, 9, 1, '2019-01-24', 320, 420, 0, 120, 96, NULL, 1, '2019-01-24 06:44:53', '2019-05-07 05:47:17'),
(28, 9, '1548312560', 11, 3, 1, '2019-01-24', 120, 320, 0, 45, 45, NULL, 1, '2019-01-24 06:49:20', '2019-01-24 06:49:20'),
(29, 4, '1548312639', 9, 54, 1, '2019-01-24', 785, 852, 0, 65, 65, NULL, 1, '2019-01-24 06:50:39', '2019-01-24 06:50:39'),
(30, 7, '1548312656', 7, 12, 1, '2019-01-24', 120, 320, 0, 210, 209, NULL, 1, '2019-01-24 06:50:56', '2019-03-04 05:06:25'),
(31, 2, '1548312874', 6, 56, 1, '2019-01-24', 652, 750, 0, 45, 45, NULL, 1, '2019-01-24 06:54:34', '2019-01-24 06:54:34'),
(32, 6, '1548312889', 18, 3, 1, '2019-01-24', 452, 652, 0, 541, 541, NULL, 1, '2019-01-24 06:54:49', '2019-01-24 06:54:49'),
(33, 11, '1548316266', 13, 19, 1, '2019-01-24', 12000, 13000, 0, 14, -60, NULL, 1, '2019-01-24 07:51:06', '2019-05-08 08:36:51'),
(34, 11, '1548316325', 13, 13, 1, '2019-01-24', 455, 655, 0, 4, -9, NULL, 1, '2019-01-24 07:52:05', '2019-03-03 10:31:00'),
(35, 11, '1548843948', 20, 24, 1, '2019-01-30', 1582, 2000, 0, 6, 1, NULL, 1, '2019-01-30 10:25:48', '2019-01-30 10:29:30'),
(36, 12, '1551076586', 19, 51, 6, '2019-02-25', 695, 852, 0, 5, -3, 'Lorem Ispum dolor', 1, '2019-02-25 06:36:26', '2019-05-07 06:00:06'),
(37, 11, '1551944263', 13, 51, 1, '2019-03-07', 452, 545, 0, 2, 0, NULL, 1, '2019-03-07 07:37:43', '2019-05-08 08:10:54'),
(38, 8, '1557306953', 1, 13, 1, '2019-05-08', 456, 650, 0, 65, 65, NULL, 1, '2019-05-08 09:15:53', '2019-05-08 09:15:53'),
(39, 8, '1557306971', 1, 56, 1, '2019-05-08', 320, 620, 0, 32, 32, NULL, 1, '2019-05-08 09:16:11', '2019-05-08 09:16:11'),
(40, 11, '1557307030', 13, 51, 1, '2019-05-08', 32, 233, 0, 2, 2, NULL, 1, '2019-05-08 09:17:10', '2019-05-08 09:17:10'),
(41, 4, '1557307110', 4, 13, 1, '2019-05-08', 258, 350, 0, 698, 698, NULL, 1, '2019-05-08 09:18:30', '2019-05-08 09:18:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_id` int(11) NOT NULL DEFAULT '1',
  `role_id` int(11) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `branch_id`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Belogin Users', 'info@belogin.com', '$2y$10$2rqrg53MrfzyGZKtRYiqruGdF9AuUsVrWpO6ifEbuTaKpseCilVOe', 1, 2, 'oyRrex01ggMHpPDBGmaPb9URsWVXHVwZDAOL7tqSVhCIkzNiJLkLZc5Prysp', '2018-12-10 23:51:51', '2019-02-26 12:14:21'),
(2, 'shakha', 'shakhawat@belogin.com', '$2y$10$EEGCqp/A2z23gv7MorJHEObdm7QxfMqsvcvGViSUUVYdc1t8eKvM.', 1, 2, 'Nos0QvZj0OQaJNo1TmIyHTUMmIyC6UzPM4H7rIAYW1mpvA4sjwMimoyqV9jr', '2018-12-11 02:53:12', '2018-12-11 02:53:12'),
(3, 'shaon', 'shaon@amirgroup.com.bd', '$2y$10$MkaVaeSdqTni4dB3egqkIuj0HsoXzt624zouk5Twm7O4x9oo50qUq', 1, 2, NULL, NULL, NULL),
(4, 'Mega Mind', 'mega.mind@amirgroup.com.bd', '$2y$10$MkaVaeSdqTni4dB3egqkIuj0HsoXzt624zouk5Twm7O4x9oo50qUq', 1, 3, NULL, NULL, '2019-02-24 10:33:59'),
(7, 'Rahat', 'rahat@gmail.com', '$2y$10$nJbTy6ujrcOxr2.OMkIp8.CLpgPeJyDTVcNCevYzwVUWLWN9H9L22', 1, 5, NULL, '2019-02-24 10:37:29', '2019-02-24 10:37:29');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(2, 'Younus Molla', '0128945654', 'molla@gmail.com', 'Panthapath Dhaka Bangladesh', '2018-12-18 04:19:42', '2018-12-18 04:19:42'),
(3, 'shuvro sen', '01897458632', 'sen@gmail.com', 'Jatrabari Dhaka Bangladesh', '2018-12-18 04:37:55', '2018-12-18 04:37:55'),
(8, 'Shuvro Sen', '5985154554', 'shubo@gmail.com', 'dddd', '2018-12-19 00:56:18', '2018-12-19 00:56:18'),
(9, 'Shoel Mozumder', '019874532', 'ss@gmail.com', 'Lorem Ispum Dolor suit imor', '2018-12-19 01:16:11', '2018-12-19 01:16:11'),
(11, 'Vue js', '018956478', 'vue@gmail.com', 'Mohammadpur Dhaka Bangladesh', '2018-12-19 02:50:23', '2018-12-19 02:50:23'),
(12, 'Rayhan', '01897465665', 'Rayhan@gmail.com', 'Santinagar Dhaka', '2018-12-19 03:08:21', '2018-12-19 03:08:21'),
(13, 'Monir Hossain', '0189744112', 'monir@gmail.com', 'Chandpur Bangladesh', '2018-12-19 03:53:38', '2018-12-19 03:53:38'),
(14, 'Tohid', '0189745623', 'tohid@gmail.com', 'Banglamoto Dhaka', '2018-12-19 04:02:14', '2018-12-19 04:02:14'),
(19, 'Shamim', '0189456754', 'samim@gmail.com', 'Rampura Dhaka', '2018-12-19 05:06:22', '2018-12-19 05:06:22'),
(23, 'Test Mia', '01740090500', 'test@belogin.com', 'Eastern Plus Dhaka', '2018-12-19 05:54:40', '2018-12-19 05:54:40'),
(24, 'Saiful Islam', '0183698745', 'saif@gmail.com', 'Dhanmondi,Dhaka', '2018-12-19 22:03:30', '2018-12-19 22:03:30'),
(26, 'Shakhawat Hossain', '0183259874', 'tohid.dj@gmail.com', 'Dhakha,Bangladesh', '2018-12-20 00:03:06', '2018-12-20 05:17:44'),
(49, 'Tohid Vaisa', '0183549874s', 'vai@gmail.com', 'Hello Vai', '2018-12-20 00:47:57', '2018-12-20 04:35:49'),
(51, 'Liton Das', '0188456656', 'das@gmail.com', 'ddds', '2018-12-20 05:31:50', '2018-12-20 05:31:50'),
(52, 'tushar R islam', '01700600400', 'ruslam@gmail.com', 'Mirpur Nibashi', '2018-12-20 05:34:42', '2018-12-20 05:53:59'),
(53, 'Wee Group', '01897461465', 'Wee@#gmail.,com', 'Moakhali Dhaka', '2018-12-20 05:35:02', '2018-12-20 06:11:51'),
(54, 'ss modern', '123548', 'ssd@gmail.com', 'sdfsdf', '2018-12-20 05:36:23', '2018-12-23 22:27:49'),
(55, 'Younus molla', '0189465985', 'yo@gmail.com', 'Hello There is Nothing', '2018-12-20 05:50:19', '2018-12-23 22:28:41'),
(56, 'Mousumi Khanom', '018963454', 'khan@mousumi.com', 'Jessore,Bangladesh', '2018-12-20 06:08:31', '2018-12-23 22:27:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_id` (`sell_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sells`
--
ALTER TABLE `sells`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sell_details`
--
ALTER TABLE `sell_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_id` (`stock_id`),
  ADD KEY `selling_date` (`selling_date`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sell_id` (`sell_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `stock_quantity` (`stock_quantity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=594;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sells`
--
ALTER TABLE `sells`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `sell_details`
--
ALTER TABLE `sell_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
