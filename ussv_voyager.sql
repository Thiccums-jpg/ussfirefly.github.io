-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 07, 2025 at 03:27 PM
-- Server version: 10.11.14-MariaDB-ubu2204
-- PHP Version: 8.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `usss_serenity`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CleanupExpiredMessages` ()   BEGIN
        DELETE FROM crew_messages WHERE expires_at < NOW();
        SELECT ROW_COUNT() as deleted_count;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `auditor_assignments`
--

CREATE TABLE `auditor_assignments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assigned_by_user_id` int(11) NOT NULL,
  `assigned_at` timestamp NULL DEFAULT current_timestamp(),
  `revoked_at` timestamp NULL DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `auditor_assignments`
--

INSERT INTO `auditor_assignments` (`id`, `user_id`, `assigned_by_user_id`, `assigned_at`, `revoked_at`, `notes`, `is_active`) VALUES
(1, 34, 34, '2025-08-22 16:08:35', '2025-08-22 16:10:51', 'auditor', 0);

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('Medal','Ribbon','Badge','Grade') NOT NULL,
  `specialization` varchar(50) DEFAULT NULL,
  `description` text NOT NULL,
  `requirements` text DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `order_precedence` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `awards`
--

INSERT INTO `awards` (`id`, `name`, `type`, `specialization`, `description`, `requirements`, `image_url`, `order_precedence`, `created_at`, `updated_at`) VALUES
(1, 'Christopher Pike Medal of Valor', 'Medal', 'Command', 'The single greatest medal any Commanding Officer can achieve. Awarded to those who have given their life, blood, sweat and tears for our Federation.', 'Character must have been in a commanding role (XO/CPT)', NULL, 1, '2025-08-22 13:09:42', '2025-08-22 15:40:51'),
(2, 'The Star Cross Medal', 'Medal', NULL, 'Consistent excellence as a Starfleet officer above and beyond what is expected', NULL, NULL, 2, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(3, 'The Purple Heart Medal', 'Medal', NULL, 'Bravery and sacrifice in the line of duty', NULL, NULL, 3, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(4, 'Medal of Honour', 'Medal', NULL, 'Incredible display of ability as a Starfleet officer on board the USS Serenity', NULL, NULL, 4, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(5, 'Starfleet Expeditionary Medal', 'Medal', NULL, 'For Completing a 5 year exploration mission', NULL, NULL, 5, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(6, 'James T Kirk Explorers Medal', 'Medal', NULL, 'Impressive display while performing acts of exploration', NULL, NULL, 6, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(7, 'Jonathan Archer Peace Medal', 'Medal', NULL, 'Advanced and successful negotiation abilities', NULL, NULL, 7, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(8, 'Silver Palm of Anaxar Medal', 'Medal', NULL, 'Admirable humanitarian efforts', NULL, NULL, 8, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(9, 'Four Palm Leaf Medal', 'Medal', NULL, 'Excellence during First Contact', NULL, NULL, 9, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(10, 'Diplomacy Achievement Medal', 'Medal', NULL, 'Diplomatic Achievement', NULL, NULL, 10, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(11, 'Montgomery Scott Medal', 'Medal', 'ENG/OPS', 'Excellence in Engineering or Operations', NULL, NULL, 11, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(12, 'Engineering Achievement Medal', 'Medal', 'ENG/OPS', 'Impressive display of Engineering or Operation ability', NULL, NULL, 12, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(13, 'The Zefram Cochrane Discovery Medal', 'Medal', 'Science', 'Brilliant Scientific advancement or discovery', NULL, NULL, 13, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(14, 'Daystrom Institute of Scientific Achievement Medal', 'Medal', 'Science', 'Excellence in the field of Science', NULL, NULL, 14, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(15, 'Starfleet Surgeons Medal', 'Medal', 'Medical', 'Excellence in the field of Medical', NULL, NULL, 15, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(16, 'Silver Lifesaving Medal', 'Medal', 'Medical', 'Impressive display of Medical ability', NULL, NULL, 16, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(17, 'Tactical Excellence Medal', 'Medal', 'SEC/TAC', 'Excellence in Security or Tactical', NULL, NULL, 17, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(18, 'Starfleet Investigative Excellence Medal', 'Medal', 'SEC/TAC', 'Admirable investigative work', NULL, NULL, 18, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(19, 'Expert Rifleman Badge', 'Badge', 'SEC/TAC', 'Prowess in use of a Type-3 Phaser', NULL, NULL, 19, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(20, 'Expert Pistol Badge', 'Badge', 'SEC/TAC', 'Prowess in the use of a Type-2 Phaser', NULL, NULL, 20, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(21, 'Hikaru Sulu Order of Tactics Medal', 'Medal', 'Helm', 'Excellence on the Helm station', NULL, NULL, 21, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(22, 'Distinguished Flying Cross Medal', 'Medal', 'Helm', 'Impressive display of Helm ability', NULL, NULL, 22, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(23, 'Five Star Medal', 'Medal', NULL, 'Conducting self as an exemplary Starfleet Officer', NULL, NULL, 23, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(24, 'Silver Star Medal', 'Medal', NULL, 'Having gone above and beyond the requirements for a Bronze Star Medal', 'Requires Bronze Star Medal', NULL, 24, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(25, 'Bronze Star Medal', 'Medal', NULL, 'Having gone above and beyond the requirements for a Good Conduct Medal', 'Requires Good Conduct Medal', NULL, 25, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(26, 'Good Conduct Medal', 'Medal', NULL, 'Shown patience, calm and generally good conduct whilst on duty', NULL, NULL, 26, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(27, 'Officers Commendation Ribbon', 'Ribbon', NULL, 'For those who have excelled as an Officer and have achieved maximum grade in their division', NULL, NULL, 27, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(28, 'Outstanding Unit Ribbon', 'Ribbon', NULL, 'For those who have excelled as an Enlisted and have achieved maximum grade in their division', NULL, NULL, 28, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(29, 'Engineering Efficiency Ribbon', 'Ribbon', 'ENG/OPS', 'Continues to show improvement and ability in Engineering or Operations', NULL, NULL, 29, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(30, 'Science Efficiency Ribbon', 'Ribbon', 'Science', 'Continues to show improvement and ability in Science', NULL, NULL, 30, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(31, 'Medical Efficiency Ribbon', 'Ribbon', 'Medical', 'Continues to show improvement and ability in Medical', NULL, NULL, 31, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(32, 'Tactical Efficiency Ribbon', 'Ribbon', 'SEC/TAC', 'Continues to show improvement and ability in Security or Tactical', NULL, NULL, 32, '2025-08-22 13:09:42', '2025-08-22 13:09:42'),
(33, 'Helm Efficiency Ribbon', 'Ribbon', 'Helm', 'Continues to show improvement and ability in Helm', NULL, NULL, 33, '2025-08-22 13:09:42', '2025-08-22 13:09:42');

-- --------------------------------------------------------

--
-- Table structure for table `award_recommendations`
--

CREATE TABLE `award_recommendations` (
  `id` int(11) NOT NULL,
  `recommended_person` varchar(255) NOT NULL,
  `recommended_award` varchar(255) NOT NULL,
  `justification` text NOT NULL,
  `submitted_by` varchar(255) NOT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `reviewed_by` varchar(255) DEFAULT NULL,
  `review_notes` text DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT current_timestamp(),
  `reviewed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `award_recommendations`
--

INSERT INTO `award_recommendations` (`id`, `recommended_person`, `recommended_award`, `justification`, `submitted_by`, `status`, `reviewed_by`, `review_notes`, `submitted_at`, `reviewed_at`) VALUES
(6, 'Captain Aidan Poe', 'Montgomery Scott Medal', ';', 'Captain Aidan Poe', 'Pending', NULL, NULL, '2025-08-22 23:32:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cargo_areas`
--

CREATE TABLE `cargo_areas` (
  `id` int(11) NOT NULL,
  `area_name` varchar(100) NOT NULL,
  `area_code` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `department_access` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `cargo_areas`
--

INSERT INTO `cargo_areas` (`id`, `area_name`, `area_code`, `description`, `department_access`, `created_at`) VALUES
(1, 'MED/SCI Double Shelf Unit ', 'MEDSCI', 'Large shelf unit for medical and scientific supplies', 'MED/SCI,ENG/OPS,COMMAND', '2025-08-20 15:35:35'),
(2, 'ENG/OPS Shelf Unit 1', 'ENGOPS1', 'Engineering and Operations storage shelf 1', 'ENG/OPS,COMMAND', '2025-08-20 15:35:35'),
(3, 'ENG/OPS Shelf Unit 2', 'ENGOPS2', 'Engineering and Operations storage shelf 2', 'ENG/OPS,COMMAND', '2025-08-20 15:35:35'),
(4, 'ENG/OPS Shelf Unit 3', 'ENGOPS3', 'Engineering and Operations storage shelf 3', 'ENG/OPS,COMMAND', '2025-08-20 15:35:35'),
(5, 'SEC/TAC Upper Level', 'SECTAC', 'Security and Tactical storage area on upper level', 'SEC/TAC,ENG/OPS,COMMAND', '2025-08-20 15:35:35'),
(6, 'Miscellaneous Items', 'MISC', 'General storage area for miscellaneous items', 'MED/SCI,ENG/OPS,SEC/TAC,COMMAND', '2025-08-20 15:35:35');

-- --------------------------------------------------------

--
-- Table structure for table `cargo_inventory`
--

CREATE TABLE `cargo_inventory` (
  `id` int(11) NOT NULL,
  `area_id` int(11) DEFAULT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_description` text DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `min_quantity` int(11) DEFAULT 5,
  `added_by` varchar(255) DEFAULT NULL,
  `added_department` varchar(100) DEFAULT NULL,
  `date_added` timestamp NULL DEFAULT current_timestamp(),
  `last_modified` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `unit_type` varchar(50) DEFAULT 'pieces'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cargo_logs`
--

CREATE TABLE `cargo_logs` (
  `id` int(11) NOT NULL,
  `inventory_id` int(11) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `quantity_change` int(11) DEFAULT NULL,
  `previous_quantity` int(11) DEFAULT NULL,
  `new_quantity` int(11) DEFAULT NULL,
  `performed_by` varchar(255) DEFAULT NULL,
  `performer_department` varchar(100) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `item_name_snapshot` varchar(255) DEFAULT NULL,
  `area_name_snapshot` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `cargo_logs`
--

INSERT INTO `cargo_logs` (`id`, `inventory_id`, `action`, `quantity_change`, `previous_quantity`, `new_quantity`, `performed_by`, `performer_department`, `reason`, `timestamp`, `item_name_snapshot`, `area_name_snapshot`) VALUES
(40, NULL, 'ADD', 6, 0, 6, 'Captain', 'Command', NULL, '2025-08-23 12:23:21', 'warp', 'ENG/OPS Shelf Unit 1');

-- --------------------------------------------------------

--
-- Table structure for table `character_auditor_assignments`
--

CREATE TABLE `character_auditor_assignments` (
  `id` int(11) NOT NULL,
  `roster_id` int(11) NOT NULL,
  `assigned_by_user_id` int(11) NOT NULL,
  `assigned_at` timestamp NULL DEFAULT current_timestamp(),
  `revoked_at` timestamp NULL DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `character_audit_trail`
--

CREATE TABLE `character_audit_trail` (
  `id` int(11) NOT NULL,
  `character_id` int(11) NOT NULL,
  `action_type` varchar(100) NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `record_id` int(11) NOT NULL,
  `additional_data` text DEFAULT NULL,
  `action_timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `command_suggestions`
--

CREATE TABLE `command_suggestions` (
  `id` int(11) NOT NULL,
  `suggestion_title` varchar(200) NOT NULL,
  `suggestion_description` text NOT NULL,
  `submitted_by` varchar(100) DEFAULT NULL,
  `status` enum('Open','Under Review','Implemented','Rejected') DEFAULT 'Open',
  `response` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crew_awards`
--

CREATE TABLE `crew_awards` (
  `id` int(11) NOT NULL,
  `roster_id` int(11) NOT NULL,
  `award_id` int(11) NOT NULL,
  `awarded_by_roster_id` int(11) DEFAULT NULL,
  `date_awarded` date NOT NULL,
  `citation` text DEFAULT NULL,
  `order_sequence` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crew_competencies`
--

CREATE TABLE `crew_competencies` (
  `id` int(11) NOT NULL,
  `roster_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `awarded_by` int(11) NOT NULL,
  `completion_date` date NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `certification_level` enum('Basic','Intermediate','Advanced','Expert') DEFAULT 'Basic',
  `notes` text DEFAULT NULL,
  `is_current` tinyint(1) DEFAULT 1,
  `awarded_at` timestamp NULL DEFAULT current_timestamp(),
  `assigned_by` int(11) DEFAULT NULL,
  `assigned_date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('assigned','in_progress','completed','expired') NOT NULL DEFAULT 'assigned',
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `completion_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crew_messages`
--

CREATE TABLE `crew_messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `sender_rank` varchar(100) DEFAULT NULL,
  `sender_department` varchar(100) DEFAULT NULL,
  `message` text NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp(),
  `is_deleted` tinyint(1) DEFAULT 0,
  `expires_at` datetime NOT NULL DEFAULT (current_timestamp() + interval 7 day)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crew_online_status`
--

CREATE TABLE `crew_online_status` (
  `user_id` int(11) NOT NULL,
  `character_name` varchar(255) DEFAULT NULL,
  `rank_name` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `last_seen` datetime DEFAULT current_timestamp(),
  `is_online` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `criminal_records`
--

CREATE TABLE `criminal_records` (
  `id` int(11) NOT NULL,
  `roster_id` int(11) NOT NULL,
  `incident_type` enum('Minor Infraction','Major Violation','Court Martial','Criminal Activity','Disciplinary Action') NOT NULL,
  `incident_date` date NOT NULL,
  `incident_description` text NOT NULL,
  `investigation_details` text DEFAULT NULL,
  `evidence_notes` text DEFAULT NULL,
  `punishment_type` enum('Verbal Warning','Written Reprimand','Loss of Privileges','Demotion','Confinement','Court Martial','Dismissal','Other') DEFAULT 'Verbal Warning',
  `punishment_details` text DEFAULT NULL,
  `punishment_duration` varchar(100) DEFAULT NULL,
  `investigating_officer` varchar(100) DEFAULT NULL,
  `reported_by` varchar(100) DEFAULT NULL,
  `status` enum('Under Investigation','Closed - Guilty','Closed - Not Guilty','Closed - Insufficient Evidence','Pending Review') DEFAULT 'Under Investigation',
  `classification` enum('Public','Restricted','Classified') DEFAULT 'Restricted',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deletion_audit`
--

CREATE TABLE `deletion_audit` (
  `id` int(11) NOT NULL,
  `deleted_by_user_id` int(11) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `record_id` int(11) NOT NULL,
  `record_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`record_data`)),
  `deletion_reason` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fault_reports`
--

CREATE TABLE `fault_reports` (
  `id` int(11) NOT NULL,
  `location_type` enum('Deck','Hull','Jefferies Tube') NOT NULL,
  `deck_number` int(11) DEFAULT NULL,
  `room` varchar(100) DEFAULT NULL,
  `jefferies_tube_number` varchar(50) DEFAULT NULL,
  `access_point` varchar(100) DEFAULT NULL,
  `fault_description` text NOT NULL,
  `reported_by_roster_id` int(11) DEFAULT NULL,
  `status` enum('Open','In Progress','Resolved') DEFAULT 'Open',
  `resolution_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `fault_reports`
--

INSERT INTO `fault_reports` (`id`, `location_type`, `deck_number`, `room`, `jefferies_tube_number`, `access_point`, `fault_description`, `reported_by_roster_id`, `status`, `resolution_description`, `created_at`, `updated_at`) VALUES
(7, '', 1, 'Section 1 Bridge', NULL, NULL, 'fire', NULL, 'Resolved', 'hklj', '2025-08-22 23:20:31', '2025-08-22 23:21:37'),
(8, '', 6, 'Section 3 Left Holodeck', NULL, NULL, 'Holodeck Waste Canisters need to be emptied, it&#039;s stinking up the medbay.', NULL, 'Resolved', '', '2025-08-27 14:50:16', '2025-09-20 21:53:39'),
(9, '', 11, '', NULL, NULL, 'Preliminary diagnostics indicate irregular power fluctuations within the internal systems. The affected subsystem intermittently fails to maintain stable output, likely caused by degraded isolinear relays or missing bio-neural gel packs. Further investigation is required to confirm the source of the fault and implement corrective action.', NULL, 'Open', NULL, '2025-09-20 22:04:44', '2025-09-20 22:04:44');

-- --------------------------------------------------------

--
-- Table structure for table `medical_records`
--

CREATE TABLE `medical_records` (
  `id` int(11) NOT NULL,
  `roster_id` int(11) NOT NULL,
  `condition_description` text NOT NULL,
  `treatment` text DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `reported_by` varchar(100) DEFAULT NULL,
  `status` enum('Open','In Progress','Resolved','Deceased') DEFAULT 'Open',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_reactions`
--

CREATE TABLE `message_reactions` (
  `id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reaction_type` varchar(50) NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roster`
--

CREATE TABLE `roster` (
  `id` int(11) NOT NULL,
  `rank` enum('Crewman 3rd Class','Crewman 2nd Class','Crewman 1st Class','Petty Officer 3rd class','Petty Officer 1st class','Chief Petty Officer','Senior Chief Petty Officer','Master Chief Petty Officer','Command Master Chief Petty Officer','Warrant officer','Ensign','Lieutenant Junior Grade','Lieutenant','Lieutenant Commander','Commander','Captain') NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `species` varchar(50) NOT NULL,
  `department` enum('Command','MED/SCI','ENG/OPS','SEC/TAC','Starfleet Auditor') NOT NULL,
  `roster_department` varchar(50) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `phaser_training` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('Active','Deceased','Missing','Transferred') DEFAULT 'Active',
  `date_of_death` date DEFAULT NULL,
  `cause_of_death` text DEFAULT NULL,
  `criminal_record_count` int(11) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `character_name` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `last_active` timestamp NULL DEFAULT NULL,
  `award_count` int(11) DEFAULT 0,
  `is_invisible` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `science_reports`
--

CREATE TABLE `science_reports` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `reported_by` varchar(100) DEFAULT NULL,
  `status` enum('Open','In Progress','Completed') DEFAULT 'Open',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `security_reports`
--

CREATE TABLE `security_reports` (
  `id` int(11) NOT NULL,
  `incident_type` enum('Crime','Security Concern','Arrest') NOT NULL,
  `description` text NOT NULL,
  `involved_roster_id` int(11) DEFAULT NULL,
  `reported_by` varchar(100) DEFAULT NULL,
  `status` enum('Open','Under Investigation','Resolved') DEFAULT 'Open',
  `resolution_notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training_access_log`
--

CREATE TABLE `training_access_log` (
  `id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `accessed_by` int(11) NOT NULL,
  `access_type` enum('view','download') NOT NULL,
  `access_date` timestamp NULL DEFAULT current_timestamp(),
  `user_agent` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training_audit`
--

CREATE TABLE `training_audit` (
  `id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `action` enum('upload','download','delete','restore','permanent_delete') NOT NULL,
  `performed_by` int(11) DEFAULT NULL,
  `character_name` varchar(100) DEFAULT NULL,
  `user_rank` varchar(50) DEFAULT NULL,
  `user_department` varchar(50) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `action_date` timestamp NULL DEFAULT current_timestamp(),
  `additional_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training_documents`
--

CREATE TABLE `training_documents` (
  `id` int(11) NOT NULL,
  `department` enum('MED/SCI','ENG/OPS','SEC/TAC','Command') NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` timestamp NULL DEFAULT NULL,
  `scheduled_deletion` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training_files`
--

CREATE TABLE `training_files` (
  `id` int(11) NOT NULL,
  `department` enum('MED/SCI','ENG/OPS','SEC/TAC','Command') NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `original_filename` varchar(255) NOT NULL,
  `file_size` int(11) NOT NULL,
  `file_type` varchar(100) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `upload_date` timestamp NULL DEFAULT current_timestamp(),
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` timestamp NULL DEFAULT NULL,
  `scheduled_deletion` timestamp NULL DEFAULT NULL,
  `download_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training_modules`
--

CREATE TABLE `training_modules` (
  `id` int(11) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_code` varchar(50) NOT NULL,
  `department` enum('MED/SCI','ENG/OPS','SEC/TAC','Command','All') NOT NULL,
  `description` text DEFAULT NULL,
  `prerequisites` text DEFAULT NULL,
  `certification_level` enum('Basic','Intermediate','Advanced','Expert') DEFAULT 'Basic',
  `is_active` tinyint(1) DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `training_modules`
--

INSERT INTO `training_modules` (`id`, `module_name`, `module_code`, `department`, `description`, `prerequisites`, `certification_level`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'First Aid Certification', 'MED-FA-001', 'MED/SCI', 'Basic medical emergency response and first aid procedures', NULL, 'Basic', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(2, 'Advanced Medical Training', 'MED-ADV-001', 'MED/SCI', 'Advanced medical procedures and emergency medicine', 'First Aid Certification', 'Advanced', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(3, 'Surgical Procedures', 'MED-SURG-001', 'MED/SCI', 'Surgical training and operating procedures', 'Advanced Medical Training', 'Expert', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(4, 'Xenobiology Studies', 'SCI-XENO-001', 'MED/SCI', 'Study of alien life forms and xenobiological protocols', NULL, 'Intermediate', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(5, 'Stellar Cartography', 'SCI-CART-001', 'MED/SCI', 'Star mapping and astronomical navigation', NULL, 'Intermediate', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(6, 'Warp Core Maintenance', 'ENG-WARP-001', 'ENG/OPS', 'Warp core systems maintenance and safety procedures', NULL, 'Intermediate', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(7, 'Transporter Operations', 'OPS-TRANS-001', 'ENG/OPS', 'Transporter system operation and safety protocols', NULL, 'Basic', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(8, 'Shield Systems', 'ENG-SHLD-001', 'ENG/OPS', 'Deflector shield operations and maintenance', NULL, 'Intermediate', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(9, 'Emergency Repairs', 'ENG-EMRG-001', 'ENG/OPS', 'Emergency engineering repair procedures', 'Warp Core Maintenance', 'Advanced', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(10, 'Computer Systems', 'OPS-COMP-001', 'ENG/OPS', 'Computer core maintenance and data management', NULL, 'Basic', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(11, 'Phaser Training', 'SEC-PHAS-001', 'SEC/TAC', 'Hand phaser operation and safety protocols', NULL, 'Basic', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(12, 'Tactical Systems', 'TAC-SYS-001', 'SEC/TAC', 'Ship tactical systems and weapons control', 'Phaser Training', 'Intermediate', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(13, 'Combat Training', 'SEC-COMB-001', 'SEC/TAC', 'Hand-to-hand combat and self-defense', NULL, 'Intermediate', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(14, 'Security Protocols', 'SEC-PROT-001', 'SEC/TAC', 'Ship security procedures and protocols', NULL, 'Basic', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(15, 'Boarding Party Operations', 'TAC-BOARD-001', 'SEC/TAC', 'Away team tactical operations', 'Combat Training,Phaser Training', 'Advanced', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(16, 'Bridge Operations', 'CMD-BRIDGE-001', 'Command', 'Bridge duty and command procedures', NULL, 'Intermediate', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(17, 'Leadership Training', 'CMD-LEAD-001', 'Command', 'Command leadership and decision making', NULL, 'Advanced', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(18, 'Starfleet Regulations', 'CMD-REG-001', 'Command', 'Starfleet regulations and protocols', NULL, 'Basic', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(19, 'Diplomatic Protocols', 'CMD-DIPL-001', 'Command', 'First contact and diplomatic procedures', 'Starfleet Regulations', 'Advanced', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(20, 'EVA Certification', 'ALL-EVA-001', 'All', 'Extra-vehicular activity and spacewalk certification', NULL, 'Intermediate', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(21, 'Emergency Procedures', 'ALL-EMRG-001', 'All', 'General emergency procedures and evacuation protocols', NULL, 'Basic', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(23, 'Cultural Sensitivity', 'ALL-CULT-001', 'All', 'Multi-species cultural awareness training', NULL, 'Basic', 1, 25, '2025-08-22 00:44:07', '2025-08-22 00:44:07'),
(138, 'Starfleet Academy Graduate', 'ALL-ACAD-001', 'All', 'Starfleet Academy graduation certification', NULL, 'Basic', 1, 25, '2025-08-22 01:10:55', '2025-08-22 01:10:55'),
(163, 'Helm Training', 'OPS-HML-01', 'ENG/OPS', 'Helm training', '', 'Expert', 1, 34, '2025-08-22 01:26:07', '2025-08-22 01:26:07'),
(164, 'Being a massive smack head', 'cracksmoking-101', 'MED/SCI', 'Smoking crack', '', 'Expert', 1, 34, '2025-08-22 01:30:51', '2025-08-22 01:30:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `steam_id` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `force_password_change` tinyint(1) DEFAULT 0,
  `active` tinyint(1) DEFAULT 1,
  `last_login` datetime DEFAULT NULL,
  `department` enum('Captain','Command','MED/SCI','ENG/OPS','SEC/TAC','Starfleet Auditor') NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `position` varchar(100) DEFAULT NULL,
  `rank` varchar(50) DEFAULT NULL,
  `roster_id` int(11) DEFAULT NULL,
  `active_character_id` int(11) DEFAULT NULL,
  `is_invisible` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `steam_id`, `password`, `force_password_change`, `active`, `last_login`, `department`, `first_name`, `last_name`, `created_at`, `updated_at`, `position`, `rank`, `roster_id`, `active_character_id`, `is_invisible`) VALUES
(23, 'Amse Gaila', '76561198130529390', '', 0, 1, '2025-09-29 20:37:40', 'Starfleet Auditor', '', '', '2025-08-19 22:27:42', '2025-09-29 20:37:40', NULL, NULL, NULL, 59, 0),
(24, 'Sanjeev Roghayeh', '76561198130529390', '', 0, 1, '2025-08-24 01:01:52', 'MED/SCI', '', '', '2025-08-20 00:05:03', '2025-09-29 20:30:57', NULL, NULL, NULL, 61, 0),
(25, 'Publius Nick', '76561198130529390', '', 0, 1, '2025-09-24 04:06:20', 'Command', '', '', '2025-08-20 05:18:28', '2025-09-29 20:31:08', NULL, NULL, NULL, 38, 0),
(26, 'Epicurus Gunda', '76561198130529390', '', 0, 1, '2025-08-25 11:13:50', 'MED/SCI', '', '', '2025-08-20 08:29:06', '2025-09-29 20:31:26', NULL, NULL, NULL, 39, 0),
(27, 'Ali Madilynn', '76561198130529390', '', 0, 1, '2025-08-22 18:13:51', 'SEC/TAC', '', '', '2025-08-20 09:04:43', '2025-09-29 20:31:36', NULL, NULL, NULL, 40, 0),
(29, 'Thirza Febe', '76561198130529390', '', 0, 1, '2025-09-01 08:27:08', 'MED/SCI', '', '', '2025-08-20 11:08:44', '2025-09-29 20:31:45', NULL, NULL, NULL, 42, 0),
(31, 'Anya Blossom', '76561198130529390', '', 0, 1, '2025-09-27 16:59:03', 'SEC/TAC', '', '', '2025-08-20 12:43:27', '2025-09-29 20:31:59', NULL, NULL, NULL, 45, 0),
(32, 'Benedikte Mahpiya', '76561198130529390', '', 0, 1, '2025-08-29 17:45:54', 'MED/SCI', '', '', '2025-08-20 21:38:46', '2025-09-29 20:32:07', NULL, NULL, NULL, 52, 0),
(33, 'Redmond Eadwulf', '76561198130529390', '', 0, 1, '2025-08-23 22:27:15', 'MED/SCI', '', '', '2025-08-21 03:05:18', '2025-09-29 20:32:50', NULL, NULL, NULL, 54, 0),
(34, 'Asterios Rasma', '76561198130529390', '', 0, 1, '2025-09-25 18:28:02', 'Command', '', '', '2025-08-22 00:29:42', '2025-09-29 20:33:03', NULL, NULL, NULL, 56, 0),
(35, 'Hilperic Sawyer', '76561198130529390', '', 0, 1, '2025-08-22 22:13:52', 'Command', '', '', '2025-08-22 21:01:10', '2025-09-29 20:33:12', NULL, NULL, NULL, 60, 0),
(37, 'Pate Lochlan', '76561198130529390', '', 0, 1, '2025-09-02 02:04:37', 'ENG/OPS', '', '', '2025-09-02 02:02:52', '2025-09-29 20:33:21', NULL, NULL, NULL, 65, 0),
(38, 'Yorick Vienna', '76561198130529390', '', 0, 1, '2025-09-03 11:53:37', 'ENG/OPS', '', '', '2025-09-02 13:22:14', '2025-09-29 20:33:31', NULL, NULL, NULL, 66, 0),
(39, 'Mwanahamisi Medine', '76561198130529390', '', 0, 1, '2025-09-03 12:47:23', 'ENG/OPS', '', '', '2025-09-03 11:54:02', '2025-09-29 20:33:43', NULL, NULL, NULL, 67, 0),
(40, 'Hariwini Chidike', '76561198130529390', '', 0, 1, '2025-09-20 22:06:46', 'ENG/OPS', '', '', '2025-09-20 21:03:14', '2025-09-29 20:33:54', NULL, NULL, NULL, 68, 0),
(41, 'Bara Milo', '76561198130529390', '', 0, 1, '2025-09-22 13:55:39', 'MED/SCI', '', '', '2025-09-22 13:51:19', '2025-09-29 20:34:03', NULL, NULL, NULL, 69, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auditor_assignments`
--
ALTER TABLE `auditor_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `assigned_by_user_id` (`assigned_by_user_id`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_award_name_type` (`name`,`type`,`specialization`);

--
-- Indexes for table `award_recommendations`
--
ALTER TABLE `award_recommendations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cargo_areas`
--
ALTER TABLE `cargo_areas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `area_code` (`area_code`);

--
-- Indexes for table `cargo_inventory`
--
ALTER TABLE `cargo_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_id` (`area_id`);

--
-- Indexes for table `cargo_logs`
--
ALTER TABLE `cargo_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cargo_logs_inventory` (`inventory_id`);

--
-- Indexes for table `character_auditor_assignments`
--
ALTER TABLE `character_auditor_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roster_id` (`roster_id`),
  ADD KEY `assigned_by_user_id` (`assigned_by_user_id`);

--
-- Indexes for table `character_audit_trail`
--
ALTER TABLE `character_audit_trail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_character_id` (`character_id`),
  ADD KEY `idx_action_timestamp` (`action_timestamp`);

--
-- Indexes for table `command_suggestions`
--
ALTER TABLE `command_suggestions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crew_awards`
--
ALTER TABLE `crew_awards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_award_per_person` (`roster_id`,`award_id`),
  ADD KEY `award_id` (`award_id`),
  ADD KEY `awarded_by_roster_id` (`awarded_by_roster_id`);

--
-- Indexes for table `crew_competencies`
--
ALTER TABLE `crew_competencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_competency` (`roster_id`,`module_id`),
  ADD KEY `awarded_by` (`awarded_by`),
  ADD KEY `idx_roster` (`roster_id`),
  ADD KEY `idx_module` (`module_id`),
  ADD KEY `idx_current` (`is_current`),
  ADD KEY `idx_expiry` (`expiry_date`),
  ADD KEY `fk_cc_assigned_by` (`assigned_by`);

--
-- Indexes for table `crew_messages`
--
ALTER TABLE `crew_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_timestamp` (`timestamp`),
  ADD KEY `idx_sender` (`sender_id`),
  ADD KEY `idx_expires_at` (`expires_at`);

--
-- Indexes for table `crew_online_status`
--
ALTER TABLE `crew_online_status`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `criminal_records`
--
ALTER TABLE `criminal_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roster_id` (`roster_id`);

--
-- Indexes for table `deletion_audit`
--
ALTER TABLE `deletion_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_table_record` (`table_name`,`record_id`),
  ADD KEY `idx_deleted_by` (`deleted_by_user_id`),
  ADD KEY `idx_deleted_at` (`deleted_at`);

--
-- Indexes for table `fault_reports`
--
ALTER TABLE `fault_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reported_by_roster_id` (`reported_by_roster_id`);

--
-- Indexes for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roster_id` (`roster_id`);

--
-- Indexes for table `message_reactions`
--
ALTER TABLE `message_reactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_reaction` (`message_id`,`user_id`,`reaction_type`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roster`
--
ALTER TABLE `roster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `science_reports`
--
ALTER TABLE `science_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `security_reports`
--
ALTER TABLE `security_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `involved_roster_id` (`involved_roster_id`);

--
-- Indexes for table `training_access_log`
--
ALTER TABLE `training_access_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accessed_by` (`accessed_by`),
  ADD KEY `idx_file_access` (`file_id`,`accessed_by`),
  ADD KEY `idx_access_date` (`access_date`);

--
-- Indexes for table `training_audit`
--
ALTER TABLE `training_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_file_id` (`file_id`),
  ADD KEY `idx_action` (`action`),
  ADD KEY `idx_date` (`action_date`),
  ADD KEY `fk_training_audit_user` (`performed_by`);

--
-- Indexes for table `training_documents`
--
ALTER TABLE `training_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `deleted_by` (`deleted_by`);

--
-- Indexes for table `training_files`
--
ALTER TABLE `training_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploaded_by` (`uploaded_by`),
  ADD KEY `deleted_by` (`deleted_by`),
  ADD KEY `idx_department` (`department`),
  ADD KEY `idx_deleted` (`is_deleted`),
  ADD KEY `idx_deletion_date` (`scheduled_deletion`);

--
-- Indexes for table `training_modules`
--
ALTER TABLE `training_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_code` (`module_code`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `idx_department` (`department`),
  ADD KEY `idx_active` (`is_active`),
  ADD KEY `idx_code` (`module_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fk_users_roster` (`roster_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auditor_assignments`
--
ALTER TABLE `auditor_assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `award_recommendations`
--
ALTER TABLE `award_recommendations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cargo_areas`
--
ALTER TABLE `cargo_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `cargo_inventory`
--
ALTER TABLE `cargo_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `cargo_logs`
--
ALTER TABLE `cargo_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `character_auditor_assignments`
--
ALTER TABLE `character_auditor_assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `character_audit_trail`
--
ALTER TABLE `character_audit_trail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `command_suggestions`
--
ALTER TABLE `command_suggestions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `crew_awards`
--
ALTER TABLE `crew_awards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `crew_competencies`
--
ALTER TABLE `crew_competencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `crew_messages`
--
ALTER TABLE `crew_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `criminal_records`
--
ALTER TABLE `criminal_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `deletion_audit`
--
ALTER TABLE `deletion_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fault_reports`
--
ALTER TABLE `fault_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `medical_records`
--
ALTER TABLE `medical_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `message_reactions`
--
ALTER TABLE `message_reactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roster`
--
ALTER TABLE `roster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `science_reports`
--
ALTER TABLE `science_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `security_reports`
--
ALTER TABLE `security_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `training_access_log`
--
ALTER TABLE `training_access_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `training_audit`
--
ALTER TABLE `training_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `training_documents`
--
ALTER TABLE `training_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `training_files`
--
ALTER TABLE `training_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `training_modules`
--
ALTER TABLE `training_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auditor_assignments`
--
ALTER TABLE `auditor_assignments`
  ADD CONSTRAINT `auditor_assignments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auditor_assignments_ibfk_2` FOREIGN KEY (`assigned_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cargo_inventory`
--
ALTER TABLE `cargo_inventory`
  ADD CONSTRAINT `cargo_inventory_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `cargo_areas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cargo_logs`
--
ALTER TABLE `cargo_logs`
  ADD CONSTRAINT `fk_cargo_logs_inventory` FOREIGN KEY (`inventory_id`) REFERENCES `cargo_inventory` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `character_auditor_assignments`
--
ALTER TABLE `character_auditor_assignments`
  ADD CONSTRAINT `character_auditor_assignments_ibfk_1` FOREIGN KEY (`roster_id`) REFERENCES `roster` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `character_auditor_assignments_ibfk_2` FOREIGN KEY (`assigned_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `crew_awards`
--
ALTER TABLE `crew_awards`
  ADD CONSTRAINT `crew_awards_ibfk_1` FOREIGN KEY (`roster_id`) REFERENCES `roster` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `crew_awards_ibfk_2` FOREIGN KEY (`award_id`) REFERENCES `awards` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `crew_awards_ibfk_3` FOREIGN KEY (`awarded_by_roster_id`) REFERENCES `roster` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `crew_competencies`
--
ALTER TABLE `crew_competencies`
  ADD CONSTRAINT `crew_competencies_ibfk_1` FOREIGN KEY (`roster_id`) REFERENCES `roster` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `crew_competencies_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `training_modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cc_assigned_by` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_cc_module` FOREIGN KEY (`module_id`) REFERENCES `training_modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cc_roster_new` FOREIGN KEY (`roster_id`) REFERENCES `roster` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `crew_messages`
--
ALTER TABLE `crew_messages`
  ADD CONSTRAINT `crew_messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `crew_online_status`
--
ALTER TABLE `crew_online_status`
  ADD CONSTRAINT `crew_online_status_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `criminal_records`
--
ALTER TABLE `criminal_records`
  ADD CONSTRAINT `criminal_records_ibfk_1` FOREIGN KEY (`roster_id`) REFERENCES `roster` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deletion_audit`
--
ALTER TABLE `deletion_audit`
  ADD CONSTRAINT `deletion_audit_ibfk_1` FOREIGN KEY (`deleted_by_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fault_reports`
--
ALTER TABLE `fault_reports`
  ADD CONSTRAINT `fault_reports_ibfk_1` FOREIGN KEY (`reported_by_roster_id`) REFERENCES `roster` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD CONSTRAINT `medical_records_ibfk_1` FOREIGN KEY (`roster_id`) REFERENCES `roster` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `message_reactions`
--
ALTER TABLE `message_reactions`
  ADD CONSTRAINT `message_reactions_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `crew_messages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `message_reactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `security_reports`
--
ALTER TABLE `security_reports`
  ADD CONSTRAINT `security_reports_ibfk_1` FOREIGN KEY (`involved_roster_id`) REFERENCES `roster` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `training_access_log`
--
ALTER TABLE `training_access_log`
  ADD CONSTRAINT `training_access_log_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `training_files` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `training_access_log_ibfk_2` FOREIGN KEY (`accessed_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `training_audit`
--
ALTER TABLE `training_audit`
  ADD CONSTRAINT `fk_training_audit_user` FOREIGN KEY (`performed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `training_audit_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `training_files` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `training_audit_ibfk_2` FOREIGN KEY (`performed_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `training_documents`
--
ALTER TABLE `training_documents`
  ADD CONSTRAINT `training_documents_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `training_documents_ibfk_2` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `training_files`
--
ALTER TABLE `training_files`
  ADD CONSTRAINT `training_files_ibfk_1` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `training_files_ibfk_2` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `training_modules`
--
ALTER TABLE `training_modules`
  ADD CONSTRAINT `training_modules_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_roster` FOREIGN KEY (`roster_id`) REFERENCES `roster` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
