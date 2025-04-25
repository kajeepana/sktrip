-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 24, 2025 at 06:11 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sk`
--
CREATE DATABASE IF NOT EXISTS `sk` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sk`;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `message`, `created_at`) VALUES
(11, 'aaaaa', 'aa@gmail.com', 'aaaaa aaaaa aaa', '2025-04-23 13:24:38'),
(12, 'zzzz', 'zz@gmail.com', 'zzzzz zzzzz zzzz', '2025-04-24 16:04:14'),
(13, 'kajee', 'kajee@gmail.com', 'qqqqqq qqqqqqq  qqqqq', '2025-04-24 16:08:07');

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

CREATE TABLE `trip` (
  `id` int(11) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `activities` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trip`
--

INSERT INTO `trip` (`id`, `destination`, `start_date`, `end_date`, `activities`) VALUES
(3, 'badulla', '2025-04-25', '2025-04-30', 'aaaaaaaaa aaaaaa'),
(4, 'kandy', '2025-04-26', '2025-04-29', 'zzzz zzzzz zzzzzzz'),
(5, 'nuwara-eliya', '2025-04-25', '2025-04-29', 'aaaaaa aaaaa aaaaaaaaaa');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(9, 'aaaa', 'aas@gmail.com', '$2y$10$PPSnzMrwtjBgbgi3gK7ZFukEIJJ692N7ekGVI1r2nf5dw63b.7mmK', '2025-04-21 05:36:31'),
(17, 'ssss', 'ssss@gmail.com', '$2y$10$4KE71beswoK.WCleTpHQC.J1zR.zXNvi./g/n5kE3JRJY8XPP2qtS', '2025-04-21 14:54:11'),
(30, 'zzzz', 'zz@gmail.com', '$2y$10$bpB1LGdd4AX88PvASC7WkuK/x0FzdMP.zgM/vEmf8M6A9PwFhNN.G', '2025-04-24 16:01:30'),
(31, 'Kajee', 'kajee@gmail.com', '$2y$10$2DaFbgvuHfBFUtgydc.wT.Z75X49rpQ6wzw9a7udrV4NgAMBJRTXe', '2025-04-24 16:05:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `trip`
--
ALTER TABLE `trip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
