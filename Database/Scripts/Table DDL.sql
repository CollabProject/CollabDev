-- phpMyAdmin SQL Dump
-- version 4.6.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 05, 2018 at 07:07 AM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `db1501450`
--

-- --------------------------------------------------------

--
-- Table structure for table `CD_Answer`
--

CREATE TABLE `CD_Answer` (
  `Id` int(11) NOT NULL,
  `QuestionId` int(11) NOT NULL,
  `Text` varchar(500) NOT NULL,
  `IsCorrect` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CD_Course`
--

CREATE TABLE `CD_Course` (
  `Id` int(11) NOT NULL,
  `Code` varchar(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CD_Player`
--

CREATE TABLE `CD_Player` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CD_Question`
--

CREATE TABLE `CD_Question` (
  `Id` int(11) NOT NULL,
  `CourseId` int(11) NOT NULL,
  `Text` varchar(500) NOT NULL,
  `Level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CD_Visit`
--

CREATE TABLE `CD_Visit` (
  `Id` int(11) NOT NULL,
  `PlayerId` int(11) NOT NULL,
  `DateTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CD_Visit_Question`
--

CREATE TABLE `CD_Visit_Question` (
  `Id` int(11) NOT NULL,
  `VisitId` int(11) NOT NULL,
  `QuestionId` int(11) NOT NULL,
  `AnswerId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CD_Answer`
--
ALTER TABLE `CD_Answer`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_question_answer` (`QuestionId`);

--
-- Indexes for table `CD_Course`
--
ALTER TABLE `CD_Course`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `CD_Player`
--
ALTER TABLE `CD_Player`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `CD_Question`
--
ALTER TABLE `CD_Question`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_course_question` (`CourseId`);

--
-- Indexes for table `CD_Visit`
--
ALTER TABLE `CD_Visit`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_player_visit` (`PlayerId`);

--
-- Indexes for table `CD_Visit_Question`
--
ALTER TABLE `CD_Visit_Question`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_visit_visitquestion` (`VisitId`),
  ADD KEY `fk_answer_visitquestion` (`AnswerId`),
  ADD KEY `fk_question_visitquestion` (`QuestionId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CD_Answer`
--
ALTER TABLE `CD_Answer`
  ADD CONSTRAINT `fk_question_answer` FOREIGN KEY (`QuestionId`) REFERENCES `CD_Question` (`Id`);

--
-- Constraints for table `CD_Question`
--
ALTER TABLE `CD_Question`
  ADD CONSTRAINT `fk_course_question` FOREIGN KEY (`CourseId`) REFERENCES `CD_Course` (`Id`);

--
-- Constraints for table `CD_Visit`
--
ALTER TABLE `CD_Visit`
  ADD CONSTRAINT `fk_player_visit` FOREIGN KEY (`PlayerId`) REFERENCES `CD_Player` (`Id`);

--
-- Constraints for table `CD_Visit_Question`
--
ALTER TABLE `CD_Visit_Question`
  ADD CONSTRAINT `fk_answer_visitquestion` FOREIGN KEY (`AnswerId`) REFERENCES `CD_Answer` (`Id`),
  ADD CONSTRAINT `fk_question_visitquestion` FOREIGN KEY (`QuestionId`) REFERENCES `CD_Question` (`Id`),
  ADD CONSTRAINT `fk_visit_visitquestion` FOREIGN KEY (`VisitId`) REFERENCES `CD_Visit` (`Id`);
 
