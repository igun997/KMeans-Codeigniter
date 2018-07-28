-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2018 at 09:00 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pelanggaran`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kp`
--

CREATE TABLE `tbl_kp` (
  `id_kp` int(11) NOT NULL,
  `nama_kp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kp`
--

INSERT INTO `tbl_kp` (`id_kp`, `nama_kp`) VALUES
(1, 'Mobil'),
(2, 'Motor');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pelanggaran`
--

CREATE TABLE `tbl_pelanggaran` (
  `id_pelanggaran` int(11) NOT NULL,
  `id_kp` int(11) NOT NULL,
  `jumlah` double NOT NULL,
  `tahun` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pelanggaran`
--

INSERT INTO `tbl_pelanggaran` (`id_pelanggaran`, `id_kp`, `jumlah`, `tahun`) VALUES
(1, 2, 400, 1968),
(2, 2, 411, 1969),
(3, 2, 422, 1970),
(4, 2, 433, 1971),
(5, 2, 444, 1972),
(6, 2, 455, 1973),
(7, 2, 466, 1974),
(8, 2, 477, 1975),
(9, 2, 488, 1976),
(10, 2, 499, 1977),
(11, 2, 500, 1978),
(12, 2, 511, 1979),
(13, 2, 522, 1980),
(14, 2, 533, 1981),
(15, 2, 544, 1982),
(16, 2, 555, 1983),
(17, 2, 566, 1984),
(18, 2, 577, 1985),
(19, 2, 588, 1986),
(20, 2, 599, 1987),
(21, 2, 600, 1988),
(22, 2, 611, 1989),
(23, 2, 622, 1990),
(24, 2, 633, 1991),
(25, 2, 644, 1992),
(26, 2, 655, 1993),
(27, 2, 666, 1994),
(28, 2, 677, 1995),
(29, 2, 688, 1996),
(30, 2, 699, 1997),
(31, 2, 700, 1998),
(32, 2, 711, 1999),
(33, 2, 722, 2000),
(34, 2, 733, 2001),
(35, 2, 744, 2002),
(36, 2, 755, 2003),
(37, 2, 766, 2004),
(38, 2, 777, 2005),
(39, 2, 788, 2006),
(40, 2, 799, 2007),
(41, 2, 800, 2008),
(42, 2, 811, 2009),
(43, 2, 822, 2010),
(44, 2, 833, 2011),
(45, 2, 844, 2012),
(46, 2, 855, 2013),
(47, 2, 866, 2014),
(48, 2, 877, 2015),
(49, 2, 900, 2016),
(50, 2, 999, 2017),
(51, 1, 200, 1968),
(52, 1, 209, 1969),
(53, 1, 215, 1970),
(54, 1, 227, 1971),
(55, 1, 236, 1972),
(56, 1, 242, 1973),
(57, 1, 250, 1974),
(58, 1, 269, 1975),
(59, 1, 270, 1976),
(60, 1, 283, 1977),
(61, 1, 299, 1978),
(62, 1, 300, 1979),
(63, 1, 305, 1980),
(64, 1, 312, 1981),
(65, 1, 325, 1982),
(66, 1, 333, 1983),
(67, 1, 344, 1984),
(68, 1, 355, 1985),
(69, 1, 366, 1986),
(70, 1, 377, 1987),
(71, 1, 388, 1988),
(72, 1, 399, 1989),
(73, 1, 400, 1990),
(74, 1, 411, 1991),
(75, 1, 422, 1992),
(76, 1, 433, 1993),
(77, 1, 444, 1994),
(78, 1, 455, 1995),
(79, 1, 466, 1996),
(80, 1, 477, 1997),
(81, 1, 488, 1998),
(82, 1, 499, 1999),
(83, 1, 500, 2000),
(84, 1, 511, 2001),
(85, 1, 522, 2002),
(86, 1, 533, 2003),
(87, 1, 544, 2004),
(88, 1, 555, 2005),
(89, 1, 566, 2006),
(90, 1, 577, 2007),
(91, 1, 588, 2008),
(92, 1, 599, 2009),
(93, 1, 600, 2010),
(94, 1, 611, 2011),
(95, 1, 622, 2012),
(96, 1, 633, 2013),
(97, 1, 700, 2014),
(98, 1, 727, 2015),
(99, 1, 750, 2016),
(100, 1, 800, 2017);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_kp`
--
ALTER TABLE `tbl_kp`
  ADD PRIMARY KEY (`id_kp`);

--
-- Indexes for table `tbl_pelanggaran`
--
ALTER TABLE `tbl_pelanggaran`
  ADD PRIMARY KEY (`id_pelanggaran`),
  ADD KEY `fk_kp` (`id_kp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_kp`
--
ALTER TABLE `tbl_kp`
  MODIFY `id_kp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_pelanggaran`
--
ALTER TABLE `tbl_pelanggaran`
  MODIFY `id_pelanggaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_pelanggaran`
--
ALTER TABLE `tbl_pelanggaran`
  ADD CONSTRAINT `tbl_pelanggaran_ibfk_1` FOREIGN KEY (`id_kp`) REFERENCES `tbl_kp` (`id_kp`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
