-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lyondb
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `documento` int(11) NOT NULL,
  `fechaNacimiento` date NOT NULL COMMENT 'Valor numérico que representa la cantidad de años vividos de un Usuario (este campo es obligatorio).',
  `nombre1` varchar(45) NOT NULL COMMENT 'Palabra asignada para distinguir al usuario de manera genérica (este campo es obligatorio).',
  `nombre2` varchar(45) DEFAULT NULL COMMENT 'Segunda palabra asignada para distinguir al usuario de manera genérica.',
  `apellido1` varchar(45) NOT NULL COMMENT 'Nombre de pila de una persona que se transmite de padre a hijo (este campo es obligatorio).',
  `apellido2` varchar(45) DEFAULT NULL COMMENT 'Nombre de pila de una persona que se transmite de padre a hijo.',
  `email` varchar(100) NOT NULL COMMENT 'Dirección de correo electrónico con la que el usuario ingresará al sistema (este campo es obligatorio).',
  `telefono_fijo` bigint(11) DEFAULT NULL COMMENT 'Número de contacto al domicilio en el que reside el Usuario.',
  `telefono_celular` bigint(20) NOT NULL COMMENT 'Número de contacto directo del Usuario (Este campo es obligatorio).',
  `contrasenia` varchar(200) NOT NULL COMMENT 'Serie de caracteres encriptados que permiten al Usuario el acceso al sistema (Este campo es obligatorio).',
  `urlFoto` varchar(200) DEFAULT NULL,
  `Tipo_idTipoDocumento` tinyint(4) NOT NULL COMMENT 'Llave foranea de tipo de identificación de Usuario (Este campo es obligatorio).',
  `Rol_idRol` int(11) NOT NULL COMMENT 'Llave foranea de tabla Rol (Este campo es obligatorio).',
  `Estado` tinyint(4) NOT NULL,
  `curso` int(11) DEFAULT NULL,
  PRIMARY KEY (`documento`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_Usuario_TipoDocumento_idx` (`Tipo_idTipoDocumento`),
  KEY `fk_Usuario_Rol1_idx` (`Rol_idRol`),
  KEY `curso` (`curso`),
  CONSTRAINT `fk_Usuario_Rol1` FOREIGN KEY (`Rol_idRol`) REFERENCES `roles` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_TipoDocumento` FOREIGN KEY (`Tipo_idTipoDocumento`) REFERENCES `tiposdocumentos` (`idTipoDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`curso`) REFERENCES `grados` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (888881,'1991-12-23','pepo',NULL,'pepazo',NULL,'a.adasdasdamzao@larrre.com',NULL,7832551,'pbkdf2_sha256$600000$GpEKddXZq',NULL,1,1,1,7),(1201313,'1991-12-23','pepo',NULL,'pepazo',NULL,'adam@lamorre.com',NULL,7832551,'seta',NULL,1,1,1,7),(1219213,'1991-12-23','pepo',NULL,'pepazo',NULL,'a.adamderazao@lamoaarrrre.com',NULL,7832551,'pbkdf2_sha256$600000$fr1ccxjcw',NULL,1,1,1,7),(8123881,'1991-12-23','pepo',NULL,'pepazo',NULL,'a.adasdasdamzao@larrrasde.com',NULL,7832551,'pbkdf2_sha256$600000$EszrG2Kgu',NULL,1,1,1,7),(10270880,'1991-12-23','Brionna','Ava','Towne','Hirthe','schiller.serenity@example.org',NULL,7837255,'seta','https://via.placeholder.com/200x200.png/0077ff?text=corporis',3,1,1,NULL),(10270881,'1991-12-23','pepo',NULL,'pepazo',NULL,'antonio@antonio.antonio',NULL,7832551,'seta',NULL,1,1,1,7),(10375882,'1998-02-14','Mabelle',NULL,'Nicolas','Shanahan','yfeest@example.net',NULL,4449190,'seta','https://via.placeholder.com/200x200.png/002233?text=non',1,2,1,NULL),(12021313,'1991-12-23','pepo',NULL,'pepazo',NULL,'a.adam.dam@lamorre.com',NULL,7832551,'seta',NULL,1,1,1,7),(12931881,'1991-12-23','pepo',NULL,'pepazo',NULL,'a.zaoa1@larasde.com',NULL,7832551,'pbkdf2_sha256$600000$ReLvOlmck',NULL,1,1,1,7),(13606910,'1998-09-01','Kobe','Lorna','Von',NULL,'cleve.marquardt@example.org',2716462,8566086,'seta',NULL,3,2,1,NULL),(15039538,'1999-01-10','Audrey',NULL,'Schmitt',NULL,'jalon.weissnat@example.org',NULL,5769515,'seta',NULL,1,2,1,NULL),(15993251,'2004-08-09','Amiya',NULL,'Satterfield',NULL,'ova24@example.com',7868174,4410923,'seta',NULL,2,3,1,NULL),(18417786,'2022-04-22','Dejuan',NULL,'Bernier',NULL,'ekrajcik@example.net',7820706,3671961,'seta',NULL,2,2,1,NULL),(18718078,'1999-11-07','Monty',NULL,'Lehner','Cummerata','rritchie@example.org',NULL,4582289,'seta',NULL,3,2,1,NULL),(21510850,'1983-09-23','Kristy','Sharon','Krajcik','Olson','johnston.hertha@example.org',3232495,3636705,'seta','https://via.placeholder.com/200x200.png/00dd55?text=et',1,2,1,NULL),(23248937,'1970-08-24','Mckenna',NULL,'Turner','Hegmann','howell.brenden@example.net',1023265,3875171,'seta',NULL,2,3,1,NULL),(23293738,'2016-07-01','Kyleigh',NULL,'Ankunding','Thiel','nwyman@example.net',NULL,6178518,'seta','https://via.placeholder.com/200x200.png/004444?text=voluptatem',2,3,1,NULL),(30381482,'1982-06-22','Bryon','Otha','Walter',NULL,'ddurgan@example.net',NULL,9170873,'seta','https://via.placeholder.com/200x200.png/003333?text=nihil',2,2,1,NULL),(30382152,'1996-02-16','Theodora',NULL,'Schneider',NULL,'eldred33@example.org',NULL,7224615,'seta','https://via.placeholder.com/200x200.png/0099dd?text=consectetur',2,2,1,NULL),(34449927,'2009-01-06','Lambert',NULL,'McKenzie','Ondricka','brown96@example.net',NULL,3543725,'seta','https://via.placeholder.com/200x200.png/00aa22?text=placeat',1,2,1,NULL),(36392754,'1989-08-25','Omari',NULL,'Murray','Nicolas','maybelle82@example.net',5095437,893931,'seta','https://via.placeholder.com/200x200.png/000033?text=sequi',3,1,1,NULL),(36848331,'2010-07-11','Keenan','Johan','Moore',NULL,'koby.bechtelar@example.com',NULL,2437389,'seta','https://via.placeholder.com/200x200.png/0000cc?text=ullam',3,1,1,NULL),(38653043,'1980-02-19','Berenice','Adele','Hickle',NULL,'marilyne53@example.org',NULL,1548664,'seta',NULL,2,3,1,NULL),(39041127,'2021-05-25','Vernon','Lea','Jacobi',NULL,'durgan.anais@example.org',8557834,1957839,'seta',NULL,2,2,1,NULL),(39276963,'1987-11-22','Tillman',NULL,'Mraz','Dickens','amelie08@example.net',NULL,2212684,'seta','https://via.placeholder.com/200x200.png/00aa11?text=consequuntur',3,3,1,NULL),(41544776,'1985-05-15','Riley','Nadia','Lind',NULL,'dandre32@example.net',5817152,3096062,'seta',NULL,3,2,1,NULL),(44396986,'1988-03-20','Glenda','Rashawn','Shields','Lindgren','olen.robel@example.com',5606193,3933515,'seta',NULL,3,2,1,NULL),(47160887,'2007-04-02','Kaylah','Harrison','Kris','Effertz','miles.hoppe@example.com',NULL,4389682,'seta',NULL,1,3,1,NULL),(52572267,'2013-11-03','Kieran',NULL,'Renner',NULL,'isai.nolan@example.com',1971138,4088177,'seta','https://via.placeholder.com/200x200.png/00ccdd?text=numquam',3,3,1,NULL),(53354212,'2014-04-23','Felix','Amely','Baumbach',NULL,'pcasper@example.com',9131885,8400548,'seta','https://via.placeholder.com/200x200.png/004499?text=vitae',1,3,1,NULL),(58607935,'2001-03-02','Carol',NULL,'Rohan','Stroman','rbailey@example.com',9689828,4458551,'seta','https://via.placeholder.com/200x200.png/00ff22?text=aut',1,3,1,NULL),(59537565,'2006-12-04','Austyn',NULL,'Bahringer','Thiel','gregg.moen@example.net',2525617,6369201,'seta','https://via.placeholder.com/200x200.png/001177?text=et',3,3,1,NULL),(62769020,'1971-08-28','Denis',NULL,'Kuhic',NULL,'mmueller@example.net',422186,5033676,'seta',NULL,2,3,1,NULL),(65444661,'1987-10-05','Eddie','Ignacio','Cummerata',NULL,'johnston.christina@example.com',3086674,6575289,'seta',NULL,2,1,1,NULL),(67252854,'2009-04-07','Cortez','Herminia','Lowe','Grimes','gklocko@example.net',NULL,4952975,'seta',NULL,3,1,1,NULL),(67574489,'1980-08-23','Frankie','Ottis','Kertzmann',NULL,'maggie24@example.com',NULL,3171959,'seta',NULL,1,1,1,NULL),(68120246,'2011-02-09','German',NULL,'Feeney',NULL,'winifred00@example.net',NULL,9740976,'seta','https://via.placeholder.com/200x200.png/0033dd?text=enim',2,2,1,NULL),(69237283,'1998-10-05','Mertie',NULL,'Wiza','Jast','rcrona@example.net',9275550,4642061,'seta',NULL,3,3,1,NULL),(70133452,'2022-05-15','Destinee','Leatha','Schamberger','Ortiz','ramiro.goyette@example.org',8179270,397248,'seta','https://via.placeholder.com/200x200.png/0077ff?text=et',3,1,1,NULL),(70147456,'2015-07-06','Johann','Monserrat','Will',NULL,'rosenbaum.sigurd@example.com',4952220,5084788,'seta','https://via.placeholder.com/200x200.png/00aa33?text=enim',2,2,1,NULL),(71504615,'2021-06-06','Maria',NULL,'Grady','Blanda','kemmer.ernest@example.org',3387536,8574296,'seta',NULL,1,2,1,NULL),(71815857,'2007-01-08','Elza','Aaliyah','Braun','Bednar','berenice32@example.net',8390803,8085070,'seta','https://via.placeholder.com/200x200.png/00ee77?text=deleniti',1,2,1,NULL),(72974203,'2001-04-09','Kayden',NULL,'Hoppe','Lubowitz','lamont.gislason@example.net',9996172,8212707,'seta','https://via.placeholder.com/200x200.png/009988?text=temporibus',1,3,1,NULL),(74481449,'1998-03-25','Billy',NULL,'Tremblay',NULL,'nicolas.herminio@example.net',2932441,3041294,'seta',NULL,2,2,1,NULL),(78535994,'2020-06-01','Hugh',NULL,'Morar','Monahan','vanessa.cormier@example.com',6589277,4751956,'seta','https://via.placeholder.com/200x200.png/0066aa?text=sequi',2,1,1,NULL),(81291881,'1991-12-23','pepo',NULL,'pepazo',NULL,'a.zaoa@larasde.com',NULL,7832551,'pbkdf2_sha256$600000$BmIDbbJC4',NULL,1,1,1,7),(81293881,'1991-12-23','pepo',NULL,'pepazo',NULL,'a.zao@larasde.com',NULL,7832551,'pbkdf2_sha256$600000$WluMK9WnM',NULL,1,1,1,7),(82178031,'2020-08-17','Amanda','Vanessa','Feeney','Zulauf','dessie.hagenes@example.net',NULL,657653,'seta',NULL,1,2,1,NULL),(88938333,'2010-06-01','Ivy','Marina','Rutherford',NULL,'hroberts@example.org',1515083,4177890,'seta','https://via.placeholder.com/200x200.png/0044ee?text=itaque',1,3,1,NULL),(91702232,'1981-09-07','Lolita',NULL,'Gerhold','Grady','camilla49@example.org',NULL,6971006,'seta',NULL,1,1,1,NULL),(92841970,'2004-12-10','Jarrett',NULL,'Steuber',NULL,'lmckenzie@example.com',3593852,5577099,'seta',NULL,2,3,1,NULL),(99018138,'2021-10-26','Amara',NULL,'Moore',NULL,'kkris@example.com',6062083,3301096,'seta',NULL,2,1,1,NULL),(102708811,'1991-12-23','pepo',NULL,'pepazo',NULL,'antonio@antonio.anatonio',NULL,7832551,'seta',NULL,1,1,1,7),(120213133,'1991-12-23','pepo',NULL,'pepazo',NULL,'a.adama.dam@lamorre.com',NULL,7832551,'pbkdf2_sha256$600000$XY2C8NQwY',NULL,1,1,1,7),(121341133,'1991-12-23','pepo',NULL,'pepazo',NULL,'a.dadadam@lamoarrre.com',NULL,7832551,'pbkdf2_sha256$600000$rbJhG3tPv',NULL,1,1,1,7),(121921133,'1991-12-23','pepo',NULL,'pepazo',NULL,'a.adamdesesperazao@lamoaarrrre.com',NULL,7832551,'pbkdf2_sha256$600000$JIoWjfITy',NULL,1,1,1,7),(121921613,'1991-12-23','pepo',NULL,'pepazo',NULL,'a.adamzao@larrre.com',NULL,7832551,'pbkdf2_sha256$600000$5vwX4HiQj',NULL,1,1,1,7),(123456789,'1990-01-15','Juan','Carlos','Gómez','López','juan@example.com',1234567,987654321,'era','avatar.jpg',1,2,0,NULL),(129411881,'1991-12-23','pepo',NULL,'pepazo',NULL,'a.zaa534oa1@larasde.com',NULL,7832551,'pbkdf2_sha256$600000$ScBp0XYNm',NULL,1,1,1,7),(129431881,'1991-12-23','pepo',NULL,'pepazo',NULL,'a.zaa54oa1@larasde.com',NULL,7832551,'pbkdf2_sha256$600000$5YCL6MzkE',NULL,1,1,1,7),(129531881,'1991-12-23','pepo',NULL,'pepazo',NULL,'a.zaa5oa1@larasde.com',NULL,7832551,'pbkdf2_sha256$600000$3ih6OcRZj',NULL,1,1,1,7),(129631881,'1991-12-23','pepo',NULL,'pepazo',NULL,'a.zaaoa1@larasde.com',NULL,7832551,'pbkdf2_sha256$600000$KlQjyaIL7',NULL,1,1,1,7),(222431881,'1991-12-23','pepo',NULL,'pepazo',NULL,'a.zaa54aoa1@larasde.com',NULL,7832551,'seta',NULL,1,1,1,7),(255810812,'2023-12-08','Alejandra','','Bolaños','Bolaños','alejandra@tucasa.com',3133132558,32132132132,'pbkdf2_sha256$600000$4xFRV9xKmN60ZJ2R8iamfz$VA9ieAY0ZXrySU9dTlbZxzXUS4L6K31w8U3qcK9Y7eo=','',1,2,1,NULL),(1010123456,'2012-06-14','ana','maria','flores','fuentes','hola@hola.com',1238764,1234987,'contraseña','',2,2,1,7),(1010123457,'2012-06-14','ana','maria','flores','fuentes','hol12a@hola.com',1238764,1234987,'contraseña','',2,2,1,7),(1233695360,'1999-08-26','Daniel',NULL,'Gonzalez',NULL,'dagar9908@gmail.com',NULL,3144274735,'pbkdf2_sha256$600000$x27NK8x58B4BMnX1SiDpSB$HtDIIgj7CWg0CP3qZ90m22pdUeBs0lTTgu8NsRekhDE=',NULL,1,1,1,NULL),(1233695362,'1998-05-20','Antonio',NULL,'Reyes',NULL,'antonioreyes@gmail.com',NULL,3124585818,'pedritoreyes',NULL,1,1,1,NULL),(1239431881,'1991-12-23','pepo',NULL,'pepazo',NULL,'a.zaa54osa1@larasde.com',NULL,7832551,'seta',NULL,1,1,1,7),(1294231881,'1991-12-23','pepo',NULL,'pepazo',NULL,'a.zaaa54oa1@larasde.com',NULL,7832551,'seta',NULL,1,1,1,7);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-06 16:35:52
