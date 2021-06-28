-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Czas generowania: 28 Cze 2021, 20:06
-- Wersja serwera: 8.0.21
-- Wersja PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `groupmania`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `commentdislikes`
--

DROP TABLE IF EXISTS `commentdislikes`;
CREATE TABLE IF NOT EXISTS `commentdislikes` (
  `DislikeID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CommentID` int NOT NULL,
  `UserID` varchar(64) NOT NULL,
  PRIMARY KEY (`DislikeID`),
  UNIQUE KEY `DislikeID_UNIQUE` (`DislikeID`),
  KEY `commentdislikes_ibfk_1` (`CommentID`),
  KEY `commentdislikes_ibfk_2` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `commentlikes`
--

DROP TABLE IF EXISTS `commentlikes`;
CREATE TABLE IF NOT EXISTS `commentlikes` (
  `LikeID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `CommentID` int NOT NULL,
  `UserID` varchar(64) NOT NULL,
  PRIMARY KEY (`LikeID`),
  UNIQUE KEY `LikeID_UNIQUE` (`LikeID`),
  KEY `commentlikes_ibfk_1` (`CommentID`),
  KEY `commentlikes_ibfk_2` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `commentlikes`
--

INSERT INTO `commentlikes` (`LikeID`, `CommentID`, `UserID`) VALUES
(0000000026, 145, '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad'),
(0000000027, 177, '50b3d886-d80d-11eb-a333-00ffce3d4aad'),
(0000000028, 174, '50b3d886-d80d-11eb-a333-00ffce3d4aad'),
(0000000029, 176, '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad'),
(0000000030, 176, 'ab0bdcb1-d813-11eb-a333-00ffce3d4aad'),
(0000000031, 179, 'ab0bdcb1-d813-11eb-a333-00ffce3d4aad'),
(0000000032, 165, 'ab0bdcb1-d813-11eb-a333-00ffce3d4aad'),
(0000000033, 173, 'ab0bdcb1-d813-11eb-a333-00ffce3d4aad'),
(0000000034, 150, 'ab0bdcb1-d813-11eb-a333-00ffce3d4aad'),
(0000000035, 166, '73c2ed0e-d819-11eb-a333-00ffce3d4aad');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `CommentID` int NOT NULL AUTO_INCREMENT,
  `ParentID` int NOT NULL DEFAULT '0',
  `ReplyTo` varchar(15) DEFAULT NULL,
  `Comment` text NOT NULL,
  `UserID` varchar(64) NOT NULL,
  `PostID` varchar(64) NOT NULL,
  PRIMARY KEY (`CommentID`),
  UNIQUE KEY `CommentID_UNIQUE` (`CommentID`),
  KEY `comments_ibfk_1` (`UserID`),
  KEY `comments_ibfk_2` (`PostID`),
  KEY `comments_ibfk_3` (`ParentID`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `comments`
--

INSERT INTO `comments` (`CommentID`, `ParentID`, `ReplyTo`, `Comment`, `UserID`, `PostID`) VALUES
(145, 0, 'undefined', 'Type sth', '4e1496fa-9b51-11eb-8139-00155d7bc389', '828d1c82-9c75-11eb-8139-00155d7bc389'),
(150, 0, 'undefined', 'rferf', '4e1496fa-9b51-11eb-8139-00155d7bc389', 'a2a99b46-9c78-11eb-8139-00155d7bc389'),
(153, 0, 'undefined', 'sdsd', '3b2462a9-a1ce-11eb-99da-00ffce3d4aad', 'a2a99b46-9c78-11eb-8139-00155d7bc389'),
(158, 0, 'undefined', 'tgrttgtg', '77ba5b56-a1f8-11eb-99da-00ffce3d4aad', 'a2a99b46-9c78-11eb-8139-00155d7bc389'),
(159, 0, 'undefined', 'sdsd', '77ba5b56-a1f8-11eb-99da-00ffce3d4aad', 'dcbb96e5-a1f7-11eb-99da-00ffce3d4aad'),
(160, 0, 'undefined', 'fdf', '77ba5b56-a1f8-11eb-99da-00ffce3d4aad', '6cc2f8f8-a206-11eb-99da-00ffce3d4aad'),
(162, 0, 'undefined', 'fdf', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', '93818776-a207-11eb-99da-00ffce3d4aad'),
(163, 0, 'undefined', 'sdsd', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', '0e3d066d-d5d0-11eb-a333-00ffce3d4aad'),
(165, 0, 'undefined', 'grtyr', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', '20157fa6-d5d3-11eb-a333-00ffce3d4aad'),
(166, 0, 'undefined', 'sdsd', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', 'f25225f4-d5d6-11eb-a333-00ffce3d4aad'),
(167, 0, 'undefined', 'gertger', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', 'f25225f4-d5d6-11eb-a333-00ffce3d4aad'),
(168, 0, 'undefined', 'rgeaergerr', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', '828d1c82-9c75-11eb-8139-00155d7bc389'),
(169, 0, 'undefined', 'fdf', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', 'f25225f4-d5d6-11eb-a333-00ffce3d4aad'),
(170, 0, 'undefined', 'fdf', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', 'aa2b04d2-d5cf-11eb-a333-00ffce3d4aad'),
(171, 0, 'undefined', 'fdf', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', 'aa2b04d2-d5cf-11eb-a333-00ffce3d4aad'),
(172, 0, 'undefined', 'fdf', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', 'aa2b04d2-d5cf-11eb-a333-00ffce3d4aad'),
(173, 0, 'undefined', 'fewf', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', 'f25225f4-d5d6-11eb-a333-00ffce3d4aad'),
(174, 0, 'undefined', 'ewfre', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', 'f25225f4-d5d6-11eb-a333-00ffce3d4aad'),
(175, 0, 'undefined', 'rferfer', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', 'f25225f4-d5d6-11eb-a333-00ffce3d4aad'),
(176, 0, 'undefined', 'fdf', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', 'f25225f4-d5d6-11eb-a333-00ffce3d4aad'),
(177, 0, 'undefined', 'fdf', '50b3d886-d80d-11eb-a333-00ffce3d4aad', 'f25225f4-d5d6-11eb-a333-00ffce3d4aad'),
(178, 0, 'undefined', 'sdsd', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', '0ae6a0ba-a20c-11eb-99da-00ffce3d4aad'),
(179, 0, 'undefined', 'RWTW45T', 'ab0bdcb1-d813-11eb-a333-00ffce3d4aad', '20157fa6-d5d3-11eb-a333-00ffce3d4aad'),
(180, 0, 'undefined', 'sdsd', 'ab0bdcb1-d813-11eb-a333-00ffce3d4aad', 'f25225f4-d5d6-11eb-a333-00ffce3d4aad'),
(181, 0, 'undefined', 'fdf', 'ab0bdcb1-d813-11eb-a333-00ffce3d4aad', '29abb939-d819-11eb-a333-00ffce3d4aad'),
(182, 0, 'undefined', 'tgrwthw', 'ab0bdcb1-d813-11eb-a333-00ffce3d4aad', 'ce780394-a201-11eb-99da-00ffce3d4aad'),
(183, 0, 'undefined', 'sdsd', 'ab0bdcb1-d813-11eb-a333-00ffce3d4aad', '70f21d9e-a1fd-11eb-99da-00ffce3d4aad');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `postdislikes`
--

DROP TABLE IF EXISTS `postdislikes`;
CREATE TABLE IF NOT EXISTS `postdislikes` (
  `DislikeID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `PostID` varchar(64) NOT NULL,
  `UserID` varchar(64) NOT NULL,
  PRIMARY KEY (`DislikeID`),
  UNIQUE KEY `LikeID_UNIQUE` (`DislikeID`),
  KEY `postdislikes_ibfk_1` (`PostID`),
  KEY `postdislikes_ibfk_2` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `postdislikes`
--

INSERT INTO `postdislikes` (`DislikeID`, `PostID`, `UserID`) VALUES
(0000000087, '93818776-a207-11eb-99da-00ffce3d4aad', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad'),
(0000000088, 'aa2b04d2-d5cf-11eb-a333-00ffce3d4aad', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad'),
(0000000089, '20157fa6-d5d3-11eb-a333-00ffce3d4aad', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad'),
(0000000090, 'ef41132e-a209-11eb-99da-00ffce3d4aad', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `postlikes`
--

DROP TABLE IF EXISTS `postlikes`;
CREATE TABLE IF NOT EXISTS `postlikes` (
  `LikeID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `PostID` varchar(64) NOT NULL,
  `UserID` varchar(64) NOT NULL,
  PRIMARY KEY (`LikeID`),
  UNIQUE KEY `LikeID_UNIQUE` (`LikeID`),
  KEY `postlikes_ibfk_1` (`PostID`),
  KEY `postlikes_ibfk_2` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `postlikes`
--

INSERT INTO `postlikes` (`LikeID`, `PostID`, `UserID`) VALUES
(0000000217, '828d1c82-9c75-11eb-8139-00155d7bc389', '7674a925-9c21-11eb-8139-00155d7bc389'),
(0000000219, '828d1c82-9c75-11eb-8139-00155d7bc389', '4e1496fa-9b51-11eb-8139-00155d7bc389'),
(0000000222, 'a2a99b46-9c78-11eb-8139-00155d7bc389', '4e1496fa-9b51-11eb-8139-00155d7bc389'),
(0000000225, 'a2a99b46-9c78-11eb-8139-00155d7bc389', '3b2462a9-a1ce-11eb-99da-00ffce3d4aad'),
(0000000230, 'b6fae182-a20c-11eb-99da-00ffce3d4aad', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad'),
(0000000231, '67046c09-a20b-11eb-99da-00ffce3d4aad', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad'),
(0000000233, '0e3d066d-d5d0-11eb-a333-00ffce3d4aad', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad'),
(0000000235, 'f25225f4-d5d6-11eb-a333-00ffce3d4aad', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad'),
(0000000237, '5eb4d184-a20b-11eb-99da-00ffce3d4aad', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad'),
(0000000238, '77fc74f7-a201-11eb-99da-00ffce3d4aad', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad'),
(0000000241, '828d1c82-9c75-11eb-8139-00155d7bc389', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad'),
(0000000242, '7ff8dddf-a20a-11eb-99da-00ffce3d4aad', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad'),
(0000000243, '0ae6a0ba-a20c-11eb-99da-00ffce3d4aad', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad'),
(0000000244, 'ce780394-a201-11eb-99da-00ffce3d4aad', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad'),
(0000000245, 'acf502a1-a1ff-11eb-99da-00ffce3d4aad', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad'),
(0000000246, '1b64f932-a200-11eb-99da-00ffce3d4aad', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad'),
(0000000247, 'dcbb96e5-a1f7-11eb-99da-00ffce3d4aad', '50b3d886-d80d-11eb-a333-00ffce3d4aad'),
(0000000248, 'f25225f4-d5d6-11eb-a333-00ffce3d4aad', '50b3d886-d80d-11eb-a333-00ffce3d4aad'),
(0000000249, 'ef41132e-a209-11eb-99da-00ffce3d4aad', 'ab0bdcb1-d813-11eb-a333-00ffce3d4aad'),
(0000000250, 'f25225f4-d5d6-11eb-a333-00ffce3d4aad', 'ab0bdcb1-d813-11eb-a333-00ffce3d4aad'),
(0000000251, 'aa2b04d2-d5cf-11eb-a333-00ffce3d4aad', 'ab0bdcb1-d813-11eb-a333-00ffce3d4aad'),
(0000000252, '20157fa6-d5d3-11eb-a333-00ffce3d4aad', 'ab0bdcb1-d813-11eb-a333-00ffce3d4aad'),
(0000000254, '29abb939-d819-11eb-a333-00ffce3d4aad', '73c2ed0e-d819-11eb-a333-00ffce3d4aad'),
(0000000255, '923a1d1a-a1fe-11eb-99da-00ffce3d4aad', '73c2ed0e-d819-11eb-a333-00ffce3d4aad'),
(0000000256, '828d1c82-9c75-11eb-8139-00155d7bc389', '73c2ed0e-d819-11eb-a333-00ffce3d4aad'),
(0000000257, 'f25225f4-d5d6-11eb-a333-00ffce3d4aad', '73c2ed0e-d819-11eb-a333-00ffce3d4aad'),
(0000000258, '8cfc61ba-d819-11eb-a333-00ffce3d4aad', 'ab0bdcb1-d813-11eb-a333-00ffce3d4aad');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `PostID` varchar(64) NOT NULL DEFAULT (uuid()),
  `UserID` varchar(64) NOT NULL,
  `Title` text NOT NULL,
  `ImageURL` text NOT NULL,
  `DateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`PostID`),
  UNIQUE KEY `PostID_UNIQUE` (`PostID`),
  KEY `posts_ibfk_1` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `posts`
--

INSERT INTO `posts` (`PostID`, `UserID`, `Title`, `ImageURL`, `DateTime`, `Name`) VALUES
('0ae6a0ba-a20c-11eb-99da-00ffce3d4aad', '77ba5b56-a1f8-11eb-99da-00ffce3d4aad', 'Toothbrush and wake up robot', 'http://localhost:3000/images/jakub-rozalski-duck-hunting-airship-05(1).jpg1618945814142.jpg', '2021-04-20 19:10:17', 'hndtyedjyet'),
('0e3d066d-d5d0-11eb-a333-00ffce3d4aad', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', 'Make a tea', 'http://localhost:3000/images/2021-05-25_1936211.jpg1624637512673.jpg', '2021-06-25 16:11:53', ''),
('1b64f932-a200-11eb-99da-00ffce3d4aad', '77ba5b56-a1f8-11eb-99da-00ffce3d4aad', 'efwerfwe', 'http://localhost:3000/images/jakub-rozalski-1920-day-before-battles.jpg1618940687847.jpg', '2021-04-20 17:44:50', ''),
('20157fa6-d5d3-11eb-a333-00ffce3d4aad', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', 'New post', 'http://localhost:3000/images/2021-05-25_1936210_clean.jpg1624638829277.jpg', '2021-06-25 16:33:51', ''),
('29abb939-d819-11eb-a333-00ffce3d4aad', 'ab0bdcb1-d813-11eb-a333-00ffce3d4aad', '', 'http://localhost:3000/images/vinicius-amnx-amano-DZ0MfTX_9sQ-unsplash.jpg1624888814858.jpg', '2021-06-28 14:00:14', 'Adrian Nykiel POST'),
('3c70c85e-a202-11eb-99da-00ffce3d4aad', '2f4b44d4-a202-11eb-99da-00ffce3d4aad', 'New post', 'http://localhost:3000/images/jakub-rozalski-1920-emergency-landing.jpg1618941602293.jpg', '2021-04-20 18:00:05', 'ewewee'),
('5a7293be-a208-11eb-99da-00ffce3d4aad', '77ba5b56-a1f8-11eb-99da-00ffce3d4aad', 'grgrgrtg', 'http://localhost:3000/images/jakub-rozalski-1920-lumbering.jpg1618944229609.jpg', '2021-04-20 18:43:52', 'undefined'),
('5eb4d184-a20b-11eb-99da-00ffce3d4aad', '77ba5b56-a1f8-11eb-99da-00ffce3d4aad', 'Make a tea rffffffffffffffffffffffffffffffffffffffffffffffffffffffffff', 'http://localhost:3000/images/jakub-rozalski-unit-concept01a-side.jpg1618945525246.jpg', '2021-04-20 19:05:28', ''),
('67046c09-a20b-11eb-99da-00ffce3d4aad', '77ba5b56-a1f8-11eb-99da-00ffce3d4aad', 'Toothbrush and wake up robot3rr2r3', 'http://localhost:3000/images/jakub-rozalski-ancients-conceptart-06.jpg1618945539176.jpg', '2021-04-20 19:05:42', ''),
('6cc2f8f8-a206-11eb-99da-00ffce3d4aad', '77ba5b56-a1f8-11eb-99da-00ffce3d4aad', 'New post', 'http://localhost:3000/images/jakub-rozalski-1920-farewell-110x70small.jpg1618943401334.jpg', '2021-04-20 18:30:04', 'undefined'),
('70f21d9e-a1fd-11eb-99da-00ffce3d4aad', '77ba5b56-a1f8-11eb-99da-00ffce3d4aad', 'frerferfrf,', 'http://localhost:3000/images/jakub-rozalski-1920-day-before-battles.jpg1618939542881.jpg', '2021-04-20 17:25:45', 'undefined'),
('77fc74f7-a201-11eb-99da-00ffce3d4aad', '77ba5b56-a1f8-11eb-99da-00ffce3d4aad', 'New post', 'http://localhost:3000/images/jakub-rozalski-1920-day-before-battles.jpg1618941272687.jpg', '2021-04-20 17:54:35', ''),
('7ff8dddf-a20a-11eb-99da-00ffce3d4aad', '2f4b44d4-a202-11eb-99da-00ffce3d4aad', 'New post', 'http://localhost:3000/images/jakub-rozalski-1920-mech-on-the-field-100na70small.jpg1618945151556.jpg', '2021-04-20 18:59:14', ''),
('828d1c82-9c75-11eb-8139-00155d7bc389', '4e1496fa-9b51-11eb-8139-00155d7bc389', 'Topic 23', 'http://localhost:3000/images/jakub-rozalski-1920-mech-on-the-field-100na70small.jpg1618917628252.jpg', '2021-04-13 16:30:08', ''),
('8cfc61ba-d819-11eb-a333-00ffce3d4aad', '73c2ed0e-d819-11eb-a333-00ffce3d4aad', 'Test post', 'http://localhost:3000/images/james-pond-1qkyck-UL3g-unsplash.jpg1624888981450.jpg', '2021-06-28 14:03:01', 'Margarita'),
('923a1d1a-a1fe-11eb-99da-00ffce3d4aad', '77ba5b56-a1f8-11eb-99da-00ffce3d4aad', 'Topic 2,', 'http://localhost:3000/images/jakub-rozalski-1920-day-before-battles.jpg1618940028227.jpg', '2021-04-20 17:33:51', 'undefined'),
('93818776-a207-11eb-99da-00ffce3d4aad', '77ba5b56-a1f8-11eb-99da-00ffce3d4aad', 'regr', 'http://localhost:3000/images/jakub-rozalski-1920-mech-on-the-field-100na70small.jpg1618943895838.jpg', '2021-04-20 18:38:18', 'undefined'),
('a2a99b46-9c78-11eb-8139-00155d7bc389', '7674a925-9c21-11eb-8139-00155d7bc389', 'Make a tea', 'http://localhost:3000/images/25592.jpg1618332749448.jpg', '2021-04-13 16:52:30', ''),
('aa2b04d2-d5cf-11eb-a333-00ffce3d4aad', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', 'New post', 'http://localhost:3000/images/2021-05-14_1521120_clean.jpg1624637344787.jpg', '2021-06-25 16:09:05', ''),
('acf502a1-a1ff-11eb-99da-00ffce3d4aad', '77ba5b56-a1f8-11eb-99da-00ffce3d4aad', 'Topic 2,', 'http://localhost:3000/images/jakub-rozalski-1920-emergency-landing.jpg1618940502571.jpg', '2021-04-20 17:41:45', 'undefined'),
('b6fae182-a20c-11eb-99da-00ffce3d4aad', '77ba5b56-a1f8-11eb-99da-00ffce3d4aad', 'ferrefrererfer', 'http://localhost:3000/images/jakub-rozalski-1920-emergency-landing.jpg1618946102843.jpg', '2021-04-20 19:15:05', ''),
('ce780394-a201-11eb-99da-00ffce3d4aad', '77ba5b56-a1f8-11eb-99da-00ffce3d4aad', 'Make a tea', 'http://localhost:3000/images/jakub-rozalski-1920-farewell-110x70small.jpg1618941417776.jpg', '2021-04-20 17:57:00', ''),
('dcbb96e5-a1f7-11eb-99da-00ffce3d4aad', '3b2462a9-a1ce-11eb-99da-00ffce3d4aad', 'New post', 'http://localhost:3000/images/jakub-rozalski-wolfpack-winter01.jpg1618937146744.jpg', '2021-04-20 16:45:49', ''),
('dd160eb6-a1fb-11eb-99da-00ffce3d4aad', '77ba5b56-a1f8-11eb-99da-00ffce3d4aad', 'New post3434', 'http://localhost:3000/images/jakub-rozalski-1920-conscription-small.jpg1618938865330.jpg', '2021-04-20 17:14:28', ''),
('ef41132e-a209-11eb-99da-00ffce3d4aad', '77ba5b56-a1f8-11eb-99da-00ffce3d4aad', 'Toothbrush and wake up robotgfdssdfgvcxzxcv', 'http://localhost:3000/images/jakub-rozalski-stranger-on-the-strange-land.jpg1618944908751.jpg', '2021-04-20 18:55:11', ''),
('f25225f4-d5d6-11eb-a333-00ffce3d4aad', '7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', 'Topic 2323223232323233', 'http://localhost:3000/images/jakub-rozalski-duck-hunting-airship-05(1).jpg1624640470489.jpg', '2021-06-25 17:01:13', 'Adrian!!'),
('f3060be0-a205-11eb-99da-00ffce3d4aad', '2f4b44d4-a202-11eb-99da-00ffce3d4aad', 'New post', 'http://localhost:3000/images/jakub-rozalski-1920-day-before-battles.jpg1618943197077.jpg', '2021-04-20 18:26:40', 'undefined');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` varchar(64) NOT NULL DEFAULT (uuid()),
  `Username` varchar(15) NOT NULL,
  `Email` varchar(320) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` char(60) NOT NULL,
  `Name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `UserID_UNIQUE` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Email`, `Password`, `Name`) VALUES
('00a904b5-9147-11eb-ad35-00155d0ac078', 'test2', 'test2@test.com', '$2b$12$BX54OPfAzwjnASAN80WkTewXBc1CyFBMQKTFtxknD0KPvmQkWM/fG', ''),
('0ca9aa00-9149-11eb-ad35-00155d0ac078', 'test3', 'test3@test.com', '$2b$12$fdnspbgO/2N2Jr50iI43Ee4hBZfFN/n1NnHKzV6tPvXy8oHwTAl9a', 'Sample Name'),
('2f4b44d4-a202-11eb-99da-00ffce3d4aad', 'test21', 'test21@test.com', '$2b$12$NvEGEYOfYc/OucPnTYE6V.WfXsZuQQQkj50/YBrK/HQqaLDmYr4oG', 'Nykiel'),
('37d0ec24-bfbc-11eb-b56c-00ffce3d4aad', 'test15', 'test15@test.com', '$2b$12$bw7eK5rTnpn2hSIN/xtEUer1LDhTqGtMR7rT.Sp8ubTxcuIPUCBp.', 'Adrian'),
('3b2462a9-a1ce-11eb-99da-00ffce3d4aad', 'test10', 'test10@test.com', '$2b$12$wvT9dQ88oxotU5xkJhgkdOMVzZ4LDzA4SNl7.nJCHzHVYJ.tni.N6', 'Adrian'),
('451934d3-912b-11eb-ad35-00155d0ac078', 'test', 'test@test.com', '$2b$12$P01d4EuHZAl2VO1kwZkgXuADbRJNccJTb3o7LJuu43cUxRSbEKEry', ''),
('4e1496fa-9b51-11eb-8139-00155d7bc389', 'test5', 'test5@test.com', '$2b$12$Aqr2tEn0tWiD0NfwTdOnL.F.EJgJ8VrJFN14xHYF.72.fgaHhFWRe', ''),
('50b3d886-d80d-11eb-a333-00ffce3d4aad', 'adrian9211', 'adrian0809all@gmail.com', '$2b$12$HS1wn2Ximson6lRD.fScj.UpWNiwY.30C2NEltMgmv0IMDGKwtfIK', 'Adrian'),
('73c2ed0e-d819-11eb-a333-00ffce3d4aad', 'Margarita', 'Margarita@gmail.com', '$2b$12$4HyX07JvZ5WSXUwFfFj2P.cKvxUAlxByckPgB30DUYLt6BTHR.yWa', 'Margarita'),
('7674a925-9c21-11eb-8139-00155d7bc389', 'test6', 'test6@test.com', '$2b$12$QpPpCZADdwcAc/XY6HXryOymBxBqncBCQLSEvs6YCH1bkt.U8Qoo.', ''),
('77ba5b56-a1f8-11eb-99da-00ffce3d4aad', 'test20', 'test20@test.com', '$2b$12$omKkXTXLiFutpUoR4I85Q.CerwklzCzBkdvnTh3NSFNS9VI29WPga', 'Adrian'),
('7bf5f0b2-d5cf-11eb-a333-00ffce3d4aad', 'test30', 'test30@test.com', '$2b$12$Y/CHdwzHCgxfxJlVsfRmxOpx165VsGvGD5i.SXcAYDzebfDHNFvbu', 'test30'),
('ab0bdcb1-d813-11eb-a333-00ffce3d4aad', 'ffrrerferf', 'ffrrerferf@gmail.com', '$2b$12$aSiWI98q.vtD/A6OI/9Vre/H8ye0tkx9QF31q25FpW8jMY9Lo8Fou', 'rfref');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users` ADD FULLTEXT KEY `Name` (`UserID`,`Username`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `commentdislikes`
--
ALTER TABLE `commentdislikes`
  ADD CONSTRAINT `commentdislikes_ibfk_1` FOREIGN KEY (`CommentID`) REFERENCES `comments` (`CommentID`) ON DELETE CASCADE,
  ADD CONSTRAINT `commentdislikes_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `commentlikes`
--
ALTER TABLE `commentlikes`
  ADD CONSTRAINT `commentlikes_ibfk_1` FOREIGN KEY (`CommentID`) REFERENCES `comments` (`CommentID`) ON DELETE CASCADE,
  ADD CONSTRAINT `commentlikes_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`PostID`) REFERENCES `posts` (`PostID`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`ParentID`) REFERENCES `comments` (`CommentID`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `postdislikes`
--
ALTER TABLE `postdislikes`
  ADD CONSTRAINT `postdislikes_ibfk_1` FOREIGN KEY (`PostID`) REFERENCES `posts` (`PostID`) ON DELETE CASCADE,
  ADD CONSTRAINT `postdislikes_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `postlikes`
--
ALTER TABLE `postlikes`
  ADD CONSTRAINT `postlikes_ibfk_1` FOREIGN KEY (`PostID`) REFERENCES `posts` (`PostID`) ON DELETE CASCADE,
  ADD CONSTRAINT `postlikes_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
