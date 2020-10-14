-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.4.13-MariaDB-log - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para facturacion
CREATE DATABASE IF NOT EXISTS `facturacion` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `facturacion`;

-- Volcando estructura para tabla facturacion.facturas
CREATE TABLE IF NOT EXISTS `facturas` (
  `ID_Factura` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Fecha_Factura` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Factura`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla facturacion.facturas: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` (`ID_Factura`, `Fecha_Factura`, `created_at`, `updated_at`) VALUES
	(1, '2020-12-03', NULL, NULL),
	(2, '2020-12-26', NULL, NULL);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;

-- Volcando estructura para tabla facturacion.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `ID_Producto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre_Producto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Precio_Producto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla facturacion.productos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`ID_Producto`, `Nombre_Producto`, `Precio_Producto`, `created_at`, `updated_at`) VALUES
	(1, 'Billetera', '50', NULL, NULL),
	(2, 'Cinturon', '500', NULL, NULL),
	(3, 'Zapatos', '1500', NULL, NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para tabla facturacion.pro_fac
CREATE TABLE IF NOT EXISTS `pro_fac` (
  `ID_Pro_Fac` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FK_ID_Factura` int(10) unsigned NOT NULL DEFAULT 0,
  `FK_ID_Producto` int(10) unsigned NOT NULL DEFAULT 0,
  `Cantidad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Pro_Fac`),
  KEY `ID_Factura` (`FK_ID_Factura`),
  KEY `ID_Producto` (`FK_ID_Producto`),
  CONSTRAINT `ID_Factura` FOREIGN KEY (`FK_ID_Factura`) REFERENCES `facturas` (`ID_Factura`),
  CONSTRAINT `ID_Producto` FOREIGN KEY (`FK_ID_Producto`) REFERENCES `productos` (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla facturacion.pro_fac: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `pro_fac` DISABLE KEYS */;
INSERT INTO `pro_fac` (`ID_Pro_Fac`, `FK_ID_Factura`, `FK_ID_Producto`, `Cantidad`, `created_at`, `updated_at`) VALUES
	(1, 2, 1, '3', NULL, NULL),
	(2, 2, 2, '1', NULL, NULL),
	(4, 2, 1, '1', NULL, NULL),
	(5, 1, 2, '1', NULL, NULL),
	(6, 1, 3, '1', NULL, NULL),
	(7, 1, 3, '1', NULL, NULL),
	(8, 1, 1, '2', NULL, NULL);
/*!40000 ALTER TABLE `pro_fac` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
