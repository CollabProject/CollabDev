

--
-- Database: `Collaborative Development`
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

-- --------------------------------------------------------

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
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `CD_Visit`
--
ALTER TABLE `CD_Visit`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `CD_Visit_Question`
--
ALTER TABLE `CD_Visit_Question`
  ADD PRIMARY KEY (`Id`);
