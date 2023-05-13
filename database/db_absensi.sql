-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2023 at 09:57 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_absensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `agama`
--

CREATE TABLE `agama` (
  `id_agama` int(11) NOT NULL,
  `agama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agama`
--

INSERT INTO `agama` (`id_agama`, `agama`) VALUES
(1, 'ISLAM'),
(2, 'KRISTEN'),
(3, 'KATHOLIK'),
(4, 'HINDU'),
(5, 'BUDDHA'),
(6, 'KONGHUCU');

-- --------------------------------------------------------

--
-- Table structure for table `gedung`
--

CREATE TABLE `gedung` (
  `gedung_id` int(11) NOT NULL,
  `nama_gedung` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gedung`
--

INSERT INTO `gedung` (`gedung_id`, `nama_gedung`, `alamat`) VALUES
(12, 'GRAHA AASI', 'Jalan Jatinegara Timur II No. 4, Rawa Bunga | Jakarta Timur, 13550 Indonesia');

-- --------------------------------------------------------

--
-- Table structure for table `goldar`
--

CREATE TABLE `goldar` (
  `id_goldar` int(11) NOT NULL,
  `goldar` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `goldar`
--

INSERT INTO `goldar` (`id_goldar`, `goldar`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'AB'),
(4, 'O'),
(5, '--');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(3, 'Karyawan', 'Karyawan');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `nama_jabatan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES
(5, 'KARYAWAN'),
(7, 'MAGANG'),
(8, 'DIREKTUR EKSEKUTIF'),
(9, 'ASISTEN MANAGER'),
(10, 'MANAGER'),
(11, 'CALON KARYAWAN');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_kelamin`
--

CREATE TABLE `jenis_kelamin` (
  `id_gender` int(11) NOT NULL,
  `jenis_kelamin` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_kelamin`
--

INSERT INTO `jenis_kelamin` (`id_gender`, `jenis_kelamin`) VALUES
(1, 'LAKI-LAKI'),
(2, 'PEREMPUAN');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `id_karyawan` varchar(20) NOT NULL,
  `no_ktp` varchar(17) NOT NULL,
  `nik` varchar(17) NOT NULL,
  `nama_karyawan` varchar(30) NOT NULL,
  `tmp_lahir` varchar(255) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` varchar(255) NOT NULL,
  `goldar` varchar(3) NOT NULL,
  `agama` varchar(255) NOT NULL,
  `alamat_ktp` varchar(255) NOT NULL,
  `domisili` varchar(255) NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `telp_kantor` varchar(13) NOT NULL,
  `telp_kerabat` varchar(13) NOT NULL,
  `hub_kerabat` varchar(255) NOT NULL,
  `is_active` int(1) NOT NULL,
  `jabatan` int(11) NOT NULL,
  `id_shift` int(20) NOT NULL,
  `gedung_id` int(11) NOT NULL,
  `user_pict` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id`, `id_karyawan`, `no_ktp`, `nik`, `nama_karyawan`, `tmp_lahir`, `tgl_lahir`, `jenis_kelamin`, `goldar`, `agama`, `alamat_ktp`, `domisili`, `no_telp`, `telp_kantor`, `telp_kerabat`, `hub_kerabat`, `is_active`, `jabatan`, `id_shift`, `gedung_id`, `user_pict`) VALUES
(1, 'A2303001', '3174026311940002', '', 'Ayu Trinanda', 'Jakarta', '1994-11-23', 'PEREMPUAN', 'A', 'ISLAM', 'Jalan Karet Belakang RT.017/002 Setiabudi Jakarta Selatan', 'Jalan Karet Belakang RT.017/002 Setiabudi Jakarta Selatan', '081316689838', '', '08118719494', 'Keluarga', 1, 9, 0, 12, '09042021081604Ayu_Triananda1.jpg'),
(2, 'M2303001', '1271106403010004', '3276060511140017', 'Rana Amalia Putri', 'Padangsidempuan', '2001-03-24', 'PEREMPUAN', 'B', 'ISLAM', 'Jl. Wijaya Kusuma Raya 259, Pancoran Mas, Depok', 'Jl. Wijaya Kusuma Raya 259, Pancoran Mas, Depok', '089537627126', '', '087768594619', 'Ayah', 1, 7, 0, 12, '14022022101117WhatsApp_Image_2022-02-09_at_20_49_211.jpeg'),
(3, 'C2303002', '1304030205820003', '', 'Bedri Firman', 'Batusangkar', '1982-05-02', 'LAKI-LAKI', 'A', 'ISLAM', 'Mutiara Mallben, Kav. AURI Jati Makmur, Pondok Gede, Bekasi', 'Mutiara Mallben, Kav. AURI Jati Makmur, Pondok Gede, Bekasi', '081374649597', '', '081295608992', 'Istri', 1, 11, 0, 12, '09042021022532WhatsApp_Image_2021-04-09_at_09_08_311.jpeg'),
(4, 'M2303003', '1406035310000002', '1406032610110000', 'Ardila Rulia Nasty', 'Pasir Pengaraian', '2000-10-13', 'PEREMPUAN', 'O', 'ISLAM', 'Kampung Padang Rt.003/Rw.001, Desa Rambah Tengah Utara, Kec. Rambah, Kab. Rokan huku, Provinsi Riau', 'Pulo Asem Utara X No.11, Kec. Pulo Gadung, Jakarta Timur', '082294108430', '08111784451', '081275721117', 'Ibu', 1, 7, 0, 12, '0201202371EC4CC4-5745-4F45-B036-4644371F772A_1_105_c1.jpg'),
(5, 'M2303004', '1803022003010004', '1803021905210006', 'Muhammad Akbar Abung A B', 'Bandar Lampung', '2001-03-20', 'LAKI-LAKI', 'A', 'ISLAM', 'Kemanggisan, Jakarta Barat', 'Kemanggisan, Jakarta Barat', '081513124401', '', '08128076007', 'Orang Tua', 1, 7, 0, 12, '17012022081423IMG_4361_copy1.jpg'),
(6, 'K2303005', '1810040409840001', '', 'Efendi Zarkasi', 'Wargomulyo', '1986-10-10', 'LAKI-LAKI', 'A', 'ISLAM', 'Kp. Malaka rt 09 rW 01 Pondok Kopi Duren Sawit Jakarta Timur', 'Kp. Malaka rt 09 rW 01 Pondok Kopi Duren Sawit Jakarta Timur', '08561235490', '', '081510769263', 'Keluarga', 1, 5, 0, 12, '09042021035103Fendi.jpg'),
(7, 'K2303006', '3171011009980003', '3171010301093350', 'Muhammad Hafidz Azmi', 'Jakarta', '1998-09-10', 'LAKI-LAKI', 'O', 'ISLAM', 'Cluster Pesona Dewata Blok PD 3 No 3, Kel. Bojong Nangka, Kec. Kelapa Dua, Kab. Tangerang Banten', 'Cluster Pesona Dewata Blok PD 3 No 3, Kel. Bojong Nangka, Kec. Kelapa Dua, Kab. Tangerang Banten', '085814019690', '', '081212456600', 'Ibu', 1, 5, 0, 12, '16092022063738Pas_Photo_Hafidz_AASI.jpeg'),
(8, 'K2303007', '3171056706980002', '', 'Jihan Aulia Grisatita', 'Jakarta', '1998-06-27', 'PEREMPUAN', 'A', 'ISLAM', 'Jl. Cempaka Warna Rt 7 Rw 4 no. 29 cempaka putih timur jakarta pusat', 'Jl. Cempaka Warna Rt 7 Rw 4 no. 29 cempaka putih timur jakarta pusat', '082120056645', '', '082298705415', 'Kakak', 1, 5, 0, 12, '09042021022918Jihan.jpg'),
(9, 'M2303008', '3172065206020004', '3276011712130020', 'Shafa Jihan Nurhaliza', 'Jakarta', '2002-06-12', 'PEREMPUAN', 'O', 'ISLAM', 'Perum Depok Jaya Agung. Jl. Sankis No. 12 RT.04/RW.10, kel. Rangkapan Jaya, Kec. Pancoran Mas, Kota Depok, Jawa Barat 16435', 'Perum Depok Jaya Agung. Jl. Sankis No. 12 RT.04/RW.10, kel. Rangkapan Jaya, Kec. Pancoran Mas, Kota Depok, Jawa Barat 16435', '085156535062', '02121013690', '08559900201', 'Ayah', 1, 7, 0, 12, '31102022Foto_Shafa_Jihan_Nurhaliza.jpg'),
(10, 'C2303033', '3173040508850006', '3173061508190039', 'Moh Taufikurohman', 'Jakarta', '1985-08-05', 'LAKI-LAKI', 'B', 'ISLAM', 'Jl. Tanjung Pura V no.15, RT.05/RW.05 Kelurahan Pegadungan - Kecamatan Kalideres Jakarta Barat', 'Jl. Tanjung Pura V no.15, RT.05/RW.05 Kelurahan Pegadungan - Kecamatan Kalideres Jakarta Barat', '081995101112', '', '081995101112', 'Istri', 1, 11, 0, 12, '01092022015343WhatsApp_Image_2022-09-01_at_8_48_23_AM.jpeg'),
(11, 'M2303010', '3174017011011002', '3174010901093792', 'Geby Racmah', 'Jakarta', '2001-11-30', 'PEREMPUAN', 'A', 'ISLAM', 'Jl. Bukit Duri Tanjakan 9 no.33', 'Jl. Bukit Duri Tanjakan 9 no.33', '085780324950', '', '08187075370', 'Saudara', 1, 7, 0, 12, '17012022075555WhatsApp_Image_2022-01-17_at_14_57_59.jpeg'),
(12, 'M2303011', '3174041204000004', '3174041601099099', 'Muhamnad Raihan Adzka', 'Jakarta', '2000-04-12', 'LAKI-LAKI', 'O', 'ISLAM', 'Jl. Cilandak KKO No.1 RT.14 RW.08 Ragunan Pasar Minggu Jakarta Selatan', 'Jl. Cilandak KKO No.1 RT.14 RW.08 Ragunan Pasar Minggu Jakarta Selatan', '081293791393', '', '081293791393', 'Kakak Sepupu', 1, 7, 0, 12, '11072022230623Muhammad_Raihan_Adzka_.jpg'),
(13, 'C2303012', '3174055406870006', '3216070704160023', 'Dewi Ningsih', 'Cibitung', '1987-06-14', 'PEREMPUAN', 'AB', 'ISLAM', 'Perumahan Kirana Cibitung Blok i5 No.32, Wanajaya, Cibitung, Bekasi', 'Perumahan Kirana Cibitung Blok i5 No.32, Wanajaya, Cibitung, Bekasi', '082311138632', '', '082118854276', 'Suami', 1, 11, 0, 12, '07092022011107Pas_Foto_Dewi.jpeg'),
(14, 'C2303013', '3174080409780002', '3174080201141001', 'Heri Agus Widiyanto', 'Semarang', '1978-09-04', 'LAKI-LAKI', 'B', 'ISLAM', 'GG.porti RT.009/ RW. 01, Kel. Rawajati, Kec. Pancoran, Jakarta Selatan', 'GG.porti RT.009/ RW. 01, Kel. Rawajati, Kec. Pancoran, Jakarta Selatan', '085216181660', '', '081290688560', 'Istri', 1, 11, 0, 12, '11072022234154WhatsApp_Image_2022-07-11_at_4_53_49_PM.jpeg'),
(15, 'C2303014', '3175024909990005', '3175022001093595', 'Veren Trifena', 'Jakarta', '1999-09-09', 'PEREMPUAN', 'AB', 'ISLAM', 'Jalan Cipinang Jagal RT 001/ RW 016 no 42. Kelurahan Cipinang, Kecamatan Pulogadung. Jakarta Timur. (13240)', 'Jalan Cipinang Jagal RT 001/ RW 016 no 42. Kelurahan Cipinang, Kecamatan Pulogadung. Jakarta Timur. (13240)', '081932597456', '', '085711779798', 'Ibu', 1, 11, 0, 12, '09052022041924WhatsApp_Image_2022-04-30_at_09_27_25.jpeg'),
(16, 'M2303015', '3175025803021001', '3175021201111019', 'Diva Marchandra Mulansari', 'Bekasi', '2002-03-18', 'PEREMPUAN', 'O', 'ISLAM', 'Jl. Kayumanis Lama 1 Gang 1 No.16, Matraman, Jakarta Timur.', 'Jl. Kayumanis Lama 1 Gang 1 No.16, Matraman, Jakarta Timur.', '089629079276', '', '081311511633', 'Ibu', 1, 7, 0, 12, '25072022020831Diva.jpeg'),
(17, 'K2303016', '3175026905991001', '3175022012160001', 'Mega Dwi Andriyani', 'Jakarta', '1999-05-29', 'PEREMPUAN', 'AB', 'ISLAM', 'Jl. Duren I no. 5 Rawamanun, Pulogadung, Jakarta Timur', 'Jl. Duren I no. 5 Rawamanun, Pulogadung, Jakarta Timur', '082110509142', '', '087791115631', 'Saudara', 1, 5, 0, 12, '02022022024655WhatsApp_Image_2021-12-23_at_20_38_40.jpeg'),
(18, 'K2303017', '3175032409720003', '3175031401090299', 'Saiful Rahim', 'Jakarta', '1972-09-24', 'LAKI-LAKI', 'A', 'ISLAM', 'Jl. Swadaya 3 No. 27, RT.015/Rw.06, Rawa Bunga, Jatinegara, Jakarta Timur', 'Jl. Swadaya 3 No. 27, RT.015/Rw.06, Rawa Bunga, Jatinegara, Jakarta Timur', '081218086865', '02121013690', '08187850661', 'Kakak', 1, 5, 0, 12, '20102022pak_syaiful.jpeg'),
(19, 'K2303018', '3175034305990002', '3175031001092875', 'Humaira Zahira', 'Jakarta', '1999-05-03', 'PEREMPUAN', 'A', 'ISLAM', 'Jl. Kebon Nanas Selatan 3 Rt.13/005, Cipinang Cempedak, Jatinegara, Jakarta Timur', 'Jl. Kebon Nanas Selatan 3 Rt.13/005, Cipinang Cempedak, Jatinegara, Jakarta Timur', '087775868207', '', '087788021551', 'Ibu', 1, 5, 0, 12, '16092022063552Pas_Photo_Humaira_AASI.jpeg'),
(20, 'K2303019', '3175061005991002', '3175060202097939', 'Rama Perdana', 'Jakarta', '1999-05-10', 'LAKI-LAKI', 'B', 'ISLAM', 'Jl. Kayu Tinggi No.124 RT.005 / RW.003, Kelurahan Cakung Timur, kec. Cakung, Jakarta Timur', 'Jl. Sunan Gunung Jati VI RT.006 / RW. 036, Kel. Bahagia, Kec. Babelan, Kab. Bekasi, Jawa Barat', '081380526192', '02121013690', '081288834539', 'Ayah', 1, 5, 0, 12, '01112022Rama_Perdana.jpg'),
(21, 'M2303020', '3175065811011004', '3175060501093493', 'Annisa Khairulala', 'Jakarta', '2001-11-18', 'PEREMPUAN', 'A', 'ISLAM', 'Kp. Pedurenan RT 001/006, Rawaterate, Cakung, Jakarta Timur', 'Kp. Pedurenan RT 001/006, Rawaterate, Cakung, Jakarta Timur', '088975560295', '', '089654321145', 'Kakak', 1, 7, 0, 12, '03022022021614EE2044DA-527C-4C57-BDF6-62FFFA40D092.jpeg'),
(22, 'C2303021', '3175071403830015', '3175072710160033', 'Efendi Zakarsi C', 'Jakarta', '1983-03-14', 'LAKI-LAKI', 'O', 'ISLAM', 'Kp. Curug No. 27 , Rt.003 / 08 , Kel. Pondok kelapa, Kec. Duren sawit , JakTim', 'Kp. Curug No. 27 , Rt.003 / 08 , Kel. Pondok kelapa, Kec. Duren sawit , JakTim', '081388555860', '', '089635667052', 'Adik Kandung', 1, 11, 0, 12, '16092022044741Pas_Photo_Pak_Efendi_Zakarsi_Outsource_Driver_AASI.jpeg'),
(23, 'K2303022', '317507190967001', '', 'Heri Supriyono', 'Banyuwangi', '1967-09-19', 'LAKI-LAKI', 'O', 'ISLAM', 'Jl. Naga Raya RT 006/ 03 No. 22 Kel. Duren Sawit', 'Jl. Naga Raya RT 006/ 03 No. 22 Kel. Duren Sawit', '087783856629', '', '08787249913', 'Keluarga', 1, 5, 0, 12, '12042021012557IMG-20210412-WA0002.jpeg'),
(24, 'K2303023', '320101280394000', '3201010305160016', 'Bintang Abimanyu Saputro', 'Bogor', '1994-03-28', 'LAKI-LAKI', '--', 'ISLAM', 'KP. Curug RT. 06/ RW. 02 , Kel. Pakansari, Cibinong, Bogor', 'KP. Curug RT. 06/ RW. 02 , Kel. Pakansari, Cibinong, Bogor', '081295042156', '', '082125991468', 'Istri', 1, 5, 0, 12, '11072022044852WhatsApp_Image_2022-07-11_at_11_41_08_AM.jpeg'),
(25, 'K2303024', '320113130403000', '3201131203070014', 'Muhammad Haikal Kamil', 'Bogor', '2003-04-13', 'LAKI-LAKI', 'O', 'ISLAM', 'Kp. Pabuaran RT. 01/ RW. 05, Kel/Des Pabuaran, Kecamatan Bojong gede.', 'Kp. Pabuaran RT. 01/ RW. 05, Kel/Des Pabuaran, Kecamatan Bojong gede.', '085793929400', '', '089665017823', 'Keluarga', 1, 5, 0, 12, '11072022233402WhatsApp_Image_2022-07-11_at_12_54_16_PM.jpeg'),
(26, 'K2303025', '3201181208920008', '3674070604210004', 'Yudi Lestari', 'Bogor', '1992-08-12', 'LAKI-LAKI', 'O', 'ISLAM', 'Batan Indah, Blok H43, RT. 013/ RW. 004, Kademangan, Setu, Kota Tangerang Selatan.', 'Batan Indah, Blok H43, RT. 013/ RW. 004, Kademangan, Setu, Kota Tangerang Selatan.', '081281183001', '', '081315875795', 'Istri', 1, 5, 0, 12, '06092022072716WhatsApp_Image_2022-09-06_at_11_53_12_AM.jpeg'),
(27, 'K2303026', '3202360210000002', '3202361005090006', 'Azhar Dwi Satria', 'Bekasi', '2000-10-02', 'LAKI-LAKI', 'O', 'ISLAM', 'Perumahan Griya Sukamaju Asri Blok D1 No.18, Desa sukamaju, kec. Sukalarang, Kabupaten Sukabumi.', 'Perumahan Griya Sukamaju Asri Blok D1 No.18, Desa sukamaju, kec. Sukalarang, Kabupaten Sukabumi.', '085210265098', '', '081563105655', 'Ayah', 1, 5, 0, 12, '16092022060405Pas_Photo_Azhar_Data_Analyst_AASI.jpeg'),
(28, 'K2303027', '3203014709980003', '3203012511059835', 'Wulan Sari Budiani', 'Sumedang', '1998-09-07', 'PEREMPUAN', 'O', 'ISLAM', 'Jl. Ir H. Juanda Gg Kalimantan 3, Rt.03/ Rw.13, Kel. Pamoyanan , Kec. Cianjur, Jawa Barat', 'Jalan Permata No.15, Jatinegara, Jakarta Timur', '089665860709', '02121013690', '087737806457', 'Ibu', 1, 5, 0, 12, '12012023WhatsApp_Image_2023-01-12_at_10_57_57.jpeg'),
(29, 'K2303028', '3271062602980005', '3271060907070025', 'Muhammad Insan Rabbani', 'Bogor', '1998-02-26', 'LAKI-LAKI', 'A', 'ISLAM', 'Jl. Dahlia No. 22 Taman Cimanggu Bogor', 'Jl. Dahlia No. 22 Taman Cimanggu Bogor', '085319642041', '', '085811492192', 'Ibu', 1, 5, 0, 12, '02022022041812WhatsApp_Image_2022-02-02_at_10_55_56.jpeg'),
(30, 'C2303029', '3273115010980002', '', 'Wulan Nurani', 'Garut', '1998-08-10', 'PEREMPUAN', 'B', 'ISLAM', 'Jl. Bangka 2 Gang 1 No 65. Mampang Prapatan Jakarta Selatan', 'Jl. Bangka 2 Gang 1 No 65. Mampang Prapatan Jakarta Selatan', '082113313238', '', '089505037010', 'Ibu', 1, 11, 0, 12, '09042021023650Wulan.jpg'),
(31, 'K2303030', '3275041298001600', '3275042205070164', 'Fahry Ammar Maulidian', 'Jakarta', '1998-07-12', 'LAKI-LAKI', 'B', 'ISLAM', 'jl. Pulo Sirih Tengah 5 Blok BE No. 408 RT. 009 RW. 013, Pekayon Jaya, Bekasi Selatan, Kota Bekasi', 'jl. Pulo Sirih Tengah 5 Blok BE No. 408 RT. 009 RW. 013, Pekayon Jaya, Bekasi Selatan, Kota Bekasi', '081287619007', '02121013690', '081806674074', 'Ibu', 1, 5, 0, 12, '26102022Fahry_Ammar.jpeg'),
(32, 'M2303031', '3275055401030013', '', 'Gladys Nindya Mediyanthi', 'Bekasi', '2003-01-14', 'PEREMPUAN', 'O', 'ISLAM', 'Jl.johar selatan II blok y1 no 13 pengasinan,rawalumbu', 'Jl.johar selatan II blok y1 no 13 pengasinan,rawalumbu', '081294389004', '', '081319248924', 'Ibu', 1, 7, 0, 12, '09042021073807Gladys.jpg'),
(33, 'C2303032', '3275076004000011', '3275070902090006', 'Tiara Angelia', 'Bekasi', '2000-04-20', 'PEREMPUAN', 'AB', 'ISLAM', 'Jl. Pasar lama Bantargebang RT 01/04', 'Jl. Pasar lama Bantargebang RT 01/04', '085695186783', '', '081219145502', 'Ibu', 1, 11, 0, 12, '27062022092336WhatsApp_Image_2022-06-27_at_4_01_38_PM.jpeg'),
(34, 'K2303033', '3275082001910012', '', 'Rian Andreas Abidin', 'Jakarta', '1991-01-20', 'LAKI-LAKI', 'O', 'ISLAM', 'Jl. Cipinang Lontar 2 No.3A', 'Jl. Cipinang Lontar 2 No.3A', '08976990246', '', '08568111212', 'Istri', 1, 5, 0, 12, '09042021083807Rian2.png'),
(35, 'M2303034', '3276065008000002', '3174091301096979', 'Afifah Adhe Trinurani', 'Depok', '2000-08-10', 'PEREMPUAN', 'A', 'ISLAM', 'Jl. Margonda Raya, Gg. Karet no.42 RT.03/ RW. 20, Depok, Jawa Barat.', 'Jl. Margonda Raya, Gg. Karet no.42 RT.03/ RW. 20, Depok, Jawa Barat.', '087888797150', '', '082123283310', 'Ayah', 1, 7, 0, 12, '06092022015344Afifah-Tax_Intern.jpeg'),
(36, 'K2303035', '3318056504980002', '', 'Nike Dyah Ayu Fatmawati', 'Pati', '1998-04-25', 'PEREMPUAN', 'O', 'ISLAM', 'Jl Raya Tengah, Gedong, Gg Remaja 1, RT 04/RW 03, Pasar Rebo, Jakarta Timur', 'Jl Raya Tengah, Gedong, Gg Remaja 1, RT 04/RW 03, Pasar Rebo, Jakarta Timur', '081210928317', '', '081399990477', 'Keluarga', 1, 5, 0, 12, '09042021035302Nike.jpg'),
(37, 'C2303036', '3320016204970001', '', 'Nila Maemunah', 'Jepara', '1997-04-22', 'PEREMPUAN', 'O', 'ISLAM', 'Jl Al Furqon 15 Pondok cina, Beji, Depok', 'Jl Al Furqon 15 Pondok cina, Beji, Depok', '081257651290', '', '082137169564', 'Ibu', 1, 11, 0, 12, '09042021021522Nila.jpg'),
(38, 'M2303037', '3403106604000002', '3175031904121031', 'Indah Aprilia', 'Gunungkidul', '2000-04-26', 'PEREMPUAN', 'A', 'ISLAM', 'Cipinang Besar Selatan, Jatinegara, Jakarta Timur', 'Cipinang Besar Selatan, Jatinegara, Jakarta Timur', '087789234150', '', '087881973091', 'Orang Tua', 1, 7, 0, 12, '17012022081730WhatsApp_Image_2022-01-17_at_14_52_50.jpeg'),
(39, 'K2303046', '3602146007990004', '', 'Julffy Delia Damayanthy', 'Lebak', '1999-07-20', 'PEREMPUAN', 'AB', 'ISLAM', 'JL. H. Yakub Saidi No. 23 RT 01 RW 04', 'JL. H. Yakub Saidi No. 23 RT 01 RW 04', '0895703182030', '', '0895703182030', 'Kakak', 1, 5, 0, 12, '290320210608241.jpg'),
(40, 'K2303039', '3603066511980004', '3603061501150005', 'Azizah Sadjum', 'Tangerang', '1998-11-25', 'PEREMPUAN', 'O', 'ISLAM', 'Kampung Cayur RT.04/RW. 01,  Desa Ranca Ilat, Kecamatan Kresek, Kabupaten Tangerang. 15620', 'Kampung Cayur RT.04/RW. 01,  Desa Ranca Ilat, Kecamatan Kresek, Kabupaten Tangerang. 15620', '089501466033', '', '081293839523', 'Kakak Kandung', 1, 5, 0, 12, '01092022013207PicsArt_07-23-12_27_28.jpg'),
(41, 'K2303040', '3603134203980001', '', 'Gita Pratiwi', 'Tangerang', '1998-03-02', 'PEREMPUAN', 'O', 'ISLAM', 'Jl. H. Yakub Saidi No. 23', 'Jl. H. Yakub Saidi No. 23', '085884043565', '', '082111718110', 'Ayah', 1, 5, 0, 12, '09042021023122Gita.jpg'),
(42, 'A2303041', '3671132210850002', '', 'Dedi Harsongko', 'Jakarta', '1985-10-22', 'LAKI-LAKI', 'A', 'ISLAM', 'Jl. Inpres 13B, KP. Patal, Rt. 002 / RW. 003 No. 43, Larangan, Gaga, Tangerang, 15154', 'Jl. Inpres 13B, KP. Patal, Rt. 002 / RW. 003 No. 43, Larangan, Gaga, Tangerang, 15154', '081212253388', '', '081319113790', 'Ibu', 1, 9, 0, 12, '29032021052435WhatsApp_Image_2021-03-29_at_12_23_50.jpeg'),
(43, 'K2303042', '3674042002010006', '3674041501103343', 'Heri Febriansyah', 'Jakarta', '2001-02-20', 'LAKI-LAKI', 'A', 'ISLAM', 'Jl. Ajem Mail No. 36 Rt.001/007, Sawah Baru, Ciputat, Tanggerang Selatan, Banten', 'Jl. Ajem Mail No. 36 Rt.001/007, Sawah Baru, Ciputat, Tanggerang Selatan, Banten', '089630963302', '02121013690', '0895637089830', 'Teman', 1, 5, 0, 12, '05012023WhatsApp_Image_2023-01-05_at_15_41_42.jpeg'),
(44, 'M2303043', '3674056110010001', '3674050501100084', 'Erina Octaviani', 'Jakarta', '2001-10-21', 'PEREMPUAN', 'O', 'ISLAM', 'Ciputat Timur, Tangerang Selatan', 'Ciputat Timur, Tangerang Selatan', '089607442239', '', '081283393301', 'Orang Tua', 1, 7, 0, 12, '17012022080933pas_foto.JPEG'),
(46, 'K2303046', '3174026311940009', '3174026311940009', 'Dummy', 'dummy', '2023-03-16', 'LAKI-LAKI', 'A', 'ISLAM', 'test', 'test', '081513124401', '02121013690', '081513124401', 'Kakak', 1, 5, 0, 12, '1603202107255910092020064844sadkaneki.png');

-- --------------------------------------------------------

--
-- Table structure for table `kehadiran`
--

CREATE TABLE `kehadiran` (
  `id_khd` int(11) NOT NULL,
  `nama_khd` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kehadiran`
--

INSERT INTO `kehadiran` (`id_khd`, `nama_khd`) VALUES
(1, 'Hadir'),
(2, 'Sakit'),
(3, 'Ijin'),
(4, 'Alfa'),
(5, 'Wfh'),
(6, 'Cuti');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(17, '::1', 'nanda_aasi', 1678932612),
(20, '::1', 'rama.aasi@gmail.com', 1678935199),
(21, '::1', 'rama.aasi@gmail.com', 1678935204);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `protected` tinyint(4) DEFAULT NULL,
  `is_active` int(1) NOT NULL,
  `is_parent` int(1) UNSIGNED NOT NULL,
  `sort` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `link`, `icon`, `protected`, `is_active`, `is_parent`, `sort`) VALUES
(15, 'menu management', 'menu', 'fa fa-list-alt', NULL, 1, 42, 14),
(16, 'master data', 'sdf', 'fa fa-folder', NULL, 1, 0, 1),
(18, 'Data Karyawan', 'karyawan', 'fa fa-user', NULL, 1, 16, 2),
(19, 'data Jabatan', 'jabatan', 'fa fa-briefcase', NULL, 1, 16, 3),
(21, 'Data Shift', 'Data Shift', 'fa fa-retweet', NULL, 0, 16, 4),
(22, 'data Lokasi', 'lokasi', 'fa fa-location-arrow', NULL, 1, 16, 5),
(31, 'Ambil QR Code', 'GenBar', 'fa fa-qrcode', NULL, 1, 0, 6),
(33, 'Scan QRCODE', 'scan', 'fa fa-search-plus', NULL, 1, 0, 7),
(35, 'User management', 'users', 'fa fa-users', NULL, 1, 42, 13),
(36, 'Histori Absensi', 'presensi', 'fa fa-paperclip', NULL, 1, 41, 9),
(39, 'Rekap Absensi', 'rekap', 'fa fa-list-alt', NULL, 1, 41, 10),
(41, 'Data Absensi', 'dataabs', 'far fa-folder-open', NULL, 1, 0, 8),
(42, 'setting', 'setting', 'fas fa-cogs', NULL, 1, 0, 11);

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

CREATE TABLE `presensi` (
  `id_absen` int(11) NOT NULL,
  `id_karyawan` varchar(20) NOT NULL,
  `tgl` date NOT NULL,
  `jam_msk` time NOT NULL,
  `jam_klr` time NOT NULL,
  `id_khd` int(11) DEFAULT NULL,
  `ket` varchar(150) NOT NULL,
  `file_keterangan` varchar(1000) NOT NULL,
  `id_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `presensi`
--

INSERT INTO `presensi` (`id_absen`, `id_karyawan`, `tgl`, `jam_msk`, `jam_klr`, `id_khd`, `ket`, `file_keterangan`, `id_status`) VALUES
(1, 'K2303023', '2023-03-16', '10:17:25', '00:00:00', 1, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `id_shift` int(11) NOT NULL,
  `nama_shift` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`id_shift`, `nama_shift`) VALUES
(5, 'SHIFT 1'),
(6, 'SHIFT 2'),
(7, 'SHIFT 3');

-- --------------------------------------------------------

--
-- Table structure for table `stts`
--

CREATE TABLE `stts` (
  `id_status` int(11) NOT NULL,
  `nama_status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stts`
--

INSERT INTO `stts` (`id_status`, `nama_status`) VALUES
(1, 'Masuk'),
(2, 'Pulang'),
(3, 'tidak hadir');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `nama_karyawan` varchar(255) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `nama_karyawan`, `first_name`, `last_name`) VALUES
(26, '::1', 'admin@admin.com', '$2y$12$MPcQlOck9fzd/5UjJ6iIXuhZivhkXdfoVD2xFXpZTnZ2IWQw/nFhW', 'admin@admin.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1556798313, 1678947266, 1, '', 'General', 'Admin'),
(58, '::1', 'nanda.aasi@gmail.com', '$2y$10$6mxdq5upnMQefehbwxoLuOIy/.rbAXOUgoxO0HMh20uJZNX6Fntdm', 'nanda.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678933572, 1678935211, 1, '', 'Ayu', 'Trinanda'),
(59, '::1', 'ardila.aasi@gmail.com', '$2y$10$jNJvWUmPyH1V6iN4X4bFX.mTAi4/apDdePtqK8FLUpMc77HYqmmhS', 'ardila.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678933638, NULL, 1, '', 'Ardila', 'Rulia Nasty'),
(60, '::1', 'efendi.aasi@gmail.com', '$2y$10$5TkAVSESM7OL2zjulVcs/.1lwWtoUENRhLNnBlU8Gxp9KGSUY.1Eq', 'efendi.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678933837, NULL, 1, '', 'Efendi', 'Zakarsi'),
(61, '::1', 'hafidz.aasi@gmail.com', '$2y$10$JLRiaLGDJaSViJsVxhfQlexCjFgXsX6I8er3FirFz2cIycBM5dGjm', 'hafidz.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678933888, NULL, 1, '', 'Muhammad', 'Hafidz Azmi'),
(62, '::1', 'jihan.aasi@gmail.com', '$2y$10$TgwiOtgxlxuv3TVhuNwu4uj.wophtYaRq/VNjzHbPOB.Ok157O0ZC', 'jihan.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678933985, NULL, 1, '', 'Jihan', 'Aulia Grisatita'),
(63, '::1', 'shafa.aasi@gmail.com', '$2y$10$KmWBIBHffLVZgi8LntQve.sEPI5/wyrkZBYJzovHEotzDbSgKv59u', 'shafa.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678935591, NULL, 1, '', 'Shafa', 'Jihan Nurhaliza'),
(64, '::1', 'saiful.aasi@gmail.com', '$2y$10$1RsFrBBveX7HklmEU9LdUuf3hWx.6ud7Dyr6jernJ4pH8KLi4fBgy', 'saiful.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678935668, NULL, 1, '', 'Saiful', 'Rahim'),
(65, '::1', 'humaira.aasi@gmail.com', '$2y$10$u5hjTBfG9CiVnZrHaK8Cge9DzgO/yZGXzRSoZ7K9h9A/Eimm4ny52', 'humaira.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678935715, NULL, 1, '', 'Humaira', 'Zahira'),
(66, '::1', 'rama.aasi@gmail.com', '$2y$10$XpkrqPXNYzJKSQ5ZNZ6bResKzMma6yF3Wi2ARYlr0QWsqK6Ml7IN.', 'rama.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678936509, NULL, 1, '', 'Rama', 'Perdana'),
(67, '::1', 'bintang.aasi@gmail.com', '$2y$10$cWrkB4ZhoQlvD0IdRrdRPecuAVq21AEPjKB5tvJW7HG7VUMmuoYYi', 'bintang.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678936608, 1678936629, 1, '', 'Bintang', 'Abimanyu Saputro'),
(68, '::1', 'haikal.aasi@gmail.com', '$2y$10$fu2GI.D6kz4qgrL3/nvTj.FRaYQ/Q5fozyAB5EVuDnyVEozYF.slO', 'haikal.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678936734, NULL, 1, '', 'Muhammad', 'Haikal Kamil'),
(69, '::1', 'yudi.aasi@gmail.com', '$2y$10$jxMpH1.Acqh3LLOcf1AXGe4DA.eTSPGcSeONl/9PrePXoKqI/JCXS', 'yudi.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678936768, NULL, 1, '', 'Yudi', 'Lestari'),
(70, '::1', 'azhar.aasi@gmail.com', '$2y$10$jN2JxJbVaF/IcXjaAhowy.ghpSkyASxgsYeRjWlfcc0cC/2.ynC.G', 'azhar.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678936790, NULL, 1, '', 'Azhar', 'Dwi Satria'),
(71, '::1', 'gladys.aasi@gmail.com', '$2y$10$IuC13sSR.o9gzus0KPuGI.ty7K2VN9KdVWUgr4HZkUVwEazDNlx.q', 'gladys.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678936899, NULL, 1, '', 'Gladys', 'Nindya Mediyanthi'),
(72, '::1', 'rian.aasi@gmail.com', '$2y$10$jDzHRNKmKBtrbAa/l2UUYegVQ/SmPYnXDykW830U4LR95aTTI.T2W', 'rian.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678937040, NULL, 1, '', 'Rian', 'Andreas Abidin'),
(73, '::1', 'nike.aasi@gmail.com', '$2y$10$EBupZNHX2i.9pTvYY4s.VOtmP2u5vuE7ACijMp4V5NXw1mNc9uTem', 'nike.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678937087, NULL, 1, '', 'Nike', 'Dyah Ayu Fatmawati'),
(74, '::1', 'julffy.aasi@gmail.com', '$2y$10$83igOHBprPVQhjTYf2KWt.FuDsNiJKI4ah.dqVgFH0wbGOHAS369W', 'julffy.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678937319, NULL, 1, '', 'Julffy', 'Delia Damayanthy'),
(75, '::1', 'azizah.aasi@gmail.com', '$2y$10$axh8JhzCquUiLHmackJjD.V8SCkw22zw5gpMZ7boqRTn1Mxc..RM2', 'azizah.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678937350, NULL, 1, '', 'Azizah', 'Sadjum'),
(76, '::1', 'gita.aasi@gmail.com', '$2y$10$ZyoU2GxcJHqoEuBoKgWjZe01j.6GnHahiWXyIzylK6z.Rnf5sW2fm', 'gita.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678937427, NULL, 1, '', 'Gita', 'Pratiwi'),
(77, '::1', 'dedi.aasi@gmail.com', '$2y$10$tSLAZOlthn9oDm7bVMzA5eFDR89Zzacp7xH3yCQypcPm6ulIVuB1K', 'dedi.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678937476, 1678937493, 1, '', 'Dedi', 'Harsongko'),
(78, '::1', 'heri.aasi@gmail.com', '$2y$10$CuGYdM0aw3q2Z7.rLtSHjuKoqV9Cak4ZPJidHdw8.rNakGJXEddMG', 'heri.aasi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678937588, NULL, 1, '', 'Heri', 'Febriansyah'),
(79, '::1', 'staff.sdm@aasi.com', '$2y$12$0L8cTKpgBubCjPZYmnkpz.YanM.EOauTjZu34w9dy9yYUizILqg/q', 'staff.sdm@aasi.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1678937624, 1678937647, 1, '', 'Staff', 'SDM');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(29, 26, 1),
(61, 58, 3),
(62, 59, 3),
(63, 60, 3),
(64, 61, 3),
(65, 62, 3),
(66, 63, 3),
(67, 64, 3),
(68, 65, 3),
(69, 66, 3),
(70, 67, 3),
(71, 68, 3),
(72, 69, 3),
(73, 70, 3),
(74, 71, 3),
(75, 72, 3),
(76, 73, 3),
(77, 74, 3),
(78, 75, 3),
(79, 76, 3),
(80, 77, 3),
(81, 78, 3),
(82, 79, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`id_agama`);

--
-- Indexes for table `gedung`
--
ALTER TABLE `gedung`
  ADD PRIMARY KEY (`gedung_id`);

--
-- Indexes for table `goldar`
--
ALTER TABLE `goldar`
  ADD PRIMARY KEY (`id_goldar`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `jenis_kelamin`
--
ALTER TABLE `jenis_kelamin`
  ADD PRIMARY KEY (`id_gender`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kehadiran`
--
ALTER TABLE `kehadiran`
  ADD PRIMARY KEY (`id_khd`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`id_absen`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`id_shift`);

--
-- Indexes for table `stts`
--
ALTER TABLE `stts`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agama`
--
ALTER TABLE `agama`
  MODIFY `id_agama` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gedung`
--
ALTER TABLE `gedung`
  MODIFY `gedung_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `goldar`
--
ALTER TABLE `goldar`
  MODIFY `id_goldar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `jenis_kelamin`
--
ALTER TABLE `jenis_kelamin`
  MODIFY `id_gender` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `kehadiran`
--
ALTER TABLE `kehadiran`
  MODIFY `id_khd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `presensi`
--
ALTER TABLE `presensi`
  MODIFY `id_absen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `id_shift` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `stts`
--
ALTER TABLE `stts`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
