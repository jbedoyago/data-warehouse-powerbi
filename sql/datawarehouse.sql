CREATE DATABASE  IF NOT EXISTS `dw_electrohogar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dw_electrohogar`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: dw_electrohogar
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Temporary view structure for view `cubo_ventas`
--

DROP TABLE IF EXISTS `cubo_ventas`;
/*!50001 DROP VIEW IF EXISTS `cubo_ventas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cubo_ventas` AS SELECT 
 1 AS `mes`,
 1 AS `Subcategoria`,
 1 AS `Region`,
 1 AS `Departamento`,
 1 AS `Ciudad`,
 1 AS `Total_Cantidad`,
 1 AS `Total_Ventas`,
 1 AS `Total_Costo`,
 1 AS `Total_Margen`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dim_clientes`
--

DROP TABLE IF EXISTS `dim_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_clientes` (
  `IdCliente` int NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Segmento` varchar(50) DEFAULT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  `Sexo` varchar(10) DEFAULT NULL,
  `Edad` int DEFAULT NULL,
  PRIMARY KEY (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_productos`
--

DROP TABLE IF EXISTS `dim_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_productos` (
  `IdProducto` int NOT NULL,
  `ProductoNombre` varchar(100) DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  `Categoria` varchar(50) DEFAULT NULL,
  `Subcategoria` varchar(50) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_tiempo`
--

DROP TABLE IF EXISTS `dim_tiempo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_tiempo` (
  `IdTiempo` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Dia` int DEFAULT NULL,
  `Mes` int DEFAULT NULL,
  `Trimestre` int DEFAULT NULL,
  `Anio` int DEFAULT NULL,
  `DiaSemana` varchar(20) DEFAULT NULL,
  `EsFinSemana` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`IdTiempo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_tiendas`
--

DROP TABLE IF EXISTS `dim_tiendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_tiendas` (
  `IdTienda` int NOT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  `Departamento` varchar(50) DEFAULT NULL,
  `Region` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdTienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `etl_clientes`
--

DROP TABLE IF EXISTS `etl_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etl_clientes` (
  `IdCliente` int DEFAULT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Segmento` varchar(50) DEFAULT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  `Sexo` varchar(10) DEFAULT NULL,
  `Edad` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hecho_ventas`
--

DROP TABLE IF EXISTS `hecho_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hecho_ventas` (
  `IdVenta` int NOT NULL,
  `IdTiempo` int DEFAULT NULL,
  `IdCliente` int DEFAULT NULL,
  `IdProducto` int DEFAULT NULL,
  `IdTienda` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `PrecioUnitario` int DEFAULT NULL,
  `TotalVenta` int DEFAULT NULL,
  `CostoUnitario` int DEFAULT NULL,
  `MargenUnitario` int DEFAULT NULL,
  `MargenTotal` int DEFAULT NULL,
  PRIMARY KEY (`IdVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staging_tiempo`
--

DROP TABLE IF EXISTS `staging_tiempo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staging_tiempo` (
  `IdTiempo` int DEFAULT NULL,
  `Fecha` varchar(20) DEFAULT NULL,
  `Dia` int DEFAULT NULL,
  `Mes` int DEFAULT NULL,
  `Trimestre` int DEFAULT NULL,
  `Anio` int DEFAULT NULL,
  `DiaSemana` varchar(20) DEFAULT NULL,
  `EsFinSemana` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `cubo_ventas`
--

/*!50001 DROP VIEW IF EXISTS `cubo_ventas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cubo_ventas` AS select `t`.`Mes` AS `mes`,`p`.`Subcategoria` AS `Subcategoria`,`ti`.`Region` AS `Region`,`ti`.`Departamento` AS `Departamento`,`ti`.`Ciudad` AS `Ciudad`,sum(`v`.`Cantidad`) AS `Total_Cantidad`,sum(`v`.`TotalVenta`) AS `Total_Ventas`,sum(`v`.`CostoUnitario`) AS `Total_Costo`,sum(`v`.`MargenTotal`) AS `Total_Margen` from (((`hecho_ventas` `v` join `dim_tiempo` `t` on((`v`.`IdTiempo` = `t`.`IdTiempo`))) join `dim_productos` `p` on((`v`.`IdProducto` = `p`.`IdProducto`))) join `dim_tiendas` `ti` on((`v`.`IdTienda` = `ti`.`IdTienda`))) group by `t`.`Mes`,`p`.`Subcategoria`,`ti`.`Region`,`ti`.`Departamento`,`ti`.`Ciudad` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-10 15:41:50
