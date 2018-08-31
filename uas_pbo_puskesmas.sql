-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2017 at 03:54 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uas_pbo_puskesmas`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` varchar(10) NOT NULL,
  `nama_dokter` varchar(20) NOT NULL,
  `jenis_kelamin_dokter` varchar(20) NOT NULL,
  `jadwal_dokter` varchar(10) NOT NULL,
  `telepon_dokter` varchar(15) NOT NULL,
  `alamat_dokter` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `jenis_kelamin_dokter`, `jadwal_dokter`, `telepon_dokter`, `alamat_dokter`) VALUES
('D0001', 'Dr. Rizky F', 'Laki - Laki', 'Rabu', '085659456197', 'Karajeun'),
('D0002', 'Dr. Aya', 'Perempuan', 'Kamis', '0872365236', 'Kp. Uye'),
('D0003', 'Dr. James', 'Laki - Laki', 'Selasa', '08763766725', 'Kp. Gudang');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` varchar(10) NOT NULL,
  `id_petugas` varchar(10) NOT NULL,
  `nama_pasien` varchar(20) NOT NULL,
  `umur_pasien` varchar(10) NOT NULL,
  `jenis_kelamin_pasien` varchar(20) NOT NULL,
  `tgl_lahir_pasien` date NOT NULL,
  `telepon_pasien` varchar(15) NOT NULL,
  `alamat_pasien` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `id_petugas`, `nama_pasien`, `umur_pasien`, `jenis_kelamin_pasien`, `tgl_lahir_pasien`, `telepon_pasien`, `alamat_pasien`) VALUES
('S0001', 'T0002', 'Maya', '20', 'Perempuan', '2017-07-08', '1234567890', 'KP. Awe'),
('S0002', 'T0001', 'Diki', '30', 'Laki - Laki', '2017-07-28', '0987654321', 'Kp. Uwa'),
('S0003', 'T0002', 'Yayan', '12', 'Laki - Laki', '2017-07-24', '1251265484', 'Kp. Aye'),
('S0004', 'T0004', 'Moni', '20', 'Perempuan', '2017-07-28', '0878853487643', 'Kp. Aye');

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id_periksa` varchar(10) NOT NULL,
  `id_dokter` varchar(10) NOT NULL,
  `id_pasien` varchar(10) NOT NULL,
  `berat_badan` varchar(10) NOT NULL,
  `tensi_darah` varchar(10) NOT NULL,
  `alergi_obat` varchar(10) NOT NULL,
  `keluhan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `periksa`
--

INSERT INTO `periksa` (`id_periksa`, `id_dokter`, `id_pasien`, `berat_badan`, `tensi_darah`, `alergi_obat`, `keluhan`) VALUES
('K0001', 'D0001', 'S0001', '50 Kg', '100', 'Tidak', 'Kurap'),
('K0002', 'D0002', 'S0003', '60 Kg', '100', 'Ya', 'Ginjal'),
('K0003', 'D0001', 'S0002', '70 kg', '90', 'Tidak', 'Panu'),
('K0004', 'D0003', 'S0004', '65 Kg', '120', 'Tidak', 'Paranas Tiris');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` varchar(10) NOT NULL,
  `nama_petugas` varchar(20) NOT NULL,
  `jadwal_petugas` varchar(20) NOT NULL,
  `tgl_jadwal_petugas` date NOT NULL,
  `tgl_lahir_petugas` date NOT NULL,
  `jenis_kelamin_petugas` varchar(20) NOT NULL,
  `alamat_petugas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `jadwal_petugas`, `tgl_jadwal_petugas`, `tgl_lahir_petugas`, `jenis_kelamin_petugas`, `alamat_petugas`) VALUES
('T0001', 'Rizky Fathurahman', 'Senin', '2017-07-03', '1997-06-29', 'Laki - Laki', 'Kp. Karajeun RT 02 RW 03'),
('T0002', 'Manohara', 'Selasa', '2017-07-04', '2017-07-18', 'Perempuan', 'Kp. Rambutan'),
('T0003', 'Budi', 'Jum''at', '2017-07-22', '2017-07-01', 'Laki - Laki', 'Kp. Cucu'),
('T0004', 'Mona', 'Rabu', '2017-07-05', '2017-07-01', 'Perempuan', 'Kp. Uye');

-- --------------------------------------------------------

--
-- Table structure for table `resep`
--

CREATE TABLE `resep` (
  `id_resep` varchar(10) NOT NULL,
  `id_pasien` varchar(10) NOT NULL,
  `id_periksa` varchar(10) NOT NULL,
  `tgl_resep` date NOT NULL,
  `nama_obat` varchar(100) NOT NULL,
  `pemakaian` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resep`
--

INSERT INTO `resep` (`id_resep`, `id_pasien`, `id_periksa`, `tgl_resep`, `nama_obat`, `pemakaian`) VALUES
('R0001', 'S0001', 'K0001', '2017-07-08', 'Salep', 'Atel Pake'),
('R0002', 'S0004', 'K0004', '2017-07-21', 'Paracetamol', '3x Sehari Setelah Makan');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
