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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,1,'American Idiot',13,'00:57:12','2004-09-21',150000,'Rock','American Idiot.jpg'),(2,2,'Nevermind',12,'00:42:38','1991-09-24',350000,'Grunge','Nevermind.jpg'),(3,3,'The Colour and the Shape',13,'00:46:47','1997-05-20',145897,'Rock','The Colour and the Shape.jpg'),(4,4,'Favourite Worst Nightmare',8,'00:37:18','2007-04-08',134561,'Rock','Favourite Worst Nightmare.jpg'),(5,5,'First Impressions of Earth',13,'00:52:19','2005-12-30',500000,'Rock','First Impressions of Earth.jpg'),(6,6,'Strange Days',8,'00:35:25','1967-09-25',150000,'Blues','Strange Days.jpg'),(7,7,'...Like Clockwork',8,'00:45:59','2013-06-03',123000,'Rock','Like Clockwork.jpg'),(8,8,'Absolution',15,'00:52:19','2003-09-29',125000,'Alternativo','Absolution.jpg'),(9,9,'One More Light',8,'00:35:19','2017-05-19',123000,'Rock Alternativo','One More Light.jpg'),(10,10,'Parachutes',8,'00:41:48','2000-07-10',564000,'Rock Alternativo','Parachutes.jpg'),(11,11,'Saturday Night Fever',13,'01:15:54','1977-11-15',456000,'Pop','Saturday Night Fever.jpg'),(12,12,'Unorthodox Jukebox',8,'00:34:53','2012-12-07',456000,'Pop','Unorthodox Jukebox.jpg'),(13,13,'OK Computer',12,'00:53:21','1997-05-21',135000,'Rock Alternativo','Ok Computer.jpg'),(14,14,'The Number of the Beast',8,'00:40:15','1982-03-22',170000,'Heavy Metal','The Number of the Beast.jpg'),(15,15,'Back in Black',10,'00:42:11','1980-07-25',250000,'Hard Rock','Back in Black.jpg'),(16,16,'Appetite for Destruction',12,'00:53:41','1987-07-21',187000,'Hard Rock','Appetite for Destruction.jpg'),(17,17,'Death Magnetic',10,'01:14:46','2008-07-28',149000,'Heavy Metal','Death Magnetic.jpg'),(18,18,'Out of Exile',11,'00:50:14','2005-05-23',150000,'Rock','Out of Exile.jpg'),(19,19,'Underclass Hero',11,'00:49:18','2007-07-18',125000,'Rock','Underclass Hero.jpg'),(20,20,'Bad Vibrations',13,'00:41:41','2016-09-02',150000,'Hadcore Punk','Bad Vibrations.jpg'),(21,21,'Dangerous',14,'01:16:56','1991-11-26',179000,'Pop','Dangerous.jpg'),(22,22,'I\'m With You',14,'00:59:21','2011-08-29',177000,'Alternativo','I\'m With You.jpg'),(23,23,'Mezmerize',11,'00:36:11','2005-05-11',197000,'Metal','Mezmerize.jpg'),(24,24,'Pleasant Dreams',12,'00:33:53','1981-07-20',120000,'Punk','Pleasant Dreams.jpg'),(25,25,'Beggars Banquet',10,'00:39:47','1968-12-06',189000,'Rhythm and Blues','Beggars Banquet.jpg'),(26,26,'Synchronicity',11,'00:44:33','1983-06-11',179000,'Alternativo','Synchronicity.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES (1,'Billie','Joe','Amstrong','Billie Joe',49,'H','1979-02-17','Estados Unidos','Guitarra Acustica',1.7,'Billie Joe.jpg'),(2,'Kurt','Donald','Cobain','Kurt Cobain',27,'H','1967-02-20','Estados Unidos','Guitarra Electrica',1.75,'Kurt Cobain.jpg'),(3,'David','Eric','Grohl','Dave Grohl',52,'H','1969-01-14','Estados Unidos','Guitarra Electrica',1.83,'Dave Grohl.jpg'),(4,'Alexander','David','Turner','Alex Turner',38,'H','1986-01-06','Inglaterra','Guitarra Electrica',1.8,'Alex Turner.jpg'),(5,'Julian','Fernando','Casablancas','Julian Casablancas',43,'H','1978-08-23','Estados Unidos','Ninguno',1.88,'Julian Casablancas.jpg'),(6,'James','Douglas','Morrison','Jim Morrison',27,'H','1943-12-08','Inglaterra','Ninguno',1.8,'Jim Morrison.jpg'),(7,'Joshua','Michael','Homme','Josh Homme',48,'H','1973-05-17','Estados Unidos','Guitarra Electrica',1.93,'Josh Homme.jpg'),(8,'Matthew','Bellamy','James','Matt Bellamy',43,'H','1978-06-09','Inglaterra','Guitarra Electrica',1.7,'Matt Bellamy.jpg'),(9,'Chester','Charles','Bennington','Chester Bennington',41,'H','1976-03-20','Estados Unidos','Ninguno',1.78,'Chester Bennington.jpg'),(10,'Christopher Anthony','John','Martin','Chris Martin',44,'H','1976-03-02','Inglaterra','Teclado',1.86,'Chris Martin.jpg'),(11,'Barry Alan','Crompton','Gibb','Barry Gibb',75,'H','1945-09-01','Inglaterra','Guitarra Acustica',1.8,'Barry Gibb.jpg'),(12,'Peter','Gene','Hernandez','Bruno Mars',36,'H','1985-10-08','Estados Unidos','Ninguno',1.65,'Bruno Mars.jpg'),(13,'Thomas','Edward','Yorke','Thom Yorke',53,'H','1968-10-07','Inglaterra','Guitarra Acustica',1.66,'Thom Yorke.jpg'),(14,'Paul','Bruce','Dickinson','Bruce Dickinson',63,'H','1968-08-07','Inglaterra','Ninguno',1.68,'Bruce Dickinson.jpg'),(15,'Brian','Francis','Johnson','Brian Johnson',74,'H','1947-10-05','Inglaterra','Ninguno',1.65,'Brian Johnson.jpg'),(16,'William','Bruce','Rose','Axl Rose',60,'H','1962-02-06','Estados Unidos','Ninguno',1.75,'Axl Rose.jpg'),(17,'James','Alan','Hetfield','James Hetfield',58,'H','1963-08-03','Estados Unidos','Guitarra Electrica',1.85,'James Hetfield.jpg'),(18,'Christopher','Cornell','John','Chris Cornell',52,'H','1967-08-20','Estados Unidos','Guitarra Acustica',1.85,'Chris Cornell.jpg'),(19,'Deryck','Jayson','Whibley','Deryck Whibley',42,'H','1987-03-21','Estados Unidos','Guitarra Acustica',1.7,'Deryck Whibley.jpg'),(20,'Jeremy','McKinnon','Wade','Jeremy McKinnon',36,'H','1985-12-17','Estados Unidos','Ninguno',1.7,'Jeremy McKinnon.jpg'),(21,'Michael','Joseph','Jackson','Michael Jackson',50,'H','1958-08-29','Estados Unidos','Ninguno',1.75,'Michael Jackson.jpg'),(22,'Anthony','Joseph','Kiedis','Anthony Kiedis',59,'H','1962-11-01','Estados Unidos','Ninguno',1.75,'Anthony Kiedis.jpg'),(23,'Serj','Tankian ',' ','Serj Tankian',54,'H','1967-08-21','Libano','Ninguno',1.79,'Serj Tankian.jpg'),(24,'Jeffrey','Ross','Hyman','Joey Ramone',49,'H','1951-05-19','Estados Unidos','Ninguno',1.98,'Joey Ramone.jpg'),(25,'Michael','Philip','Jagger','Mick Jagger',78,'H','1943-07-26','Inglaterra','Ninguno',1.78,'Mick Jagger.jpg'),(26,'Gordon Matthew','Thomas','Sumner','Sting',70,'H','1951-10-02','Inglaterra','Bajo Electrico',1.82,'Sting.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_album`
--

LOCK TABLES `auditoria_album` WRITE;
/*!40000 ALTER TABLE `auditoria_album` DISABLE KEYS */;
INSERT INTO `auditoria_album` VALUES (1,1,'American Idiot',13,'00:57:12','2004-09-21',150000,'Rock','American Idiot.jpg','root@localhost','2022-06-24 20:07:46','Dato Insertado',1),(2,2,'Nevermind',12,'00:42:38','1991-09-24',350000,'Grunge','Nevermind.jpg','root@localhost','2022-06-24 20:07:46','Dato Insertado',2),(3,3,'The Colour and the Shape',13,'00:46:47','1997-05-20',145897,'Rock','The Colour and the Shape.jpg','root@localhost','2022-06-24 20:07:46','Dato Insertado',3),(4,4,'Favourite Worst Nightmare',8,'00:37:18','2007-04-08',134561,'Rock','Favourite Worst Nightmare.jpg','root@localhost','2022-06-24 20:07:46','Dato Insertado',4),(5,5,'First Impressions of Earth',13,'00:52:19','2005-12-30',500000,'Rock','First Impressions of Earth.jpg','root@localhost','2022-06-24 20:07:46','Dato Insertado',5),(6,6,'Strange Days',8,'00:35:25','1967-09-25',150000,'Blues','Strange Days.jpg','root@localhost','2022-06-24 20:07:46','Dato Insertado',6),(7,7,'...Like Clockwork',8,'00:45:59','2013-06-03',123000,'Rock','Like Clockwork.jpg','root@localhost','2022-06-24 20:07:46','Dato Insertado',7),(8,8,'Absolution',15,'00:52:19','2003-09-29',125000,'Alternativo','Absolution.jpg','root@localhost','2022-06-24 20:12:11','Dato Insertado',8),(9,9,'One More Light',8,'00:35:19','2017-05-19',123000,'Rock Alternativo','One More Light.jpg','root@localhost','2022-06-24 20:12:11','Dato Insertado',9),(10,10,'Parachutes',8,'00:41:48','2000-07-10',564000,'Rock Alternativo','Parachutes.jpg','root@localhost','2022-06-24 20:12:11','Dato Insertado',10),(11,11,'Saturday Night Fever',13,'01:15:54','1977-11-15',456000,'Pop','Saturday Night Fever.jpg','root@localhost','2022-06-24 20:12:11','Dato Insertado',11),(12,12,'Unorthodox Jukebox',8,'00:34:53','2012-12-07',456000,'Pop','Unorthodox Jukebox.jpg','root@localhost','2022-06-24 20:12:11','Dato Insertado',12),(13,13,'OK Computer',12,'00:53:21','1997-05-21',135000,'Rock Alternativo','Ok Computer.jpg','root@localhost','2022-06-24 20:12:11','Dato Insertado',13),(14,14,'The Number of the Beast',8,'00:40:15','1982-03-22',170000,'Heavy Metal','The Number of the Beast.jpg','root@localhost','2022-06-24 20:12:11','Dato Insertado',14),(15,15,'Back in Black',10,'00:42:11','1980-07-25',250000,'Hard Rock','Back in Black.jpg','root@localhost','2022-06-24 20:12:11','Dato Insertado',15),(16,16,'Appetite for Destruction',12,'00:53:41','1987-07-21',187000,'Hard Rock','Appetite for Destruction.jpg','root@localhost','2022-06-24 20:12:11','Dato Insertado',16),(17,17,'Death Magnetic',10,'01:14:46','2008-07-28',149000,'Heavy Metal','Death Magnetic.jpg','root@localhost','2022-06-24 20:12:11','Dato Insertado',17),(18,18,'Out of Exile',11,'00:50:14','2005-05-23',150000,'Rock','Out of Exile.jpg','root@localhost','2022-06-24 20:16:16','Dato Insertado',18),(19,19,'Underclass Hero',11,'00:49:18','2007-07-18',125000,'Rock','Underclass Hero.jpg','root@localhost','2022-06-24 20:16:16','Dato Insertado',19),(20,20,'Bad Vibrations',13,'00:41:41','2016-09-02',150000,'Hadcore Punk','Bad Vibrations.jpg','root@localhost','2022-06-24 20:16:16','Dato Insertado',20),(21,21,'Dangerous',14,'01:16:56','1991-11-26',179000,'Pop','Dangerous.jpg','root@localhost','2022-06-24 20:16:16','Dato Insertado',21),(22,22,'I\'m With You',14,'00:59:21','2011-08-29',177000,'Alternativo','I\'m With You.jpg','root@localhost','2022-06-24 20:16:16','Dato Insertado',22),(23,23,'Mezmerize',11,'00:36:11','2005-05-11',197000,'Metal','Mezmerize.jpg','root@localhost','2022-06-24 20:16:16','Dato Insertado',23),(24,24,'Pleasant Dreams',12,'00:33:53','1981-07-20',120000,'Punk','Pleasant Dreams.jpg','root@localhost','2022-06-24 20:16:16','Dato Insertado',24),(25,25,'Beggars Banquet',10,'00:39:47','1968-12-06',189000,'Rhythm and Blues','Beggars Banquet.jpg','root@localhost','2022-06-24 20:16:16','Dato Insertado',25),(26,26,'Synchronicity',11,'00:44:33','1983-06-11',179000,'Alternativo','Synchronicity.jpg','root@localhost','2022-06-24 20:16:16','Dato Insertado',26);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_artista`
--

LOCK TABLES `auditoria_artista` WRITE;
/*!40000 ALTER TABLE `auditoria_artista` DISABLE KEYS */;
INSERT INTO `auditoria_artista` VALUES (1,'Billie','Joe','Amstrong','Billie Joe',49,'H','1979-02-17','Estados Unidos','Guitarra Acustica',1.7,'Billie Joe.jpg','root@localhost','2022-06-24 20:07:01','Dato Insertado',1),(2,'Kurt','Donald','Cobain','Kurt Cobain',27,'H','1967-02-20','Estados Unidos','Guitarra Electrica',1.75,'Kurt Cobain.jpg','root@localhost','2022-06-24 20:07:01','Dato Insertado',2),(3,'David','Eric','Grohl','Dave Grohl',52,'H','1969-01-14','Estados Unidos','Guitarra Electrica',1.83,'Dave Grohl.jpg','root@localhost','2022-06-24 20:07:01','Dato Insertado',3),(4,'Alexander','David','Turner','Alex Turner',38,'H','1986-01-06','Inglaterra','Guitarra Electrica',1.8,'Alex Turner.jpg','root@localhost','2022-06-24 20:07:01','Dato Insertado',4),(5,'Julian','Fernando','Casablancas','Julian Casablancas',43,'H','1978-08-23','Estados Unidos','Ninguno',1.88,'Julian Casablancas.jpg','root@localhost','2022-06-24 20:07:01','Dato Insertado',5),(6,'James','Douglas','Morrison','Jim Morrison',27,'H','1943-12-08','Inglaterra','Ninguno',1.8,'Jim Morrison.jpg','root@localhost','2022-06-24 20:07:01','Dato Insertado',6),(7,'Joshua','Michael','Homme','Josh Homme',48,'H','1973-05-17','Estados Unidos','Guitarra Electrica',1.93,'Josh Homme.jpg','root@localhost','2022-06-24 20:07:01','Dato Insertado',7),(8,'Matthew','Bellamy','James','Matt Bellamy',43,'H','1978-06-09','Inglaterra','Guitarra Electrica',1.7,'Matt Bellamy.jpg','root@localhost','2022-06-24 20:10:57','Dato Insertado',8),(9,'Chester','Charles','Bennington','Chester Bennington',41,'H','1976-03-20','Estados Unidos','Ninguno',1.78,'Chester Bennington.jpg','root@localhost','2022-06-24 20:10:57','Dato Insertado',9),(10,'Christopher Anthony','John','Martin','Chris Martin',44,'H','1976-03-02','Inglaterra','Teclado',1.86,'Chris Martin.jpg','root@localhost','2022-06-24 20:10:57','Dato Insertado',10),(11,'Barry Alan','Crompton','Gibb','Barry Gibb',75,'H','1945-09-01','Inglaterra','Guitarra Acustica',1.8,'Barry Gibb.jpg','root@localhost','2022-06-24 20:10:57','Dato Insertado',11),(12,'Peter','Gene','Hernandez','Bruno Mars',36,'H','1985-10-08','Estados Unidos','Ninguno',1.65,'Bruno Mars.jpg','root@localhost','2022-06-24 20:10:57','Dato Insertado',12),(13,'Thomas','Edward','Yorke','Thom Yorke',53,'H','1968-10-07','Inglaterra','Guitarra Acustica',1.66,'Thom Yorke.jpg','root@localhost','2022-06-24 20:10:57','Dato Insertado',13),(14,'Paul','Bruce','Dickinson','Bruce Dickinson',63,'H','1968-08-07','Inglaterra','Ninguno',1.68,'Bruce Dickinson.jpg','root@localhost','2022-06-24 20:10:57','Dato Insertado',14),(15,'Brian','Francis','Johnson','Brian Johnson',74,'H','1947-10-05','Inglaterra','Ninguno',1.65,'Brian Johnson.jpg','root@localhost','2022-06-24 20:10:57','Dato Insertado',15),(16,'William','Bruce','Rose','Axl Rose',60,'H','1962-02-06','Estados Unidos','Ninguno',1.75,'Axl Rose.jpg','root@localhost','2022-06-24 20:10:57','Dato Insertado',16),(17,'James','Alan','Hetfield','James Hetfield',58,'H','1963-08-03','Estados Unidos','Guitarra Electrica',1.85,'James Hetfield.jpg','root@localhost','2022-06-24 20:10:57','Dato Insertado',17),(18,'Christopher','Cornell','John','Chris Cornell',52,'H','1967-08-20','Estados Unidos','Guitarra Acustica',1.85,'Chris Cornell.jpg','root@localhost','2022-06-24 20:15:47','Dato Insertado',18),(19,'Deryck','Jayson','Whibley','Deryck Whibley',42,'H','1987-03-21','Estados Unidos','Guitarra Acustica',1.7,'Deryck Whibley.jpg','root@localhost','2022-06-24 20:15:47','Dato Insertado',19),(20,'Jeremy','McKinnon','Wade','Jeremy McKinnon',36,'H','1985-12-17','Estados Unidos','Ninguno',1.7,'Jeremy McKinnon.jpg','root@localhost','2022-06-24 20:15:47','Dato Insertado',20),(21,'Michael','Joseph','Jackson','Michael Jackson',50,'H','1958-08-29','Estados Unidos','Ninguno',1.75,'Michael Jackson.jpg','root@localhost','2022-06-24 20:15:47','Dato Insertado',21),(22,'Anthony','Joseph','Kiedis','Anthony Kiedis',59,'H','1962-11-01','Estados Unidos','Ninguno',1.75,'Anthony Kiedis.jpg','root@localhost','2022-06-24 20:15:47','Dato Insertado',22),(23,'Serj','Tankian ',' ','Serj Tankian',54,'H','1967-08-21','Libano','Ninguno',1.79,'Serj Tankian.jpg','root@localhost','2022-06-24 20:15:47','Dato Insertado',23),(24,'Jeffrey','Ross','Hyman','Joey Ramone',49,'H','1951-05-19','Estados Unidos','Ninguno',1.98,'Joey Ramone.jpg','root@localhost','2022-06-24 20:15:47','Dato Insertado',24),(25,'Michael','Philip','Jagger','Mick Jagger',78,'H','1943-07-26','Inglaterra','Ninguno',1.78,'Mick Jagger.jpg','root@localhost','2022-06-24 20:15:47','Dato Insertado',25),(26,'Gordon Matthew','Thomas','Sumner','Sting',70,'H','1951-10-02','Inglaterra','Bajo Electrico',1.82,'Sting.jpg','root@localhost','2022-06-24 20:15:47','Dato Insertado',26);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_cancion`
--

LOCK TABLES `auditoria_cancion` WRITE;
/*!40000 ALTER TABLE `auditoria_cancion` DISABLE KEYS */;
INSERT INTO `auditoria_cancion` VALUES (1,1,1,1,'Whatsername','00:04:12','2004-07-15','Ingles','Rock','root@localhost','2022-06-24 20:07:57','Dato Insertado',1),(2,2,2,2,'In Bloom','00:04:15','1991-02-17','Ingles','Grunge','root@localhost','2022-06-24 20:07:57','Dato Insertado',2),(3,3,3,3,'Everlong','00:04:11','1997-12-22','Ingles','Rock','root@localhost','2022-06-24 20:07:57','Dato Insertado',3),(4,4,4,4,'Brianstorm','00:02:52','2007-07-20','Ingles','Rock','root@localhost','2022-06-24 20:07:57','Dato Insertado',4),(5,5,5,5,'Juicebox','00:03:18','2005-12-30','Ingles','Rock','root@localhost','2022-06-24 20:07:57','Dato Insertado',5),(6,6,6,6,'People Are Strange','00:02:11','1967-12-14','Ingles','Blues','root@localhost','2022-06-24 20:07:57','Dato Insertado',6),(7,7,7,7,'I Sat by the Ocean','00:03:55','2013-10-25','Ingles','Rock','root@localhost','2022-06-24 20:07:57','Dato Insertado',7),(8,8,8,8,'Stockholm Syndrome','00:04:57','2003-09-15','Ingles','Rock Alternativo','root@localhost','2022-06-24 20:12:29','Dato Insertado',8),(9,9,9,9,'One More Light','00:04:15','2017-05-19','Ingles','Rock Alternativo','root@localhost','2022-06-24 20:12:29','Dato Insertado',9),(10,10,10,10,'Yellow','00:04:29','2000-05-25','Ingles','Rock Alternativo','root@localhost','2022-06-24 20:12:29','Dato Insertado',10),(11,11,11,11,'Stayin Alive','00:04:15','1977-12-12','Ingles','Pop','root@localhost','2022-06-24 20:12:29','Dato Insertado',11),(12,12,12,12,'Locked Out of Heaven','00:03:54','2012-10-01','Ingles','Pop','root@localhost','2022-06-24 20:12:29','Dato Insertado',12),(13,13,13,13,'Let Down','00:05:00','2017-07-15','Ingles','Alternativo','root@localhost','2022-06-24 20:12:29','Dato Insertado',13),(14,14,14,14,'Hallowed Be Thy Name','00:07:12','1982-10-15','Ingles','Heavy Metal','root@localhost','2022-06-24 20:12:29','Dato Insertado',14),(15,15,15,15,'Shoot to Thrill','00:05:18','1980-04-19','Ingles','Hard Rock','root@localhost','2022-06-24 20:12:29','Dato Insertado',15),(16,16,16,16,'Welcome To The Jungle','00:04:34','1987-04-15','Ingles','Hard Rock','root@localhost','2022-06-24 20:12:29','Dato Insertado',16),(17,17,17,17,'All Nightmare Long','00:07:57','2008-08-05','Ingles','Heavy Metal','root@localhost','2022-06-24 20:12:29','Dato Insertado',17),(18,18,18,18,'Be Yourself','00:04:38','2005-07-22','Ingles','Rock Alternativo','root@localhost','2022-06-24 20:16:29','Dato Insertado',18),(19,19,19,19,'Walking Disaster','00:04:46','2007-05-25','Ingles','Alternativo','root@localhost','2022-06-24 20:16:29','Dato Insertado',19),(20,20,20,20,'Bullfight','00:04:35','2016-05-05','Ingles','Hadcore Punk','root@localhost','2022-06-24 20:16:29','Dato Insertado',20),(21,21,21,21,'Give In to Me','00:05:29','1991-11-20','Ingles','Pop','root@localhost','2022-06-24 20:16:29','Dato Insertado',21),(22,22,22,22,'The Adventures Of Rain Dance Maggie','00:04:42','2011-05-10','Ingles','Alternativo','root@localhost','2022-06-24 20:16:29','Dato Insertado',22),(23,23,23,23,'Lost In Hollywood','00:05:21','2005-05-17','Ingles','Rock','root@localhost','2022-06-24 20:16:29','Dato Insertado',23),(24,24,24,24,'We Want the Airwaves','00:03:21','1981-05-12','Ingles','Punk','root@localhost','2022-06-24 20:16:29','Dato Insertado',24),(25,25,25,25,'Sympathy For The Devil','00:06:17','1968-12-06','Ingles','Rhythm and Blues','root@localhost','2022-06-24 20:16:29','Dato Insertado',25),(26,26,26,26,'Every Breath You Take','00:04:14','1983-06-11','Ingles','Alternativo','root@localhost','2022-06-24 20:16:29','Dato Insertado',26);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_disquera`
--

LOCK TABLES `auditoria_disquera` WRITE;
/*!40000 ALTER TABLE `auditoria_disquera` DISABLE KEYS */;
INSERT INTO `auditoria_disquera` VALUES (1,'Warner Records','Warnerrecords@org.com','Los Angeles, California, Estados Unidos',8188469090,'1958-03-19','Warner Records.jpg','root@localhost','2022-06-24 20:07:14','Dato Insertado',1),(2,'Sub Pop','radio@subpop.com','Seattle , WA , 98121 EE . UU. ',2064418441,'1986-05-17','Sub Pop.jpg','root@localhost','2022-06-24 20:07:14','Dato Insertado',2),(3,'RCA Records','jane.doe@rcarecords.com','Nashville, Tennessee, Estados Unidos',8772526873,'1960-09-09','RCA Records.jpg','root@localhost','2022-06-24 20:07:14','Dato Insertado',3),(4,'Domino Records','dominorecordco@.com','Londres, Inglaterra',5618796432,'1993-09-17','Domino Records.jpg','root@localhost','2022-06-24 20:07:14','Dato Insertado',4),(5,'Cult Records','Cult_Records@123.org.com','Seattle , WA , 561356 EE . UU.',1542659877,'2009-06-21','Cult Records.jpg','root@localhost','2022-06-24 20:07:14','Dato Insertado',5),(6,'Rhino Records','rhino_record@org.com','Burbank, Los Angeles, California',1432649844,'1978-07-06','Rhino Records.jpg','root@localhost','2022-06-24 20:07:14','Dato Insertado',6),(7,'Rekords Rekords','rekords_rekord@org.com','Estados Unidos, California',6548976433,'2001-05-12','Rekords Rekords.jpg','root@localhost','2022-06-24 20:07:14','Dato Insertado',7),(8,'Mushroom Records','Mushroom_Records@org.com','Melbourne, Australia',1265886132,'1972-05-12','Mushroom Records.jpg','root@localhost','2022-06-24 20:11:44','Dato Insertado',8),(9,'Warner Music Group','Warnermusic@org.com','Nueva York, NY, EE.UU.',1233456798,'1958-04-06','Warner Music Group.jpg','root@localhost','2022-06-24 20:11:44','Dato Insertado',9),(10,'Parlophone','parlophone@org.com','Londres, Inglaterra, Reino Unido.',1346598845,'1920-12-15','Parlophone.jpg','root@localhost','2022-06-24 20:11:44','Dato Insertado',10),(11,'Leedon','leedon@org.com','Estados Unidos',1365445879,'1969-10-10','Leedon.jpg','root@localhost','2022-06-24 20:11:44','Dato Insertado',11),(12,'Motown','motown@org.com','Detroit, Michigan, Estados Unidos',9564553214,'1959-01-12','Motown.jpg','root@localhost','2022-06-24 20:11:44','Dato Insertado',12),(13,'XL Recordings','XLRecordings@org.com','Londres, Reino Unido',6532142856,'1989-05-12','XL Recordings.jpg','root@localhost','2022-06-24 20:11:44','Dato Insertado',13),(14,'EMI Music','EMI@org.com','Londres, Reino Unido',2656789566,'1931-03-15','EMI Music.jpg','root@localhost','2022-06-24 20:11:44','Dato Insertado',14),(15,'Atlantic Records','Atlantic_records@org.com','Nueva York, Estados Unidos',9562374525,'1947-10-27','Atlantic Records.jpg','root@localhost','2022-06-24 20:11:44','Dato Insertado',15),(16,'Geffen Records','GRecords@org.com','Santa Monica, California',6595412235,'1980-10-25','Geffen Records.jpg','root@localhost','2022-06-24 20:11:44','Dato Insertado',16),(17,'Megaforce Records','MegaforceRecords@org.com','Nueva York, Estados Unidos',1346886005,'1982-11-07','Megaforce Records.jpg','root@localhost','2022-06-24 20:11:44','Dato Insertado',17),(18,'Interscope Records','InterscopeRecords@org.com','Santa Monica, California, Estados Unidos',5612235678,'1990-12-25','Interscope Records.jpg','root@localhost','2022-06-24 20:15:56','Dato Insertado',18),(19,'Hopeless Records','HopelessRecords@org.usa.com','Van Nuys, Los Angeles, California',2346859725,'1993-02-10','Hopeless Records.jpg','root@localhost','2022-06-24 20:15:56','Dato Insertado',19),(20,'Indianola Records','Indianola_Records@org.com','Tampa, Florida, Estados Unidos',1256894532,'1999-10-27','Indianola Records.jpg','root@localhost','2022-06-24 20:15:56','Dato Insertado',20),(21,'Sony Music','SonyMusic@org.com','Nueva York, Estados Unidos',1658903045,'1929-09-09','Sony Music.jpg','root@localhost','2022-06-24 20:15:56','Dato Insertado',21),(22,'Enigma Records','EnigmaRecords@org.com','California, Estados Unidos',9371303846,'1981-07-15','Enigma Records.jpg','root@localhost','2022-06-24 20:15:56','Dato Insertado',22),(23,'American Recordings','AmericanRecordings@org.com','Burbank, California, Estados Unidos',9785623645,'1988-06-17','American Recordings.jpg','root@localhost','2022-06-24 20:15:56','Dato Insertado',23),(24,'Sire Records','SireRecords@org.com','Estados Unidos',6089764302,'1966-06-19','Sire Records.jpg','root@localhost','2022-06-24 20:15:56','Dato Insertado',24),(25,'ABKCO Records','ABKCORecords@org.com','Nueva York, Estados Unidos',9563021699,'1961-04-15','ABKCO Records.jpg','root@localhost','2022-06-24 20:15:56','Dato Insertado',25),(26,'A&M Records','AMRecords@org.com','Estados Unidos',9361230546,'1962-07-15','A&M Records.jpg','root@localhost','2022-06-24 20:15:56','Dato Insertado',26);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_grupo`
--

LOCK TABLES `auditoria_grupo` WRITE;
/*!40000 ALTER TABLE `auditoria_grupo` DISABLE KEYS */;
INSERT INTO `auditoria_grupo` VALUES (1,1,'Green Day','Estados Unidos','1987-05-18',4,'Rock','Ingles','Green Day.jpg','root@localhost','2022-06-24 20:07:25','Dato Insertado',1),(2,2,'Nirvana','Aberdeen, Washington, Estados Unidos','1989-06-15',4,'Grunge','Ingles','Nirvana.jpg','root@localhost','2022-06-24 20:07:25','Dato Insertado',2),(3,3,'Foo Fighters','Seattle, Washington, Estados Unidos','1994-10-19',5,'Rock','Ingles','Foo Fighters.jpg','root@localhost','2022-06-24 20:07:25','Dato Insertado',3),(4,4,'Arctic Monkeys','Inglaterra','2003-06-22',4,'Rock','Ingles','Arctic Monkeys.jpg','root@localhost','2022-06-24 20:07:25','Dato Insertado',4),(5,5,'The Strokes','Nueva York, Estados Unidos','1998-11-16',4,'Rock','Ingles','The Strokes.jpg','root@localhost','2022-06-24 20:07:25','Dato Insertado',5),(6,6,'The Doors','Los Angeles, California, Estados Unidos','1964-08-23',4,'Blues','Ingles','The Doors.jpg','root@localhost','2022-06-24 20:07:25','Dato Insertado',6),(7,7,'Queens Of the Stone Age','Palm Desert, California, Estados Unidos','2000-03-15',4,'Rock','Ingles','Queens Of the Stone Age.jpg','root@localhost','2022-06-24 20:07:25','Dato Insertado',7),(8,8,'Muse','Teignmouth, Devon','1994-10-07',3,'Rock','Ingles','Muse.jpg','root@localhost','2022-06-24 20:11:55','Dato Insertado',8),(9,9,'Linkin Park','Agoura Hills, California, Estados Unidos','1996-07-20',6,'Nu Metal','Ingles','Linkin Park.jpg','root@localhost','2022-06-24 20:11:55','Dato Insertado',9),(10,10,'Coldplay','Londres, Reino Unido','1996-10-20',5,'Alternativo','Ingles','Coldplay.jpg','root@localhost','2022-06-24 20:11:55','Dato Insertado',10),(11,11,'Bee Gees','Redcliffe, Australia','1958-04-25',4,'Pop','Ingles','Bee Gees.jpg','root@localhost','2022-06-24 20:11:55','Dato Insertado',11),(12,12,'Bruno Mars','Estados Unidos','2004-01-20',1,'Pop','Ingles','Bruno Mars.jpg','root@localhost','2022-06-24 20:11:55','Dato Insertado',12),(13,13,'Radiohead','Abingdon, Oxfordshire, Inglaterra, Reino Unido','1985-07-15',5,'Rock Alternativo','Ingles','Radiohead.jpg','root@localhost','2022-06-24 20:11:55','Dato Insertado',13),(14,14,'Iron Maiden','Londres, Inglaterra, Reino Unido','1975-05-15',7,'Heavy Metal','Ingles','Iron Maiden.jpg','root@localhost','2022-06-24 20:11:55','Dato Insertado',14),(15,15,'AC/DC','Sidney, Nueva Gales del Sur, Australia','1973-12-28',6,'Hard Rock','Ingles','AC DC.jpg','root@localhost','2022-06-24 20:11:55','Dato Insertado',15),(16,16,'Guns N Roses','Los Angeles, California','1985-06-12',5,'Hard Rock','Ingles','Guns N Roses.jpg','root@localhost','2022-06-24 20:11:55','Dato Insertado',16),(17,17,'Metallica','Los Angeles, California, Estados Unidos','1983-02-10',4,'Heavy Metal','Ingles','Metallica.jpg','root@localhost','2022-06-24 20:11:55','Dato Insertado',17),(18,18,'Audioslave','Glendale, California, Estados Unidos','2001-07-15',4,'Rock Alternativo','Ingles','Audioslave.jpg','root@localhost','2022-06-24 20:16:05','Dato Insertado',18),(19,19,'Sum 41','Ajax, Canada','1996-10-25',4,'Rock Alternativo','Ingles','Sum 41.jpg','root@localhost','2022-06-24 20:16:05','Dato Insertado',19),(20,20,'A Day to Remember','Ocala, Florida','2003-07-26',5,'Hadcore Punk','Ingles','A Day to Remember.jpg','root@localhost','2022-06-24 20:16:05','Dato Insertado',20),(21,21,'Michael Jackson','Gary, Indiana, Estados Unidos','1964-07-27',1,'Pop','Ingles','Michael Jackson.jpg','root@localhost','2022-06-24 20:16:05','Dato Insertado',21),(22,22,'Red Hot Chili Peppers','Los Angeles, California, Estados Unidos','1983-04-15',4,'Rock','Ingles','Red Hot Chili Peppers.jpg','root@localhost','2022-06-24 20:16:05','Dato Insertado',22),(23,23,'System of a Down','Glendale, California, Estados Unidos','1994-07-15',4,'Rock','Ingles','System of a Down.jpg','root@localhost','2022-06-24 20:16:05','Dato Insertado',23),(24,24,'Ramones','Queens, Nueva York; (Estados Unidos)','1974-04-20',4,'Punk','Ingles','Ramones.jpg','root@localhost','2022-06-24 20:16:05','Dato Insertado',24),(25,25,'The Rolling Stones','Londres, Inglaterra, Reino Unido','1962-10-15',5,'Rock','Ingles','The Rolling Stones.jpg','root@localhost','2022-06-24 20:16:05','Dato Insertado',25),(26,26,'The Police','Londres, Inglaterra Reino Unido','1977-10-15',3,'Rock','Ingles','The Police.jpg','root@localhost','2022-06-24 20:16:05','Dato Insertado',26);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_usuario`
--

LOCK TABLES `auditoria_usuario` WRITE;
/*!40000 ALTER TABLE `auditoria_usuario` DISABLE KEYS */;
INSERT INTO `auditoria_usuario` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Raul Gabriel','Geronimo','Herrera','2000-09-07',5528973869,'H','raul090700@gmail.com','Raul','c90d6d172779ddee6dae9af3aa21d7bc','root@localhost','2022-06-24 20:06:42','Dato Insertado',1),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Brian Alejandro','Rodriguez','Cruz','2000-03-14',5514923287,'H','barc140300@gmail.com','Brian','eb30e1385a540b9acaf23f32a950f3b6','root@localhost','2022-06-24 20:06:42','Dato Insertado',2),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Luis Manuel','Bastida','Lemus','2000-09-17',5627386384,'H','lemus17.bl@gmail.com','Lemus','8ea5c44d4b58e498f3ff0a0979df4d44','root@localhost','2022-06-24 20:06:42','Dato Insertado',3),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Brian Ulises','Orihuela','Perez','1999-05-15',5530467220,'H','borihuelap001@alumno.uaemex.mx','Brian Ulises','99a6a99ac976917ed2715fd111722489','root@localhost','2022-06-24 20:16:35','Dato Insertado',4),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Felipe','Reyes','Miguel','2000-07-13',5534915207,'H','freyesm006@alumno.uaemex.mx','Felipe','cc177bd80f5b18704b87858be6b75793','root@localhost','2022-06-24 20:16:35','Dato Insertado',5),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Luis Enrique','Vaca','Crispin','2000-04-20',5582914841,'H','luisenriquevacacrispin@gmail.com','Luis Enrique','a1c8a0f102106d3148f2de509b615247','root@localhost','2022-06-24 20:16:35','Dato Insertado',6);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canciones`
--

LOCK TABLES `canciones` WRITE;
/*!40000 ALTER TABLE `canciones` DISABLE KEYS */;
INSERT INTO `canciones` VALUES (1,1,1,1,'Whatsername','00:04:12','2004-07-15','Ingles','Rock'),(2,2,2,2,'In Bloom','00:04:15','1991-02-17','Ingles','Grunge'),(3,3,3,3,'Everlong','00:04:11','1997-12-22','Ingles','Rock'),(4,4,4,4,'Brianstorm','00:02:52','2007-07-20','Ingles','Rock'),(5,5,5,5,'Juicebox','00:03:18','2005-12-30','Ingles','Rock'),(6,6,6,6,'People Are Strange','00:02:11','1967-12-14','Ingles','Blues'),(7,7,7,7,'I Sat by the Ocean','00:03:55','2013-10-25','Ingles','Rock'),(8,8,8,8,'Stockholm Syndrome','00:04:57','2003-09-15','Ingles','Rock Alternativo'),(9,9,9,9,'One More Light','00:04:15','2017-05-19','Ingles','Rock Alternativo'),(10,10,10,10,'Yellow','00:04:29','2000-05-25','Ingles','Rock Alternativo'),(11,11,11,11,'Stayin Alive','00:04:15','1977-12-12','Ingles','Pop'),(12,12,12,12,'Locked Out of Heaven','00:03:54','2012-10-01','Ingles','Pop'),(13,13,13,13,'Let Down','00:05:00','2017-07-15','Ingles','Alternativo'),(14,14,14,14,'Hallowed Be Thy Name','00:07:12','1982-10-15','Ingles','Heavy Metal'),(15,15,15,15,'Shoot to Thrill','00:05:18','1980-04-19','Ingles','Hard Rock'),(16,16,16,16,'Welcome To The Jungle','00:04:34','1987-04-15','Ingles','Hard Rock'),(17,17,17,17,'All Nightmare Long','00:07:57','2008-08-05','Ingles','Heavy Metal'),(18,18,18,18,'Be Yourself','00:04:38','2005-07-22','Ingles','Rock Alternativo'),(19,19,19,19,'Walking Disaster','00:04:46','2007-05-25','Ingles','Alternativo'),(20,20,20,20,'Bullfight','00:04:35','2016-05-05','Ingles','Hadcore Punk'),(21,21,21,21,'Give In to Me','00:05:29','1991-11-20','Ingles','Pop'),(22,22,22,22,'The Adventures Of Rain Dance Maggie','00:04:42','2011-05-10','Ingles','Alternativo'),(23,23,23,23,'Lost In Hollywood','00:05:21','2005-05-17','Ingles','Rock'),(24,24,24,24,'We Want the Airwaves','00:03:21','1981-05-12','Ingles','Punk'),(25,25,25,25,'Sympathy For The Devil','00:06:17','1968-12-06','Ingles','Rhythm and Blues'),(26,26,26,26,'Every Breath You Take','00:04:14','1983-06-11','Ingles','Alternativo');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disquera`
--

LOCK TABLES `disquera` WRITE;
/*!40000 ALTER TABLE `disquera` DISABLE KEYS */;
INSERT INTO `disquera` VALUES (1,'Warner Records','Warnerrecords@org.com','Los Angeles, California, Estados Unidos',8188469090,'1958-03-19','Warner Records.jpg'),(2,'Sub Pop','radio@subpop.com','Seattle , WA , 98121 EE . UU. ',2064418441,'1986-05-17','Sub Pop.jpg'),(3,'RCA Records','jane.doe@rcarecords.com','Nashville, Tennessee, Estados Unidos',8772526873,'1960-09-09','RCA Records.jpg'),(4,'Domino Records','dominorecordco@.com','Londres, Inglaterra',5618796432,'1993-09-17','Domino Records.jpg'),(5,'Cult Records','Cult_Records@123.org.com','Seattle , WA , 561356 EE . UU.',1542659877,'2009-06-21','Cult Records.jpg'),(6,'Rhino Records','rhino_record@org.com','Burbank, Los Angeles, California',1432649844,'1978-07-06','Rhino Records.jpg'),(7,'Rekords Rekords','rekords_rekord@org.com','Estados Unidos, California',6548976433,'2001-05-12','Rekords Rekords.jpg'),(8,'Mushroom Records','Mushroom_Records@org.com','Melbourne, Australia',1265886132,'1972-05-12','Mushroom Records.jpg'),(9,'Warner Music Group','Warnermusic@org.com','Nueva York, NY, EE.UU.',1233456798,'1958-04-06','Warner Music Group.jpg'),(10,'Parlophone','parlophone@org.com','Londres, Inglaterra, Reino Unido.',1346598845,'1920-12-15','Parlophone.jpg'),(11,'Leedon','leedon@org.com','Estados Unidos',1365445879,'1969-10-10','Leedon.jpg'),(12,'Motown','motown@org.com','Detroit, Michigan, Estados Unidos',9564553214,'1959-01-12','Motown.jpg'),(13,'XL Recordings','XLRecordings@org.com','Londres, Reino Unido',6532142856,'1989-05-12','XL Recordings.jpg'),(14,'EMI Music','EMI@org.com','Londres, Reino Unido',2656789566,'1931-03-15','EMI Music.jpg'),(15,'Atlantic Records','Atlantic_records@org.com','Nueva York, Estados Unidos',9562374525,'1947-10-27','Atlantic Records.jpg'),(16,'Geffen Records','GRecords@org.com','Santa Monica, California',6595412235,'1980-10-25','Geffen Records.jpg'),(17,'Megaforce Records','MegaforceRecords@org.com','Nueva York, Estados Unidos',1346886005,'1982-11-07','Megaforce Records.jpg'),(18,'Interscope Records','InterscopeRecords@org.com','Santa Monica, California, Estados Unidos',5612235678,'1990-12-25','Interscope Records.jpg'),(19,'Hopeless Records','HopelessRecords@org.usa.com','Van Nuys, Los Angeles, California',2346859725,'1993-02-10','Hopeless Records.jpg'),(20,'Indianola Records','Indianola_Records@org.com','Tampa, Florida, Estados Unidos',1256894532,'1999-10-27','Indianola Records.jpg'),(21,'Sony Music','SonyMusic@org.com','Nueva York, Estados Unidos',1658903045,'1929-09-09','Sony Music.jpg'),(22,'Enigma Records','EnigmaRecords@org.com','California, Estados Unidos',9371303846,'1981-07-15','Enigma Records.jpg'),(23,'American Recordings','AmericanRecordings@org.com','Burbank, California, Estados Unidos',9785623645,'1988-06-17','American Recordings.jpg'),(24,'Sire Records','SireRecords@org.com','Estados Unidos',6089764302,'1966-06-19','Sire Records.jpg'),(25,'ABKCO Records','ABKCORecords@org.com','Nueva York, Estados Unidos',9563021699,'1961-04-15','ABKCO Records.jpg'),(26,'A&M Records','AMRecords@org.com','Estados Unidos',9361230546,'1962-07-15','A&M Records.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,1,'Green Day','Estados Unidos','1987-05-18',4,'Rock','Ingles','Green Day.jpg'),(2,2,'Nirvana','Aberdeen, Washington, Estados Unidos','1989-06-15',4,'Grunge','Ingles','Nirvana.jpg'),(3,3,'Foo Fighters','Seattle, Washington, Estados Unidos','1994-10-19',5,'Rock','Ingles','Foo Fighters.jpg'),(4,4,'Arctic Monkeys','Inglaterra','2003-06-22',4,'Rock','Ingles','Arctic Monkeys.jpg'),(5,5,'The Strokes','Nueva York, Estados Unidos','1998-11-16',4,'Rock','Ingles','The Strokes.jpg'),(6,6,'The Doors','Los Angeles, California, Estados Unidos','1964-08-23',4,'Blues','Ingles','The Doors.jpg'),(7,7,'Queens Of the Stone Age','Palm Desert, California, Estados Unidos','2000-03-15',4,'Rock','Ingles','Queens Of the Stone Age.jpg'),(8,8,'Muse','Teignmouth, Devon','1994-10-07',3,'Rock','Ingles','Muse.jpg'),(9,9,'Linkin Park','Agoura Hills, California, Estados Unidos','1996-07-20',6,'Nu Metal','Ingles','Linkin Park.jpg'),(10,10,'Coldplay','Londres, Reino Unido','1996-10-20',5,'Alternativo','Ingles','Coldplay.jpg'),(11,11,'Bee Gees','Redcliffe, Australia','1958-04-25',4,'Pop','Ingles','Bee Gees.jpg'),(12,12,'Bruno Mars','Estados Unidos','2004-01-20',1,'Pop','Ingles','Bruno Mars.jpg'),(13,13,'Radiohead','Abingdon, Oxfordshire, Inglaterra, Reino Unido','1985-07-15',5,'Rock Alternativo','Ingles','Radiohead.jpg'),(14,14,'Iron Maiden','Londres, Inglaterra, Reino Unido','1975-05-15',7,'Heavy Metal','Ingles','Iron Maiden.jpg'),(15,15,'AC/DC','Sidney, Nueva Gales del Sur, Australia','1973-12-28',6,'Hard Rock','Ingles','AC DC.jpg'),(16,16,'Guns N Roses','Los Angeles, California','1985-06-12',5,'Hard Rock','Ingles','Guns N Roses.jpg'),(17,17,'Metallica','Los Angeles, California, Estados Unidos','1983-02-10',4,'Heavy Metal','Ingles','Metallica.jpg'),(18,18,'Audioslave','Glendale, California, Estados Unidos','2001-07-15',4,'Rock Alternativo','Ingles','Audioslave.jpg'),(19,19,'Sum 41','Ajax, Canada','1996-10-25',4,'Rock Alternativo','Ingles','Sum 41.jpg'),(20,20,'A Day to Remember','Ocala, Florida','2003-07-26',5,'Hadcore Punk','Ingles','A Day to Remember.jpg'),(21,21,'Michael Jackson','Gary, Indiana, Estados Unidos','1964-07-27',1,'Pop','Ingles','Michael Jackson.jpg'),(22,22,'Red Hot Chili Peppers','Los Angeles, California, Estados Unidos','1983-04-15',4,'Rock','Ingles','Red Hot Chili Peppers.jpg'),(23,23,'System of a Down','Glendale, California, Estados Unidos','1994-07-15',4,'Rock','Ingles','System of a Down.jpg'),(24,24,'Ramones','Queens, Nueva York; (Estados Unidos)','1974-04-20',4,'Punk','Ingles','Ramones.jpg'),(25,25,'The Rolling Stones','Londres, Inglaterra, Reino Unido','1962-10-15',5,'Rock','Ingles','The Rolling Stones.jpg'),(26,26,'The Police','Londres, Inglaterra Reino Unido','1977-10-15',3,'Rock','Ingles','The Police.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Raul Gabriel','Geronimo','Herrera','2000-09-07',5528973869,'H','raul090700@gmail.com','Raul','c90d6d172779ddee6dae9af3aa21d7bc'),(2,'Brian Alejandro','Rodriguez','Cruz','2000-03-14',5514923287,'H','barc140300@gmail.com','Brian','eb30e1385a540b9acaf23f32a950f3b6'),(3,'Luis Manuel','Bastida','Lemus','2000-09-17',5627386384,'H','lemus17.bl@gmail.com','Lemus','8ea5c44d4b58e498f3ff0a0979df4d44'),(4,'Brian Ulises','Orihuela','Perez','1999-05-15',5530467220,'H','borihuelap001@alumno.uaemex.mx','Brian Ulises','99a6a99ac976917ed2715fd111722489'),(5,'Felipe','Reyes','Miguel','2000-07-13',5534915207,'H','freyesm006@alumno.uaemex.mx','Felipe','cc177bd80f5b18704b87858be6b75793'),(6,'Luis Enrique','Vaca','Crispin','2000-04-20',5582914841,'H','luisenriquevacacrispin@gmail.com','Luis Enrique','a1c8a0f102106d3148f2de509b615247');
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

-- Dump completed on 2022-06-24 20:17:21
