-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                5.5.57 - MySQL Community Server (GPL)
-- Sunucu İşletim Sistemi:       linux-glibc2.12
-- HeidiSQL Sürüm:               9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- db165289_mates için veritabanı yapısı dökülüyor
CREATE DATABASE IF NOT EXISTS `db165289_mates` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db165289_mates`;

-- tablo yapısı dökülüyor db165289_mates.emails
CREATE TABLE IF NOT EXISTS `emails` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mail` char(100) NOT NULL,
  `datecreated` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- db165289_mates.emails: ~12 rows (yaklaşık) tablosu için veriler indiriliyor
DELETE FROM `emails`;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
INSERT INTO `emails` (`ID`, `mail`, `datecreated`) VALUES
	(1, 'test@test.com', '2017-06-03 19:02:44'),
	(2, 'tarkan@mate.com', '2017-06-03 19:27:21'),
	(3, 'tarkan.kaya@xn--gmal-nza.com', '2017-06-03 19:27:37'),
	(4, 'test@gmail.com', '2017-06-04 14:05:54'),
	(5, 'yoncaosoy@yahoo.com', '2017-06-04 14:16:17'),
	(6, 'mobilden@test.com', '2017-06-07 14:21:09'),
	(7, 'aq@aq.COm', '2017-07-12 17:33:39'),
	(8, 'test.1@test.com', '2017-08-12 13:00:17'),
	(9, 'test1.@test.com', '2017-08-12 13:01:15'),
	(10, 'TEST.@TEDX.COM', '2017-08-12 13:02:58'),
	(11, 'TEST.CIN@xn--cim-9dc.cim', '2017-08-12 13:04:06'),
	(12, 'canererdogan1@gmail.com', '2017-06-09 18:28:16');
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;

-- yöntem yapısı dökülüyor db165289_mates.spAddMail
DELIMITER //
CREATE DEFINER="root"@"%" PROCEDURE spAddMail(
	IN _mail VARCHAR(100)
)
BEGIN
	INSERT INTO emails (mail,datecreated) 
	SELECT _mail,now() FROM emails 
	WHERE NOT EXISTS (SELECT * FROM emails
	      WHERE mail=_mail) 
	LIMIT 1;
END//
DELIMITER ;

-- yöntem yapısı dökülüyor db165289_mates.spGetMails
DELIMITER //
CREATE DEFINER="root"@"%" PROCEDURE spGetMails()
BEGIN
	select * from emails;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
