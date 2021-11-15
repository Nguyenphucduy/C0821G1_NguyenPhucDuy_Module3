-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: quan_ly_don_hang
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
-- Table structure for table `chi_tiet_don_dat_hang`
--

DROP TABLE IF EXISTS `chi_tiet_don_dat_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_don_dat_hang` (
  `ma_vat_tu` int NOT NULL,
  `so_don_hang` int NOT NULL,
  PRIMARY KEY (`ma_vat_tu`,`so_don_hang`),
  KEY `so_don_hang` (`so_don_hang`),
  CONSTRAINT `chi_tiet_don_dat_hang_ibfk_1` FOREIGN KEY (`ma_vat_tu`) REFERENCES `vat_tu` (`ma_vt`),
  CONSTRAINT `chi_tiet_don_dat_hang_ibfk_2` FOREIGN KEY (`so_don_hang`) REFERENCES `so_don_hang` (`so_dh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_don_dat_hang`
--

LOCK TABLES `chi_tiet_don_dat_hang` WRITE;
/*!40000 ALTER TABLE `chi_tiet_don_dat_hang` DISABLE KEYS */;
/*!40000 ALTER TABLE `chi_tiet_don_dat_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chi_tiet_phieu_nhap`
--

DROP TABLE IF EXISTS `chi_tiet_phieu_nhap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_phieu_nhap` (
  `don_gia_nhap` double DEFAULT NULL,
  `so_luong_nhap` int DEFAULT NULL,
  `so_pn_phieu_nhap` int NOT NULL,
  `ma_vat_tu` int NOT NULL,
  PRIMARY KEY (`so_pn_phieu_nhap`,`ma_vat_tu`),
  KEY `ma_vat_tu` (`ma_vat_tu`),
  CONSTRAINT `chi_tiet_phieu_nhap_ibfk_1` FOREIGN KEY (`so_pn_phieu_nhap`) REFERENCES `phieu_nhap` (`so_pn`),
  CONSTRAINT `chi_tiet_phieu_nhap_ibfk_2` FOREIGN KEY (`ma_vat_tu`) REFERENCES `vat_tu` (`ma_vt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_phieu_nhap`
--

LOCK TABLES `chi_tiet_phieu_nhap` WRITE;
/*!40000 ALTER TABLE `chi_tiet_phieu_nhap` DISABLE KEYS */;
/*!40000 ALTER TABLE `chi_tiet_phieu_nhap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chi_tiet_phieu_xuat`
--

DROP TABLE IF EXISTS `chi_tiet_phieu_xuat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_phieu_xuat` (
  `don_gia_xuat` double DEFAULT NULL,
  `so_luong_xuat` int DEFAULT NULL,
  `so_px_phieu_xuat` int NOT NULL,
  `ma_vat_tu` int NOT NULL,
  PRIMARY KEY (`so_px_phieu_xuat`,`ma_vat_tu`),
  KEY `ma_vat_tu` (`ma_vat_tu`),
  CONSTRAINT `chi_tiet_phieu_xuat_ibfk_1` FOREIGN KEY (`so_px_phieu_xuat`) REFERENCES `phieu_xuat` (`so_px`),
  CONSTRAINT `chi_tiet_phieu_xuat_ibfk_2` FOREIGN KEY (`ma_vat_tu`) REFERENCES `vat_tu` (`ma_vt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_phieu_xuat`
--

LOCK TABLES `chi_tiet_phieu_xuat` WRITE;
/*!40000 ALTER TABLE `chi_tiet_phieu_xuat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chi_tiet_phieu_xuat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nha_cc`
--

DROP TABLE IF EXISTS `nha_cc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nha_cc` (
  `ma_ncc` int NOT NULL,
  `ten_ncc` varchar(50) DEFAULT NULL,
  `dia_chi` varchar(60) DEFAULT NULL,
  `so_dien_thoai` int DEFAULT NULL,
  `so_don_hang` int DEFAULT NULL,
  PRIMARY KEY (`ma_ncc`),
  KEY `so_don_hang` (`so_don_hang`),
  CONSTRAINT `nha_cc_ibfk_1` FOREIGN KEY (`so_don_hang`) REFERENCES `so_don_hang` (`so_dh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nha_cc`
--

LOCK TABLES `nha_cc` WRITE;
/*!40000 ALTER TABLE `nha_cc` DISABLE KEYS */;
/*!40000 ALTER TABLE `nha_cc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieu_nhap`
--

DROP TABLE IF EXISTS `phieu_nhap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieu_nhap` (
  `so_pn` int NOT NULL,
  `ngay_nhap` date DEFAULT NULL,
  PRIMARY KEY (`so_pn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieu_nhap`
--

LOCK TABLES `phieu_nhap` WRITE;
/*!40000 ALTER TABLE `phieu_nhap` DISABLE KEYS */;
/*!40000 ALTER TABLE `phieu_nhap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieu_xuat`
--

DROP TABLE IF EXISTS `phieu_xuat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieu_xuat` (
  `so_px` int NOT NULL,
  `ngay_xuat` date DEFAULT NULL,
  PRIMARY KEY (`so_px`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieu_xuat`
--

LOCK TABLES `phieu_xuat` WRITE;
/*!40000 ALTER TABLE `phieu_xuat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phieu_xuat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `so_don_hang`
--

DROP TABLE IF EXISTS `so_don_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_don_hang` (
  `so_dh` int NOT NULL,
  `ngay_dh` date DEFAULT NULL,
  PRIMARY KEY (`so_dh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `so_don_hang`
--

LOCK TABLES `so_don_hang` WRITE;
/*!40000 ALTER TABLE `so_don_hang` DISABLE KEYS */;
/*!40000 ALTER TABLE `so_don_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vat_tu`
--

DROP TABLE IF EXISTS `vat_tu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vat_tu` (
  `ma_vt` int NOT NULL,
  `ten_vt` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ma_vt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vat_tu`
--

LOCK TABLES `vat_tu` WRITE;
/*!40000 ALTER TABLE `vat_tu` DISABLE KEYS */;
/*!40000 ALTER TABLE `vat_tu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-15 13:52:25
