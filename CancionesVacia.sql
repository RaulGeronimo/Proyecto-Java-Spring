-- MariaDB dump 10.17  Distrib 10.4.12-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Canciones
-- ------------------------------------------------------
-- Server version	10.4.12-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `idAlbum` int(11) NOT NULL AUTO_INCREMENT,
  `idGrupo` int(11) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `NoCanciones` int(11) DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Lanzamiento` date DEFAULT NULL,
  `NoVentas` double DEFAULT NULL,
  `Genero` varchar(45) DEFAULT NULL,
  `imagen` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`idAlbum`),
  KEY `idGrupo` (`idGrupo`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger agregar_Auditoria_Album
AFTER INSERT ON Album
for each ROW
INSERT INTO Auditoria_Album(
    idGrupo, Nombre, Canciones, Duracion, Lanzamiento, Ventas, Genero, Imagen,
    usuario, modificado, proceso, idAlbum)
VALUES(
    NEW.idGrupo, NEW.Nombre, NEW.NoCanciones, NEW.Duracion, NEW.Lanzamiento, NEW.NoVentas, NEW.Genero, NEW.Imagen,
    USER(), NOW(), 'Dato Insertado', NEW.idAlbum) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger actualiza_Auditoria_Album
AFTER UPDATE ON Album
for each ROW
INSERT INTO Auditoria_Album(
    idGrupo, Nombre, Canciones, Duracion, Lanzamiento, Ventas, Genero, Imagen,
    usuario, modificado, proceso, idAlbum)
VALUES(
    NEW.idGrupo, NEW.Nombre, NEW.NoCanciones, NEW.Duracion, NEW.Lanzamiento, NEW.NoVentas, NEW.Genero, NEW.Imagen,
    USER(), NOW(), 'Dato Actualizado', NEW.idAlbum) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger eliminar_Auditoria_Album
AFTER DELETE ON Album
for each ROW
INSERT INTO Auditoria_Album(
    idGrupo, Nombre, Canciones, Duracion, Lanzamiento, Ventas, Genero, Imagen,
    usuario, modificado, proceso, idAlbum)
VALUES(
    OLD.idGrupo, OLD.Nombre, OLD.NoCanciones, OLD.Duracion, OLD.Lanzamiento, OLD.NoVentas, OLD.Genero, OLD.Imagen,
    USER(), NOW(), 'Dato Eliminado', OLD.idAlbum) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artista` (
  `idArtista` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `ApellidoP` varchar(45) DEFAULT NULL,
  `ApellidoM` varchar(45) DEFAULT NULL,
  `NombreArtistico` varchar(60) DEFAULT NULL,
  `Edad` int(11) DEFAULT NULL,
  `Genero` char(1) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Pais` varchar(45) DEFAULT NULL,
  `Instrumento` varchar(45) DEFAULT NULL,
  `Estatura` double DEFAULT NULL,
  `Imagen` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`idArtista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger agregar_Auditoria_Artista
after insert on Artista
for each row
INSERT INTO Auditoria_Artista(
    Nombre, Paterno, Materno, Artistico, Edad,
    Genero, Nacimiento, Pais, Instrumento, Estatura, Imagen,
    usuario, modificado, proceso, idArtista)
values(
    NEW.Nombre, NEW.ApellidoP, NEW.ApellidoM, NEW.NombreArtistico, NEW.Edad,
    NEW.Genero, NEW.FechaNacimiento, NEW.Pais, NEW.Instrumento, NEW.Estatura, NEW.Imagen,
    USER(), NOW(), 'Dato Insertado', NEW.idArtista) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger actualiza_Auditoria_Artista
after UPDATE on Artista
for each row
INSERT INTO Auditoria_Artista(
    Nombre, Paterno, Materno, Artistico, Edad,
    Genero, Nacimiento, Pais, Instrumento, Estatura, Imagen,
    usuario, modificado, proceso, idArtista)
values(
    NEW.Nombre, NEW.ApellidoP, NEW.ApellidoM, NEW.NombreArtistico, NEW.Edad, NEW.Genero,
    NEW.FechaNacimiento, NEW.Pais, NEW.Instrumento, NEW.Estatura, NEW.Imagen,
    USER(), NOW(), 'Dato Actualizado', NEW.idArtista) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger eliminar_Auditoria_Artista
after DELETE on Artista
for each row
INSERT INTO Auditoria_Artista(
    Nombre, Paterno, Materno, Artistico, Edad,
    Genero, Nacimiento, Pais, Instrumento, Estatura, Imagen,
    usuario, modificado, proceso, idArtista)
values(
    OLD.Nombre, OLD.ApellidoP, OLD.ApellidoM, OLD.NombreArtistico, OLD.Edad, OLD.Genero,
    OLD.FechaNacimiento, OLD.Pais, OLD.Instrumento, OLD.Estatura, OLD.Imagen,
    USER(), NOW(), 'Dato Eliminado', OLD.idArtista) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `auditoria_album`
--

DROP TABLE IF EXISTS `auditoria_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idGrupo` int(11) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Canciones` int(11) DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Lanzamiento` date DEFAULT NULL,
  `Ventas` double DEFAULT NULL,
  `Genero` varchar(45) DEFAULT NULL,
  `Imagen` varchar(70) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `proceso` varchar(45) DEFAULT NULL,
  `idAlbum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_album`
--

LOCK TABLES `auditoria_album` WRITE;
/*!40000 ALTER TABLE `auditoria_album` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_artista`
--

DROP TABLE IF EXISTS `auditoria_artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria_artista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Paterno` varchar(45) DEFAULT NULL,
  `Materno` varchar(45) DEFAULT NULL,
  `Artistico` varchar(60) DEFAULT NULL,
  `Edad` int(11) DEFAULT NULL,
  `Genero` char(1) DEFAULT NULL,
  `Nacimiento` date DEFAULT NULL,
  `Pais` varchar(45) DEFAULT NULL,
  `Instrumento` varchar(45) DEFAULT NULL,
  `Estatura` double DEFAULT NULL,
  `imagen` varchar(70) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `proceso` varchar(45) DEFAULT NULL,
  `idArtista` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_artista`
--

LOCK TABLES `auditoria_artista` WRITE;
/*!40000 ALTER TABLE `auditoria_artista` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_cancion`
--

DROP TABLE IF EXISTS `auditoria_cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria_cancion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idGrupo` int(11) DEFAULT NULL,
  `idInterprete` int(11) DEFAULT NULL,
  `idAlbum` int(11) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Lanzamiento` date DEFAULT NULL,
  `Idioma` varchar(45) DEFAULT NULL,
  `Genero` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `proceso` varchar(45) DEFAULT NULL,
  `idCancion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_cancion`
--

LOCK TABLES `auditoria_cancion` WRITE;
/*!40000 ALTER TABLE `auditoria_cancion` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_cancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_disquera`
--

DROP TABLE IF EXISTS `auditoria_disquera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria_disquera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Direccion` varchar(60) DEFAULT NULL,
  `Telefono` bigint(20) DEFAULT NULL,
  `Fundacion` date DEFAULT NULL,
  `imagen` varchar(70) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `proceso` varchar(45) DEFAULT NULL,
  `idDisquera` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_disquera`
--

LOCK TABLES `auditoria_disquera` WRITE;
/*!40000 ALTER TABLE `auditoria_disquera` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_disquera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_grupo`
--

DROP TABLE IF EXISTS `auditoria_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria_grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idDisquera` int(11) DEFAULT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  `Origen` varchar(70) DEFAULT NULL,
  `Inicio` date DEFAULT NULL,
  `Integrantes` int(11) DEFAULT NULL,
  `Genero` varchar(45) DEFAULT NULL,
  `Idioma` varchar(45) DEFAULT NULL,
  `imagen` varchar(70) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `proceso` varchar(45) DEFAULT NULL,
  `idGrupo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_grupo`
--

LOCK TABLES `auditoria_grupo` WRITE;
/*!40000 ALTER TABLE `auditoria_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_usuario`
--

DROP TABLE IF EXISTS `auditoria_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreAnt` varchar(45) DEFAULT NULL,
  `paternoAnt` varchar(45) DEFAULT NULL,
  `maternoAnt` varchar(45) DEFAULT NULL,
  `fechaNacimientoAnt` date DEFAULT NULL,
  `celularAnt` bigint(20) DEFAULT NULL,
  `sexoAnt` char(1) DEFAULT NULL,
  `correoAnt` varchar(45) DEFAULT NULL,
  `usernameAnt` varchar(45) DEFAULT NULL,
  `passwordAnt` varchar(45) DEFAULT NULL,
  `nombreNew` varchar(45) DEFAULT NULL,
  `paternoNew` varchar(45) DEFAULT NULL,
  `maternoNew` varchar(45) DEFAULT NULL,
  `fechaNacimientoNew` date DEFAULT NULL,
  `celularNew` bigint(20) DEFAULT NULL,
  `sexoNew` char(1) DEFAULT NULL,
  `correoNew` varchar(45) DEFAULT NULL,
  `usernameNew` varchar(45) DEFAULT NULL,
  `passwordNew` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `modificado` datetime DEFAULT NULL,
  `proceso` varchar(45) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_usuario`
--

LOCK TABLES `auditoria_usuario` WRITE;
/*!40000 ALTER TABLE `auditoria_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canciones`
--

DROP TABLE IF EXISTS `canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canciones` (
  `IdCancion` int(11) NOT NULL AUTO_INCREMENT,
  `IdGrupo` int(11) DEFAULT NULL,
  `IdInterprete` int(11) DEFAULT NULL,
  `IdAlbum` int(11) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Lanzamiento` date DEFAULT NULL,
  `Idioma` varchar(45) DEFAULT NULL,
  `Genero` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdCancion`),
  KEY `IdGrupo` (`IdGrupo`),
  KEY `IdInterprete` (`IdInterprete`),
  KEY `IdAlbum` (`IdAlbum`),
  CONSTRAINT `canciones_ibfk_1` FOREIGN KEY (`IdGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `canciones_ibfk_2` FOREIGN KEY (`IdInterprete`) REFERENCES `artista` (`idArtista`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `canciones_ibfk_3` FOREIGN KEY (`IdAlbum`) REFERENCES `album` (`idAlbum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canciones`
--

LOCK TABLES `canciones` WRITE;
/*!40000 ALTER TABLE `canciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `canciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger agregar_Auditoria_Cancion
AFTER INSERT ON Canciones
for each ROW
INSERT INTO Auditoria_Cancion(
    idGrupo, idInterprete, idAlbum, Nombre,
    Duracion, Lanzamiento, Idioma, Genero,
    usuario, modificado, proceso, idCancion)
VALUES(
    NEW.idGrupo, NEW.idInterprete, NEW.idAlbum, NEW.Nombre,
    NEW.Duracion, NEW.Lanzamiento, NEW.Idioma, NEW.Genero,
    USER(), NOW(), 'Dato Insertado', NEW.idCancion) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger actualiza_Auditoria_Cancion
AFTER UPDATE ON Canciones
for each ROW
INSERT INTO Auditoria_Cancion(
    idGrupo, idInterprete, idAlbum, Nombre,
    Duracion, Lanzamiento, Idioma, Genero,
    usuario, modificado, proceso, idCancion)
VALUES(
    NEW.idGrupo, NEW.idInterprete, NEW.idAlbum, NEW.Nombre,
    NEW.Duracion, NEW.Lanzamiento, NEW.Idioma, NEW.Genero,
    USER(), NOW(), 'Dato Actualizado', NEW.idCancion) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger eliminar_Auditoria_Cancion
AFTER DELETE ON Canciones
for each ROW
INSERT INTO Auditoria_Cancion(
    idGrupo, idInterprete, idAlbum, Nombre,
    Duracion, Lanzamiento, Idioma, Genero,
    usuario, modificado, proceso, idCancion)
VALUES(
    OLD.idGrupo, OLD.idInterprete, OLD.idAlbum, OLD.Nombre,
    OLD.Duracion, OLD.Lanzamiento, OLD.Idioma, OLD.Genero,
    USER(), NOW(), 'Dato Eliminado', OLD.idCancion) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `disquera`
--

DROP TABLE IF EXISTS `disquera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disquera` (
  `idDisquera` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Direccion` varchar(60) DEFAULT NULL,
  `Telefono` bigint(20) DEFAULT NULL,
  `Fundacion` date DEFAULT NULL,
  `imagen` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`idDisquera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disquera`
--

LOCK TABLES `disquera` WRITE;
/*!40000 ALTER TABLE `disquera` DISABLE KEYS */;
/*!40000 ALTER TABLE `disquera` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger agregar_Auditoria_Disquera
after INSERT on Disquera
for each row
INSERT INTO Auditoria_Disquera(
    Nombre, Correo, Direccion, Telefono, Fundacion, Imagen,
    usuario, modificado, proceso, idDisquera)
values(
    NEW.Nombre, NEW.Correo, NEW.Direccion, NEW.Telefono, NEW.Fundacion, NEW.Imagen,
    USER(), NOW(), 'Dato Insertado', NEW.idDisquera) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger actualiza_Auditoria_Disquera
after UPDATE on Disquera
for each row
INSERT INTO Auditoria_Disquera(
    Nombre, Correo, Direccion, Telefono, Fundacion, Imagen,
    usuario, modificado, proceso, idDisquera)
values(
    NEW.Nombre, NEW.Correo, NEW.Direccion, NEW.Telefono, NEW.Fundacion, NEW.Imagen,
    USER(), NOW(), 'Dato Actualizado', NEW.idDisquera) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger eliminar_Auditoria_Disquera
after DELETE on Disquera
for each row
INSERT INTO Auditoria_Disquera(
    Nombre, Correo, Direccion, Telefono, Fundacion, Imagen,
    usuario, modificado, proceso, idDisquera)
values(
    OLD.Nombre, OLD.Correo, OLD.Direccion, OLD.Telefono, OLD.Fundacion, OLD.Imagen,
    USER(), NOW(), 'Dato Eliminado', OLD.idDisquera) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `idGrupo` int(11) NOT NULL AUTO_INCREMENT,
  `idDisquera` int(11) DEFAULT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  `Origen` varchar(70) DEFAULT NULL,
  `Inicio` date DEFAULT NULL,
  `NoIntegrantes` int(11) DEFAULT NULL,
  `Genero` varchar(45) DEFAULT NULL,
  `Idioma` varchar(45) DEFAULT NULL,
  `imagen` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`idGrupo`),
  KEY `idDisquera` (`idDisquera`),
  CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`idDisquera`) REFERENCES `disquera` (`idDisquera`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger agregar_Auditoria_Grupo
AFTER INSERT ON Grupo
for each ROW
INSERT INTO Auditoria_Grupo(
    idDisquera, Nombre, Origen, Inicio, Integrantes, Genero, idioma, Imagen,
    usuario, modificado, proceso, idGrupo)
VALUES(
    NEW.idDisquera, NEW.Nombre, NEW.Origen, NEW.Inicio, NEW.NoIntegrantes, NEW.Genero, NEW.Idioma, NEW.Imagen,
    USER(), NOW(), 'Dato Insertado', NEW.idGrupo) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger actualiza_Auditoria_Grupo
AFTER UPDATE ON Grupo
for each ROW
INSERT INTO Auditoria_Grupo(
    idDisquera, Nombre, Origen, Inicio, Integrantes, Genero, idioma, Imagen,
    usuario, modificado, proceso, idGrupo)
VALUES(
    NEW.idDisquera, NEW.Nombre, NEW.Origen, NEW.Inicio, NEW.NoIntegrantes, NEW.Genero, NEW.Idioma, NEW.Imagen,
    USER(), NOW(), 'Dato Actualizado', NEW.idGrupo) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger eliminar_Auditoria_Grupo
AFTER DELETE ON Grupo
for each ROW
INSERT INTO Auditoria_Grupo(
    idDisquera, Nombre, Origen, Inicio, Integrantes, Genero, idioma, Imagen,
    usuario, modificado, proceso, idGrupo)
VALUES(
    OLD.idDisquera, OLD.Nombre, OLD.Origen, OLD.Inicio, OLD.NoIntegrantes, OLD.Genero, OLD.Idioma, OLD.Imagen,
    USER(), NOW(), 'Dato Eliminado', OLD.idGrupo) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Paterno` varchar(45) DEFAULT NULL,
  `Materno` varchar(45) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Celular` bigint(20) DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger Agregar_Auditoria_Usuario
AFTER INSERT ON Usuario
for each ROW
INSERT INTO Auditoria_Usuario(
    nombreNew, paternoNew, maternoNew, fechaNacimientoNew,
    celularNew, sexoNew, correoNew, usernameNew, passwordNew,
    usuario, modificado, proceso, idUsuario)
VALUES(
    NEW.nombre, NEW.paterno, NEW.materno, NEW.fechaNacimiento,
    NEW.celular, NEW.sexo, NEW.correo, NEW.username, NEW.password,
    USER(), NOW(), 'Dato Insertado', NEW.idUsuario) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger Actualiza_Auditoria_Usuario
AFTER UPDATE ON Usuario
for each ROW
INSERT INTO Auditoria_Usuario(
    nombreAnt, paternoAnt, maternoAnt, fechaNacimientoAnt,
    celularAnt, sexoAnt, correoAnt, usernameAnt, passwordAnt,

    nombreNew, paternoNew, maternoNew, fechaNacimientoNew,
    celularNew, sexoNew, correoNew, usernameNew, passwordNew,
    usuario, modificado, proceso, idUsuario)
VALUES(
    OLD.nombre, OLD.paterno, OLD.materno, OLD.fechaNacimiento,
    OLD.celular, OLD.sexo, OLD.correo, OLD.username, OLD.password,

    NEW.nombre, NEW.paterno, NEW.materno, NEW.fechaNacimiento,
    NEW.celular, NEW.sexo, NEW.correo, NEW.username, NEW.password,
    USER(), NOW(), 'Dato Actualizado', NEW.idUsuario) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger Elimina_Auditoria_Usuario
AFTER DELETE ON Usuario
for each ROW
INSERT INTO Auditoria_Usuario(
    nombreAnt, paternoAnt, maternoAnt, fechaNacimientoAnt,
    celularAnt, sexoAnt, correoAnt, usernameAnt, passwordAnt,
    usuario, modificado, proceso, idUsuario)
VALUES(
    OLD.nombre, OLD.paterno, OLD.materno, OLD.fechaNacimiento,
    OLD.celular, OLD.sexo, OLD.correo, OLD.username, OLD.password,
    USER(), NOW(), 'Dato Eliminado', OLD.idUsuario) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-24 20:05:57
