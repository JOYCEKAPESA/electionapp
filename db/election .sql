-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2018 at 12:04 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `election`
--

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` int(10) NOT NULL,
  `batch_name` varchar(255) NOT NULL,
  `course_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`id`, `batch_name`, `course_id`) VALUES
(3, 'First year 2017/18', 1),
(4, 'Second year 2017/18', 1),
(5, 'Third year 2017/18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` int(10) NOT NULL,
  `election_period_id` int(10) NOT NULL,
  `position_id` int(10) NOT NULL,
  `student_id` int(11) NOT NULL,
  `faculty_id` int(10) DEFAULT NULL,
  `course_id` int(10) DEFAULT NULL,
  `batch_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `election_period_id`, `position_id`, `student_id`, `faculty_id`, `course_id`, `batch_id`) VALUES
(1, 1, 1, 3, NULL, NULL, NULL),
(2, 1, 1, 4, NULL, NULL, NULL),
(3, 1, 2, 8, 1, 1, 5),
(4, 1, 3, 6, 1, 1, 4),
(5, 1, 1, 5, NULL, NULL, NULL),
(6, 1, 3, 7, 1, 1, 5),
(7, 1, 2, 9, 1, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(10) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `years_to_complete` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `years_to_complete`, `faculty_id`) VALUES
(1, 'B.Sc in Information and commmunication Technology with Business(ICT-B) ', 3, 1),
(2, 'B.Sc in Information and commmunication Technology with Management(ICT-M)', 3, 1),
(3, 'Bsc in Information Technology and Systems', 3, 1),
(4, 'Production Operation Management', 3, 1),
(5, 'Industrial Engineering Management', 3, 1),
(6, 'Applied Statistics', 3, 1),
(7, 'Library Information Management', 3, 1),
(8, 'BHSM', 3, 5),
(9, 'BHRM', 3, 5),
(10, 'BBA-MKT', 3, 4),
(12, 'BBA-ED', 3, 4),
(13, 'BBA-PLM', 3, 4),
(14, 'BAF-PS', 3, 4),
(15, 'BAF-BS', 3, 4),
(16, 'P&D', 3, 3),
(17, 'PPM', 3, 3),
(18, 'BPA-RAM', 3, 5),
(19, 'BPA', 3, 5),
(20, 'BECA', 3, 3),
(21, 'BEEM', 3, 3),
(22, 'BELM', 3, 3),
(23, 'BLGM', 3, 5),
(24, 'EDU(MIST)', 3, 1),
(25, 'EPP', 3, 3),
(26, 'CICT', 1, 1),
(27, 'CLIM', 1, 1),
(28, 'CL', 1, 2),
(29, 'CLGM', 1, 5),
(30, 'DIT', 2, 1),
(31, 'DAS', 2, 1),
(41, 'LL.M-CL', 2, 2),
(42, 'LLB', 3, 2),
(43, 'MA-EDU', 2, 3),
(44, 'MBA-CM', 2, 4),
(45, 'MHSM', 2, 5),
(46, 'MPA', 2, 3),
(47, 'MRPP', 2, 3),
(48, 'MSc.A&E', 2, 3),
(49, 'MSc.DP', 2, 3),
(50, 'MSc.ECON', 2, 3),
(51, 'MSc.EM', 2, 3),
(52, 'MSc.ENTER', 2, 3),
(53, 'MSc.EPP', 2, 3),
(54, 'MSc.HME', 2, 5),
(55, 'MSc.HRM', 2, 5),
(56, 'MSc.MKT', 2, 4),
(57, 'MSc.PPM', 2, 3),
(58, 'MSc.PSCM', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `election_period`
--

CREATE TABLE `election_period` (
  `id` int(10) NOT NULL,
  `period` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `election_period`
--

INSERT INTO `election_period` (`id`, `period`) VALUES
(1, 'Election 2018');

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `id` int(10) NOT NULL,
  `faculty_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`id`, `faculty_name`) VALUES
(1, 'Faculty of Science and Technology(FST)'),
(2, 'Faculty of Law'),
(3, 'Faculty of social science'),
(4, 'School of Business'),
(5, 'School of Public Administration and management');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` int(10) NOT NULL,
  `position_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `position_name`) VALUES
(1, 'Presidents'),
(2, 'Senators'),
(3, 'Faculty Representatives');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(10) NOT NULL,
  `Registration_number` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `Admission_date` date NOT NULL,
  `faculty_id` int(10) NOT NULL,
  `course_id` int(10) NOT NULL,
  `batch_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `Registration_number`, `first_name`, `last_name`, `Admission_date`, `faculty_id`, `course_id`, `batch_id`, `user_id`) VALUES
(1, '13303003/T.15', 'JOYCE', 'KAPESA', '2015-11-30', 1, 1, 5, 1),
(3, '13303001/T.15', 'BONIPHACE', 'MAFURU', '2015-11-30', 1, 1, 5, 2),
(4, '13303008/T.15', 'SITOGELWA', 'MGONGOLWA', '2015-11-30', 1, 1, 5, 3),
(5, '13303012/T.15', 'DEOGRATIUS', 'KIBAJI', '2015-11-30', 1, 1, 5, 4),
(6, '13303015/T.15', 'AMEDEUS', 'MINJA', '2015-11-30', 1, 1, 5, 5),
(7, '13303043/T.15', 'HALIMA', 'MAPANDE', '2015-11-30', 1, 1, 5, 6),
(8, '13303037/T.15', 'EMMANUEL ', 'LAWTON', '2015-11-30', 1, 1, 5, 10),
(9, '13303017/T.15', 'EMMANUEL', 'SIMBA', '2015-11-30', 1, 1, 5, 11),
(10, '13303005/T.15', 'GEORGE', 'FELIX', '2015-11-30', 1, 1, 5, 12),
(11, '13303002/T.15', 'SAID', 'RASHID', '2015-11-30', 1, 1, 5, 13),
(12, '13306034/T.15', 'IRENE', 'MVUNGI', '2015-11-30', 1, 4, 5, 14),
(13, '13306026/t.15', 'CHRISTERBERRY', 'SHIGELA', '2015-11-30', 1, 4, 5, 14),
(14, '12345678/T.16', 'ZABIBU', 'MACHUNGWA', '2016-12-26', 4, 10, 4, 15),
(15, '15274893/T.16', 'HALIMA', 'MARINGO', '2016-12-26', 5, 9, 4, 16);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'joy', '7c4a8d09ca3762af61e59520943dc26494f8941b'),
(2, 'student1', '2439e0457579ab4fd962cbd80b9206aca794cc38'),
(3, 'student2', 'c241e7b7811ffbe3faba5b193717a46f9643eab1'),
(4, 'student3', '32be4bedbd3a8539503a9bbbe72f9d84956affa1'),
(5, 'student4', 'student4'),
(6, 'admin', 'admin'),
(10, 'student5', 'student5'),
(11, 'student6', 'student6'),
(12, 'student7', 'student7'),
(13, 'student8', 'student8'),
(14, 'student9', 'student9'),
(15, 'student10', 'student10'),
(16, 'student11', 'student11'),
(17, 'student12', 'student12'),
(18, 'student13', 'student13'),
(19, 'student14', 'student14');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `positon_id` int(10) NOT NULL,
  `election_period_id` int(10) NOT NULL,
  `candidate_id` int(10) NOT NULL,
  `voted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `user_id`, `positon_id`, `election_period_id`, `candidate_id`, `voted_at`) VALUES
(50, 1, 1, 1, 2, '2018-05-02 00:13:27'),
(51, 1, 2, 1, 7, '2018-05-02 00:13:27'),
(52, 1, 3, 1, 6, '2018-05-02 00:13:27'),
(53, 1, 1, 1, 2, '2018-05-02 00:44:28'),
(54, 1, 2, 1, 7, '2018-05-02 00:44:29'),
(55, 1, 3, 1, 6, '2018-05-02 00:44:29'),
(56, 1, 1, 1, 2, '2018-05-02 00:49:00'),
(57, 1, 2, 1, 7, '2018-05-02 00:49:00'),
(58, 1, 3, 1, 6, '2018-05-02 00:49:00'),
(59, 1, 1, 1, 2, '2018-05-02 00:49:31'),
(60, 1, 2, 1, 7, '2018-05-02 00:49:31'),
(61, 1, 3, 1, 6, '2018-05-02 00:49:31'),
(62, 1, 1, 1, 2, '2018-05-02 00:49:47'),
(63, 1, 2, 1, 7, '2018-05-02 00:49:47'),
(64, 1, 3, 1, 6, '2018-05-02 00:49:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `batch_id` (`batch_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `election_period_id` (`election_period_id`),
  ADD KEY `faculty_id` (`faculty_id`),
  ADD KEY `position_id` (`position_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faculty_id` (`faculty_id`);

--
-- Indexes for table `election_period`
--
ALTER TABLE `election_period`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faculty_id` (`faculty_id`),
  ADD KEY `batch_id` (`batch_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `students_ibfk_4` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `positon_id` (`positon_id`),
  ADD KEY `election_period_id` (`election_period_id`),
  ADD KEY `votes_ibfk_4` (`candidate_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `election_period`
--
ALTER TABLE `election_period`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `batches`
--
ALTER TABLE `batches`
  ADD CONSTRAINT `batches_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `candidates`
--
ALTER TABLE `candidates`
  ADD CONSTRAINT `candidates_ibfk_1` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidates_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidates_ibfk_3` FOREIGN KEY (`election_period_id`) REFERENCES `election_period` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidates_ibfk_4` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidates_ibfk_5` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidates_ibfk_6` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `students_ibfk_3` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `students_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `votes_ibfk_2` FOREIGN KEY (`positon_id`) REFERENCES `positions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `votes_ibfk_3` FOREIGN KEY (`election_period_id`) REFERENCES `election_period` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `votes_ibfk_4` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
