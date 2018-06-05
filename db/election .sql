-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2018 at 10:19 PM
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
(4, 'Second year 201718', 1),
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
  `batch_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `election_period_id`, `position_id`, `student_id`, `faculty_id`, `batch_id`) VALUES
(1, 1, 1, 3, NULL, NULL),
(2, 1, 1, 4, NULL, NULL),
(3, 1, 2, 1, 1, NULL),
(4, 1, 3, 11, 4, 4),
(5, 1, 1, 10, NULL, NULL),
(6, 1, 3, 7, 3, 5),
(7, 1, 3, 9, 3, 3),
(9, 1, 2, 5, 1, NULL),
(10, 1, 2, 8, 3, NULL),
(11, 1, 2, 14, 5, NULL),
(12, 1, 2, 12, 4, NULL),
(16, 1, 3, 6, 2, 3),
(17, 1, 3, 13, 1, 5),
(18, 1, 3, 15, 1, 5),
(19, 1, 3, 17, 5, 3);

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
(16, '(BSc.Econ-P&D)', 3, 3),
(17, 'BSc.Econ-PPM', 3, 3),
(18, 'BPA-RAM', 3, 5),
(19, 'BPA', 3, 5),
(20, 'BECA', 3, 3),
(21, 'BEEM', 3, 3),
(22, 'BELM', 3, 3),
(23, 'BLGM', 3, 5),
(24, 'Bachelor of Science in Mathematics and ICT with Education(BSc.MIST-EDU)', 3, 1),
(25, 'BSc.Econ-EPP', 3, 3),
(26, 'Certificate in Information Technology(CICT)', 1, 1),
(27, 'Certificate in Library and Information Management(CLIM)', 1, 1),
(28, 'Certificate in Law(CL)', 1, 2),
(29, 'CLGM', 1, 5),
(30, 'Diploma in Information Technology(DIT)', 2, 1),
(31, 'Diploma in Applied Statistics(DAS)', 2, 1),
(41, 'LL.M International Law', 2, 2),
(42, 'Bachelor of Laws(LLB)', 3, 2),
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
(56, 'MSc.MM', 2, 4),
(57, 'MSc.PPM', 2, 3),
(58, 'MSc.PSCM', 2, 3),
(59, 'LL.M in Commercial Law', 2, 2),
(60, 'LL.M in Constitutional and Administrative Law', 2, 2),
(61, 'MSc.A&F', 2, 4),
(62, 'MSc.PSCM', 2, 4),
(63, 'MSc.Enterprenuership', 2, 4),
(64, 'BMC', 1, 4),
(65, 'CLGM', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `election_period`
--

CREATE TABLE `election_period` (
  `id` int(10) NOT NULL,
  `period` varchar(255) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `election_period`
--

INSERT INTO `election_period` (`id`, `period`, `start_time`, `end_time`, `is_active`) VALUES
(1, 'Election 2018', '2018-06-05 09:00:00', '2019-06-12 07:00:00', 1);

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
(5, 'school  of public administration and management');

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
  `reg_number` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `admission_date` date NOT NULL,
  `faculty_id` int(10) NOT NULL,
  `course_id` int(10) NOT NULL,
  `batch_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `reg_number`, `first_name`, `last_name`, `admission_date`, `faculty_id`, `course_id`, `batch_id`, `user_id`) VALUES
(1, '13303003/T.15', 'JOYCE', 'KAPESA', '2015-11-30', 1, 1, 5, 1),
(2, '15290371/T.17', 'JACKLINE ', 'KAAYA', '2017-11-30', 1, 1, 5, 18),
(3, '13303001/T.15', 'BONIPHACE', 'MAFURU', '2017-11-30', 1, 1, 5, 2),
(4, '13303008/T.15', 'STOGELWA', 'MGONGOLWA', '2015-11-30', 1, 1, 5, 3),
(5, '13303012/T.16', 'DEOGRATIUS', 'KIBAJI', '2016-11-30', 1, 1, 5, 4),
(6, '13303015/T.17', 'AMEDEUS', 'MINJA', '2017-11-30', 2, 42, 3, 5),
(7, '13303043/T.15', 'HALIMA', 'MAPANDE', '2015-11-30', 3, 21, 5, 6),
(8, '13303037/T.16', 'EMMANUEL ', 'LAWTON', '2016-11-30', 3, 20, 4, 10),
(9, '13303017/T.17', 'EMMANUEL', 'SIMBA', '2017-11-30', 3, 22, 3, 11),
(10, '13303005/T.15', 'GEORGE', 'FELIX', '2015-11-30', 4, 15, 5, 12),
(11, '13303002/T.16', 'SAID', 'RASHID', '2016-11-30', 4, 12, 4, 13),
(12, '13306034/T.17', 'IRENE', 'MVUNGI', '2017-11-30', 4, 10, 3, 14),
(13, '13306026/T.16', 'CHRISTERBERRY', 'SHIGELA', '2016-11-30', 1, 4, 4, 8),
(14, '12345678/T.15', 'ZABIBU', 'MACHUNGWA', '2015-11-30', 5, 18, 5, 15),
(15, '15274893/T.16', 'HALIMA', 'MARINGO', '2016-11-30', 5, 9, 4, 16),
(16, '1302122/T.15', 'NICHOLAUS', 'MOKOKI', '2015-11-30', 4, 12, 5, 7),
(17, '12397403/T.17', 'JANETH', 'KYEJUMBA', '2017-11-30', 5, 8, 3, 19),
(18, '1302132/T.15', 'JONES', 'NJELEKELA', '2015-11-30', 1, 24, 5, 9),
(19, '1302129/T.16', 'IDDI', 'MAHUNDA', '2016-11-30', 5, 19, 4, 17),
(20, '13303025/T.15', 'FLORENCE', 'ESAU', '2017-11-30', 1, 1, 3, 20);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_first_time_login` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `is_first_time_login`) VALUES
(1, 'joy', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1),
(2, 'student1', '2439e0457579ab4fd962cbd80b9206aca794cc38', 1),
(3, 'student2', 'c241e7b7811ffbe3faba5b193717a46f9643eab1', 1),
(4, 'student3', '32be4bedbd3a8539503a9bbbe72f9d84956affa1', 1),
(5, 'student4', 'student4', 1),
(6, 'admin', 'admin', 1),
(7, 'student15', 'student15', 1),
(8, 'student16', 'student16', 1),
(9, 'student17', 'student17', 1),
(10, 'student5', 'student5', 1),
(11, 'student6', 'student6', 1),
(12, 'student7', 'student7', 1),
(13, 'student8', 'student8', 1),
(14, 'student9', 'student9', 1),
(15, 'student10', 'student10', 1),
(16, 'student11', 'student11', 1),
(17, 'student12', 'student12', 1),
(18, 'student13', 'student13', 1),
(19, 'student14', 'student14', 1),
(20, 'student18', 'student18', 1);

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
(46, 1, 1, 1, 1, '2018-06-05 12:55:44'),
(47, 1, 2, 1, 9, '2018-06-05 12:55:44'),
(48, 1, 3, 1, 17, '2018-06-05 12:55:44');

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

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
