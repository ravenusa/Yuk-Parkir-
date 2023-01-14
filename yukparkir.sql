-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2023 at 12:56 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yukparkir`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(30) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga_barang` int(11) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `id_mhs_poin` varchar(30) NOT NULL,
  `jumlah_poin` int(11) NOT NULL,
  `stok_barang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga_barang`, `jumlah_barang`, `id_mhs_poin`, `jumlah_poin`, `stok_barang`) VALUES
('B0001', 'Bolpoin', 15, 1, 'P001', 200, 50);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `nim` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`nim`, `password`) VALUES
('20.11.3618', 'halo2'),
('20.11.3623', 'halo'),
('20.11.3655', 'halo3'),
('20.11.3672', 'halo4');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(30) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `prodi` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `no_hp` decimal(10,0) DEFAULT NULL,
  `no_kendaraan` varchar(20) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `prodi`, `email`, `no_hp`, `no_kendaraan`, `foto`) VALUES
('20.11.3618', 'Irham', 'Ilmu Komunikasi', 'irham@gmail.com', '9999999999', 'DK 4334 PP', 'https://raw.githubusercontent.com/whatdefood/whatdefood.github.io/main/img/20_11_3618.jpg'),
('20.11.3623', 'Ravenusa', 'Informatika', 'ravenusanusa@gmail.com', '9999999999', 'AB 2020 JK', 'https://raw.githubusercontent.com/whatdefood/whatdefood.github.io/main/img/20_11_3623.jpg'),
('20.11.3655', 'Egik Tri', 'Informatika', 'egik3@gmail.com', '9999999999', 'AD 1944 HV', 'https://raw.githubusercontent.com/whatdefood/whatdefood.github.io/main/img/20_11_3655.jpg'),
('20.11.3672', 'Gibran', 'Ilmu Komunikasi', 'Aldrin@gmail.com', '898333453', 'AD 5636 ZZ', 'https://raw.githubusercontent.com/whatdefood/whatdefood.github.io/main/img/20_11_3672.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `poin`
--

CREATE TABLE `poin` (
  `id_mhs_poin` varchar(30) NOT NULL,
  `nim` varchar(30) NOT NULL,
  `jumlah_poin` int(11) NOT NULL,
  `transaksi_masuk` varchar(30) DEFAULT NULL,
  `transaksi_keluar` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `poin`
--

INSERT INTO `poin` (`id_mhs_poin`, `nim`, `jumlah_poin`, `transaksi_masuk`, `transaksi_keluar`) VALUES
('P001', '20.11.3623', 200, '5', '15'),
('P002', '20.11.3655', 50, '5', ' '),
('P003', '20.11.3618', 30, '3', ' '),
('P004', '20.11.3672', 40, '4', '');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `email` varchar(50) NOT NULL,
  `nim` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `plat` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_pindai`
--

CREATE TABLE `riwayat_pindai` (
  `id_riwayat` varchar(30) NOT NULL,
  `tanggal` datetime DEFAULT NULL,
  `nim` varchar(30) NOT NULL,
  `id_mhs_poin` varchar(30) NOT NULL,
  `jumlah_poin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `riwayat_pindai`
--

INSERT INTO `riwayat_pindai` (`id_riwayat`, `tanggal`, `nim`, `id_mhs_poin`, `jumlah_poin`) VALUES
('R0001', '2022-12-02 00:00:00', '20.11.3623', 'P001', 200),
('R0002', '2022-12-02 00:00:00', '20.11.3655', 'P002', 50);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_mhs_poin` (`id_mhs_poin`,`jumlah_poin`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`password`),
  ADD KEY `nim` (`nim`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `poin`
--
ALTER TABLE `poin`
  ADD PRIMARY KEY (`id_mhs_poin`,`jumlah_poin`),
  ADD KEY `nim` (`nim`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`email`),
  ADD KEY `nim` (`nim`);

--
-- Indexes for table `riwayat_pindai`
--
ALTER TABLE `riwayat_pindai`
  ADD PRIMARY KEY (`id_riwayat`),
  ADD KEY `id_mhs_poin` (`id_mhs_poin`,`jumlah_poin`),
  ADD KEY `nim` (`nim`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_mhs_poin`,`jumlah_poin`) REFERENCES `poin` (`id_mhs_poin`, `jumlah_poin`);

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);

--
-- Constraints for table `poin`
--
ALTER TABLE `poin`
  ADD CONSTRAINT `poin_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);

--
-- Constraints for table `register`
--
ALTER TABLE `register`
  ADD CONSTRAINT `register_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);

--
-- Constraints for table `riwayat_pindai`
--
ALTER TABLE `riwayat_pindai`
  ADD CONSTRAINT `riwayat_pindai_ibfk_1` FOREIGN KEY (`id_mhs_poin`,`jumlah_poin`) REFERENCES `poin` (`id_mhs_poin`, `jumlah_poin`),
  ADD CONSTRAINT `riwayat_pindai_ibfk_2` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
