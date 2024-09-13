-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2024 at 02:30 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `holiday_calendar`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `name`, `date`, `type`, `created_at`, `updated_at`) VALUES
(1, 'New Year\'s Day', '2024-01-01', 'Optional holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(2, 'Lohri', '2024-01-13', 'National holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(3, 'Makar Sankranti', '2024-01-14', 'Hinduism', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(4, 'Pongal', '2024-01-15', 'Hinduism', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(5, 'Guru Govind Singh Jayanti', '2024-01-17', 'Observance', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(6, 'Hazarat Ali\'s Birthday', '2024-01-25', 'Optional holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(7, 'Republic Day', '2024-01-26', 'National holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(8, 'Lunar New Year', '2024-02-10', 'Observance', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(9, 'Vasant Panchami', '2024-02-14', 'Hinduism', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(10, 'Valentine\'s Day', '2024-02-14', 'Observance', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(11, 'Shivaji Jayanti', '2024-02-19', 'Optional holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(12, 'Guru Ravidas Jayanti', '2024-02-24', 'Optional holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(13, 'Maharishi Dayanand Saraswati Jayanti', '2024-03-06', 'Optional holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(14, 'Maha Shivaratri/Shivaratri', '2024-03-08', 'Hinduism', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(15, 'Ramadan Start', '2024-03-12', 'Observance', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(16, 'March Equinox', '2024-03-20', 'Season', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(17, 'Holika Dahana', '2024-03-24', 'Optional holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(18, 'Holi', '2024-03-25', 'National holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(19, 'Dolyatra', '2024-03-25', 'National holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(20, 'Maundy Thursday', '2024-03-28', 'Observance', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(21, 'Good Friday', '2024-03-29', 'National holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(22, 'Easter Day', '2024-03-31', 'Optional holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(23, 'Jamat Ul-Vida', '2024-04-05', 'Optional holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(24, 'Chaitra Sukhladi', '2024-04-09', 'Hinduism', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(25, 'Ugadi', '2024-04-09', 'Hinduism', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(26, 'Gudi Padwa', '2024-04-09', 'Hinduism', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(27, 'Ramzan Id/Eid-ul-Fitar', '2024-04-10', 'Muslim', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(28, 'Ramzan Id/Eid-ul-Fitar', '2024-04-11', 'National holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(29, 'Vaisakhi', '2024-04-13', 'Optional holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(30, 'Mesadi / Vaisakhadi', '2024-04-14', 'Optional holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(31, 'Ambedkar Jayanti', '2024-04-14', 'National holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(32, 'Rama Navami', '2024-04-17', 'National holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(33, 'Mahavir Jayanti', '2024-04-21', 'National holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(34, 'First day of Passover', '2024-04-23', 'Observance', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(35, 'International Worker\'s Day', '2024-05-01', 'Observance', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(36, 'Birthday of Rabindranath', '2024-05-08', 'Optional holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(37, 'Mothers\' Day', '2024-05-12', 'Observance', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(38, 'Buddha Purnima/Vesak', '2024-05-23', 'National holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(39, 'Fathers\' Day', '2024-06-16', 'Observance', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(40, 'Bakrid/Eid ul-Adha', '2024-06-17', 'National holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(41, 'June Solstice', '2024-06-21', 'Season', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(42, 'Rath Yatra', '2024-07-07', 'Hinduism', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(43, 'Muharram/Ashura', '2024-07-17', 'National holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(44, 'Guru Purnima', '2024-07-21', 'Observance', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(45, 'Friendship Day', '2024-08-04', 'Observance', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(46, 'Independence Day', '2024-08-15', 'National holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(47, 'Parsi New Year', '2024-08-15', 'Optional holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(48, 'Raksha Bandhan (Rakhi)', '2024-08-19', 'Hinduism', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(49, 'Janmashtami', '2024-08-26', 'National holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(50, 'Janmashtami (Smarta)', '2024-08-26', 'Observance', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(51, 'Ganesh Chaturthi/Vinayaka Chaturthi', '2024-09-07', 'Hinduism', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(52, 'Onam', '2024-09-15', 'Hinduism', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(53, 'Milad un-Nabi/Id-e-Milad', '2024-09-16', 'National holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(54, 'September Equinox', '2024-09-22', 'Season', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(55, 'Mahatma Gandhi Jayanti', '2024-10-02', 'National holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(56, 'First Day of Sharad Navratri', '2024-10-03', 'Observance', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(57, 'First Day of Durga Puja Festivities', '2024-10-09', 'Observance', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(58, 'Maha Saptami', '2024-10-10', 'Optional holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(59, 'Maha Navami', '2024-10-11', 'Optional holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(60, 'Maha Ashtami', '2024-10-11', 'Optional holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(61, 'Dussehra', '2024-10-12', 'National holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(62, 'Maharishi Valmiki Jayanti', '2024-10-17', 'Optional holiday', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(63, 'Karaka Chaturthi (Karva Chauth)', '2024-10-20', 'Hinduism', '2024-09-13 06:39:33', '2024-09-13 06:39:33'),
(64, 'Halloween', '2024-10-31', 'Observance', '2024-09-13 06:39:34', '2024-09-13 06:39:34'),
(65, 'Naraka Chaturdasi', '2024-10-31', 'Optional holiday', '2024-09-13 06:39:34', '2024-09-13 06:39:34'),
(66, 'Diwali/Deepavali', '2024-10-31', 'National holiday', '2024-09-13 06:39:34', '2024-09-13 06:39:34'),
(67, 'Govardhan Puja', '2024-11-02', 'Optional holiday', '2024-09-13 06:39:34', '2024-09-13 06:39:34'),
(68, 'Bhai Duj', '2024-11-03', 'Hinduism', '2024-09-13 06:39:34', '2024-09-13 06:39:34'),
(69, 'Chhat Puja (Pratihar Sashthi/Surya Sashthi)', '2024-11-07', 'Hinduism', '2024-09-13 06:39:34', '2024-09-13 06:39:34'),
(70, 'Guru Nanak Jayanti', '2024-11-15', 'National holiday', '2024-09-13 06:39:34', '2024-09-13 06:39:34'),
(71, 'Guru Tegh Bahadur\'s Martyrdom Day', '2024-11-24', 'Optional holiday', '2024-09-13 06:39:34', '2024-09-13 06:39:34'),
(72, 'December Solstice', '2024-12-21', 'Season', '2024-09-13 06:39:34', '2024-09-13 06:39:34'),
(73, 'Christmas Eve', '2024-12-24', 'Optional holiday', '2024-09-13 06:39:34', '2024-09-13 06:39:34'),
(74, 'Christmas', '2024-12-25', 'National holiday', '2024-09-13 06:39:34', '2024-09-13 06:39:34'),
(75, 'First Day of Hanukkah', '2024-12-26', 'Observance', '2024-09-13 06:39:34', '2024-09-13 06:39:34'),
(76, 'New Year\'s Eve', '2024-12-31', 'Observance', '2024-09-13 06:39:34', '2024-09-13 06:39:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(5, '2024_09_13_064426_create_holidays_table', 1);

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
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
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
