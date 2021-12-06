-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: furama_resort
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bo_phan`
--

DROP TABLE IF EXISTS `bo_phan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bo_phan` (
  `id_bo_phan` int NOT NULL,
  `ten_bo_phan` varchar(50) NOT NULL,
  PRIMARY KEY (`id_bo_phan`),
  UNIQUE KEY `id_bo_phan` (`id_bo_phan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bo_phan`
--

LOCK TABLES `bo_phan` WRITE;
/*!40000 ALTER TABLE `bo_phan` DISABLE KEYS */;
/*!40000 ALTER TABLE `bo_phan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dich_vu`
--

DROP TABLE IF EXISTS `dich_vu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dich_vu` (
  `id_dich_vu` int NOT NULL,
  `ten_dich_vu` varchar(50) NOT NULL,
  `so_tang` int NOT NULL,
  `so_nguoi_toi_da` int NOT NULL,
  `chi_phi_thue` double NOT NULL,
  `trang_thai` tinyint(1) DEFAULT NULL,
  `id_kieu_thue` int NOT NULL,
  `id_loai_dich_vu` int NOT NULL,
  PRIMARY KEY (`id_dich_vu`),
  UNIQUE KEY `id_dich_vu` (`id_dich_vu`),
  KEY `id_kieu_thue` (`id_kieu_thue`),
  KEY `id_loai_dich_vu` (`id_loai_dich_vu`),
  CONSTRAINT `dich_vu_ibfk_1` FOREIGN KEY (`id_kieu_thue`) REFERENCES `kieu_thue` (`id_kieu_thue`),
  CONSTRAINT `dich_vu_ibfk_2` FOREIGN KEY (`id_loai_dich_vu`) REFERENCES `loai_dich_vu` (`id_loai_dich_vu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dich_vu`
--

LOCK TABLES `dich_vu` WRITE;
/*!40000 ALTER TABLE `dich_vu` DISABLE KEYS */;
/*!40000 ALTER TABLE `dich_vu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dich_vu_di_kem`
--

DROP TABLE IF EXISTS `dich_vu_di_kem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dich_vu_di_kem` (
  `id_dich_vu_di_kem` int NOT NULL,
  `ten_dich_vu_di_kem` varchar(50) NOT NULL,
  `gia` double NOT NULL,
  `don_vi` varchar(10) NOT NULL,
  `trang_thai_kha_dung` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_dich_vu_di_kem`),
  UNIQUE KEY `id_dich_vu_di_kem` (`id_dich_vu_di_kem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dich_vu_di_kem`
--

LOCK TABLES `dich_vu_di_kem` WRITE;
/*!40000 ALTER TABLE `dich_vu_di_kem` DISABLE KEYS */;
/*!40000 ALTER TABLE `dich_vu_di_kem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hop_dong`
--

DROP TABLE IF EXISTS `hop_dong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hop_dong` (
  `id_hop_dong` int NOT NULL,
  `ngay_lam_hop_dong` date NOT NULL,
  `ngay_ket_thuc` date NOT NULL,
  `tien_dat_coc` double NOT NULL,
  `tong_tien` double NOT NULL,
  `id_nhan_vien` int NOT NULL,
  `id_khach_hang` int NOT NULL,
  `id_dich_vu` int NOT NULL,
  PRIMARY KEY (`id_hop_dong`),
  UNIQUE KEY `id_hop_dong` (`id_hop_dong`),
  KEY `id_nhan_vien` (`id_nhan_vien`),
  KEY `id_khach_hang` (`id_khach_hang`),
  KEY `id_dich_vu` (`id_dich_vu`),
  CONSTRAINT `hop_dong_ibfk_1` FOREIGN KEY (`id_nhan_vien`) REFERENCES `nhan_vien` (`id_nhan_vien`),
  CONSTRAINT `hop_dong_ibfk_2` FOREIGN KEY (`id_khach_hang`) REFERENCES `khach_hang` (`id_khach_hang`),
  CONSTRAINT `hop_dong_ibfk_3` FOREIGN KEY (`id_dich_vu`) REFERENCES `dich_vu` (`id_dich_vu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hop_dong`
--

LOCK TABLES `hop_dong` WRITE;
/*!40000 ALTER TABLE `hop_dong` DISABLE KEYS */;
/*!40000 ALTER TABLE `hop_dong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hop_dong_chi_tiet`
--

DROP TABLE IF EXISTS `hop_dong_chi_tiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hop_dong_chi_tiet` (
  `id_hop_dong_chi_tiet` int NOT NULL,
  `id_hop_dong` int NOT NULL,
  `id_dich_vu_di_kem` int NOT NULL,
  `so_luong` int NOT NULL,
  PRIMARY KEY (`id_hop_dong_chi_tiet`),
  UNIQUE KEY `id_hop_dong_chi_tiet` (`id_hop_dong_chi_tiet`),
  KEY `id_hop_dong` (`id_hop_dong`),
  KEY `id_dich_vu_di_kem` (`id_dich_vu_di_kem`),
  CONSTRAINT `hop_dong_chi_tiet_ibfk_1` FOREIGN KEY (`id_hop_dong`) REFERENCES `hop_dong` (`id_hop_dong`),
  CONSTRAINT `hop_dong_chi_tiet_ibfk_2` FOREIGN KEY (`id_dich_vu_di_kem`) REFERENCES `dich_vu_di_kem` (`id_dich_vu_di_kem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hop_dong_chi_tiet`
--

LOCK TABLES `hop_dong_chi_tiet` WRITE;
/*!40000 ALTER TABLE `hop_dong_chi_tiet` DISABLE KEYS */;
/*!40000 ALTER TABLE `hop_dong_chi_tiet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khach_hang`
--

DROP TABLE IF EXISTS `khach_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khach_hang` (
  `id_khach_hang` int NOT NULL,
  `ho_ten` varchar(50) NOT NULL,
  `ngay_sinh` date NOT NULL,
  `so_cmnd` int NOT NULL,
  `sdt` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `dia_chi` varchar(50) NOT NULL,
  `id_loai_khach` int NOT NULL,
  PRIMARY KEY (`id_khach_hang`),
  UNIQUE KEY `id_khach_hang` (`id_khach_hang`),
  KEY `id_loai_khach` (`id_loai_khach`),
  CONSTRAINT `khach_hang_ibfk_1` FOREIGN KEY (`id_loai_khach`) REFERENCES `loai_khach` (`id_loai_khach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khach_hang`
--

LOCK TABLES `khach_hang` WRITE;
/*!40000 ALTER TABLE `khach_hang` DISABLE KEYS */;
/*!40000 ALTER TABLE `khach_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kieu_thue`
--

DROP TABLE IF EXISTS `kieu_thue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kieu_thue` (
  `id_kieu_thue` int NOT NULL,
  `ten_kieu_thue` varchar(50) NOT NULL,
  `gia_thue` double NOT NULL,
  PRIMARY KEY (`id_kieu_thue`),
  UNIQUE KEY `id_kieu_thue` (`id_kieu_thue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kieu_thue`
--

LOCK TABLES `kieu_thue` WRITE;
/*!40000 ALTER TABLE `kieu_thue` DISABLE KEYS */;
/*!40000 ALTER TABLE `kieu_thue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_dich_vu`
--

DROP TABLE IF EXISTS `loai_dich_vu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loai_dich_vu` (
  `id_loai_dich_vu` int NOT NULL,
  `ten_loai_dich_vu` varchar(50) NOT NULL,
  PRIMARY KEY (`id_loai_dich_vu`),
  UNIQUE KEY `id_loai_dich_vu` (`id_loai_dich_vu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_dich_vu`
--

LOCK TABLES `loai_dich_vu` WRITE;
/*!40000 ALTER TABLE `loai_dich_vu` DISABLE KEYS */;
/*!40000 ALTER TABLE `loai_dich_vu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_khach`
--

DROP TABLE IF EXISTS `loai_khach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loai_khach` (
  `id_loai_khach` int NOT NULL,
  `ten_loai_khachn` varchar(50) NOT NULL,
  PRIMARY KEY (`id_loai_khach`),
  UNIQUE KEY `id_loai_khach` (`id_loai_khach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_khach`
--

LOCK TABLES `loai_khach` WRITE;
/*!40000 ALTER TABLE `loai_khach` DISABLE KEYS */;
/*!40000 ALTER TABLE `loai_khach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhan_vien`
--

DROP TABLE IF EXISTS `nhan_vien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhan_vien` (
  `id_nhan_vien` int NOT NULL,
  `ho_ten` varchar(50) NOT NULL,
  `ngay_sinh` date NOT NULL,
  `so_cmnd` int NOT NULL,
  `luong` double NOT NULL,
  `sdt` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `dia_chi` varchar(50) NOT NULL,
  `id_vi_tri` int NOT NULL,
  `id_trinh_do` int NOT NULL,
  `id_bo_phan` int NOT NULL,
  PRIMARY KEY (`id_nhan_vien`),
  UNIQUE KEY `id_nhan_vien` (`id_nhan_vien`),
  KEY `id_vi_tri` (`id_vi_tri`),
  KEY `id_trinh_do` (`id_trinh_do`),
  KEY `id_bo_phan` (`id_bo_phan`),
  CONSTRAINT `nhan_vien_ibfk_1` FOREIGN KEY (`id_vi_tri`) REFERENCES `vi_tri` (`id_vi_tri`),
  CONSTRAINT `nhan_vien_ibfk_2` FOREIGN KEY (`id_trinh_do`) REFERENCES `trinh_do` (`id_trinh_do`),
  CONSTRAINT `nhan_vien_ibfk_3` FOREIGN KEY (`id_bo_phan`) REFERENCES `bo_phan` (`id_bo_phan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhan_vien`
--

LOCK TABLES `nhan_vien` WRITE;
/*!40000 ALTER TABLE `nhan_vien` DISABLE KEYS */;
/*!40000 ALTER TABLE `nhan_vien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trinh_do`
--

DROP TABLE IF EXISTS `trinh_do`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trinh_do` (
  `id_trinh_do` int NOT NULL,
  `name_trinh_do` varchar(50) NOT NULL,
  PRIMARY KEY (`id_trinh_do`),
  UNIQUE KEY `id_trinh_do` (`id_trinh_do`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trinh_do`
--

LOCK TABLES `trinh_do` WRITE;
/*!40000 ALTER TABLE `trinh_do` DISABLE KEYS */;
/*!40000 ALTER TABLE `trinh_do` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vi_tri`
--

DROP TABLE IF EXISTS `vi_tri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vi_tri` (
  `id_vi_tri` int NOT NULL,
  `ten_vi_tri` varchar(50) NOT NULL,
  PRIMARY KEY (`id_vi_tri`),
  UNIQUE KEY `id_vi_tri` (`id_vi_tri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vi_tri`
--

LOCK TABLES `vi_tri` WRITE;
/*!40000 ALTER TABLE `vi_tri` DISABLE KEYS */;
/*!40000 ALTER TABLE `vi_tri` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-16 11:11:08
