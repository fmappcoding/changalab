-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 13, 2025 at 04:54 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `changalab`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@site.com', 'admin', NULL, '66a60faf6e8a01722159023.png', '$2y$12$J3iJWJ1nP.76gYy1St7iu.z6V3NjTf4Kw3vrQwZwoB2Sci04udm5y', 'vGMKpMKqSiRCs8x00sULUbJDcCikjqP76gtibAm6sMR8rBLPQvqR9gLS7w50', NULL, '2025-03-09 05:43:12');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `click_url` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blocked_ips`
--

CREATE TABLE `blocked_ips` (
  `id` bigint UNSIGNED NOT NULL,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commission_logs`
--

CREATE TABLE `commission_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `who` int NOT NULL DEFAULT '0',
  `level` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `main_amo` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `title` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cron_jobs`
--

CREATE TABLE `cron_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` text COLLATE utf8mb4_unicode_ci,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cron_schedule_id` int NOT NULL DEFAULT '0',
  `next_run` datetime DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `is_running` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cron_jobs`
--

INSERT INTO `cron_jobs` (`id`, `name`, `alias`, `action`, `url`, `cron_schedule_id`, `next_run`, `last_run`, `is_running`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Currency Rate Update', 'currency_rate_cron', '[\"App\\\\Http\\\\Controllers\\\\CronController\", \"fiatRate\"]', NULL, 1, '2025-03-09 13:52:44', '2025-03-09 13:47:44', 1, 1, '2024-07-16 12:45:10', '2025-03-09 07:47:44'),
(2, 'Check Expired Alerts', 'check_expired_alerts', '[\"App\\\\Http\\\\Controllers\\\\CronController\", \"checkExpiredAlerts\"]', NULL, 1, '2025-03-13 04:46:26', '2025-03-13 04:41:26', 1, 1, '2024-07-16 06:45:10', '2025-03-12 22:41:26'),
(3, 'Rate Alert', 'rate_alert', '[\"App\\\\Http\\\\Controllers\\\\CronController\", \"rateAlert\"]', NULL, 1, '2025-03-13 04:46:29', '2025-03-13 04:41:29', 1, 1, '2024-07-16 06:45:10', '2025-03-12 22:41:29'),
(4, 'Initiated Exchanged Cancellation ', 'exchange_auto_cancel', '[\"App\\\\Http\\\\Controllers\\\\CronController\", \"exchangeAutoCancel\"]', NULL, 1, '2025-03-13 04:46:32', '2025-03-13 04:41:32', 1, 1, NULL, '2025-03-12 22:41:32');

-- --------------------------------------------------------

--
-- Table structure for table `cron_job_logs`
--

CREATE TABLE `cron_job_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `cron_job_id` int NOT NULL DEFAULT '0',
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `duration` int NOT NULL DEFAULT '0',
  `error` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cron_schedules`
--

CREATE TABLE `cron_schedules` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interval` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cron_schedules`
--

INSERT INTO `cron_schedules` (`id`, `name`, `interval`, `status`, `created_at`, `updated_at`) VALUES
(1, '5 Minute', 300, 1, '2024-07-30 07:20:06', '2024-07-30 07:20:06');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `gateway_id` int UNSIGNED NOT NULL DEFAULT '0' COMMENT '0 = manual',
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_sym` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conversion_rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `percent_decrease` decimal(5,2) NOT NULL DEFAULT '0.00',
  `percent_increase` decimal(5,2) NOT NULL DEFAULT '0.00',
  `sell_at` decimal(28,8) DEFAULT '0.00000000',
  `buy_at` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `fixed_charge_for_sell` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `percent_charge_for_sell` decimal(5,2) NOT NULL DEFAULT '0.00',
  `fixed_charge_for_buy` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `percent_charge_for_buy` decimal(5,2) NOT NULL DEFAULT '0.00',
  `reserve` decimal(28,8) NOT NULL,
  `minimum_limit_for_sell` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `maximum_limit_for_sell` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `minimum_limit_for_buy` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `maximum_limit_for_buy` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `user_detail_form_id` int UNSIGNED NOT NULL DEFAULT '0',
  `instruction` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `available_for_sell` tinyint(1) NOT NULL DEFAULT '1',
  `available_for_buy` tinyint(1) NOT NULL DEFAULT '1',
  `show_rate` tinyint(1) NOT NULL DEFAULT '1',
  `automatic_rate_update` tinyint(1) NOT NULL DEFAULT '1',
  `add_automatic_rate` decimal(8,2) NOT NULL DEFAULT '0.00',
  `show_number_after_decimal` int NOT NULL DEFAULT '2',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=enabled,0=disabled',
  `trx_proof_form_id` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `exchange_id` int DEFAULT '0',
  `method_code` int UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `method_currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `final_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `detail` text COLLATE utf8mb4_unicode_ci,
  `btc_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `try` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT '0',
  `is_web` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'This will be 1 if the request is from NextJs application',
  `admin_feedback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `success_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failed_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_cron` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `device_tokens`
--

CREATE TABLE `device_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `is_app` tinyint(1) NOT NULL DEFAULT '0',
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exchanges`
--

CREATE TABLE `exchanges` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED DEFAULT '0',
  `send_currency_id` int UNSIGNED NOT NULL DEFAULT '0',
  `receive_currency_id` int UNSIGNED NOT NULL DEFAULT '0',
  `sending_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `receiving_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `sending_charge` decimal(28,8) DEFAULT '0.00000000',
  `receiving_charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `charge` text COLLATE utf8mb4_unicode_ci,
  `buy_rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `sell_rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `refund_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `bonus_first_exchange` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Initial, 1=approved,2=pending,3=refund,9=cancel',
  `automatic_payment_status` tinyint(1) NOT NULL DEFAULT '0',
  `wallet_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_proof` text COLLATE utf8mb4_unicode_ci,
  `admin_trx_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_feedback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_data` text COLLATE utf8mb4_unicode_ci,
  `transaction_proof_data` text COLLATE utf8mb4_unicode_ci,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text COLLATE utf8mb4_unicode_ci,
  `shortcode` text COLLATE utf8mb4_unicode_ci COMMENT 'object',
  `support` text COLLATE utf8mb4_unicode_ci COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>enable, 2=>disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, '2019-10-18 23:16:05', '2022-03-22 05:22:24'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"-----------\"}}', 'recaptcha.png', 0, '2019-10-18 23:16:05', '2025-03-12 22:41:55'),
(3, 'custom-captcha', 'Custom Captcha', 'Just put any random string', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 0, '2019-10-18 23:16:05', '2022-12-26 07:09:50'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{measurement_id}}\"></script>\n                <script>\n                  window.dataLayer = window.dataLayer || [];\n                  function gtag(){dataLayer.push(arguments);}\n                  gtag(\"js\", new Date());\n                \n                  gtag(\"config\", \"{{measurement_id}}\");\n                </script>', '{\"measurement_id\":{\"title\":\"Measurement ID\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, '2021-05-04 10:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'fb_com.png', 0, NULL, '2022-03-22 05:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint UNSIGNED NOT NULL,
  `data_keys` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_values` longtext COLLATE utf8mb4_unicode_ci,
  `seo_content` longtext COLLATE utf8mb4_unicode_ci,
  `tempname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `seo_content`, `tempname`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"exchange platform\",\"currency exchange platform\",\"changalab\",\"usd to inr\",\"currency exchnage\",\"easy exchange\",\"money exhcngae\",\"bitcoin to usd\",\"money exchange\",\"crypto currency exchange\",\"crypto currency\"],\"description\":\"ChangaLab can be explained as a network of buyers and sellers, who transfer currency between each other or for their own. It is the means by which individuals, and companies convert one currency into another. This Currency Exchange Platform is the most advanced script in Codecanyon. The Currency Exchange Platform is endlessly appealing, feature-loaded, customized, and possesses the remarkable capability of running on all devices and operating systems.\",\"social_title\":\"ChangaLab - Currency Exchange Platform\",\"social_description\":\"ChangaLab can be explained as a network of buyers and sellers, who transfer currency between each other or for their own. It is the means by which individuals, companies convert one currency into another. This Currency Exchange Platform is the most advanced script in Codecanyon. The Currency Exchange Platform is endlessly appealing, feature-loaded, customized, and possesses the remarkable capability of running on all devices and operating systems.\",\"image\":\"67d25fa7ca5881741840295.png\"}', NULL, NULL, '', '2020-07-04 05:42:52', '2025-03-12 22:31:36'),
(24, 'about.content', '{\"has_image\":\"1\",\"heading\":\"About Changalab\",\"subheading\":\"The smartest way to collect, convert and transfer money globally\",\"description\":\"At Changalab, our mission is to create the world\\u2019s best exchange platform for individuals and international businesses.<div><br \\/><\\/div><div><div>Changalab was born back in 2016 by innovators in a London basement armed with ten years of banking experience, an entrepreneurial spirit, and a desire to provide customers a real alternative to the big banks. Since then, we\\u2019ve grown exponentially, and with a global team around 600 strong, have become a market-leading, multi-award winning, bank-beating, rapidly-growing, fun-loving international payments company.<\\/div><\\/div><div><br \\/><\\/div><div>Currently, more than 250,000 global customers &amp; 150,000 global businesses choose Changalab for their international transfers. We have transferred \\u00a370 Billion for our customers since we launched, more than 1 million transfers per year<br \\/><\\/div>\",\"about_image\":\"63cfac0241e491674554370.png\"}', NULL, 'orange_oasis', NULL, '2020-10-27 06:51:20', '2023-01-24 03:59:31'),
(25, 'blog.content', '{\"heading\":\"Our Latest News\",\"subheading\":\"Lorem ipsum dolor sit amet consectetuer adipiscing elit. Aenean modo lula eget dolor. Aenean massa.\"}', NULL, 'orange_oasis', NULL, '2020-10-27 06:51:34', '2023-01-23 06:56:21'),
(28, 'counter.content', '{\"has_image\":\"1\",\"background_image\":\"63a2e69ff20351671620255.jpg\"}', NULL, 'orange_oasis', NULL, '2020-10-27 07:04:02', '2022-12-21 04:57:36'),
(31, 'social_icon.element', '{\"title\":\"Facebook\",\"social_icon\":\"<i class=\\\"las la-expand\\\"><\\/i>\",\"url\":\"https:\\/\\/www.google.com\\/\"}', NULL, 'orange_oasis', NULL, '2020-11-11 10:07:30', '2022-10-20 11:15:48'),
(33, 'feature.content', '{\"heading\":\"Our Special Features\",\"subheading\":\"We support the most secure services and features. This secured website supports a user-friendly interface and various attractive features that ready to use.\"}', NULL, 'orange_oasis', NULL, '2021-01-03 05:40:54', '2022-10-20 11:15:48'),
(34, 'feature.element', '{\"title\":\"Safe and Secure\",\"description\":\"We value your money and your privacy. We have deployed the best systems to ensure that your money and your account.\",\"feature_icon\":\"<i class=\\\"fas fa-hand-holding-heart\\\"><\\/i>\"}', NULL, 'orange_oasis', NULL, '2021-01-03 05:41:02', '2022-10-20 11:15:48'),
(35, 'service.element', '{\"trx_type\":\"withdraw\",\"service_icon\":\"<i class=\\\"las la-highlighter\\\"><\\/i>\",\"title\":\"asdfasdf\",\"description\":\"asdfasdfasdfasdf\"}', NULL, 'orange_oasis', NULL, '2021-03-05 07:12:10', '2022-10-20 11:15:48'),
(36, 'service.content', '{\"trx_type\":\"deposit\",\"heading\":\"asdf fffff\",\"subheading\":\"555\"}', NULL, 'orange_oasis', NULL, '2021-03-05 07:27:34', '2022-10-20 11:15:48'),
(39, 'banner.content', '{\"has_image\":\"1\",\"heading\":\"Changalab - Secure and Suitable Currency Exchange Platform\",\"image\":\"66a6225d149331722163805.jpg\"}', NULL, 'blue_bliss', '', '2021-05-01 12:09:30', '2024-07-28 04:50:05'),
(41, 'cookie.data', '{\"short_desc\":\"We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.\",\"description\":\"<div><h5 class=\\\"mb-2\\\">What information do we collect?<\\/h5><p>We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><p><br><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">How do we protect your information?<\\/h5><p>All provided delicate\\/credit data is sent through Stripe.<br>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><p><br><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Do we disclose any information to outside parties?<\\/h5><p>We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><p><br><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Children\'s Online Privacy Protection Act Compliance<\\/h5><p>We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><p><br><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Changes to our Privacy Policy<\\/h5><p>If we decide to change our privacy policy, we will post those changes on this page.<\\/p><p><br><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">How long we retain your information?<\\/h5><p>At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><p><br><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">What we don\\u2019t do with your data<\\/h5><p>We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\",\"status\":1}', NULL, 'orange_oasis', NULL, '2020-07-04 05:42:52', '2025-03-12 22:40:50'),
(42, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"description\":\"<div><h5 class=\\\"mb-2\\\">What information do we collect?<\\/h5><p>We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">How do we protect your information?<\\/h5><p>All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Do we disclose any information to outside parties?<\\/h5><p>We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Children\'s Online Privacy Protection Act Compliance<\\/h5><p>We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Changes to our Privacy Policy<\\/h5><p>If we decide to change our privacy policy, we will post those changes on this page.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">How long we retain your information?<\\/h5><p>At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">What we don\\u2019t do with your data<\\/h5><p>We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', NULL, 'orange_oasis', 'privacy-policy', '2021-06-08 14:50:42', '2025-03-12 22:39:01'),
(43, 'policy_pages.element', '{\"title\":\"Terms of Service\",\"description\":\"<div><h5 class=\\\"mb-2\\\">What information do we collect?<\\/h5><p>We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">How do we protect your information?<\\/h5><p>All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Do we disclose any information to outside parties?<\\/h5><p>We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Children\'s Online Privacy Protection Act Compliance<\\/h5><p>We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Changes to our Privacy Policy<\\/h5><p>If we decide to change our privacy policy, we will post those changes on this page.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">How long we retain your information?<\\/h5><p>At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">What we don\\u2019t do with your data<\\/h5><p>We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', NULL, 'orange_oasis', 'terms-of-service', '2021-06-08 14:51:18', '2025-03-12 22:39:14'),
(44, 'maintenance.data', '{\"description\":\"<h2 style=\\\"text-align:center;\\\"><span><font size=\\\"6\\\">We\'re just tuning up a few things.<\\/font><\\/span><\\/h2><p>We apologize for the inconvenience but Front is currently undergoing planned maintenance. Thanks for your patience.<br><\\/p>\",\"image\":\"67d2607904cae1741840505.png\"}', NULL, NULL, NULL, '2020-07-04 05:42:52', '2025-03-12 22:35:05'),
(45, 'header.content', '{\"address\":\"California, USA\",\"email\":\"do-not-reply@viserlab.com\",\"mobile\":\"+1 (101) 100000\"}', NULL, 'orange_oasis', NULL, '2022-09-02 14:44:39', '2022-10-20 11:15:48'),
(47, 'feature.element', '{\"title\":\"Low Transparent Fee\",\"description\":\"We make sure that you are able to send as much money as possible, and we offer the best exchange rates possible here.\",\"feature_icon\":\"<i class=\\\"far fa-money-bill-alt\\\"><\\/i>\"}', NULL, 'orange_oasis', NULL, '2022-09-02 14:55:14', '2022-10-20 11:15:48'),
(48, 'feature.element', '{\"title\":\"Fast Transaction\",\"description\":\"We support fast transactions all over the world. With change lab sending money is simple, quick, and hassle-free.\",\"feature_icon\":\"<i class=\\\"fas fa-shipping-fast\\\"><\\/i>\"}', NULL, 'orange_oasis', NULL, '2022-09-02 14:55:33', '2022-10-20 11:15:48'),
(49, 'feature.element', '{\"title\":\"Reliable\",\"description\":\"We are highly reliable and trusted by thousands of people. Your security is our top priority.\",\"feature_icon\":\"<i class=\\\"far fa-heart\\\"><\\/i>\"}', NULL, 'orange_oasis', NULL, '2022-09-02 14:55:53', '2022-10-20 11:15:48'),
(50, 'feature.element', '{\"title\":\"Crypto\",\"description\":\"Our platform supports all types of cryptocurrency having an easy deposit and withdrawal system.\",\"feature_icon\":\"<i class=\\\"fas fa-money-check-alt\\\"><\\/i>\"}', NULL, 'orange_oasis', NULL, '2022-09-02 14:56:14', '2022-10-20 11:15:48'),
(51, 'feature.element', '{\"title\":\"24\\/7 Support\",\"description\":\"We are here for you. We provide 24\\/7 customer support through e-mail and support tickets.\",\"feature_icon\":\"<i class=\\\"fas fa-hands-helping\\\"><\\/i>\"}', NULL, 'orange_oasis', NULL, '2022-09-02 14:56:32', '2022-10-20 11:15:48'),
(52, 'counter.element', '{\"title\":\"Currency\",\"counter_digit\":\"20\",\"counter_icon\":\"<i class=\\\"fas fa-money-bill-alt\\\"><\\/i>\"}', NULL, 'orange_oasis', NULL, '2022-09-02 14:57:46', '2022-10-20 11:15:48'),
(53, 'counter.element', '{\"title\":\"Transaction\",\"counter_digit\":\"93\",\"counter_icon\":\"<i class=\\\"fas fa-money-check-alt\\\"><\\/i>\"}', NULL, 'orange_oasis', NULL, '2022-09-02 14:58:06', '2022-10-20 11:15:48'),
(54, 'counter.element', '{\"title\":\"Customer\",\"counter_digit\":\"98.4\",\"counter_icon\":\"<i class=\\\"fas fa-users\\\"><\\/i>\"}', NULL, 'orange_oasis', NULL, '2022-09-02 14:58:28', '2022-10-20 11:15:48'),
(55, 'counter.element', '{\"title\":\"Exchange\",\"counter_digit\":\"20\",\"counter_icon\":\"<i class=\\\"fas fa-exchange-alt\\\"><\\/i>\"}', NULL, 'orange_oasis', NULL, '2022-09-02 14:58:47', '2022-10-20 11:15:48'),
(56, 'testimonial.content', '{\"heading\":\"What our happy customers say\",\"subheading\":\"See what our satisfied customers have to say about our services\"}', NULL, 'orange_oasis', NULL, '2022-09-02 15:03:00', '2023-01-25 05:34:57'),
(57, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"Undexco Rubas\",\"designation\":\"Market Analyser\",\"description\":\"Consectetur adipisicing elit. Cumque adipisci sequi nisi doloremque magni at a eos tenetur? at totam mollitia quas!\",\"rating\":\"5\",\"client_image\":\"63538fe3e70e31666420707.png\"}', NULL, 'orange_oasis', NULL, '2022-09-02 15:03:27', '2022-12-24 03:52:47'),
(58, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"Olivia Emma\",\"designation\":\"Market Analyser\",\"description\":\"Consectetur adipisicing elit. Cumque adipisci sequi nisi doloremque magni at a eos tenetur? at totam mollitia quas!\",\"rating\":\"3\",\"client_image\":\"6353901435f431666420756.png\"}', NULL, 'orange_oasis', NULL, '2022-09-02 15:03:50', '2022-12-24 03:53:13'),
(59, 'testimonial.element', '{\"has_image\":[\"1\"],\"name\":\"Jon Smith\",\"designation\":\"Chief Executive Officer\",\"description\":\"I joined here in 2017, this is legal, compliance, risk, financial crime, internal audit and company secretariat teams\",\"rating\":\"5\",\"client_image\":\"63538fcc3ed681666420684.png\"}', NULL, 'orange_oasis', NULL, '2022-09-02 15:04:11', '2022-12-25 23:31:58'),
(64, 'faq.content', '{\"heading\":\"Frequently Asked Question\",\"subheading\":\"Some frequently Asked Question\"}', NULL, 'orange_oasis', NULL, '2022-09-02 15:06:35', '2022-12-25 01:13:46'),
(65, 'faq.element', '{\"question\":\"How do I exchange money?\",\"answer\":\"You can exchange money at banks, financial institutions, and online currency exchange platforms. You can also use a credit card that is accepted internationally.\"}', NULL, 'orange_oasis', NULL, '2022-09-02 15:06:55', '2023-01-25 05:37:57'),
(66, 'faq.element', '{\"question\":\"What is an exchange rate?\",\"answer\":\"An exchange rate is the value of one currency in relation to another currency. It is the rate at which one currency can be exchanged for another.\"}', NULL, 'orange_oasis', NULL, '2022-09-02 15:07:09', '2023-01-25 05:39:27'),
(67, 'faq.element', '{\"question\":\"How do exchange rates fluctuate?\",\"answer\":\"Exchange rates fluctuate based on supply and demand for a particular currency, as well as a variety of other factors such as economic conditions, government policies, and market sentiment.\"}', NULL, 'orange_oasis', NULL, '2022-09-02 15:07:23', '2023-01-25 05:39:43'),
(68, 'faq.element', '{\"question\":\"Is currency trading a good investment?\",\"answer\":\"Currency trading can be a speculative and high-risk investment, and it should only be done by experienced investors who understand the risks involved. It\'s important to do your research and to consult with a financial advisor or currency trading expert before making any investment decisions.\"}', NULL, 'orange_oasis', NULL, '2022-09-02 15:07:36', '2023-01-25 05:40:36'),
(69, 'transaction.content', '{\"heading\":\"Our Latest Transaction\",\"subheading\":\"Transfer funds around the world from the comfort of your home with our easy-to-use online.\"}', NULL, 'orange_oasis', NULL, '2022-09-02 15:08:26', '2022-10-20 11:15:48'),
(70, 'subscribe.content', '{\"has_image\":\"1\",\"heading\":\"Subscribe Our Newsletter\",\"subheading\":\"Subscribe Our Newslater Now to get all the updates and Discount Offer News\",\"background_image\":\"66a60ac471f301722157764.png\"}', NULL, 'orange_oasis', '', '2022-09-02 15:09:50', '2024-07-28 03:09:24'),
(73, 'footer.content', '{\"details\":\"Changalab is a trusted and secure currency exchange platform that allows users to buy and sell different types of currencies. This platform offers a wide range of currencies to choose from and allow users to exchange money at competitive rates.\",\"copyright\":\"All Right Reserved\"}', NULL, 'orange_oasis', NULL, '2022-09-02 15:51:40', '2023-01-25 00:12:58'),
(74, 'social_icons.element', '{\"name\":\"instagram\",\"icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"url\":\"https:\\/\\/www.instagram.com\\/\"}', NULL, 'orange_oasis', '', '2022-09-02 15:51:59', '2024-07-28 03:32:23'),
(75, 'social_icons.element', '{\"name\":\"facebook\",\"icon\":\"<i class=\\\"fab fa-facebook\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\\/\"}', NULL, 'orange_oasis', '', '2022-09-02 15:52:14', '2024-07-28 03:32:11'),
(77, 'social_icons.element', '{\"name\":\"youtube\",\"icon\":\"<i class=\\\"lab la-youtube\\\"><\\/i>\",\"url\":\"https:\\/\\/www.youtube.com\\/\"}', NULL, 'orange_oasis', NULL, '2022-09-02 15:52:52', '2022-10-20 11:15:48'),
(79, 'breadcrumb.content', '{\"has_image\":\"1\",\"background_image\":\"631c5979dec951662802297.jpg\"}', NULL, 'orange_oasis', NULL, '2022-09-03 16:30:55', '2022-10-20 11:15:48'),
(80, 'affiliation.content', '{\"heading\":\"Affiliation\",\"subheading\":\"Invite your friends and earn referral commission\"}', NULL, 'orange_oasis', NULL, '2022-09-04 14:50:31', '2023-01-25 05:30:57'),
(82, 'mission_vision.element', '{\"has_image\":[\"1\"],\"heading\":\"Our Mission\",\"subheading\":\"Our values reflect who we are and what we stand for as a company.\",\"description\":\"<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;font-family:Montserrat, sans-serif;\\\"><span style=\\\"color:rgb(29,28,29);background-color:rgb(248,248,248);font-family:\'Slack-Lato\', appleLogo, sans-serif;font-size:15px;\\\">Changalab\\u00a0<\\/span><span style=\\\"color:rgb(68,68,68);font-size:11.5pt;font-family:Arial, sans-serif;\\\">our local and global expertise to be a leading service provider of payment solutions for our customers globally by delivering high quality, innovative and world-class products and services; while maintaining the highest standards of governance and ethics.<\\/span><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\"><\\/span><\\/p><p style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;font-family:Montserrat, sans-serif;\\\"><span style=\\\"color:rgb(33,37,41);font-size:12pt;font-family:Arial, sans-serif;\\\"><br \\/><br \\/><\\/span><span style=\\\"font-size:12pt;font-family:\'Times New Roman\', serif;\\\"><\\/span><\\/p><p style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;font-family:Montserrat, sans-serif;\\\"><span style=\\\"font-weight:bolder;\\\"><span style=\\\"color:rgb(68,68,68);font-size:11.5pt;font-family:Arial, sans-serif;\\\">Customer Commitment :\\u00a0<\\/span><\\/span><span style=\\\"color:rgb(68,68,68);font-size:11.5pt;font-family:Arial, sans-serif;\\\">We develop relationships that make a positive difference in our customers\' lives.<\\/span><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\"><\\/span><\\/p><p style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;font-family:Montserrat, sans-serif;\\\"><span style=\\\"font-weight:bolder;\\\"><span style=\\\"color:rgb(68,68,68);font-size:11.5pt;font-family:Arial, sans-serif;\\\">Quality:\\u00a0<\\/span><\\/span><span style=\\\"color:rgb(68,68,68);font-size:11.5pt;font-family:Arial, sans-serif;\\\">We provide outstanding products and unsurpassed service that, together, deliver premium value to our customers.<\\/span><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\"><\\/span><\\/p><p style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;font-family:Montserrat, sans-serif;\\\"><span style=\\\"font-weight:bolder;\\\"><span style=\\\"color:rgb(68,68,68);font-size:11.5pt;font-family:Arial, sans-serif;\\\">Integrity:\\u00a0<\\/span><\\/span><span style=\\\"color:rgb(68,68,68);font-size:11.5pt;font-family:Arial, sans-serif;\\\">We uphold the highest standards of integrity in all of our actions.<\\/span><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\"><\\/span><\\/p><p style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;font-family:Montserrat, sans-serif;\\\"><span style=\\\"font-weight:bolder;\\\"><span style=\\\"color:rgb(68,68,68);font-size:11.5pt;font-family:Arial, sans-serif;\\\">Teamwork:\\u00a0<\\/span><\\/span><span style=\\\"color:rgb(68,68,68);font-size:11.5pt;font-family:Arial, sans-serif;\\\">We work together, across boundaries, to meet the needs of our customers and to help the company win.<\\/span><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\"><\\/span><\\/p><p style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;font-family:Montserrat, sans-serif;\\\"><span style=\\\"font-weight:bolder;\\\"><span style=\\\"color:rgb(68,68,68);font-size:11.5pt;font-family:Arial, sans-serif;\\\">Respect for People :\\u00a0<\\/span><\\/span><span style=\\\"color:rgb(68,68,68);font-size:11.5pt;font-family:Arial, sans-serif;\\\">We value our people, encourage their development, and reward their performance.<\\/span><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\"><\\/span><\\/p><p style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;font-family:Montserrat, sans-serif;\\\"><span style=\\\"font-weight:bolder;\\\"><span style=\\\"color:rgb(68,68,68);font-size:11.5pt;font-family:Arial, sans-serif;\\\">Good Citizenship :\\u00a0<\\/span><\\/span><span style=\\\"color:rgb(68,68,68);font-size:11.5pt;font-family:Arial, sans-serif;\\\">We are good citizens in the communities in which we live and work.<\\/span><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\"><\\/span><\\/p><p style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;font-family:Montserrat, sans-serif;\\\"><span style=\\\"font-weight:bolder;\\\"><span style=\\\"color:rgb(68,68,68);font-size:11.5pt;font-family:Arial, sans-serif;\\\">A Will to Win:\\u00a0<\\/span><\\/span><span style=\\\"color:rgb(68,68,68);font-size:11.5pt;font-family:Arial, sans-serif;\\\">We exhibit a strong will to win in the marketplace and in every aspect of our business.<\\/span><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\"><\\/span><\\/p><p style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;font-family:Montserrat, sans-serif;\\\"><span style=\\\"font-weight:bolder;\\\"><span style=\\\"color:rgb(68,68,68);font-size:11.5pt;font-family:Arial, sans-serif;\\\">Personal Accountability:\\u00a0<\\/span><\\/span><span style=\\\"color:rgb(68,68,68);font-size:11.5pt;font-family:Arial, sans-serif;\\\">We are personally accountable for delivering on our commitments.<\\/span><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\"><\\/span><\\/p><p style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;font-family:Montserrat, sans-serif;\\\"><span style=\\\"color:rgb(68,68,68);font-size:11.5pt;font-family:Arial, sans-serif;\\\">Changalab\\u00a0operates with best-in-class economics We focus on managing our business as efficiently as possible to continually improve the quality of our service and invest in growth.\\u00a0<\\/span><span style=\\\"font-weight:bolder;\\\"><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\">\\u00a0<\\/span><\\/span><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\">Changalabbuilt on service and sustained by innovation. We\'re a global services company that provides customers with access to products, insights, and experiences that enrich lives and build business success.<\\/span><\\/p><p style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p style=\\\"margin:0in 0in 16.5pt;font-family:Montserrat, sans-serif;\\\"><\\/p><p class=\\\"MsoNormal\\\" style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p style=\\\"font-family:Montserrat, sans-serif;\\\">\\u00a0<\\/p>\",\"image\":\"6315d087b7cd81662374023.png\"}', NULL, 'orange_oasis', NULL, '2022-09-04 15:03:43', '2022-10-20 11:15:48'),
(83, 'mission_vision.element', '{\"has_image\":[\"1\"],\"heading\":\"Our Vision\",\"subheading\":\"To be leading provider of payment solutions globally.\",\"description\":\"<br \\/><div><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;font-family:Montserrat, sans-serif;\\\">At\\u00a0Changalab, our mission is to create the world\\u2019s best exchange platform for individuals and international businesses.<\\/p><p style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;font-family:Montserrat, sans-serif;\\\">Changalab was born back in 2000 by innovators in a London basement armed with ten years of banking experience, an entrepreneurial spirit, and a desire to provide customers a real alternative to the big banks. Since then, we\\u2019ve grown exponentially and with a global team around 600 strong, have become a market-leading, multi-award winning, bank-beating, rapidly-growing, fun-loving international payments company.<\\/p><p style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;font-family:Montserrat, sans-serif;\\\">\\u00a0<\\/p><p style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;font-family:Montserrat, sans-serif;\\\">For ensuring fast &amp; secure online transactions and providing value-added services across the global horizon has been our centralized vision. We are ready with every intention, tool, skill, and technique to accomplish such pre-defined objectives, while we are also fully devoted to prove the best customer experience and have implemented various efforts to safeguard them earnestly.<\\/p><p style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;font-family:Montserrat, sans-serif;\\\">Likewise, Our R&amp;D department has been working constantly to initiate newer measures for safer and more secure monetary transactions across the globe. We have cherished a variety of objectives since the beginning.<\\/p><p style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;font-family:Montserrat, sans-serif;\\\">\\u00a0<\\/p><p style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p class=\\\"MsoNormal\\\" style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p class=\\\"MsoNormal\\\" style=\\\"font-family:Montserrat, sans-serif;\\\"><\\/p><p style=\\\"font-family:Montserrat, sans-serif;\\\">\\u00a0<\\/p><\\/div>\",\"image\":\"6315d0a8ee0b91662374056.jpg\"}', NULL, 'orange_oasis', NULL, '2022-09-04 15:03:59', '2022-10-20 11:15:48'),
(87, 'payment_gateway.content', '{\"heading\":\"Our Payment Methods\"}', NULL, 'orange_oasis', NULL, '2022-09-09 11:36:16', '2022-10-20 11:15:48'),
(102, 'login.content', '{\"has_image\":\"1\",\"heading\":\"The easiest way to transfer your money to all over the world.\",\"login_image\":\"631d7b99b16921662876569.png\"}', NULL, 'orange_oasis', NULL, '2022-09-10 16:39:29', '2022-10-20 11:15:48'),
(103, 'register.content', '{\"has_image\":\"1\",\"heading\":\"The easiest way to transfer your money to all over the world.\",\"register_image\":\"631d90aa0c97e1662881962.png\"}', NULL, 'orange_oasis', NULL, '2022-09-10 16:40:22', '2022-10-20 11:15:48'),
(104, 'faq.element', '{\"question\":\"Can I use my credit card to exchange money?\",\"answer\":\"Yes, you can use a credit card that is accepted internationally to exchange money. However, you may have to pay additional fees and charges associated with using a credit card.\"}', NULL, 'orange_oasis', '', '2022-09-10 21:11:56', '2025-02-24 05:22:52'),
(105, 'kyc_content.content', '{\"unverified_content\":\"Dear User, we need your KYC Data for some action. Don\'t hesitate to provide KYC Data, It\'s so much potential for us too. Don\'t worry,  it\'s very much secure in our system.\",\"pending_content\":\"Dear user, Your submitted KYC Data is currently pending now. Please take us some time to review your Data. Thank you so much for your cooperation.\"}', NULL, 'orange_oasis', NULL, '2022-09-13 17:03:10', '2022-12-26 02:23:28'),
(112, 'about.element', '{\"has_image\":\"1\",\"image\":\"63539305c262c1666421509.png\"}', NULL, 'orange_oasis', NULL, '2022-10-22 05:51:49', '2022-10-22 05:51:49'),
(113, 'about.element', '{\"has_image\":\"1\",\"image\":\"6353930ed2beb1666421518.png\"}', NULL, 'orange_oasis', NULL, '2022-10-22 05:51:58', '2022-10-22 05:51:58'),
(115, 'about.element', '{\"has_image\":\"1\",\"image\":\"63539319dfd341666421529.png\"}', NULL, 'orange_oasis', NULL, '2022-10-22 05:52:09', '2022-10-22 05:52:09'),
(117, 'about.content', '{\"has_image\":\"1\",\"heading\":\"About Changalab\",\"subheading\":\"The smartest way to collect, convert and transfer money globally\",\"description\":\"<div class=\\\"col-lg-7 pe-lg-5\\\" style=\\\"width:700px;max-width:100%;\\\"><div class=\\\"about-content\\\"><div class=\\\"section-header left-style margin-olpo text-left\\\"><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\"><br \\/><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\">At Changalab, our mission is to create the world\\u2019s best exchange platform for individuals and\\r\\ninternational businesses.<\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\"><br \\/><\\/p><p><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\">Changalab\\r\\n was born back\\r\\nin 2016 by innovators in a London basement armed with ten years of \\r\\nbanking\\r\\nexperience, an entrepreneurial spirit, and a desire to provide customers\\r\\n a real alternative to the big banks. Since then, we\\u2019ve grown \\r\\nexponentially, and with a global team around 600 strong, have become a \\r\\nmarket-leading, multi-award\\r\\nwinning, bank-beating, rapidly-growing, fun-loving international \\r\\npayments\\r\\ncompany.<\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\"><br \\/><\\/p><p><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\">Currently, more than\\r\\n250,000 global customers &amp; 150,000 global businesses choose Changalab for their\\r\\ninternational transfers. We have transferred \\u00a370 Billion for our customers\\r\\nsince we launched, more than 1 million transfers per year<\\/p><\\/div><\\/div><\\/div><div class=\\\"col-lg-5\\\" style=\\\"width:500px;max-width:100%;color:rgb(82,95,128);font-family:Assistant, sans-serif;\\\"><\\/div>\",\"about_image\":\"6353be75f18841666432629.png\"}', NULL, 'blue_bliss', NULL, '2022-10-22 06:11:19', '2022-12-26 02:26:22'),
(118, 'blog.content', '{\"heading\":\"Our Latest News\",\"subheading\":\"Stay Informed with the Latest Trends, Expert Insights, and In-Depth Articles for a Smarter You.\"}', NULL, 'blue_bliss', '', '2022-10-22 06:15:47', '2025-02-26 04:39:01'),
(121, 'testimonial.content', '{\"heading\":\"Clients Feedback\",\"subheading\":\"We always care for our clients and love to getting good feedbacks from you. Take a look at what some of our clients think of us.\"}', NULL, 'blue_bliss', NULL, '2022-10-22 06:17:28', '2022-10-23 08:04:56'),
(122, 'testimonial.element', '{\"name\":\"Robart\",\"designation\":\"Businessman\",\"description\":\"This is a trustable site, I have joined here recently but their working process is so user-friendly and riable.\"}', NULL, 'blue_bliss', NULL, '2022-10-22 06:17:28', '2022-10-22 09:03:52'),
(123, 'testimonial.element', '{\"name\":\"Faisal Kabir\",\"designation\":\"Group General Counsel and Compliance Officer\",\"description\":\"I joined here in 2017, this is legal, compliance, risk, financial crime, internal audit and company secretariat teams.\"}', NULL, 'blue_bliss', NULL, '2022-10-22 06:17:28', '2022-10-22 09:04:13'),
(124, 'testimonial.element', '{\"name\":\"Nadine Reeves\",\"designation\":\"Chief Executive Officer\",\"description\":\"Changalab is the largest financial market in the world, it is a relatively unfamiliar terrain for retail traders.\"}', NULL, 'blue_bliss', NULL, '2022-10-22 06:17:28', '2022-10-22 09:04:31'),
(125, 'banner.content', '{\"heading\":\"A trusted and secure currency exchange platform\",\"has_image\":\"1\",\"background_image\":\"6353ae2a8fa241666428458.jpg\"}', NULL, 'orange_oasis', NULL, '2022-10-22 07:47:38', '2023-01-24 03:50:49'),
(128, 'affiliation.content', '{\"title\":\"AFFILIATE PROGRAME\",\"heading\":\"Changalab Affiliates\",\"subheading\":\"Changalab - Secure and Suitable Currency Exchange Platform\"}', NULL, 'blue_bliss', NULL, '2022-10-22 08:57:33', '2022-12-21 05:57:25'),
(131, 'counter.content', '{\"has_image\":\"1\",\"image\":\"66a626bebd5451722164926.png\"}', NULL, 'blue_bliss', '', '2022-10-22 09:08:34', '2024-07-28 05:08:46'),
(132, 'counter.element', '{\"title\":\"Currency\",\"counter_digit\":\"20\",\"counter_abbreviation\":\"K\",\"counter_icon\":\"<i class=\\\"fas fa-money-bill\\\"><\\/i>\"}', NULL, 'blue_bliss', NULL, '2022-10-22 09:09:12', '2022-10-23 08:01:08'),
(133, 'counter.element', '{\"title\":\"Transaction\",\"counter_digit\":\"93\",\"counter_abbreviation\":\"K\",\"counter_icon\":\"<i class=\\\"fas fa-money-check-alt\\\"><\\/i>\"}', NULL, 'blue_bliss', NULL, '2022-10-22 09:10:01', '2022-10-23 08:01:13'),
(134, 'counter.element', '{\"title\":\"Customer\",\"counter_digit\":\"98.4\",\"counter_abbreviation\":\"K\",\"counter_icon\":\"<i class=\\\"fas fa-users\\\"><\\/i>\"}', NULL, 'blue_bliss', NULL, '2022-10-22 09:10:29', '2022-10-23 08:01:18'),
(135, 'counter.element', '{\"title\":\"Exchange\",\"counter_digit\":\"20\",\"counter_abbreviation\":\"K\",\"counter_icon\":\"<i class=\\\"fas fa-exchange-alt\\\"><\\/i>\"}', NULL, 'blue_bliss', NULL, '2022-10-22 09:10:59', '2022-10-23 08:01:23'),
(136, 'faq.content', '{\"has_image\":\"1\",\"heading\":\"Frequently Asked Question\",\"subheading\":\"Some frequently Asked Questions\",\"faq_image\":\"63a82d9468bb31671966100.png\"}', NULL, 'blue_bliss', NULL, '2022-10-22 09:12:19', '2022-12-25 05:01:40'),
(137, 'faq.element', '{\"question\":\"How To Exchange Currency?\",\"answer\":\"Always decline if given the opportunity to charge your purchase in USD. \\r\\nThis may bring hidden transaction and conversion fees that will amount \\r\\nto much more than charging your purchase in the local currency. Insist \\r\\nthat all purchases are charged in the local currency. \\r\\n\\r\\nThere are always financial risks involved with traveling \\r\\ninternationally, which is why it is important to take extra precautions \\r\\nmaking exchanges, purchases, or withdrawals abroad\"}', NULL, 'blue_bliss', NULL, '2022-10-22 09:12:37', '2022-12-22 01:26:11'),
(138, 'faq.element', '{\"question\":\"In which forms can I buy foreign exchange?\",\"answer\":\"You can choose to buy foreign exchange in one or more of these \\r\\nmodes: cash\\/currency notes, traveller\\u2019s cheques and prepaid \\r\\nmulti-currency forex cards. Most people prefer to carry their currency \\r\\nin a combination of cash (generally for smaller expenses) and prepaid \\r\\nmulti-currency cards which can be swiped at merchant outlets or used to \\r\\nwithdraw cash at an ATM.\"}', NULL, 'blue_bliss', NULL, '2022-10-22 09:12:49', '2022-12-22 01:26:27'),
(139, 'faq.element', '{\"question\":\"How To Create a Changylab account?\",\"answer\":\"If you want to open an account for personal use you can do it over the phone or online. Opening an account online should only take a few minutes. You need to register to the site and just login to the site using the user id and password.\"}', NULL, 'blue_bliss', '', '2022-10-22 09:13:06', '2025-02-24 05:29:39'),
(140, 'faq.element', '{\"question\":\"Is Two-Factor Authentication (2FA) mandatory?\",\"answer\":\"All the clients  who have signed up to on the site, are required to \\nperform additional authorization at the following stages online: Login, Adding or managing beneficiaries, Instructing a payment or booking a site.\"}', NULL, 'blue_bliss', '', '2022-10-22 09:13:16', '2025-02-24 05:29:13'),
(141, 'feature.content', '{\"heading\":\"Our Special Features\",\"subheading\":\"We support the most secure services and features. This secured website supports a user-friendly interface and various attractive features that ready to use.\"}', NULL, 'blue_bliss', NULL, '2022-10-22 09:14:31', '2022-10-22 09:14:31'),
(142, 'feature.element', '{\"title\":\"Safe and Secure\",\"description\":\"We value your money and your privacy. We have deployed the best systems to ensure that your money and your account.\",\"feature_icon\":\"<i class=\\\"fas fa-hand-holding-heart\\\"><\\/i>\"}', NULL, 'blue_bliss', NULL, '2022-10-22 09:14:52', '2022-10-22 09:14:52'),
(143, 'feature.element', '{\"title\":\"Low Transparent Fee\",\"description\":\"We make sure that you are able to send as much money as possibles, we offer the best exchange rates possible here.\",\"feature_icon\":\"<i class=\\\"fas fa-money-bill\\\"><\\/i>\"}', NULL, 'blue_bliss', NULL, '2022-10-22 09:15:16', '2022-10-22 09:15:16'),
(144, 'feature.element', '{\"title\":\"Fast Transaction\",\"description\":\"We support fast transactions all over the world. With changalab sending money is simple, quick, and hassle-free.\",\"feature_icon\":\"<i class=\\\"fas fa-shipping-fast\\\"><\\/i>\"}', NULL, 'blue_bliss', NULL, '2022-10-22 09:15:38', '2022-10-22 09:15:38'),
(145, 'feature.element', '{\"title\":\"Reliable\",\"description\":\"We are highly reliable and trusted by thousands of people. Your security is our top priority.\",\"feature_icon\":\"<i class=\\\"far fa-heart\\\"><\\/i>\"}', NULL, 'blue_bliss', NULL, '2022-10-22 09:16:03', '2022-10-22 09:16:03'),
(146, 'feature.element', '{\"title\":\"Crypto\",\"description\":\"Our platform supports all types of cryptocurrency having an easy deposit and withdrawal system.\",\"feature_icon\":\"<i class=\\\"fas fa-money-check-alt\\\"><\\/i>\"}', NULL, 'blue_bliss', NULL, '2022-10-22 09:17:13', '2022-10-22 09:17:13'),
(147, 'feature.element', '{\"title\":\"24\\/7 Support\",\"description\":\"We are here for you. We provide 24\\/7 customer support through e-mail and support tickets.\",\"feature_icon\":\"<i class=\\\"fas fa-hands-helping\\\"><\\/i>\"}', NULL, 'blue_bliss', NULL, '2022-10-22 09:17:40', '2022-10-22 09:17:40'),
(148, 'footer.content', '{\"details\":\"Changalab - Secure and Suitable Currency Exchange Platform\",\"copyright\":\"All Rights Reserved\"}', NULL, 'blue_bliss', NULL, '2022-10-22 09:19:52', '2022-12-22 01:14:10'),
(149, 'how_it_work.content', '{\"heading\":\"How To Work\",\"subheading\":\"Changalab simplifies earning through a seamless 6-tier referral system. Invite others, grow your network, and earn rewards at every level. Start today and unlock endless income!\"}', NULL, 'blue_bliss', '', '2022-10-22 09:20:32', '2025-02-24 05:28:11'),
(153, 'mission_vision.element', '{\"has_image\":[\"1\"],\"heading\":\"Our Mission\",\"subheading\":\"Our values reflect who we are and what we stand for as a company.\",\"description\":\"<p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\"><span style=\\\"background-color:rgb(248,248,248);color:rgb(29,28,29);font-family:\'Slack-Lato\', appleLogo, sans-serif;font-size:15px;\\\">Changalab\\u00a0<\\/span><span style=\\\"font-size:11.5pt;font-family:Arial, sans-serif;color:#444444;\\\">our local\\r\\nand global expertise to be a leading service provider of payment solutions for\\r\\nour customers globally by delivering high quality, innovative and world-class\\r\\nproducts and services; while maintaining the highest standards of governance\\r\\nand ethics.<\\/span><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\"><\\/span><\\/p><p><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\"><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;color:#212529;\\\"><br \\/><br \\/><\\/span><span style=\\\"font-size:12pt;font-family:\'Times New Roman\', serif;\\\"><\\/span><\\/p><p><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\"><b><span style=\\\"font-size:11.5pt;font-family:Arial, sans-serif;color:#444444;\\\">Customer Commitment\\r\\n:\\u00a0<\\/span><\\/b><span style=\\\"font-size:11.5pt;font-family:Arial, sans-serif;color:#444444;\\\">We develop\\r\\nrelationships that make a positive difference in our customers\' lives.<\\/span><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\"><\\/span><\\/p><p><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\"><b><span style=\\\"font-size:11.5pt;font-family:Arial, sans-serif;color:#444444;\\\">Quality:\\u00a0<\\/span><\\/b><span style=\\\"font-size:11.5pt;font-family:Arial, sans-serif;color:#444444;\\\">We provide outstanding products and\\r\\nunsurpassed service that, together, deliver premium value to our customers.<\\/span><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\"><\\/span><\\/p><p><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\"><b><span style=\\\"font-size:11.5pt;font-family:Arial, sans-serif;color:#444444;\\\">Integrity:\\u00a0<\\/span><\\/b><span style=\\\"font-size:11.5pt;font-family:Arial, sans-serif;color:#444444;\\\">We uphold the highest standards of integrity\\r\\nin all of our actions.<\\/span><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\"><\\/span><\\/p><p><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\"><b><span style=\\\"font-size:11.5pt;font-family:Arial, sans-serif;color:#444444;\\\">Teamwork:\\u00a0<\\/span><\\/b><span style=\\\"font-size:11.5pt;font-family:Arial, sans-serif;color:#444444;\\\">We work together, across boundaries, to meet\\r\\nthe needs of our customers and to help the company win.<\\/span><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\"><\\/span><\\/p><p><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\"><b><span style=\\\"font-size:11.5pt;font-family:Arial, sans-serif;color:#444444;\\\">Respect for People\\r\\n:\\u00a0<\\/span><\\/b><span style=\\\"font-size:11.5pt;font-family:Arial, sans-serif;color:#444444;\\\">We value our people,\\r\\nencourage their development, and reward their performance.<\\/span><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\"><\\/span><\\/p><p><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\"><b><span style=\\\"font-size:11.5pt;font-family:Arial, sans-serif;color:#444444;\\\">Good Citizenship\\r\\n:\\u00a0<\\/span><\\/b><span style=\\\"font-size:11.5pt;font-family:Arial, sans-serif;color:#444444;\\\">We are good citizens\\r\\nin the communities in which we live and work.<\\/span><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\"><\\/span><\\/p><p><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\"><b><span style=\\\"font-size:11.5pt;font-family:Arial, sans-serif;color:#444444;\\\">A Will to Win:\\u00a0<\\/span><\\/b><span style=\\\"font-size:11.5pt;font-family:Arial, sans-serif;color:#444444;\\\">We exhibit a strong will to win in the\\r\\nmarketplace and in every aspect of our business.<\\/span><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\"><\\/span><\\/p><p><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\"><b><span style=\\\"font-size:11.5pt;font-family:Arial, sans-serif;color:#444444;\\\">Personal\\r\\nAccountability:\\u00a0<\\/span><\\/b><span style=\\\"font-size:11.5pt;font-family:Arial, sans-serif;color:#444444;\\\">We\\r\\nare personally accountable for delivering on our commitments.<\\/span><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\"><\\/span><\\/p><p><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\"><span style=\\\"font-size:11.5pt;font-family:Arial, sans-serif;color:#444444;\\\">Changalab\\u00a0operates\\r\\nwith best-in-class economics We focus on managing our business as efficiently\\r\\nas possible to continually improve the quality of our service and invest in\\r\\ngrowth.\\u00a0<\\/span><b><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\">\\u00a0<\\/span><\\/b><span style=\\\"font-size:12pt;font-family:Arial, sans-serif;\\\">Changalabbuilt on service and sustained by\\r\\ninnovation. We\'re a global services company that provides customers with access\\r\\nto products, insights, and experiences that enrich lives and build business\\r\\nsuccess.<\\/span><\\/p><p><\\/p><p style=\\\"margin:0in 0in 16.5pt;\\\">\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n<\\/p><p class=\\\"MsoNormal\\\"><\\/p><p>\\u00a0<\\/p><p><\\/p>\",\"image\":\"63a6a21d141631671864861.png\"}', NULL, 'blue_bliss', NULL, '2022-10-22 09:24:44', '2022-12-24 00:54:21');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `seo_content`, `tempname`, `slug`, `created_at`, `updated_at`) VALUES
(154, 'mission_vision.element', '{\"has_image\":[\"1\"],\"heading\":\"Our Vision\",\"subheading\":\"To be leading provider of payment solutions globally.\",\"description\":\"<div class=\\\"section-header left-style margin-olpo text-left\\\" style=\\\"margin:0px auto 50px;\\\"><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\"><br \\/><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\">\\r\\nAt\\u00a0Changalab, our mission is to create the world\\u2019s best exchange platform for\\r\\nindividuals and international businesses.<\\/p><p><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\">Changalab\\r\\n was born\\r\\nback in 2000 by innovators in a London basement armed with ten years of \\r\\nbanking\\r\\nexperience, an entrepreneurial spirit, and a desire to provide customers\\r\\n a real alternative to the big banks. Since then, we\\u2019ve grown \\r\\nexponentially and with a\\r\\nglobal team around 600 strong, have become a market-leading, multi-award\\r\\nwinning, bank-beating, rapidly-growing, fun-loving international \\r\\npayments company.<\\/p><p><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\">\\u00a0<\\/p><p><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\">For ensuring fast\\r\\n&amp; secure online transactions and providing value-added services across the\\r\\nglobal horizon has been our centralized vision. We are ready with every\\r\\nintention, tool, skill, and technique to accomplish such pre-defined\\r\\nobjectives, while we are also fully devoted to prove the best customer\\r\\nexperience and have implemented various efforts to safeguard them earnestly.<\\/p><p><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\">Likewise, Our R&amp;D\\r\\ndepartment has been working constantly to initiate newer measures for safer and\\r\\nmore secure monetary transactions across the globe. We have cherished a variety\\r\\nof objectives since the beginning.<\\/p><p><\\/p><p class=\\\"MsoNormal\\\" style=\\\"margin-bottom:0.0001pt;line-height:normal;\\\">\\u00a0<\\/p><p><\\/p><p class=\\\"MsoNormal\\\">\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n<\\/p><p class=\\\"MsoNormal\\\"><\\/p><p>\\u00a0<\\/p><\\/div>\",\"image\":\"63a6a215844161671864853.jpg\"}', NULL, 'blue_bliss', NULL, '2022-10-22 09:25:23', '2022-12-24 00:54:13'),
(155, 'subscribe.content', '{\"has_image\":\"1\",\"heading\":\"Subscribe Our Newsletter\",\"subheading\":\"Subscribe Our Newslater Now to get all the updates and Discount Offer News\",\"background_image\":\"66a62730b2b5b1722165040.png\"}', NULL, 'blue_bliss', '', '2022-10-22 09:26:09', '2024-07-28 05:10:40'),
(156, 'latest_exchange.content', '{\"heading\":\"Our Latest Exchange\",\"subheading\":\"Transfer funds around the world from the comfort of your home with our easy-to-use online.\"}', NULL, 'blue_bliss', NULL, '2022-10-22 09:26:52', '2022-10-22 09:26:52'),
(158, 'banned.content', '{\"has_image\":\"1\",\"heading\":\"This Account Is Banned\",\"image\":\"6353cdcb0c76d1666436555.png\"}', NULL, 'orange_oasis', NULL, '2022-10-22 10:02:35', '2023-01-25 07:31:05'),
(159, 'header.content', '{\"address\":\"90 School Lane DERBY DE14 1BE\",\"email\":\"do-not-reply@viserlab.com\",\"mobile\":\"+1 (101) 100000\"}', NULL, 'blue_bliss', NULL, '2022-10-23 05:07:25', '2023-01-12 07:16:08'),
(160, 'breadcrumb.content', '{\"has_image\":\"1\",\"background_image\":\"635526f85b0681666524920.jpg\"}', NULL, 'blue_bliss', NULL, '2022-10-23 10:35:20', '2022-10-23 10:35:20'),
(161, 'social_icons.element', '{\"name\":\"pinterest\",\"icon\":\"<i class=\\\"fab fa-pinterest\\\"><\\/i>\",\"url\":\"https:\\/\\/www.pinterest.com\"}', NULL, 'blue_bliss', '', '2022-10-23 10:37:20', '2024-07-28 07:14:59'),
(162, 'social_icons.element', '{\"name\":\"Youtube\",\"icon\":\"<i class=\\\"fab fa-youtube\\\"><\\/i>\",\"url\":\"https:\\/\\/www.youtube.com\\/\"}', NULL, 'blue_bliss', '', '2022-10-23 10:38:19', '2024-07-28 07:14:26'),
(163, 'social_icons.element', '{\"name\":\"Instagram\",\"icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"url\":\"https:\\/\\/www.instagram.com\\/\"}', NULL, 'blue_bliss', '', '2022-10-23 10:38:43', '2024-07-28 07:14:17'),
(164, 'social_icons.element', '{\"name\":\"Twiter\",\"icon\":\"<i class=\\\"fa-brands fa-x-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/x.com\\/\"}', NULL, 'blue_bliss', '', '2022-10-23 10:39:24', '2024-07-28 07:14:00'),
(165, 'social_icons.element', '{\"name\":\"facebook\",\"icon\":\"<i class=\\\"fab fa-facebook\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\\/\"}', NULL, 'blue_bliss', '', '2022-10-23 10:39:42', '2024-07-28 07:13:40'),
(166, 'affiliation.element', '{\"level\":\"1\",\"commission\":\"10\",\"description\":\"Earn 10% on direct referrals. Start building your network by inviting friends and family. Your first level is the foundation of earnings\\u2014 rewarding, and a great way to kickstart your income journey.\"}', NULL, 'blue_bliss', '', '2022-10-24 05:50:54', '2025-02-26 04:37:06'),
(167, 'affiliation.element', '{\"level\":\"2\",\"commission\":\"8\",\"description\":\"Get 8% on second-level referrals. Watch your network grow as your referrals bring in new members. This level expands your reach and boosts your earnings without extra effort.\"}', NULL, 'blue_bliss', '', '2022-10-24 05:54:36', '2025-02-26 04:38:23'),
(168, 'affiliation.element', '{\"level\":\"3\",\"commission\":\"7\",\"description\":\"Receive 7% on third-level referrals. Your network\\u2019s growth multiplies, creating a steady stream of passive income. Enjoy the benefits of a thriving community working together for success.\"}', NULL, 'blue_bliss', '', '2022-10-24 05:56:39', '2025-02-26 04:38:28'),
(169, 'affiliation.element', '{\"level\":\"4\",\"commission\":\"5\",\"description\":\"Earn 5% on fourth-level referrals. As your network deepens, your earnings increase effortlessly. This level ensures long-term rewards as your community continues to expand.\"}', NULL, 'blue_bliss', '', '2022-10-24 05:56:53', '2025-02-26 04:38:34'),
(170, 'affiliation.element', '{\"level\":\"5\",\"commission\":\"4\",\"description\":\"Gain 4% on fifth-level referrals. Your network\\u2019s exponential growth brings consistent income. This level maximizes your earning potential with minimal effort, rewarding your dedication.\"}', NULL, 'blue_bliss', '', '2022-10-24 05:57:07', '2025-02-26 04:38:38'),
(171, 'affiliation.element', '{\"level\":\"6\",\"commission\":\"3\",\"description\":\"Enjoy 3% on sixth-level referrals. The final tier ensures continuous rewards as your network grows. A true testament to the power of teamwork and passive income!\"}', NULL, 'blue_bliss', '', '2022-10-24 05:57:31', '2025-02-26 04:38:44'),
(172, 'kyc_content.content', '{\"unverified_content\":\"Dear User, we need your KYC Data for some action. Don\'t hesitate to provide KYC Data, It\'s so much potential for us too. Don\'t worry,  it\'s very much secure in our system.\",\"pending_content\":\"Dear user, Your submitted KYC Data is currently pending now. Please take us some time to review your Data. Thank you so much for your cooperation.\"}', NULL, 'blue_bliss', NULL, '2022-09-13 17:03:10', '2022-10-20 11:15:48'),
(173, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Maximizing Your Money: Understanding and Utilizing Currency Exchange Rates\",\"description\":\"<p style=\\\"border:0px solid rgb(217,217,227);margin-right:0px;margin-bottom:1.25em;margin-left:0px;\\\">Maximizing your money is a goal that many people have, whether it\'s for travel, investing, or saving for the future. One way to make the most of your money is by understanding and utilizing currency exchange rates.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Currency exchange rates are the value of one currency in relation to another currency. For example, if the exchange rate between the US dollar and the euro is 1.20, that means that for every US dollar, you can receive 1.20 euros. Exchange rates fluctuate constantly, and they can be affected by a variety of factors, such as economic conditions, government policies, and market sentiment.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">There are a few key things to keep in mind when it comes to currency exchange rates. First, it\'s important to keep an eye on the exchange rate between your home currency and the currency of the country you\'re planning to visit or do business with. This will give you an idea of how much your money is worth in that country and how much you can expect to pay for goods and services.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Second, it\'s a good idea to compare exchange rates from different sources, such as banks, financial institutions, and online currency exchange platforms. Each of these sources may have slightly different exchange rates and fees, so it\'s important to shop around for the best deal.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Third, you should be aware of the market conditions and regulations that can affect the exchange rate. For example, if a country\'s economy is struggling, its currency may weaken, which can make it a less favorable time to exchange money.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Finally, if you\'re planning to invest in foreign currencies, it\'s important to do your research and understand the risks involved. Currency trading is a speculative and high-risk investment, and it should only be done by experienced investors who understand the risks involved.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin-top:1.25em;margin-right:0px;margin-left:0px;\\\">By understanding and utilizing currency exchange rates, you can make the most of your money and potentially save money when traveling, investing, or doing business internationally. Keep an eye on exchange rates, compare rates from different sources, be aware of market conditions and regulations, and do your research before investing in foreign currencies. With a little knowledge and research, you can maximize your money and reach your financial goals.<\\/p>\",\"blog_image\":\"63d0d6798895f1674630777.png\"}', NULL, 'orange_oasis', 'maximizing-your-money:-understanding-and-utilizing-currency-exchange-rates', '2022-10-22 06:16:09', '2023-01-25 01:23:29'),
(174, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"The Basics of Money Exchange: How it Works and How to Make Informed Decisions\",\"description\":\"<p style=\\\"border:0px solid rgb(217,217,227);margin-right:0px;margin-bottom:1.25em;margin-left:0px;\\\">Money exchange, also known as foreign exchange or forex, is the process of converting one currency into another. It is an essential part of international trade and travel, and it is also a popular form of investment. In this blog post, we will explore the basics of money exchange and how it works.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">When you exchange money, you are essentially buying one currency and selling another. For example, if you want to convert US dollars into euros, you would sell your US dollars and buy euros in return. The exchange rate between the two currencies will determine the amount of euros you receive for your dollars. Exchange rates fluctuate constantly, and they can be affected by a variety of factors, such as economic conditions, government policies, and market sentiment.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Money exchange can be done in a variety of ways. One of the most common ways is through a bank or financial institution. Banks and financial institutions typically offer a wide range of currencies and competitive exchange rates, but they also charge fees and commissions for their services. Another way to exchange money is through an online currency exchange platform. These platforms typically offer a wider range of currencies and more competitive exchange rates than banks and financial institutions. However, it\'s important to research and compares fees and exchange rates before using any online currency exchange platform.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Money exchange is not just for international trade and travel, it\'s also a popular form of investment. Many investors use currency trading as a way to make money from fluctuations in exchange rates. Currency trading is a speculative and high-risk investment, and it should only be done by experienced investors who understand the risks involved.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin-top:1.25em;margin-right:0px;margin-left:0px;\\\">In conclusion, money exchange is an essential part of international trade and travel, and it can also be a popular form of investment. It is important to understand the basics of how it works and to research and compare fees and exchange rates before making any exchange. It\'s also crucial to be aware of the market conditions and regulations that can affect the exchange rate. With a little knowledge and research, you can make informed decisions and potentially save money when exchanging currency.<\\/p>\",\"blog_image\":\"63d0d8348db8b1674631220.png\"}', NULL, 'orange_oasis', 'the-basics-of-money-exchange:-how-it-works-and-how-to-make-informed-decisions', '2022-10-22 09:01:00', '2023-01-25 01:20:20'),
(175, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"The Ins and Outs of Foreign Exchange: A Comprehensive Guide\",\"description\":\"<p style=\\\"border:0px solid rgb(217,217,227);margin-right:0px;margin-bottom:1.25em;margin-left:0px;\\\">Foreign exchange, also known as forex or currency trading, is the process of buying and selling different types of currencies. It is an essential part of international trade and travel, and it is also a popular form of investment. In this blog post, we will explore the ins and outs of foreign exchange, and provide a comprehensive guide on how it works.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">When you exchange money, you are essentially buying one currency and selling another. For example, if you want to convert US dollars into euros, you would sell your US dollars and buy euros in return. The exchange rate between the two currencies will determine the amount of euros you receive for your dollars. Exchange rates fluctuate constantly, and they can be affected by a variety of factors, such as economic conditions, government policies, and market sentiment.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">There are a few different ways to exchange money. One of the most common ways is through a bank or financial institution. Banks and financial institutions typically offer a wide range of currencies and competitive exchange rates, but they also charge fees and commissions for their services. Another way to exchange money is through an online currency exchange platform. These platforms typically offer a wider range of currencies and more competitive exchange rates than banks and financial institutions, but it\'s important to research and compare fees and exchange rates before using any online currency exchange platform.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Foreign exchange is not just for international trade and travel, it\'s also a popular form of investment. Many investors use currency trading as a way to make money from fluctuations in exchange rates. Currency trading is a speculative and high-risk investment, and it should only be done by experienced investors who understand the risks involved.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">In addition to the above, there are a few key things to keep in mind when it comes to foreign exchange. First, it\'s important to keep an eye on the exchange rate between the currency you hold and the currency you want to buy or sell. This will give you an idea of how much your money is worth in that currency.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Second, it\'s important to be aware of the market conditions and regulations that can affect the exchange rate. For example, if a country\'s economy is struggling, its currency may weaken, which can make it a less favorable time to exchange money.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Third, you should also be aware of the different types of exchanges such as OTC, spot and forward exchange rates. Knowing the differences between them can help you make better decisions on when to make the exchange.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Finally, it\'s always a good idea to do your research and to consult with a financial advisor or currency trading expert before making any investment decisions.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin-top:1.25em;margin-right:0px;margin-left:0px;\\\">In conclusion, foreign exchange is an essential part of international trade and travel, and it can also be a popular form of investment. It is important to understand the ins and outs of how it works and to research and compare fees and exchange rates before making any exchange. It\'s also crucial to be aware of the market conditions and regulations that can affect the exchange rate. By keeping these things in mind, you can make informed decisions and potentially save money when exchanging currency.<\\/p>\",\"blog_image\":\"63d0daba0a1241674631866.png\"}', NULL, 'orange_oasis', 'the-ins-and-outs-of-foreign-exchange:-a-comprehensive-guide', '2022-10-22 09:02:00', '2023-01-25 01:31:06'),
(176, 'banned.content', '{\"has_image\":\"1\",\"heading\":\"THIS ACCOUNT IS BANNED\",\"image\":\"6353cdcb0c76d1666436555.png\"}', NULL, 'blue_bliss', '', '2022-10-22 10:02:35', '2025-03-12 22:46:03'),
(181, 'currency_info.content', '{\"heading\":\"Reserve and Rates\",\"subheading\":\"See our reserve amount of several currencies and current rates\"}', NULL, 'blue_bliss', NULL, '2022-12-22 00:49:55', '2023-01-25 02:38:49'),
(182, 'policy_pages.element', '{\"title\":\"Refund Policy\",\"description\":\"<div><h5 class=\\\"mb-2\\\">What information do we collect?<\\/h5><p>We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">How do we protect your information?<\\/h5><p>All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Do we disclose any information to outside parties?<\\/h5><p>We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Children\'s Online Privacy Protection Act Compliance<\\/h5><p>We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Changes to our Privacy Policy<\\/h5><p>If we decide to change our privacy policy, we will post those changes on this page.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">How long we retain your information?<\\/h5><p>At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">What we don\\u2019t do with your data<\\/h5><p>We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', NULL, 'orange_oasis', 'refund-policy', '2022-12-22 01:03:42', '2025-03-12 22:39:22'),
(183, 'payment_gateway.element', '{\"has_image\":\"1\",\"gateway_image\":\"63d0d1d706a351674629591.png\"}', NULL, 'orange_oasis', NULL, '2022-09-09 05:36:28', '2023-01-25 00:53:11'),
(184, 'payment_gateway.element', '{\"has_image\":\"1\",\"gateway_image\":\"63d0d12dee4d11674629421.png\"}', NULL, 'orange_oasis', NULL, '2022-09-09 05:36:37', '2023-01-25 00:50:21'),
(185, 'payment_gateway.element', '{\"has_image\":\"1\",\"gateway_image\":\"63d0d05eb75031674629214.png\"}', NULL, 'orange_oasis', NULL, '2022-09-09 05:36:44', '2023-01-25 00:46:54'),
(186, 'payment_gateway.element', '{\"has_image\":\"1\",\"gateway_image\":\"63d0ce1c41e6f1674628636.png\"}', NULL, 'orange_oasis', NULL, '2022-09-09 05:36:51', '2023-01-25 00:37:16'),
(187, 'payment_gateway.element', '{\"has_image\":\"1\",\"gateway_image\":\"63d0cda2243851674628514.png\"}', NULL, 'orange_oasis', NULL, '2022-09-09 05:36:56', '2023-01-25 00:35:14'),
(188, 'payment_gateway.element', '{\"has_image\":\"1\",\"gateway_image\":\"63d0cced06d941674628333.png\"}', NULL, 'orange_oasis', NULL, '2022-09-09 05:37:04', '2023-01-25 00:32:13'),
(189, 'payment_gateway.element', '{\"has_image\":\"1\",\"gateway_image\":\"63d0cc189a1d81674628120.png\"}', NULL, 'orange_oasis', NULL, '2022-09-09 05:37:11', '2023-01-25 00:28:40'),
(190, 'payment_gateway.element', '{\"has_image\":\"1\",\"gateway_image\":\"63d0cf8d297101674629005.png\"}', NULL, 'orange_oasis', NULL, '2022-09-09 05:37:18', '2023-01-25 00:43:25'),
(191, 'payment_gateway.element', '{\"has_image\":\"1\",\"gateway_image\":\"63d0cfd87e6d51674629080.png\"}', NULL, 'orange_oasis', NULL, '2022-09-09 05:37:23', '2023-01-25 00:44:40'),
(192, 'affiliation.element', '{\"level\":\"1\",\"commission\":\"10\",\"description\":\"Earn 10% on direct referrals. Start building your network by inviting friends and family. Your first level is the foundation of earnings\\u2014 rewarding, and a great way to kickstart your income journey.\"}', NULL, 'orange_oasis', '', '2022-12-26 02:28:41', '2025-02-24 05:19:21'),
(193, 'affiliation.element', '{\"level\":\"2\",\"commission\":\"8\",\"description\":\"Get 8% on second-level referrals. Watch your network grow as your referrals bring in new members. This level expands your reach and boosts your earnings without extra effort.\"}', NULL, 'orange_oasis', '', '2022-12-26 02:28:41', '2025-02-24 05:17:18'),
(194, 'affiliation.element', '{\"level\":\"3\",\"commission\":\"7\",\"description\":\"Receive 7% on third-level referrals. Your network\\u2019s growth multiplies, creating a steady stream of passive income. Enjoy the benefits of a thriving community working together for success.\"}', NULL, 'orange_oasis', '', '2022-12-26 02:28:41', '2025-02-24 05:17:34'),
(195, 'affiliation.element', '{\"level\":\"4\",\"commission\":\"5\",\"description\":\"Earn 5% on fourth-level referrals. As your network deepens, your earnings increase effortlessly. This level ensures long-term rewards as your community continues to expand.\"}', NULL, 'orange_oasis', '', '2022-12-26 02:28:41', '2025-02-24 05:17:50'),
(196, 'affiliation.element', '{\"level\":\"5\",\"commission\":\"4\",\"description\":\"Gain 4% on fifth-level referrals. Your network\\u2019s exponential growth brings consistent income. This level maximizes your earning potential with minimal effort, rewarding your dedication.\"}', NULL, 'orange_oasis', '', '2022-12-26 02:28:41', '2025-02-24 05:18:02'),
(197, 'affiliation.element', '{\"level\":\"6\",\"commission\":\"3\",\"description\":\"Enjoy 3% on sixth-level referrals. The final tier ensures continuous rewards as your network grows. A true testament to the power of teamwork and passive income!\"}', NULL, 'orange_oasis', '', '2022-12-26 02:28:41', '2025-02-24 05:19:43'),
(198, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"description\":\"<div><h5 class=\\\"mb-2\\\">What information do we collect?<\\/h5><p>We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">How do we protect your information?<\\/h5><p>All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Do we disclose any information to outside parties?<\\/h5><p>We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Children\'s Online Privacy Protection Act Compliance<\\/h5><p>We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Changes to our Privacy Policy<\\/h5><p>If we decide to change our privacy policy, we will post those changes on this page.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">How long we retain your information?<\\/h5><p>At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">What we don\\u2019t do with your data<\\/h5><p>We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', NULL, 'blue_bliss', 'privacy-policy', '2022-12-26 02:48:05', '2025-03-12 22:40:21'),
(199, 'policy_pages.element', '{\"title\":\"Terms of Service\",\"description\":\"<div><h5 class=\\\"mb-2\\\">What information do we collect?<\\/h5><p>We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">How do we protect your information?<\\/h5><p>All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Do we disclose any information to outside parties?<\\/h5><p>We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Children\'s Online Privacy Protection Act Compliance<\\/h5><p>We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Changes to our Privacy Policy<\\/h5><p>If we decide to change our privacy policy, we will post those changes on this page.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">How long we retain your information?<\\/h5><p>At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">What we don\\u2019t do with your data<\\/h5><p>We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', NULL, 'blue_bliss', 'terms-of-service', '2022-12-26 02:48:05', '2025-03-12 22:40:13'),
(200, 'policy_pages.element', '{\"title\":\"Refund Policy\",\"description\":\"<div><h5 class=\\\"mb-2\\\">What information do we collect?<\\/h5><p>We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">How do we protect your information?<\\/h5><p>All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Do we disclose any information to outside parties?<\\/h5><p>We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Children\'s Online Privacy Protection Act Compliance<\\/h5><p>We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">Changes to our Privacy Policy<\\/h5><p>If we decide to change our privacy policy, we will post those changes on this page.<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">How long we retain your information?<\\/h5><p>At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><p><br \\/><\\/p><\\/div><div><h5 class=\\\"mb-2\\\">What we don\\u2019t do with your data<\\/h5><p>We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', NULL, 'blue_bliss', 'refund-policy', '2022-12-26 02:48:05', '2025-03-12 22:40:01'),
(201, 'register.content', '{\"heading\":\"Create New Account\"}', NULL, 'blue_bliss', NULL, '2022-12-26 07:20:59', '2022-12-26 07:20:59'),
(202, 'login.content', '{\"heading\":\"Login Your Account\"}', NULL, 'blue_bliss', NULL, '2022-12-26 07:22:08', '2022-12-26 07:22:08'),
(210, 'how_it_work.element', '{\"icon\":\"<i class=\\\"las la-sync\\\"><\\/i>\",\"title\":\"Pair Your Currency\",\"subtitle\":\"Select the sending ad receving amount with currency\"}', NULL, 'blue_bliss', NULL, '2023-01-15 09:22:14', '2023-01-25 02:45:03'),
(211, 'how_it_work.element', '{\"icon\":\"<i class=\\\"las la-check-circle\\\"><\\/i>\",\"title\":\"Confirm Your Exchange\",\"subtitle\":\"Send the amount need to be sent with valid payment information\"}', NULL, 'blue_bliss', NULL, '2023-01-15 09:22:33', '2023-01-25 02:46:07'),
(212, 'how_it_work.element', '{\"icon\":\"<i class=\\\"fas fa-hand-holding-usd\\\"><\\/i>\",\"title\":\"Get Expected Currency\",\"subtitle\":\"Confirm your payment to get your accepted currency\"}', NULL, 'blue_bliss', NULL, '2023-01-15 09:22:50', '2023-01-25 02:44:28'),
(220, 'contact_us.element', '{\"has_image\":\"1\",\"heading\":\"Give Us a Call\",\"subheading\":\"Give us a call for prompt assistance and friendly support\",\"value\":\"+1 808-671-0767\",\"icon\":\"63cfec1c9bbe41674570780.png\"}', NULL, 'orange_oasis', '', '2023-01-24 08:33:00', '2024-07-28 03:40:26'),
(221, 'contact_us.element', '{\"has_image\":\"1\",\"heading\":\"Leave Us a Message\",\"subheading\":\"Feel free to leave us a message, we\'ll get back to ASAP\",\"value\":\"support@changalab.com\",\"icon\":\"63cfec94d06371674570900.png\"}', NULL, 'orange_oasis', NULL, '2023-01-24 08:35:00', '2024-03-03 17:06:25'),
(222, 'contact_us.element', '{\"has_image\":\"1\",\"heading\":\"Meet Face to Face\",\"subheading\":\"Let\'s arrange a meeting for a personal discussion\",\"value\":\"New York, USA\",\"icon\":\"63cfecf64583f1674570998.png\"}', NULL, 'orange_oasis', NULL, '2023-01-24 08:36:38', '2024-03-03 17:08:22'),
(223, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"The Future of Currency Exchange: How Technology is Changing the Game\",\"description\":\"<p style=\\\"border:0px solid rgb(217,217,227);margin-right:0px;margin-bottom:1.25em;margin-left:0px;\\\">Currency exchange, also known as foreign exchange or forex, has come a long way since the days of physically exchanging cash at a bank or currency exchange bureau. Today, technology is playing an increasingly important role in the world of currency exchange, and it is changing the game in several ways. In this blog post, we will explore the future of currency exchange and how technology is shaping the industry.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">One of the biggest ways that technology is changing the currency exchange game is through the rise of online currency exchange platforms. These platforms allow users to buy and sell different types of currencies online, and they typically offer a wide range of currencies to choose from and allow users to exchange money at competitive rates. Some platforms also offer additional features such as price alerts, charts, and historical data to help users make informed decisions about when to buy or sell a specific currency.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Another way that technology is changing the currency exchange game is through the use of blockchain and cryptocurrency. Blockchain technology, which is the backbone of cryptocurrency, offers a secure and decentralized way to exchange money. Cryptocurrency, such as Bitcoin, Ethereum, and Litecoin, is based on blockchain technology and offers a new way for people to exchange value.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Artificial intelligence (AI) and machine learning (ML) technology also have a big impact on currency exchange. These technologies can help to predict market movements, understand the customer\'s behavior, and develop better exchange rates. AI-based chatbots are also becoming more common in online currency exchange platforms, providing instant customer service and assistance.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">In addition to the above, mobile technology is also playing an important role in currency exchange. Many online currency exchange platforms now offer mobile apps, which allow users to exchange money and manage their accounts on the go. This makes it easy for people to exchange money while traveling or to make quick trades while they\'re out and about.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin-top:1.25em;margin-right:0px;margin-left:0px;\\\">In conclusion, technology is changing the game in the world of currency exchange. Online currency exchange platforms, blockchain and cryptocurrency, AI, and mobile technology are all making it easier and more convenient for people to exchange money. As technology continues to evolve, it\'s likely that we will see even more changes and innovation in the currency exchange industry in the future. By staying on top of these trends and developments, individuals and businesses can make the most of their money and stay ahead of the game in the fast-paced world of currency exchange.<\\/p>\",\"blog_image\":\"63d0dc5c32e6c1674632284.png\"}', NULL, 'orange_oasis', 'the-future-of-currency-exchange:-how-technology-is-changing-the-game', '2023-01-25 01:38:03', '2023-01-25 01:38:04'),
(224, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Currency Trading 101: Understanding the Risks and Rewards\",\"description\":\"<p style=\\\"border:0px solid rgb(217,217,227);margin-right:0px;margin-bottom:1.25em;margin-left:0px;\\\">Currency trading, also known as forex trading or foreign exchange trading, is the process of buying and selling different types of currencies in the hopes of making a profit. It is a popular form of investment, but it is also a high-risk and speculative one. In this blog post, we will explore the basics of currency trading, and discuss the risks and rewards associated with it.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">When you trade currency, you are essentially betting on the movement of exchange rates between different currencies. If you believe that a certain currency will appreciate in value, you would buy that currency and sell another one. If your prediction is correct, you can make a profit. However, if your prediction is wrong, you can lose money.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">One of the main risks associated with currency trading is the volatility of exchange rates. Exchange rates can fluctuate wildly, and they can be affected by a variety of factors, such as economic conditions, government policies, and market sentiment. This means that even experienced traders can be caught off guard by sudden changes in the market.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Another risk associated with currency trading is the use of leverage. Leverage allows traders to trade larger amounts of money than they have in their account. This can amplify potential profits, but it can also amplify potential losses. Leverage also makes it easier to trade more than you can afford to lose, which can be risky.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Despite the risks, there are also potential rewards associated with currency trading. The most obvious reward is the potential for profit. If you can correctly predict changes in exchange rates, you can make money. Currency trading can also be a way to diversify your investment portfolio, and potentially mitigate risk.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">It\'s important to note that currency trading is not suitable for everyone and it should only be done by experienced investors who understand the risks involved. It\'s also important to do your research and to consult with a financial advisor or currency trading expert before making any investment decisions.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin-top:1.25em;margin-right:0px;margin-left:0px;\\\">In conclusion, currency trading, also known as forex trading or foreign exchange trading, is a popular form of investment that can offer potential rewards, but it\'s also a high-risk and speculative one. It\'s important to understand the risks and rewards associated with currency trading before getting involved and to consult with a financial advisor or currency trading expert. With the right knowledge and approach, it can be a powerful tool for maximizing your money, but it\'s crucial to be aware of the risks and to act accordingly.<\\/p>\",\"blog_image\":\"63d0de4bf07021674632779.jpg\"}', NULL, 'orange_oasis', 'currency-trading-101:-understanding-the-risks-and-rewards', '2023-01-25 01:46:19', '2023-01-25 01:46:20'),
(225, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Streamline Your Financial Transactions: How to Use Online Currency Exchange Platforms\",\"description\":\"<p style=\\\"border:0px solid rgb(217,217,227);margin-right:0px;margin-bottom:1.25em;margin-left:0px;\\\">Online currency exchange platforms are a convenient and efficient way to manage your international financial transactions. They allow you to buy and sell different types of currencies at competitive rates, and they can help you streamline your financial transactions. In this blog post, we will explore how to use online currency exchange platforms, and discuss the benefits of doing so.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">The first step to using an online currency exchange platform is to research and compare the different options available. Look for platforms that offer a wide range of currencies, competitive exchange rates, and low fees. It\'s also important to check the platform\'s security measures, as they handle sensitive financial information.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Once you\'ve selected a platform, you\'ll need to create an account. This typically involves providing personal and financial information, such as your name, address, and bank account information. It\'s important to ensure that the platform is fully compliant with all relevant laws and regulations, and that your personal and financial data is protected.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Once your account is set up, you can start buying and selling currencies. To buy a currency, you\'ll need to transfer funds into your account, and then place an order for the currency you want to buy. To sell a currency, you\'ll need to transfer the currency you want to sell into your account, and then place an order to sell it.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Online currency exchange platforms also usually provide additional features such as price alerts, charts, and historical data to help you make informed decisions about when to buy or sell a specific currency. This can help you to take advantage of market fluctuations and potentially make a profit.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Another advantage of using online currency exchange platforms is that they\'re typically available 24\\/7, so you can make transactions at any time. This is especially useful for people who travel frequently or do business internationally.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin-top:1.25em;margin-right:0px;margin-left:0px;\\\">In conclusion, online currency exchange platforms can help streamline your financial transactions and make it easier to manage your international finances. They offer a wide range of currencies at competitive rates, and they provide additional features such as price alerts and charts to help you make informed decisions. They\'re typically available 24\\/7, which is useful for people who travel frequently or do business internationally. By researching and comparing the different options available, creating an account, and keeping an eye on the market, you can make the most of these platforms and potentially save money on your currency exchanges.<\\/p>\",\"blog_image\":\"63d0df4910ae61674633033.jpg\"}', NULL, 'orange_oasis', 'streamline-your-financial-transactions:-how-to-use-online-currency-exchange-platforms', '2023-01-25 01:50:32', '2023-01-25 01:50:33'),
(232, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Maximizing Your Money: Understanding and Utilizing Currency Exchange Rates\",\"description\":\"<p style=\\\"border:0px solid rgb(217,217,227);margin-right:0px;margin-bottom:1.25em;margin-left:0px;\\\">Maximizing your money is a goal that many people have, whether it\'s for travel, investing, or saving for the future. One way to make the most of your money is by understanding and utilizing currency exchange rates.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Currency exchange rates are the value of one currency in relation to another currency. For example, if the exchange rate between the US dollar and the euro is 1.20, that means that for every US dollar, you can receive 1.20 euros. Exchange rates fluctuate constantly, and they can be affected by a variety of factors, such as economic conditions, government policies, and market sentiment.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">There are a few key things to keep in mind when it comes to currency exchange rates. First, it\'s important to keep an eye on the exchange rate between your home currency and the currency of the country you\'re planning to visit or do business with. This will give you an idea of how much your money is worth in that country and how much you can expect to pay for goods and services.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Second, it\'s a good idea to compare exchange rates from different sources, such as banks, financial institutions, and online currency exchange platforms. Each of these sources may have slightly different exchange rates and fees, so it\'s important to shop around for the best deal.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Third, you should be aware of the market conditions and regulations that can affect the exchange rate. For example, if a country\'s economy is struggling, its currency may weaken, which can make it a less favorable time to exchange money.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Finally, if you\'re planning to invest in foreign currencies, it\'s important to do your research and understand the risks involved. Currency trading is a speculative and high-risk investment, and it should only be done by experienced investors who understand the risks involved.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin-top:1.25em;margin-right:0px;margin-left:0px;\\\">By understanding and utilizing currency exchange rates, you can make the most of your money and potentially save money when traveling, investing, or doing business internationally. Keep an eye on exchange rates, compare rates from different sources, be aware of market conditions and regulations, and do your research before investing in foreign currencies. With a little knowledge and research, you can maximize your money and reach your financial goals.<\\/p>\",\"blog_image\":\"63d0e893333df1674635411.png\"}', NULL, 'blue_bliss', 'maximizing-your-money:-understanding-and-utilizing-currency-exchange-rates', '2023-01-25 02:26:44', '2023-01-25 02:30:11');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `seo_content`, `tempname`, `slug`, `created_at`, `updated_at`) VALUES
(233, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"The Basics of Money Exchange: How it Works and How to Make Informed Decisions\",\"description\":\"<p style=\\\"border:0px solid rgb(217,217,227);margin-right:0px;margin-bottom:1.25em;margin-left:0px;\\\">Money exchange, also known as foreign exchange or forex, is the process of converting one currency into another. It is an essential part of international trade and travel, and it is also a popular form of investment. In this blog post, we will explore the basics of money exchange and how it works.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">When you exchange money, you are essentially buying one currency and selling another. For example, if you want to convert US dollars into euros, you would sell your US dollars and buy euros in return. The exchange rate between the two currencies will determine the amount of euros you receive for your dollars. Exchange rates fluctuate constantly, and they can be affected by a variety of factors, such as economic conditions, government policies, and market sentiment.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Money exchange can be done in a variety of ways. One of the most common ways is through a bank or financial institution. Banks and financial institutions typically offer a wide range of currencies and competitive exchange rates, but they also charge fees and commissions for their services. Another way to exchange money is through an online currency exchange platform. These platforms typically offer a wider range of currencies and more competitive exchange rates than banks and financial institutions. However, it\'s important to research and compares fees and exchange rates before using any online currency exchange platform.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Money exchange is not just for international trade and travel, it\'s also a popular form of investment. Many investors use currency trading as a way to make money from fluctuations in exchange rates. Currency trading is a speculative and high-risk investment, and it should only be done by experienced investors who understand the risks involved.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin-top:1.25em;margin-right:0px;margin-left:0px;\\\">In conclusion, money exchange is an essential part of international trade and travel, and it can also be a popular form of investment. It is important to understand the basics of how it works and to research and compare fees and exchange rates before making any exchange. It\'s also crucial to be aware of the market conditions and regulations that can affect the exchange rate. With a little knowledge and research, you can make informed decisions and potentially save money when exchanging currency.<\\/p>\",\"blog_image\":\"63d0e87e0ff051674635390.png\"}', NULL, 'blue_bliss', 'the-basics-of-money-exchange:-how-it-works-and-how-to-make-informed-decisions', '2023-01-25 02:26:44', '2023-01-25 02:29:50'),
(234, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"The Ins and Outs of Foreign Exchange: A Comprehensive Guide\",\"description\":\"<p style=\\\"border:0px solid rgb(217,217,227);margin-right:0px;margin-bottom:1.25em;margin-left:0px;\\\">Foreign exchange, also known as forex or currency trading, is the process of buying and selling different types of currencies. It is an essential part of international trade and travel, and it is also a popular form of investment. In this blog post, we will explore the ins and outs of foreign exchange, and provide a comprehensive guide on how it works.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">When you exchange money, you are essentially buying one currency and selling another. For example, if you want to convert US dollars into euros, you would sell your US dollars and buy euros in return. The exchange rate between the two currencies will determine the amount of euros you receive for your dollars. Exchange rates fluctuate constantly, and they can be affected by a variety of factors, such as economic conditions, government policies, and market sentiment.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">There are a few different ways to exchange money. One of the most common ways is through a bank or financial institution. Banks and financial institutions typically offer a wide range of currencies and competitive exchange rates, but they also charge fees and commissions for their services. Another way to exchange money is through an online currency exchange platform. These platforms typically offer a wider range of currencies and more competitive exchange rates than banks and financial institutions, but it\'s important to research and compare fees and exchange rates before using any online currency exchange platform.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Foreign exchange is not just for international trade and travel, it\'s also a popular form of investment. Many investors use currency trading as a way to make money from fluctuations in exchange rates. Currency trading is a speculative and high-risk investment, and it should only be done by experienced investors who understand the risks involved.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">In addition to the above, there are a few key things to keep in mind when it comes to foreign exchange. First, it\'s important to keep an eye on the exchange rate between the currency you hold and the currency you want to buy or sell. This will give you an idea of how much your money is worth in that currency.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Second, it\'s important to be aware of the market conditions and regulations that can affect the exchange rate. For example, if a country\'s economy is struggling, its currency may weaken, which can make it a less favorable time to exchange money.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Third, you should also be aware of the different types of exchanges such as OTC, spot and forward exchange rates. Knowing the differences between them can help you make better decisions on when to make the exchange.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Finally, it\'s always a good idea to do your research and to consult with a financial advisor or currency trading expert before making any investment decisions.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin-top:1.25em;margin-right:0px;margin-left:0px;\\\">In conclusion, foreign exchange is an essential part of international trade and travel, and it can also be a popular form of investment. It is important to understand the ins and outs of how it works and to research and compare fees and exchange rates before making any exchange. It\'s also crucial to be aware of the market conditions and regulations that can affect the exchange rate. By keeping these things in mind, you can make informed decisions and potentially save money when exchanging currency.<\\/p>\",\"blog_image\":\"63d0e869256d81674635369.png\"}', NULL, 'blue_bliss', 'the-ins-and-outs-of-foreign-exchange:-a-comprehensive-guide', '2023-01-25 02:26:44', '2023-01-25 02:29:29'),
(235, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"The Future of Currency Exchange: How Technology is Changing the Game\",\"description\":\"<p style=\\\"border:0px solid rgb(217,217,227);margin-right:0px;margin-bottom:1.25em;margin-left:0px;\\\">Currency exchange, also known as foreign exchange or forex, has come a long way since the days of physically exchanging cash at a bank or currency exchange bureau. Today, technology is playing an increasingly important role in the world of currency exchange, and it is changing the game in several ways. In this blog post, we will explore the future of currency exchange and how technology is shaping the industry.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">One of the biggest ways that technology is changing the currency exchange game is through the rise of online currency exchange platforms. These platforms allow users to buy and sell different types of currencies online, and they typically offer a wide range of currencies to choose from and allow users to exchange money at competitive rates. Some platforms also offer additional features such as price alerts, charts, and historical data to help users make informed decisions about when to buy or sell a specific currency.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Another way that technology is changing the currency exchange game is through the use of blockchain and cryptocurrency. Blockchain technology, which is the backbone of cryptocurrency, offers a secure and decentralized way to exchange money. Cryptocurrency, such as Bitcoin, Ethereum, and Litecoin, is based on blockchain technology and offers a new way for people to exchange value.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Artificial intelligence (AI) and machine learning (ML) technology also have a big impact on currency exchange. These technologies can help to predict market movements, understand the customer\'s behavior, and develop better exchange rates. AI-based chatbots are also becoming more common in online currency exchange platforms, providing instant customer service and assistance.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">In addition to the above, mobile technology is also playing an important role in currency exchange. Many online currency exchange platforms now offer mobile apps, which allow users to exchange money and manage their accounts on the go. This makes it easy for people to exchange money while traveling or to make quick trades while they\'re out and about.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin-top:1.25em;margin-right:0px;margin-left:0px;\\\">In conclusion, technology is changing the game in the world of currency exchange. Online currency exchange platforms, blockchain and cryptocurrency, AI, and mobile technology are all making it easier and more convenient for people to exchange money. As technology continues to evolve, it\'s likely that we will see even more changes and innovation in the currency exchange industry in the future. By staying on top of these trends and developments, individuals and businesses can make the most of their money and stay ahead of the game in the fast-paced world of currency exchange.<\\/p>\",\"blog_image\":\"63d0e8547bb101674635348.png\"}', NULL, 'blue_bliss', 'the-future-of-currency-exchange:-how-technology-is-changing-the-game', '2023-01-25 02:26:44', '2023-01-25 02:29:08'),
(236, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Currency Trading 101: Understanding the Risks and Rewards\",\"description\":\"<p style=\\\"border:0px solid rgb(217,217,227);margin-right:0px;margin-bottom:1.25em;margin-left:0px;\\\">Currency trading, also known as forex trading or foreign exchange trading, is the process of buying and selling different types of currencies in the hopes of making a profit. It is a popular form of investment, but it is also a high-risk and speculative one. In this blog post, we will explore the basics of currency trading, and discuss the risks and rewards associated with it.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">When you trade currency, you are essentially betting on the movement of exchange rates between different currencies. If you believe that a certain currency will appreciate in value, you would buy that currency and sell another one. If your prediction is correct, you can make a profit. However, if your prediction is wrong, you can lose money.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">One of the main risks associated with currency trading is the volatility of exchange rates. Exchange rates can fluctuate wildly, and they can be affected by a variety of factors, such as economic conditions, government policies, and market sentiment. This means that even experienced traders can be caught off guard by sudden changes in the market.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Another risk associated with currency trading is the use of leverage. Leverage allows traders to trade larger amounts of money than they have in their account. This can amplify potential profits, but it can also amplify potential losses. Leverage also makes it easier to trade more than you can afford to lose, which can be risky.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Despite the risks, there are also potential rewards associated with currency trading. The most obvious reward is the potential for profit. If you can correctly predict changes in exchange rates, you can make money. Currency trading can also be a way to diversify your investment portfolio, and potentially mitigate risk.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">It\'s important to note that currency trading is not suitable for everyone and it should only be done by experienced investors who understand the risks involved. It\'s also important to do your research and to consult with a financial advisor or currency trading expert before making any investment decisions.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin-top:1.25em;margin-right:0px;margin-left:0px;\\\">In conclusion, currency trading, also known as forex trading or foreign exchange trading, is a popular form of investment that can offer potential rewards, but it\'s also a high-risk and speculative one. It\'s important to understand the risks and rewards associated with currency trading before getting involved and to consult with a financial advisor or currency trading expert. With the right knowledge and approach, it can be a powerful tool for maximizing your money, but it\'s crucial to be aware of the risks and to act accordingly.<\\/p>\",\"blog_image\":\"63d0e839971a31674635321.jpg\"}', NULL, 'blue_bliss', 'currency-trading-101:-understanding-the-risks-and-rewards', '2023-01-25 02:26:45', '2023-01-25 02:28:41'),
(237, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Streamline Your Financial Transactions: How to Use Online Currency Exchange Platforms\",\"description\":\"<p style=\\\"border:0px solid rgb(217,217,227);margin-right:0px;margin-bottom:1.25em;margin-left:0px;\\\">Online currency exchange platforms are a convenient and efficient way to manage your international financial transactions. They allow you to buy and sell different types of currencies at competitive rates, and they can help you streamline your financial transactions. In this blog post, we will explore how to use online currency exchange platforms, and discuss the benefits of doing so.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">The first step to using an online currency exchange platform is to research and compare the different options available. Look for platforms that offer a wide range of currencies, competitive exchange rates, and low fees. It\'s also important to check the platform\'s security measures, as they handle sensitive financial information.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Once you\'ve selected a platform, you\'ll need to create an account. This typically involves providing personal and financial information, such as your name, address, and bank account information. It\'s important to ensure that the platform is fully compliant with all relevant laws and regulations, and that your personal and financial data is protected.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Once your account is set up, you can start buying and selling currencies. To buy a currency, you\'ll need to transfer funds into your account, and then place an order for the currency you want to buy. To sell a currency, you\'ll need to transfer the currency you want to sell into your account, and then place an order to sell it.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Online currency exchange platforms also usually provide additional features such as price alerts, charts, and historical data to help you make informed decisions about when to buy or sell a specific currency. This can help you to take advantage of market fluctuations and potentially make a profit.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin:1.25em 0px;\\\">Another advantage of using online currency exchange platforms is that they\'re typically available 24\\/7, so you can make transactions at any time. This is especially useful for people who travel frequently or do business internationally.<\\/p><p style=\\\"border:0px solid rgb(217,217,227);margin-top:1.25em;margin-right:0px;margin-left:0px;\\\">In conclusion, online currency exchange platforms can help streamline your financial transactions and make it easier to manage your international finances. They offer a wide range of currencies at competitive rates, and they provide additional features such as price alerts and charts to help you make informed decisions. They\'re typically available 24\\/7, which is useful for people who travel frequently or do business internationally. By researching and comparing the different options available, creating an account, and keeping an eye on the market, you can make the most of these platforms and potentially save money on your currency exchanges.<\\/p>\",\"blog_image\":\"63d0e81b972c41674635291.jpg\"}', NULL, 'blue_bliss', 'streamline-your-financial-transactions:-how-to-use-online-currency-exchange-platforms', '2023-01-25 02:26:45', '2023-01-25 02:28:12'),
(238, 'faq.element', '{\"question\":\"How does your currency exchange platform work?\",\"answer\":\"Our currency exchange platform allows users to buy and sell different types of currencies at competitive rates. Users can create an account, transfer funds, and place orders to buy or sell currencies.\"}', NULL, 'orange_oasis', NULL, '2023-01-25 05:49:10', '2023-01-25 05:49:10'),
(239, 'faq.element', '{\"question\":\"What types of currencies do you offer?\",\"answer\":\"We offer a wide range of currencies to choose from, including major currencies such as US dollar, Euro, British pound, and Japanese yen, as well as a variety of other currencies.\"}', NULL, 'orange_oasis', NULL, '2023-01-25 05:49:25', '2023-01-25 05:49:25'),
(240, 'faq.element', '{\"question\":\"How do I create an account on your platform?\",\"answer\":\"To create an account, you will need to provide personal and financial information, such as your name, address, and bank account information. We also have a verification process in place to ensure the security of our users\' information.\"}', NULL, 'orange_oasis', NULL, '2023-01-25 05:49:38', '2023-01-25 05:49:38'),
(241, 'faq.element', '{\"question\":\"Are there any fees associated with using your platform?\",\"answer\":\"Yes, there are fees associated with using our platform, but they are generally lower than the fees charged by banks and traditional financial institutions. The fee will depend on the type of transaction and the amount.\"}', NULL, 'orange_oasis', NULL, '2023-01-25 05:51:38', '2023-01-25 05:51:38'),
(242, 'faq.element', '{\"question\":\"Is your platform safe and secure?\",\"answer\":\"Yes, our platform uses the latest security measures to ensure the safety and security of our users\' personal and financial information. We also comply with all relevant laws and regulations.\"}', NULL, 'orange_oasis', NULL, '2023-01-25 05:51:55', '2023-01-25 05:51:55'),
(243, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"exchange platform\",\"currency exchange platform\",\"changalab\",\"usd to inr\",\"currency exchnage\",\"easy exchange\",\"money exhcngae\",\"bitcoin to usd\",\"money exchange\",\"crypto currency exchange\",\"crypto currency\"],\"description\":\"ChangaLab can be explained as a network of buyers and sellers, who transfer currency between each other or for their own. It is the means by which individuals, and companies convert one currency into another. This Currency Exchange Platform is the most advanced script in Codecanyon. The Currency Exchange Platform is endlessly appealing, feature-loaded, customized, and possesses the remarkable capability of running on all devices and operating systems.\",\"social_title\":\"ChangeLab\",\"social_description\":\"ChangaLab can be explained as a network of buyers and sellers, who transfer currency between each other or for their own. It is the means by which individuals, companies convert one currency into another. This Currency Exchange Platform is the most advanced script in Codecanyon. The Currency Exchange Platform is endlessly appealing, feature-loaded, customized, and possesses the remarkable capability of running on all devices and operating systems.\",\"image\":\"63d28b1c3530e1674742556.png\"}', NULL, NULL, NULL, '2023-01-26 08:15:56', '2023-01-26 08:15:56'),
(244, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"exchange platform\",\"currency exchange platform\",\"changalab\",\"usd to inr\",\"currency exchnage\",\"easy exchange\",\"money exhcngae\",\"bitcoin to usd\",\"money exchange\",\"crypto currency exchange\",\"crypto currency\"],\"description\":\"ChangaLab can be explained as a network of buyers and sellers, who transfer currency between each other or for their own. It is the means by which individuals, and companies convert one currency into another. This Currency Exchange Platform is the most advanced script in Codecanyon. The Currency Exchange Platform is endlessly appealing, feature-loaded, customized, and possesses the remarkable capability of running on all devices and operating systems.\",\"social_title\":\"ChangeLab\",\"social_description\":\"ChangaLab can be explained as a network of buyers and sellers, who transfer currency between each other or for their own. It is the means by which individuals, companies convert one currency into another. This Currency Exchange Platform is the most advanced script in Codecanyon. The Currency Exchange Platform is endlessly appealing, feature-loaded, customized, and possesses the remarkable capability of running on all devices and operating systems.\",\"image\":\"63d28b3cbfc3d1674742588.png\"}', NULL, NULL, NULL, '2023-01-26 08:16:28', '2023-01-26 08:16:28'),
(245, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"exchange platform\",\"currency exchange platform\",\"changalab\",\"usd to inr\",\"currency exchnage\",\"easy exchange\",\"money exhcngae\",\"bitcoin to usd\",\"money exchange\",\"crypto currency exchange\",\"crypto currency\"],\"description\":\"ChangaLab can be explained as a network of buyers and sellers, who transfer currency between each other or for their own. It is the means by which individuals, and companies convert one currency into another. This Currency Exchange Platform is the most advanced script in Codecanyon. The Currency Exchange Platform is endlessly appealing, feature-loaded, customized, and possesses the remarkable capability of running on all devices and operating systems.\",\"social_title\":\"ChangeLab\",\"social_description\":\"ChangaLab can be explained as a network of buyers and sellers, who transfer currency between each other or for their own. It is the means by which individuals, companies convert one currency into another. This Currency Exchange Platform is the most advanced script in Codecanyon. The Currency Exchange Platform is endlessly appealing, feature-loaded, customized, and possesses the remarkable capability of running on all devices and operating systems.\",\"image\":\"63d4b742251c31674884930.png\"}', NULL, NULL, NULL, '2023-01-27 23:48:50', '2023-01-27 23:48:50'),
(246, 'trustpilot_review.content', '{\"heading\":\"Trust amplified unfiltered reviews\",\"subheading\":\"Empowering customers, inspiring trust, unfiltered Trustpilot Reviews\"}', NULL, 'blue_bliss', NULL, '2023-06-18 03:37:35', '2023-06-18 03:37:35'),
(247, 'trustpilot_review.content', '{\"heading\":\"Trust amplified unfiltered reviews\",\"subheading\":\"Empowering customers, inspiring trust, unfiltered Trustpilot Reviews\"}', NULL, 'orange_oasis', NULL, '2023-06-18 01:41:42', '2023-06-21 05:12:50'),
(250, 'register_disable.content', '{\"has_image\":\"1\",\"heading\":\"Registration Currently Disabled\",\"subheading\":\"Page you are looking for doesn\'t exit or an other error occurred or temporarily unavailable.\",\"image\":\"66488b6067df71716030304.png\"}', NULL, 'orange_oasis', '', '2024-05-18 05:05:04', '2025-03-12 22:52:21'),
(251, 'register_disable.content', '{\"has_image\":\"1\",\"heading\":\"Registration Currently Disabled\",\"subheading\":\"Page you are looking for doesn\'t exit or an other error occurred or temporarily unavailable.\",\"button_name\":\"Go to Home\",\"button_url\":\"\\/\",\"image\":\"66488b6067df71716030304.png\"}', NULL, 'blue_bliss', '', '2024-05-18 05:05:04', '2024-05-18 05:05:04'),
(252, 'notice_bar.content', '{\"title\":\"We are using a merchant for Skrill and NETELLER so in order to buy from their gateway you have to buy a minimum of 5250 INR equivalent.\"}', NULL, 'orange_oasis', '', '2022-09-10 10:26:59', '2024-07-30 06:31:33'),
(253, 'notice_bar.content', '{\"title\":\"We are using a merchant for Skrill and NETELLER so in order to buy from their gateway you have to buy a minimum of 5250 BDT equivalent.\"}', NULL, 'blue_bliss', '', '2024-01-04 18:00:50', '2024-07-07 21:52:31'),
(254, 'contact_us.content', '{\"has_image\":\"1\",\"heading\":\"Contact With Us\",\"subheading\":\"Get In Touch With Us\",\"email\":\"support@changalab.com\",\"email_title\":\"Mail Us\",\"email_subtitle\":\"Reach Out with Questions or Comments Anytime\",\"email_icon\":\"<i class=\\\"far fa-envelope\\\"><\\/i>\",\"mobile\":\"570-869-8015\",\"mobile_title\":\"Mobile\",\"mobile_subtitle\":\"Call us for support and swift solutions today\",\"mobile_icon\":\"<i class=\\\"fas fa-phone\\\"><\\/i>\",\"address\":\"90 School Lane DERBY DE14 1BE\",\"address_title\":\"Address\",\"address_subtitle\":\"Reach out to us for inquiries and support\",\"address_icon\":\"<i class=\\\"fas fa-map-marker-alt\\\"><\\/i>\",\"image\":\"668ba1d40adff1720426964.png\"}', NULL, 'blue_bliss', '', '2020-10-27 00:59:19', '2024-07-28 06:20:44'),
(255, 'contact_us.content', '{\"heading\":\"Contact With Us\",\"subheading\":\"Get In Touch With Us\",\"map_url\":\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d2624.896389560072!2d2.3435399769064498!3d48.860186100579476!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e66e1f417951ff%3A0x26e713d69f45c1ce!2s15%20Rue%20des%20Halles%2C%2075001%20Paris%2C%20France!5e0!3m2!1sen!2sbd!4v1689267291790!5m2!1sen!2sbd\"}', NULL, 'orange_oasis', '', '2022-10-22 01:58:04', '2024-07-29 06:16:39'),
(256, 'mobile_app.content', '{\"has_image\":\"1\",\"heading\":\"Changalab - Currency Exchange Mobile App\",\"description\":\"ChangaLab is a currency exchange flutter mobile application (Android &IOS) that comes with the \\u201cChangaLab \\u2013 Currency Exchange Platform\\u201d CMS. Created with aspiring entrepreneurs and businesses entering the exciting world of currency exchange in mind\",\"mobile_image\":\"67d263e970e4c1741841385.png\"}', NULL, 'blue_bliss', '', '2024-07-08 03:47:26', '2025-03-12 22:49:46'),
(257, 'mobile_app.content', '{\"has_image\":\"1\",\"heading\":\"Changalab - Currency Exchange Mobile App\",\"description\":\"ChangaLab is a currency exchange flutter mobile application (Android &IOS) that comes with the \\u201cChangaLab \\u2013 Currency Exchange Platform\\u201d CMS. Created with aspiring entrepreneurs and businesses entering the exciting world of currency exchange in mind\",\"app_title\":\"Over 70 million downloads worldwide\",\"mobile_image\":\"67d2644f1c4341741841487.png\"}', NULL, 'orange_oasis', '', '2024-07-13 03:08:07', '2025-03-12 22:51:27'),
(258, 'mobile_app.element', '{\"has_image\":\"1\",\"download_link\":\"https:\\/\\/play.google.com\\/store\\/apps?hl=en\",\"app_store_image\":\"67d264106feb31741841424.png\"}', NULL, 'blue_bliss', '', '2025-03-12 22:50:24', '2025-03-12 22:50:24'),
(259, 'mobile_app.element', '{\"has_image\":\"1\",\"download_link\":\"https:\\/\\/www.apple.com\\/store\",\"app_store_image\":\"67d26419db2f31741841433.png\"}', NULL, 'blue_bliss', '', '2025-03-12 22:50:33', '2025-03-12 22:50:33'),
(260, 'mobile_app.element', '{\"has_image\":\"1\",\"download_link\":\"https:\\/\\/play.google.com\\/store\\/apps?hl=en\",\"app_store_image\":\"67d26457e90a41741841495.png\"}', NULL, 'orange_oasis', '', '2025-03-12 22:51:35', '2025-03-12 22:51:35'),
(261, 'mobile_app.element', '{\"has_image\":\"1\",\"download_link\":\"https:\\/\\/www.apple.com\\/store\",\"app_store_image\":\"67d2645ed6a8f1741841502.png\"}', NULL, 'orange_oasis', '', '2025-03-12 22:51:42', '2025-03-12 22:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` int UNSIGNED NOT NULL DEFAULT '0',
  `code` int DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text COLLATE utf8mb4_unicode_ci,
  `supported_currencies` text COLLATE utf8mb4_unicode_ci,
  `crypto` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 101, 'Paypal', 'Paypal', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"----------------\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-10-18 07:42:54'),
(2, 0, 102, 'Perfect Money', 'PerfectMoney', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"----------------\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:35:33'),
(3, 0, 103, 'Stripe Hosted', 'Stripe', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"----------------\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:48:36'),
(4, 0, 104, 'Skrill', 'Skrill', 1, '{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"---\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:30:16'),
(5, 0, 105, 'PayTM', 'Paytm', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"----------------\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"----------------\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"----------------\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"----------------\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"----------------\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 03:00:44'),
(6, 0, 106, 'Payeer', 'Payeer', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"----------------\"}}', NULL, '2019-09-14 13:14:22', '2022-08-28 10:11:14'),
(7, 0, 107, 'PayStack', 'Paystack', 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"----------------\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"----------------\"}}\r\n', NULL, '2019-09-14 13:14:22', '2021-05-21 01:49:51'),
(9, 0, 109, 'Flutterwave', 'Flutterwave', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-06-05 11:37:45'),
(10, 0, 110, 'RazorPay', 'Razorpay', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"----------------\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"----------------\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:51:32'),
(11, 0, 111, 'Stripe Storefront', 'StripeJs', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"----------------\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:53:10'),
(12, 0, 112, 'Instamojo', 'Instamojo', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"----------------\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"----------------\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"----------------\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:56:20'),
(13, 0, 501, 'Blockchain', 'Blockchain', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"----------------\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"----------------\"}}', '{\"BTC\":\"BTC\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2022-03-21 07:41:56'),
(15, 0, 503, 'CoinPayments', 'Coinpayments', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"----------------\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"USDT.BEP20\":\"Tether USD (BSC Chain)\",\"USDT.ERC20\":\"Tether USD (ERC20)\",\"USDT.TRC20\":\"Tether USD (Tron/TRC20)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:14'),
(16, 0, 504, 'CoinPayments Fiat', 'CoinpaymentsFiat', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:44'),
(17, 0, 505, 'Coingate', 'Coingate', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-03-30 09:24:57'),
(18, 0, 506, 'Coinbase Commerce', 'CoinbaseCommerce', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"----------------\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"----------------\"}}', NULL, '2019-09-14 13:14:22', '2021-05-21 02:02:47'),
(19, 0, 113, 'Paypal Express', 'PaypalSdk', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"----------------\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"----------------\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-20 23:01:08'),
(20, 0, 114, 'Stripe Checkout', 'StripeV3', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"----------------\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"----------------\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"----------------\"}}', NULL, '2019-09-14 13:14:22', '2021-05-21 00:58:38'),
(21, 0, 115, 'Mollie', 'Mollie', 1, '{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"----------------\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"----------------\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:44:45'),
(22, 0, 116, 'Cashmaal', 'Cashmaal', 1, '{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"----------------\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"----------------\"}}', '{\"PKR\":\"PKR\",\"USD\":\"USD\"}', 0, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"----------------\"}}', NULL, NULL, '2021-06-22 08:05:04'),
(23, 0, 119, 'Mercado Pago', 'MercadoPago', 1, '{\"access_token\":{\"title\":\"Access Token\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2022-09-14 07:41:14'),
(24, 0, 120, 'Authorize.net', 'Authorize', 1, '{\"login_id\":{\"title\":\"Login ID\",\"global\":true,\"value\":\"----------------\"},\"transaction_key\":{\"title\":\"Transaction Key\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2022-08-28 09:33:06'),
(25, 0, 121, 'NMI', 'NMI', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"----------------\"}}', '{\"AED\":\"AED\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"RUB\":\"RUB\",\"SEC\":\"SEC\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2022-08-28 10:32:31'),
(56, 0, 510, 'Binance', 'Binance', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"----------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"----------------\"}}', '{\"BTC\":\"Bitcoin\",\"USD\":\"USD\",\"BNB\":\"BNB\"}', 1, '{\"cron\":{\"title\": \"Cron Job URL\",\"value\":\"----------------\"}}', NULL, NULL, '2023-02-14 05:08:04'),
(57, 0, 124, 'SslCommerz', 'SslCommerz', 1, '{\"store_id\":{\"title\":\"Store ID\",\"global\":true,\"value\":\"---------\"},\"store_password\":{\"title\":\"Store Password\",\"global\":true,\"value\":\"----------\"}}', '{\"BDT\":\"BDT\",\"USD\":\"USD\",\"EUR\":\"EUR\",\"SGD\":\"SGD\",\"INR\":\"INR\",\"MYR\":\"MYR\"}', 0, NULL, NULL, NULL, '2024-07-29 07:37:38'),
(58, 0, 125, 'Aamarpay', 'Aamarpay', 1, '{\"store_id\":{\"title\":\"Store ID\",\"global\":true,\"value\":\"---------\"},\"signature_key\":{\"title\":\"Signature Key\",\"global\":true,\"value\":\"----------\"}}', '{\"BDT\":\"BDT\"}', 0, NULL, NULL, NULL, '2024-07-29 07:25:47'),
(59, 0, 126, '2Checkout', 'TwoCheckout', 1, '{\"merchant_code\":{\"title\":\"Merchant Code\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"----------------\"}}', '{\"AFN\": \"AFN\",\"ALL\": \"ALL\",\"DZD\": \"DZD\",\"ARS\": \"ARS\",\"AUD\": \"AUD\",\"AZN\": \"AZN\",\"BSD\": \"BSD\",\"BDT\": \"BDT\",\"BBD\": \"BBD\",\"BZD\": \"BZD\",\"BMD\": \"BMD\",\"BOB\": \"BOB\",\"BWP\": \"BWP\",\"BRL\": \"BRL\",\"GBP\": \"GBP\",\"BND\": \"BND\",\"BGN\": \"BGN\",\"CAD\": \"CAD\",\"CLP\": \"CLP\",\"CNY\": \"CNY\",\"COP\": \"COP\",\"CRC\": \"CRC\",\"HRK\": \"HRK\",\"CZK\": \"CZK\",\"DKK\": \"DKK\",\"DOP\": \"DOP\",\"XCD\": \"XCD\",\"EGP\": \"EGP\",\"EUR\": \"EUR\",\"FJD\": \"FJD\",\"GTQ\": \"GTQ\",\"HKD\": \"HKD\",\"HNL\": \"HNL\",\"HUF\": \"HUF\",\"INR\": \"INR\",\"IDR\": \"IDR\",\"ILS\": \"ILS\",\"JMD\": \"JMD\",\"JPY\": \"JPY\",\"KZT\": \"KZT\",\"KES\": \"KES\",\"LAK\": \"LAK\",\"MMK\": \"MMK\",\"LBP\": \"LBP\",\"LRD\": \"LRD\",\"MOP\": \"MOP\",\"MYR\": \"MYR\",\"MVR\": \"MVR\",\"MRO\": \"MRO\",\"MUR\": \"MUR\",\"MXN\": \"MXN\",\"MAD\": \"MAD\",\"NPR\": \"NPR\",\"TWD\": \"TWD\",\"NZD\": \"NZD\",\"NIO\": \"NIO\",\"NOK\": \"NOK\",\"PKR\": \"PKR\",\"PGK\": \"PGK\",\"PEN\": \"PEN\",\"PHP\": \"PHP\",\"PLN\": \"PLN\",\"QAR\": \"QAR\",\"RON\": \"RON\",\"RUB\": \"RUB\",\"WST\": \"WST\",\"SAR\": \"SAR\",\"SCR\": \"SCR\",\"SGD\": \"SGD\",\"SBD\": \"SBD\",\"ZAR\": \"ZAR\",\"KRW\": \"KRW\",\"LKR\": \"LKR\",\"SEK\": \"SEK\",\"CHF\": \"CHF\",\"SYP\": \"SYP\",\"THB\": \"THB\",\"TOP\": \"TOP\",\"TTD\": \"TTD\",\"TRY\": \"TRY\",\"UAH\": \"UAH\",\"AED\": \"AED\",\"USD\": \"USD\",\"VUV\": \"VUV\",\"VND\": \"VND\",\"XOF\": \"XOF\",\"YER\": \"YER\"}', 0, '{\"approved_url\":{\"title\": \"Approved URL\",\"value\":\"----------------\"}}', NULL, NULL, '2024-05-07 08:24:56'),
(60, 0, 127, 'Checkout', 'Checkout', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"------\"},\"public_key\":{\"title\":\"PUBLIC KEY\",\"global\":true,\"value\":\"------\"},\"processing_channel_id\":{\"title\":\"PROCESSING CHANNEL\",\"global\":true,\"value\":\"------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"AUD\":\"AUD\",\"CAN\":\"CAN\",\"CHF\":\"CHF\",\"SGD\":\"SGD\",\"JPY\":\"JPY\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2024-05-07 08:09:44');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_code` int DEFAULT NULL,
  `gateway_alias` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `gateway_parameter` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `site_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_text` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text COLLATE utf8mb4_unicode_ci,
  `sms_template` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_template` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text COLLATE utf8mb4_unicode_ci COMMENT 'email configuration',
  `sms_config` text COLLATE utf8mb4_unicode_ci,
  `global_shortcodes` text COLLATE utf8mb4_unicode_ci,
  `kv` tinyint(1) NOT NULL DEFAULT '0',
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'sms notification, 0 - dont send, 1 - send',
  `pn` tinyint(1) NOT NULL DEFAULT '1',
  `socialite_credentials` text COLLATE utf8mb4_unicode_ci,
  `trustpilot_widget_code` text COLLATE utf8mb4_unicode_ci,
  `force_ssl` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT '0',
  `secure_password` tinyint(1) NOT NULL DEFAULT '0',
  `agree` tinyint(1) NOT NULL DEFAULT '0',
  `system_customized` tinyint(1) NOT NULL DEFAULT '0',
  `paginate_number` int NOT NULL DEFAULT '0',
  `currency_format` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>Both\r\n2=>Text Only\r\n3=>Symbol Only',
  `registration` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_commission` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Exchange Commission',
  `show_notice_bar` tinyint(1) NOT NULL DEFAULT '1',
  `multi_language` tinyint(1) NOT NULL DEFAULT '1',
  `show_number_after_decimal` int NOT NULL DEFAULT '2',
  `firebase_config` text COLLATE utf8mb4_unicode_ci,
  `currency_api_key` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_cron` timestamp NULL DEFAULT NULL,
  `available_version` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `automatic_currency_rate_update` tinyint(1) NOT NULL DEFAULT '0',
  `admin_email_notification` tinyint(1) NOT NULL DEFAULT '0',
  `first_exchange_bonus` tinyint(1) NOT NULL DEFAULT '0',
  `first_exchange_bonus_percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `exchange_auto_cancel_time` int NOT NULL DEFAULT '1',
  `exchange_auto_cancel` tinyint(1) NOT NULL DEFAULT '0',
  `register_bonus` tinyint(1) NOT NULL DEFAULT '0',
  `register_bonus_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `cur_text`, `cur_sym`, `email_from`, `email_from_name`, `email_template`, `sms_template`, `sms_from`, `push_title`, `push_template`, `base_color`, `mail_config`, `sms_config`, `global_shortcodes`, `kv`, `ev`, `en`, `sv`, `sn`, `pn`, `socialite_credentials`, `trustpilot_widget_code`, `force_ssl`, `maintenance_mode`, `secure_password`, `agree`, `system_customized`, `paginate_number`, `currency_format`, `registration`, `active_template`, `exchange_commission`, `show_notice_bar`, `multi_language`, `show_number_after_decimal`, `firebase_config`, `currency_api_key`, `last_cron`, `available_version`, `automatic_currency_rate_update`, `admin_email_notification`, `first_exchange_bonus`, `first_exchange_bonus_percentage`, `exchange_auto_cancel_time`, `exchange_auto_cancel`, `register_bonus`, `register_bonus_amount`, `created_at`, `updated_at`) VALUES
(1, 'ChangaLab', 'INR', '₹', 'no-reply@viserlab.com', '{{site_name}}', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n  <!--[if !mso]><!-->\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n  <!--<![endif]-->\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n  <title></title>\n  <style type=\"text/css\">\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\n.ExternalClass { width: 100%; background-color: #ffffff; }\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\nhtml { width: 100%; }\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\ntable table table { table-layout: auto; }\n.yshortcuts a { border-bottom: none !important; }\nimg:hover { opacity: 0.9 !important; }\na { color: #0087ff; text-decoration: none; }\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\n.btn-link a { color:#FFFFFF !important;}\n\n@media only screen and (max-width: 480px) {\nbody { width: auto !important; }\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\n/* image */\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\n}\n</style>\n\n\n\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n    <tbody><tr>\n      <td height=\"50\"></td>\n    </tr>\n    <tr>\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n          <tbody><tr>\n            <td align=\"center\" width=\"600\">\n              <!--header-->\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n                <tbody><tr>\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n                      <tbody><tr>\n                        <td height=\"20\"></td>\n                      </tr>\n                      <tr>\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\n                      </tr>\n                      <tr>\n                        <td height=\"20\"></td>\n                      </tr>\n                    </tbody></table>\n                  </td>\n                </tr>\n              </tbody></table>\n              <!--end header-->\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n                <tbody><tr>\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n                      <tbody><tr>\n                        <td height=\"35\"></td>\n                      </tr>\n                      <!--logo-->\n                      <tr>\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\n                          <a href=\"#\">\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://script.viserlab.com/apps/cdn/demo-logo.png\" width=\"220\" alt=\"img\">\n                          </a>\n                        </td>\n                      </tr>\n                      <!--end logo-->\n                      <tr>\n                        <td height=\"40\"></td>\n                      </tr>\n                      <!--headline-->\n                      <tr>\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello {{fullname}} ({{username}})</td>\n                      </tr>\n                      <!--end headline-->\n                      <tr>\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\n                            <tbody><tr>\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\n                            </tr>\n                          </tbody></table>\n                        </td>\n                      </tr>\n                      <tr>\n                        <td height=\"20\"></td>\n                      </tr>\n                      <!--content-->\n                      <tr>\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">{{message}}</td>\n                      </tr>\n                      <!--end content-->\n                      <tr>\n                        <td height=\"40\"></td>\n                      </tr>\n              \n                    </tbody></table>\n                  </td>\n                </tr>\n                <tr>\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n                      <tbody><tr>\n                        <td height=\"10\"></td>\n                      </tr>\n                      <!--preference-->\n                      <tr>\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\n                          © 2024 <a href=\"#\">{{site_name}}</a>&nbsp;. All Rights Reserved. \n                        </td>\n                      </tr>\n                      <!--end preference-->\n                      <tr>\n                        <td height=\"10\"></td>\n                      </tr>\n                    </tbody></table>\n                  </td>\n                </tr>\n              </tbody></table>\n            </td>\n          </tr>\n        </tbody></table>\n      </td>\n    </tr>\n    <tr>\n      <td height=\"60\"></td>\n    </tr>\n  </tbody></table>', 'hi {{fullname}} ({{username}}), {{message}}', 'ViserAdmin', NULL, NULL, 'FF6B31', '{\"name\":\"php\"}', '{\"name\":\"nexmo\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"------------8888888\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}', 0, 0, 1, 0, 0, 0, '{\"google\":{\"client_id\":\"----------------------\",\"client_secret\":\"---------------------\",\"status\":0},\"facebook\":{\"client_id\":\"--------------------\",\"client_secret\":\"--------------------\",\"status\":0},\"linkedin\":{\"client_id\":\"---------------------\",\"client_secret\":\"----------------------\",\"status\":0}}', '<script src=\"https://cdn.commoninja.com/sdk/latest/commonninja.js\" defer></script>\r\n<div class=\"commonninja_component pid-8fe58863-1703-4c54-a523-79c3b1366d8a\"></div>', 0, 0, 0, 1, 0, 20, 1, 1, 'orange_oasis', 0, 1, 1, 2, '{\"apiKey\":\"---------------\",\"authDomain\":\"------------------\",\"projectId\":\"--------------\",\"storageBucket\":\"------------------\",\"messagingSenderId\":\"----------------\",\"appId\":\"--------------\",\"measurementId\":\"----------------\"}', '---------------------', '2025-03-12 22:41:32', '3.2', 0, 0, 0, 0.00, 30, 0, 0, 10.00000000, NULL, '2025-03-12 22:52:49');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `image`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', '67d260ca98e7f1741840586.png', 1, '2020-07-06 07:47:55', '2025-03-12 22:36:26');

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_type` tinyint(1) DEFAULT NULL,
  `sender` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_to` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `notification_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_read` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci,
  `sms_body` text COLLATE utf8mb4_unicode_ci,
  `push_body` text COLLATE utf8mb4_unicode_ci,
  `shortcodes` text COLLATE utf8mb4_unicode_ci,
  `email_status` tinyint(1) NOT NULL DEFAULT '1',
  `email_sent_from_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent_from_address` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_status` tinyint(1) NOT NULL DEFAULT '1',
  `sms_sent_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_status` tinyint(1) NOT NULL DEFAULT '0',
  `firebase_body` text COLLATE utf8mb4_unicode_ci,
  `firebase_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subject`, `push_title`, `email_body`, `sms_body`, `push_body`, `shortcodes`, `email_status`, `email_sent_from_name`, `email_sent_from_address`, `sms_status`, `sms_sent_from`, `push_status`, `firebase_body`, `firebase_status`, `created_at`, `updated_at`) VALUES
(1, 'BAL_ADD', 'Balance - Added', 'Your Account has been Credited', NULL, '<div><div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">{{remark}}</span></div>', '{{amount}} {{site_currency}} credited in your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin note is \"{{remark}}\"', NULL, '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, NULL, NULL, 0, NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2025-03-12 22:27:15'),
(2, 'BAL_SUB', 'Balance - Subtracted', 'Your Account has been Debited', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: {{remark}}</div>', '{{amount}} {{site_currency}} debited from your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin Note is {{remark}}', NULL, '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, NULL, NULL, 1, NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2022-04-03 02:24:11'),
(3, 'DEPOSIT_COMPLETE', 'Payment - Automated - Successful', 'Deposit Completed Successfully', NULL, '<div>Your deposit of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been completed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#000000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Received : {{method_amount}} {{method_currency}}<br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit successfully by {{method_name}}', NULL, '{\"trx\":\"Transaction number for the payment\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the payment method\",\"method_currency\":\"Currency of the payment method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, NULL, NULL, 1, NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2022-04-03 02:25:43'),
(4, 'DEPOSIT_APPROVE', 'Payment - Manual - Approved', 'Your Deposit is Approved', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>is Approved .<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Admin Approve Your {{amount}} {{site_currency}} payment request by {{method_name}} transaction : {{trx}}', NULL, '{\"trx\":\"Transaction number for the payment\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the payment method\",\"method_currency\":\"Currency of the payment method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, NULL, NULL, 1, NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2022-04-03 02:26:07'),
(6, 'DEPOSIT_REQUEST', 'Payment - Manual - Requested', 'Deposit Request Submitted Successfully', NULL, '<div>Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>submitted successfully<span style=\"font-weight: bolder;\">&nbsp;.<br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}}<br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit requested by {{method_name}}. Charge: {{charge}} . Trx: {{trx}}', NULL, '{\"trx\":\"Transaction number for the payment\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the payment method\",\"method_currency\":\"Currency of the payment method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}', 1, NULL, NULL, 1, NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2022-04-03 02:29:19'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">{{time}} .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">{{code}}</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div>', 'Your account recovery code is: {{code}}', NULL, '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, NULL, NULL, 0, NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2022-03-20 20:47:05'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'You have reset your password', NULL, '<p style=\"font-family: Montserrat, sans-serif;\">You have successfully reset your password.</p><p style=\"font-family: Montserrat, sans-serif;\">You changed from&nbsp; IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{time}}</span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><font color=\"#ff0000\">If you did not change that, please contact us as soon as possible.</font></span></p>', 'Your password has been changed successfully', NULL, '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, NULL, NULL, 1, NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2022-04-05 03:46:35'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Reply Support Ticket', NULL, '<div><p><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\">A member from our support team has replied to the following ticket:</span></span></p><p><span style=\"font-weight: bolder;\"><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\"><br></span></span></span></p><p><span style=\"font-weight: bolder;\">[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</span></p><p>----------------------------------------------</p><p>Here is the reply :<br></p><p>{{reply}}<br></p></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Your Ticket#{{ticket_id}} :  {{ticket_subject}} has been replied.', NULL, '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, NULL, NULL, 1, NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2022-03-20 20:47:51'),
(10, 'EVER_CODE', 'Verification - Email', 'Please verify your email address', NULL, '<br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;{{code}}</span></font></div></div>', '---', NULL, '{\"code\":\"Email verification code\"}', 1, NULL, NULL, 0, NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2022-04-03 02:32:07'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', NULL, '---', 'Your phone verification code is: {{code}}', NULL, '{\"code\":\"SMS Verification Code\"}', 0, NULL, NULL, 1, NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2022-03-20 19:24:37'),
(12, 'WITHDRAW_APPROVE', 'Withdraw - Approved', 'Withdraw Request has been Processed and your money is sent', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Processed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Processed Payment :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div>', 'Admin Approve Your {{amount}} {{site_currency}} withdraw request by {{method_name}}. Transaction {{trx}}', NULL, '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"admin_details\":\"Details provided by the admin\",\"balance_after_charge\":\"Balance after implement charge\"}', 1, NULL, NULL, 1, NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2022-03-20 20:50:16'),
(13, 'WITHDRAW_REJECT', 'Withdraw - Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Rejected.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You should get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">----</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\"><br></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\">{{amount}} {{currency}} has been&nbsp;<span style=\"font-weight: bolder;\">refunded&nbsp;</span>to your account and your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}}</span><span style=\"font-weight: bolder;\">&nbsp;{{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Rejection :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br><br><br></div><div></div><div></div>', 'Admin Rejected Your {{amount}} {{site_currency}} withdraw request. Your Main Balance {{post_balance}}  {{method_name}} , Transaction {{trx}}', NULL, '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this action\",\"admin_details\":\"Rejection message by the admin\",\"balance_after_charge\":\"Balance after implement charge\"}', 1, NULL, NULL, 1, NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2022-03-20 20:57:46'),
(14, 'WITHDRAW_REQUEST', 'Withdraw - Requested', 'Withdraw Request Submitted Successfully', NULL, '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been submitted Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', '{{amount}} {{site_currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} Trx: {{trx}}', NULL, '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this transaction\",\"balance_after_charge\":\"Balance after implement charge\"}', 1, NULL, NULL, 1, NULL, 0, NULL, 0, '2021-11-03 12:00:00', '2022-03-21 04:39:03'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', '{{subject}}', '{{message}}', '{{message}}', '{{message}}', '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, NULL, NULL, 1, NULL, 1, NULL, 0, '2019-09-14 13:14:22', '2024-07-30 00:14:53'),
(16, 'KYC_APPROVE', 'KYC Approved', 'KYC has been approved', NULL, NULL, NULL, NULL, '[]', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL),
(17, 'KYC_REJECT', 'KYC Rejected', 'KYC has been rejected', NULL, NULL, NULL, NULL, '{\"reason\":\"Rejection Reason\"}', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL),
(18, 'CANCEL_EXCHANGE', 'Cancel Exchange', 'Your Exchange Canceled', NULL, '<div>Cancel Your Exchange. Your Exchange id {{exchange}}</div>\r\n\r\n</br></br>\r\n\r\nCancel Reason : {{reason}}', 'Your Exchange is Canceled ', NULL, '{\"exchnage\":\"Exchange Id\",\"reason\":\"Reason\"}', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL),
(19, 'APPROVED_EXCHANGE', 'Approved Exchange', 'Your Exchange Approved', NULL, '<div><b>{{amount}} {{currency}}</b> send in your {{method}} wallet . Your Exchange id {{exchange}}</div>', 'Your Exchange is Approved. Amount send to your {{amount}} {{currency}} in {{method}} ', NULL, '{\"amount\":\"Amount\",\"method\":\"Currency Name\",\"exchange\":\"exchange Id\",\"currency\":\"Currency\",\"admin_transaction_number\":\"Admin Transaction/Wallet Number\"}', 1, NULL, NULL, 1, NULL, 0, 'Your exchange approved successfully\"', 1, NULL, NULL),
(20, 'EXCHANGE_REFUND', 'Refund Exchange', 'Your Exchange Refunded', NULL, '<div><b>{{amount}} {{currency}}</b> refunded in your {{method}} wallet . Your Exchange id {{exchange}}\r\n<br><br>\r\n\r\nRefund Reason : {{reason}}\r\n\r\n</div>\r\n\r\n', 'Your Exchange is Approved. Amount send to your {{amount}} {{currency}} in {{method}} ', NULL, '{\"amount\":\"Amount\",\"method\":\"Currency Name\",\"exchange\":\"exchange Id\",\"currency\":\"Currency\",\"reason\":\"Reason\"}', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL),
(22, 'REFERRAL_COMMISSION', 'Referral Commission', 'User Referral Commission', NULL, 'Bonus: {{amount}} {{site_currency}},&nbsp;<div>Current Balance: {{post_balance}},</div><div><span style=\"font-family: &quot;Open Sans&quot;, sans-serif;\">{{level}}</span><span style=\"font-family: &quot;Open Sans&quot;, sans-serif;\">,</span></div><div>Transaction: {{trx}},</div>', 'Bonus: {{amount}} {{currency}}, \r\nTransaction: {{trx}},', NULL, '{\"amount\":\"Amount\", \"post_balance\":\"Post Balance\", \"trx\":\"Transaction\",\"level\":\"Level\"}', 1, NULL, NULL, 1, NULL, 0, NULL, 0, NULL, '2024-02-11 21:25:54'),
(23, 'EXCHANGE_APPROVAL_REQUIRED', 'Exchange approval for admin', 'New exchange - approval needed', 'New exchange - approval needed', '<p><strong>Hello {{username}},</strong></p><p>A new exchange request has been submitted and requires your review. Below are the details:</p><p>🔹 <strong>Exchange ID:</strong> <code>#{{exchange_id}}</code><br>🔹 <strong>Amount:</strong> <code>{{amount}}</code><br>🔹 <strong>Sent Currency:</strong> <code>{{send_currency}}</code><br>🔹 <strong>Received Currency:</strong> <code>{{receive_currency}}</code></p><p>📌 <strong>Action Required:</strong><br>Please review the exchange details and approve/reject it from the admin panel.</p><p>Best Regards,<br><strong>{{site_name}} Team</strong></p>', '', NULL, '{\"username\":\"Admin username\", \"exchange_id\":\"Exchange ID\", \"amount\":\"Exchange Amount\",\"send_currency\":\"User send the currecy\", \"receive_currency\":\"User received the currency\", \"exchange_link\":\"Exchange link to see details\"}', 1, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, '2025-02-04 16:20:46'),
(24, 'RATE_ALERT_NOTIFICATION', 'Exchange Rate Alert', 'Exchange Rate Alert: {{from_currency}} to {{to_currency}}', 'Exchange Rate Alert', '<p data-start=\"86\" data-end=\"98\"><strong data-start=\"86\" data-end=\"96\">Hello,</strong></p><p data-start=\"100\" data-end=\"173\">Great news! The exchange rate you set an alert for has been reached. 🎉</p><p data-start=\"175\" data-end=\"332\">🔹 <strong data-start=\"178\" data-end=\"196\">From Currency:</strong> {{from_currency}}<br data-start=\"214\" data-end=\"217\">🔹 <strong data-start=\"220\" data-end=\"236\">To Currency:</strong> {{to_currency}}<br data-start=\"252\" data-end=\"255\">🔹 <strong data-start=\"258\" data-end=\"274\">Target Rate:</strong> {{target_rate}}<br data-start=\"290\" data-end=\"293\">🔹 <strong data-start=\"296\" data-end=\"313\">Current Rate:</strong> {{current_rate}}</p><p data-start=\"334\" data-end=\"381\">Now might be the perfect time to take action!</p><p data-start=\"383\" data-end=\"420\">Stay updated with the latest rates.</p><p data-start=\"422\" data-end=\"462\">Best regards,<br data-start=\"435\" data-end=\"438\"><strong data-start=\"438\" data-end=\"460\">{{site_name}} Team</strong></p>', '', NULL, '{\"from_currency\":\"From currency to get alert\", \"to_currency\":\"To currency for alert\", \"target_rate\":\"Target rate for alert\",\"current rate\":\"Current rate of the selected currency\"}', 1, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, '2025-02-15 06:47:38'),
(25, 'BONUS_RECEIVED', 'First Exchange Bonus Received', '🎉 Bonus Received for Your Exchange!', '🎉 Bonus Received for Your Exchange!', '<p data-start=\"86\" data-end=\"98\"><b><span style=\"font-size: 0.875rem; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">Congratulations! You have received </span><span class=\"hljs-selector-tag\" style=\"font-size: 0.875rem; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">a</span><span style=\"font-size: 0.875rem; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\"> bonus for your first exchange (ID: {{exchange}}).&nbsp;</span></b></p><p data-start=\"86\" data-end=\"98\">💰 Bonus Amount: <b>{{amount}} {{currency}}</b>&nbsp;</p><p data-start=\"86\" data-end=\"98\"><br></p><p data-start=\"86\" data-end=\"98\">Thank you for using our platform.&nbsp;</p><p data-start=\"86\" data-end=\"98\">We appreciate your trust and support!\r\n\r\nHappy exchanging!&nbsp;</p><p data-start=\"86\" data-end=\"98\"><b>{{site_name}}</b></p>', '', NULL, '{\"exchange\":\"Exchange Id For the Exchange\", \"amount\":\"Exchange bonus amount\", \"currency\":\"Received bonus currency\"}', 1, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, '2025-02-18 20:27:24'),
(26, 'REGISTER_BONUS', 'Registration Bonus', 'Registration bonus for signing up', NULL, '<div><div style=\"font-family: Montserrat, sans-serif;\">You get {{amount}}&nbsp;{{site_currency}} for your registration.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}&nbsp;</span></font></div>', 'You get {{amount}} {{site_currency}} for your registration.', 'You get {{amount}} {{site_currency}} for your registration.', '{\"trx\":\"Transaction number\",\"amount\":\"Bonus amount\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, NULL, NULL, 0, NULL, 0, NULL, 0, '2021-11-03 06:00:00', '2025-02-27 08:15:11');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'template name',
  `secs` text COLLATE utf8mb4_unicode_ci,
  `seo_content` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `seo_content`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', '/', 'templates.orange_oasis.', '[\"affiliation\",\"subscribe\",\"testimonial\",\"mobile_app\",\"trustpilot_review\",\"payment_gateway\"]', NULL, 1, '2020-07-11 06:23:58', '2025-02-24 05:47:02'),
(4, 'Blog', 'blog', 'templates.orange_oasis.', NULL, NULL, 1, '2020-10-22 01:14:43', '2022-12-15 03:24:18'),
(5, 'Contact', 'contact', 'templates.orange_oasis.', NULL, NULL, 1, '2020-10-22 01:14:53', '2020-10-22 01:14:53'),
(7, 'faq', 'faq', 'templates.orange_oasis.', NULL, NULL, 1, '2022-10-17 11:32:06', '2023-01-16 02:49:47'),
(19, 'About Us', 'about', 'templates.orange_oasis.', '[\"about\",\"testimonial\",\"payment_gateway\"]', NULL, 0, '2022-10-17 11:31:57', '2023-01-23 05:21:02'),
(21, 'HOME', '/', 'templates.blue_bliss.', '[\"currency_info\",\"feature\",\"testimonial\",\"trustpilot_review\",\"counter\",\"how_it_work\",\"faq\",\"latest_exchange\",\"subscribe\",\"mobile_app\",\"blog\"]', NULL, 1, '2020-07-11 06:23:58', '2025-02-24 05:49:31'),
(22, 'Blog', 'blog', 'templates.blue_bliss.', NULL, NULL, 1, '2020-10-22 01:14:43', '2022-10-25 12:07:00'),
(23, 'Contact', 'contact', 'templates.blue_bliss.', NULL, NULL, 1, '2020-10-22 01:14:53', '2020-10-22 01:14:53'),
(24, 'About', 'about', 'templates.blue_bliss.', '[\"about\",\"testimonial\",\"mission_vision\"]', NULL, 0, '2022-10-17 11:31:57', '2022-12-24 00:54:49'),
(26, 'Affiliation', 'affiliate-program', 'templates.blue_bliss.', '[\"affiliation\",\"subscribe\"]', NULL, 0, '2022-10-23 10:01:24', '2022-10-25 11:10:26');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rate_alerts`
--

CREATE TABLE `rate_alerts` (
  `id` bigint UNSIGNED NOT NULL,
  `from_currency_id` bigint UNSIGNED NOT NULL,
  `to_currency_id` bigint UNSIGNED NOT NULL,
  `target_rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `alert_email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'pending->0, completed->1',
  `expire_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` bigint UNSIGNED NOT NULL,
  `level` int NOT NULL DEFAULT '0',
  `percent` decimal(5,2) DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `support_message_id` int UNSIGNED NOT NULL DEFAULT '0',
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `support_ticket_id` int UNSIGNED NOT NULL DEFAULT '0',
  `admin_id` int UNSIGNED NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT '0',
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `post_balance` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `trx_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `update_logs`
--

CREATE TABLE `update_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `version` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_log` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `firstname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dial_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_by` int DEFAULT NULL,
  `balance` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: banned, 1: active',
  `kyc_data` text COLLATE utf8mb4_unicode_ci,
  `kyc_rejection_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified	',
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: sms unverified, 1: sms verified',
  `profile_complete` tinyint(1) NOT NULL DEFAULT '0',
  `ver_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ban_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_by` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `user_ip` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint UNSIGNED NOT NULL,
  `method_id` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `after_charge` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `withdraw_information` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blocked_ips`
--
ALTER TABLE `blocked_ips`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blocked_ips_ip_address_unique` (`ip_address`);

--
-- Indexes for table `commission_logs`
--
ALTER TABLE `commission_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cron_jobs`
--
ALTER TABLE `cron_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cron_job_logs`
--
ALTER TABLE `cron_job_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cron_schedules`
--
ALTER TABLE `cron_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cur_sym` (`cur_sym`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_tokens`
--
ALTER TABLE `device_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exchanges`
--
ALTER TABLE `exchanges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `exchanges_exchange_id_unique` (`exchange_id`),
  ADD KEY `user_id_2` (`user_id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `rate_alerts`
--
ALTER TABLE `rate_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `update_logs`
--
ALTER TABLE `update_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trx` (`trx`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blocked_ips`
--
ALTER TABLE `blocked_ips`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commission_logs`
--
ALTER TABLE `commission_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cron_jobs`
--
ALTER TABLE `cron_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cron_job_logs`
--
ALTER TABLE `cron_job_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cron_schedules`
--
ALTER TABLE `cron_schedules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `device_tokens`
--
ALTER TABLE `device_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exchanges`
--
ALTER TABLE `exchanges`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=262;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rate_alerts`
--
ALTER TABLE `rate_alerts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `update_logs`
--
ALTER TABLE `update_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
