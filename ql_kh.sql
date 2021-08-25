-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2021 at 03:29 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ql_kh`
--

-- --------------------------------------------------------

--
-- Table structure for table `bomon`
--

CREATE TABLE `bomon` (
  `maBoMon` int(11) NOT NULL,
  `tenBoMon` varchar(256) DEFAULT NULL,
  `moTa` varchar(256) DEFAULT NULL,
  `maKhoa` int(11) NOT NULL,
  `taoNgay` datetime NOT NULL DEFAULT current_timestamp(),
  `suaNgay` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bomon`
--

INSERT INTO `bomon` (`maBoMon`, `tenBoMon`, `moTa`, `maKhoa`, `taoNgay`, `suaNgay`) VALUES
(1, 'cntt 2', 'cong nghe thong tin k13', 1, '2021-08-23 19:32:07', '2021-08-23 19:32:07'),
(3, '43424', '43243242', 1, '2021-08-23 19:32:07', '2021-08-23 19:32:07'),
(4, '678565', 'hjhgjghj', 1, '2021-08-25 16:51:15', '2021-08-25 16:51:31');

-- --------------------------------------------------------

--
-- Table structure for table `congvan`
--

CREATE TABLE `congvan` (
  `maCongVan` int(11) NOT NULL,
  `tenCongVan` varchar(256) NOT NULL,
  `noiDung` text NOT NULL,
  `maGiaoVien` int(11) DEFAULT NULL,
  `maBoMon` int(11) DEFAULT NULL,
  `taoNgay` datetime NOT NULL DEFAULT current_timestamp(),
  `suaNgay` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `giangday`
--

CREATE TABLE `giangday` (
  `maGiaoVien` int(11) NOT NULL,
  `maMon` int(11) NOT NULL,
  `thoiGian` datetime NOT NULL,
  `diaDiem` text NOT NULL,
  `soTiet` int(11) NOT NULL,
  `ghiChu` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `giaovien`
--

CREATE TABLE `giaovien` (
  `maGiaoVien` int(11) NOT NULL,
  `tenGiaoVien` varchar(11) DEFAULT NULL,
  `maBoMon` int(11) NOT NULL,
  `taoNgay` datetime NOT NULL DEFAULT current_timestamp(),
  `vaiTro` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `giaovien`
--

INSERT INTO `giaovien` (`maGiaoVien`, `tenGiaoVien`, `maBoMon`, `taoNgay`, `vaiTro`) VALUES
(2, 'dsa2321 342', 3, '2021-08-25 17:44:31', '321312'),
(3, 'Xuân Tùng', 1, '2021-08-25 17:58:58', 'Thầy');

-- --------------------------------------------------------

--
-- Table structure for table `khoa`
--

CREATE TABLE `khoa` (
  `maKhoa` int(11) NOT NULL,
  `tenKhoa` varchar(256) DEFAULT NULL,
  `moTa` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `khoa`
--

INSERT INTO `khoa` (`maKhoa`, `tenKhoa`, `moTa`) VALUES
(1, 'du lich', 'du lich 1');

-- --------------------------------------------------------

--
-- Table structure for table `mon`
--

CREATE TABLE `mon` (
  `maMon` int(11) NOT NULL,
  `tenMon` varchar(256) DEFAULT NULL,
  `moTa` varchar(256) DEFAULT NULL,
  `taoNgay` datetime NOT NULL DEFAULT current_timestamp(),
  `suaNgay` datetime NOT NULL DEFAULT current_timestamp(),
  `maBoMon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mon`
--

INSERT INTO `mon` (`maMon`, `tenMon`, `moTa`, `taoNgay`, `suaNgay`, `maBoMon`) VALUES
(1, 'cntt', 'cong nghe thong tin', '2021-08-19 19:31:28', '2021-08-23 19:31:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `thongke`
--

CREATE TABLE `thongke` (
  `maGiaoVien` int(11) NOT NULL,
  `maMon` int(11) NOT NULL,
  `thoiGianDay` int(11) NOT NULL,
  `thoiGianDayThucTe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bomon`
--
ALTER TABLE `bomon`
  ADD PRIMARY KEY (`maBoMon`),
  ADD KEY `maKhoa` (`maKhoa`);

--
-- Indexes for table `congvan`
--
ALTER TABLE `congvan`
  ADD KEY `maBoMon` (`maBoMon`),
  ADD KEY `maGiaoVien` (`maGiaoVien`);

--
-- Indexes for table `giangday`
--
ALTER TABLE `giangday`
  ADD PRIMARY KEY (`maGiaoVien`,`maMon`),
  ADD KEY `maMon` (`maMon`);

--
-- Indexes for table `giaovien`
--
ALTER TABLE `giaovien`
  ADD PRIMARY KEY (`maGiaoVien`),
  ADD KEY `maBoMon` (`maBoMon`);

--
-- Indexes for table `khoa`
--
ALTER TABLE `khoa`
  ADD PRIMARY KEY (`maKhoa`);

--
-- Indexes for table `mon`
--
ALTER TABLE `mon`
  ADD PRIMARY KEY (`maMon`),
  ADD KEY `maBoMon` (`maBoMon`);

--
-- Indexes for table `thongke`
--
ALTER TABLE `thongke`
  ADD PRIMARY KEY (`maGiaoVien`,`maMon`),
  ADD KEY `maMon` (`maMon`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bomon`
--
ALTER TABLE `bomon`
  ADD CONSTRAINT `bomon_ibfk_2` FOREIGN KEY (`maKhoa`) REFERENCES `khoa` (`maKhoa`);

--
-- Constraints for table `congvan`
--
ALTER TABLE `congvan`
  ADD CONSTRAINT `congvan_ibfk_1` FOREIGN KEY (`maBoMon`) REFERENCES `bomon` (`maBoMon`),
  ADD CONSTRAINT `congvan_ibfk_2` FOREIGN KEY (`maGiaoVien`) REFERENCES `giaovien` (`maGiaoVien`);

--
-- Constraints for table `giangday`
--
ALTER TABLE `giangday`
  ADD CONSTRAINT `giangday_ibfk_1` FOREIGN KEY (`maGiaoVien`) REFERENCES `giaovien` (`maGiaoVien`),
  ADD CONSTRAINT `giangday_ibfk_2` FOREIGN KEY (`maMon`) REFERENCES `mon` (`maMon`);

--
-- Constraints for table `giaovien`
--
ALTER TABLE `giaovien`
  ADD CONSTRAINT `giaovien_ibfk_1` FOREIGN KEY (`maBoMon`) REFERENCES `bomon` (`maBoMon`);

--
-- Constraints for table `mon`
--
ALTER TABLE `mon`
  ADD CONSTRAINT `mon_ibfk_1` FOREIGN KEY (`maBoMon`) REFERENCES `bomon` (`maBoMon`);

--
-- Constraints for table `thongke`
--
ALTER TABLE `thongke`
  ADD CONSTRAINT `thongke_ibfk_1` FOREIGN KEY (`maGiaoVien`) REFERENCES `giaovien` (`maGiaoVien`),
  ADD CONSTRAINT `thongke_ibfk_2` FOREIGN KEY (`maMon`) REFERENCES `mon` (`maMon`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
