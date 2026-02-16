-- Database: `sekolah`

CREATE DATABASE IF NOT EXISTS `sekolah`;
USE `sekolah`;

-- Table structure for table `siswa`

CREATE TABLE IF NOT EXISTS `siswa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tmplahir` varchar(50) NOT NULL,
  `tglahir` varchar(20) NOT NULL,
  `kelamin` varchar(15) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
