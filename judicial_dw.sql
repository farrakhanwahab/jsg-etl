-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 27, 2024 at 04:55 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `judicial_dw`
--

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `Case_ID` varchar(20) DEFAULT NULL,
  `Case_Type` varchar(50) DEFAULT NULL,
  `Case_Status` varchar(50) DEFAULT NULL,
  `Filing_Date` date DEFAULT NULL,
  `Resolution_Date` varchar(50) DEFAULT NULL,
  `Cost_Type` varchar(50) DEFAULT NULL,
  `Amount` float DEFAULT NULL,
  `Payment_Status` varchar(50) DEFAULT NULL,
  `Outcome_Type` varchar(50) DEFAULT NULL,
  `Resolution_Time` int(11) DEFAULT NULL,
  `Judge_ID` varchar(20) DEFAULT NULL,
  `Court_Record_ID` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cases`
--

INSERT INTO `cases` (`Case_ID`, `Case_Type`, `Case_Status`, `Filing_Date`, `Resolution_Date`, `Cost_Type`, `Amount`, `Payment_Status`, `Outcome_Type`, `Resolution_Time`, `Judge_ID`, `Court_Record_ID`) VALUES
('8a2767f3-c580-4ae0-b', 'Labour', 'Dismissed', '2023-03-08', '2023-09-04', 'Variable', 66513.8, 'Pending', 'Settled', 355, '62ce07e6-0ff2-4b49-b', '2a778f77-ed55-4865-a'),
('3368c5d9-b158-4c10-9', 'Family', 'Pending', '2021-02-11', '2024-05-07', 'Variable', 82186.9, 'Failed', 'Acquittal', 252, '36c2d088-ca2d-488c-9', '65b0e80f-66ee-44de-b'),
('3eeb7768-9463-4da5-9', 'Commercial', 'Closed', '2022-06-18', '2022-04-10', 'Variable', 48318.9, 'Paid', 'Dismissed', 278, '9f13983b-f041-4a42-b', '26b95e86-26cc-457e-9'),
('dc9873c5-483b-46d5-a', 'Commercial', 'Pending', '2020-07-27', '2023-11-04', 'Variable', 50347.3, 'Pending', 'Settled', 213, '00b2bb03-cc6e-4b76-b', '4fad4997-0da7-4931-a'),
('abf39f15-1c80-4ca5-9', 'Labour', 'Closed', '2021-11-14', '2024-03-27', 'Variable', 12130.6, 'Pending', 'Dismissed', 106, '5c7eb707-0456-4c5b-9', 'eb7416c6-052d-44c2-8'),
('fac9ee27-c920-4159-b', 'Commercial', 'Closed', '2023-09-25', '2021-04-30', 'Fixed', 48967, 'Failed', 'Settled', 331, '91469519-2482-4486-b', '9c514dad-ae35-49df-9'),
('a2065daa-29ee-480f-9', 'Commercial', 'Settled', '2023-10-15', '2022-10-15', 'Variable', 47388.1, 'Paid', 'Acquittal', 73, 'bd690063-6698-4890-9', 'c2121582-0e99-49af-8'),
('b5309fa0-10c5-4a1f-8', 'Family', 'Settled', '2021-01-23', '2023-03-26', 'Fixed', 95697.3, 'Failed', 'Dismissed', 250, '5fe42617-7c13-4cd5-9', 'cbbea9b5-bdb3-4ccb-8'),
('3c63698f-a9cf-42aa-b', 'Civil', 'Settled', '2024-08-15', '2022-12-08', 'Variable', 74270.3, 'Paid', 'Dismissed', 342, '37d9a45f-6ea3-48f5-a', '944ecd12-7f7a-4577-8'),
('2861f6d5-85eb-4259-8', 'Labour', 'Closed', '2024-02-21', '2021-11-03', 'Fixed', 37786.8, 'Paid', 'Dismissed', 158, '4fa1ca10-742b-400e-9', 'dd05674b-37f9-4342-a'),
('93a2b020-aa20-467a-b', 'Civil', 'Settled', '2021-08-05', '2021-12-07', 'Fixed', 98715.6, 'Pending', 'Acquittal', 73, 'e8d4eec9-599e-4509-8', '01603b84-0705-4aca-a'),
('58253fbf-d6a5-4882-a', 'Commercial', 'Pending', '2020-12-03', '2024-11-19', 'Fixed', 84075.8, 'Failed', 'Conviction', 257, 'ff441c03-e771-43b4-b', '874df824-2cc3-4877-b'),
('709acd27-b132-4353-b', 'Commercial', 'Closed', '2023-04-08', '2020-11-11', 'Variable', 51324.3, 'Failed', 'Dismissed', 224, '1512544e-9d83-4693-8', 'd6889279-b203-4748-9'),
('dee0e511-55ad-473e-9', 'Criminal', 'Pending', '2024-07-21', '2021-09-05', 'Fixed', 8853.63, 'Paid', 'Acquittal', 302, '7689bff7-2b84-4a38-9', 'f8d30ef1-b556-4918-b'),
('cc0142f0-004b-4e8b-8', 'Criminal', 'Settled', '2022-08-28', '2020-07-26', 'Variable', 51656.6, 'Paid', 'Dismissed', 236, 'a5d114e8-e178-466b-9', 'eb4c5140-88b3-42e3-9'),
('9c1c55b2-3abd-4b25-9', 'Labour', 'Closed', '2023-08-29', '2022-05-17', 'Fixed', 92756.5, 'Failed', 'Settled', 109, 'b4d329e4-770b-4c96-a', '9ec0b206-496c-42aa-8'),
('43d47d08-97a9-4441-9', 'Criminal', 'Settled', '2020-12-27', '2022-10-05', 'Variable', 31695.4, 'Paid', 'Dismissed', 223, 'df6efda2-77e9-4903-9', '873a296b-2d25-43a5-a'),
('47ec7f67-1c12-4c2b-8', 'Family', 'Pending', '2023-12-19', '2023-04-20', 'Variable', 15110, 'Paid', 'Dismissed', 130, '5280665c-4e11-4039-b', '5a4322f9-95c1-4478-8'),
('241b0d64-e8da-42af-b', 'Civil', 'Pending', '2020-05-24', '2022-12-05', 'Fixed', 95645.8, 'Failed', 'Conviction', 162, '1186938f-a9bc-4380-b', 'fc22113a-3602-4155-b'),
('f97bfc8d-e953-4f33-9', 'Labour', 'Pending', '2021-10-10', '2021-05-15', 'Fixed', 49793.8, 'Paid', 'Settled', 174, 'd75476f9-fb84-4d9e-a', 'd3baf2bf-1dfa-4649-8'),
('626d316d-2b8f-4ceb-8', 'Labour', 'Settled', '2022-01-22', '2022-02-15', 'Variable', 74334.3, 'Pending', 'Settled', 277, 'e7df6103-3f31-42e5-b', '58620ead-12ed-4440-b'),
('0fb9b991-b50a-4893-9', 'Commercial', 'Settled', '2020-01-03', '2024-06-28', 'Variable', 80597.4, 'Pending', 'Dismissed', 322, 'ddedbdfd-40dc-468e-a', 'de6565db-f0e6-4487-a'),
('0d7f8ee3-2e77-4e22-9', 'Family', 'Pending', '2021-03-11', '2020-11-02', 'Fixed', 87685.3, 'Failed', 'Settled', 302, '0c95de6d-732c-4866-8', '4138e352-b463-4410-9'),
('5e08d000-8195-4bc1-9', 'Labour', 'Closed', '2023-09-09', '2023-02-03', 'Fixed', 95551.3, 'Paid', 'Settled', 246, '126f1cc8-56ab-4e17-a', 'c9c84990-067c-4ede-b'),
('c65bac11-122f-4397-9', 'Civil', 'Settled', '2023-02-21', '2023-04-21', 'Fixed', 93370.6, 'Pending', 'Acquittal', 202, '26a07656-0dda-4e4d-9', 'dbdcdce9-6d8d-4dde-a'),
('1b3121c5-bb31-4f12-8', 'Labour', 'Dismissed', '2024-09-19', '2020-07-14', 'Fixed', 63417.2, 'Pending', 'Settled', 353, '59104775-bfbb-4301-9', '227b7858-29ae-4fa6-8'),
('6c1e4eb6-49aa-410f-a', 'Civil', 'Dismissed', '2024-05-15', '2021-06-07', 'Variable', 11854.1, 'Failed', 'Acquittal', 326, '062eed1e-b900-477b-a', 'f4e6f502-b11e-45d0-9'),
('470e3421-efef-466b-a', 'Family', 'Closed', '2021-05-19', '2023-04-13', 'Fixed', 77845.9, 'Failed', 'Acquittal', 284, '8fb1bb77-4aa4-4bfc-9', '6d82cf53-a46b-4645-a'),
('dffee6af-efcd-4f15-9', 'Criminal', 'Settled', '2024-02-19', '2024-10-05', 'Fixed', 16468.8, 'Pending', 'Acquittal', 319, '71dbd066-d37a-4643-a', '5665039e-b043-4d73-9'),
('14ec7c5a-0d30-45c1-8', 'Civil', 'Settled', '2021-08-14', '2023-04-24', 'Fixed', 73075.4, 'Failed', 'Settled', 352, 'f5fd606b-2f4d-471b-9', '585efa68-cd48-4dc7-b'),
('96c55840-f020-4db2-b', 'Civil', 'Dismissed', '2023-10-10', '2023-10-24', 'Fixed', 23402, 'Pending', 'Acquittal', 154, '9ff0cbf0-bded-4d8a-b', 'c7e70e57-4d3d-4d73-a'),
('1ed3aec0-4143-4334-9', 'Family', 'Pending', '2024-05-10', '2020-05-17', 'Fixed', 25541, 'Pending', 'Acquittal', 73, 'c01b03a5-b8c9-4725-9', '4cfa277b-d978-4fad-a'),
('e2325770-ffcb-4e53-9', 'Commercial', 'Settled', '2023-02-21', '2021-04-28', 'Variable', 64099.3, 'Pending', 'Acquittal', 275, '8d2d7ca4-05c8-4bf9-b', '11fb94e3-b160-437f-b'),
('52d5ab87-bd97-471e-a', 'Civil', 'Dismissed', '2020-01-24', '2022-06-09', 'Variable', 7884.4, 'Failed', 'Acquittal', 305, '5a726d8d-7480-4b41-b', '4a204e85-05f6-4c55-b'),
('f052810c-ad10-4ed5-b', 'Civil', 'Pending', '2023-07-13', '2023-06-14', 'Fixed', 64229.3, 'Failed', 'Acquittal', 172, '7318548d-6b29-430a-b', 'a5994541-0c81-4c39-8'),
('946d95e6-8a9b-4c41-9', 'Commercial', 'Dismissed', '2021-12-17', '2021-09-02', 'Fixed', 16864.2, 'Paid', 'Settled', 75, '0e14c97f-f920-41b4-9', '4d6883c5-93f1-4e94-8'),
('a53f038a-5f70-4a4b-9', 'Family', 'Settled', '2020-02-08', '2020-05-03', 'Variable', 41400.2, 'Paid', 'Conviction', 142, '2f67b0c9-8c62-415e-9', '1cd312a5-6e75-4d3d-9'),
('4040564b-707c-4b7a-a', 'Civil', 'Closed', '2022-07-05', '2022-03-20', 'Variable', 90905.6, 'Paid', 'Dismissed', 364, 'ee037dd2-cbfc-41b7-9', '9f893027-1539-4e9e-9'),
('635f8e61-a787-4d92-b', 'Labour', 'Dismissed', '2023-03-24', '2020-05-28', 'Variable', 84442.1, 'Paid', 'Conviction', 34, '61b61b51-c334-48e1-8', '8486bc24-6464-4d6e-b'),
('3dbe8738-621b-4ca5-a', 'Criminal', 'Dismissed', '2024-09-25', '2023-07-08', 'Variable', 88384, 'Pending', 'Settled', 244, 'c89f1d84-59ce-4599-8', '1fc3adb1-a2fb-43fa-9'),
('fe0b7e3b-263a-4840-8', 'Family', 'Closed', '2024-09-01', '2024-02-22', 'Variable', 92997.5, 'Paid', 'Dismissed', 109, '554dbc77-adfa-47e1-b', 'eae09d10-fa01-472d-9'),
('6d8a6310-46ea-4421-b', 'Civil', 'Dismissed', '2021-03-02', '2021-10-24', 'Fixed', 19153.9, 'Paid', 'Acquittal', 230, 'c6d1ac33-00c8-4ad5-b', 'a6e187fd-aff5-40f2-8'),
('9cc82fa2-cbb6-4c6f-9', 'Criminal', 'Dismissed', '2022-11-01', '2021-11-19', 'Variable', 71666.9, 'Failed', 'Dismissed', 252, '0751df82-fe37-4df4-a', 'a768295b-f58d-4404-b'),
('8c17909e-5883-47da-b', 'Criminal', 'Dismissed', '2024-05-26', '2022-06-27', 'Variable', 41358.8, 'Failed', 'Settled', 107, '68bb6fa0-6252-4844-9', '9d476112-258e-43f3-9'),
('b107bc63-89b8-4652-a', 'Civil', 'Closed', '2021-05-28', '2022-05-20', 'Variable', 97746.8, 'Failed', 'Acquittal', 357, 'f8c31285-aa18-455e-b', 'f723cdcf-8de6-4669-b'),
('ae624fdc-94bb-4d9c-b', 'Civil', 'Pending', '2020-10-08', '2020-02-20', 'Variable', 16320.4, 'Failed', 'Acquittal', 217, '97ee1895-c9b9-4795-9', 'e32a16ff-cdd3-43d4-a'),
('ab5bbc89-79e4-4f03-9', 'Family', 'Settled', '2023-10-20', '2021-12-28', 'Variable', 42831, 'Paid', 'Acquittal', 76, '558ecb3c-5493-48d4-9', '804744ee-7d83-4ceb-a'),
('3b909a87-2ba0-49b7-b', 'Family', 'Closed', '2021-08-08', '2020-10-22', 'Variable', 55661.9, 'Failed', 'Conviction', 40, '40771bf7-9a10-4e1d-9', '310c47bb-6060-4200-9'),
('d8f60125-4803-412b-a', 'Criminal', 'Settled', '2022-04-04', '2021-11-24', 'Variable', 44719, 'Pending', 'Dismissed', 351, 'd279028a-a6a3-43cf-9', '10662048-0bc2-423e-8'),
('8e3ab827-894f-4159-9', 'Labour', 'Dismissed', '2020-04-29', '2021-08-07', 'Fixed', 28554.8, 'Pending', 'Conviction', 91, 'ef02297e-9493-418b-8', '85090442-100c-435e-9'),
('82b7ce5c-9d05-4e85-9', 'Labour', 'Pending', '2022-05-14', '2020-09-29', 'Variable', 75415.2, 'Pending', 'Conviction', 164, 'a094485c-41d0-46fb-b', '1414163d-5096-4e0e-b'),
('e44048a5-2aa9-42b2-9', 'Civil', 'Dismissed', '2024-10-29', '2022-05-03', 'Fixed', 12291.5, 'Pending', 'Dismissed', 231, '2df882bc-caa3-4596-8', '32e3ae46-f40b-4c7d-a'),
('a404328c-db7e-4547-9', 'Criminal', 'Dismissed', '2024-07-09', '2024-02-20', 'Variable', 92350.3, 'Paid', 'Dismissed', 165, '343cdbae-1114-47b5-9', '12a1d7fe-e1e1-472f-9'),
('e70bb67f-7e35-4339-a', 'Criminal', 'Settled', '2021-11-22', '2023-02-28', 'Fixed', 58646.5, 'Failed', 'Settled', 316, '26c1df43-e2f8-43e6-b', '375e9535-414f-4ef9-9'),
('17b30e87-dcf0-4967-a', 'Labour', 'Pending', '2021-12-31', '2023-04-02', 'Variable', 69338.1, 'Pending', 'Conviction', 62, 'ed8acd26-9461-4cf8-8', 'c4fa52fd-b870-4063-a'),
('9e66b36d-3a3d-4299-9', 'Civil', 'Settled', '2021-01-23', '2020-10-10', 'Fixed', 69411.3, 'Failed', 'Settled', 233, '663f6f0d-9da3-4111-9', '7e8f8e33-ea70-4f40-8'),
('d6e363d7-a2af-41e9-9', 'Labour', 'Pending', '2024-05-07', '2022-04-01', 'Variable', 57153.1, 'Failed', 'Conviction', 177, '250571b9-fa52-47f7-b', '2a59b922-bbe0-42da-a'),
('2c52f8e1-f9a5-4459-8', 'Commercial', 'Pending', '2021-05-24', '2020-02-25', 'Variable', 86623.6, 'Paid', 'Acquittal', 284, '29234217-406d-4d1f-8', 'c22b0819-a1fb-4320-8'),
('98ed5deb-c7b9-474d-b', 'Civil', 'Closed', '2023-08-09', '2024-05-15', 'Fixed', 61666.5, 'Failed', 'Dismissed', 227, 'e4784efe-764c-4b7a-8', 'e56afd6d-f325-425d-9'),
('adc2e9f0-5efd-4b8a-9', 'Civil', 'Settled', '2022-05-11', '2022-04-19', 'Variable', 78672.4, 'Pending', 'Settled', 155, '745ad464-f8fc-423e-b', '66916f2c-f870-4268-b'),
('0590a596-e481-47ea-a', 'Criminal', 'Settled', '2021-10-06', '2022-12-10', 'Fixed', 26942, 'Pending', 'Acquittal', 356, 'b015979c-4009-4b8d-b', '5a5a5fa2-0f7b-4169-9'),
('02f313ab-dbf0-4c94-a', 'Civil', 'Pending', '2024-08-30', '2021-10-15', 'Fixed', 39956.5, 'Paid', 'Settled', 151, 'c992542e-7a8f-4d4d-9', '9d227dcc-9bd6-4191-a'),
('ee3f1e98-82df-4d47-9', 'Commercial', 'Closed', '2024-05-24', '2023-05-23', 'Variable', 65372.9, 'Pending', 'Acquittal', 124, 'ed3ef324-cc32-4c78-9', 'ffb10670-7f60-49f4-a'),
('30c1eeb3-5288-4ff0-a', 'Labour', 'Dismissed', '2020-09-07', '2021-05-10', 'Fixed', 85415.4, 'Paid', 'Conviction', 259, '86e204e5-2659-494a-8', '2cf6f9d9-cb93-40d5-a'),
('d49e6df0-1b16-4548-9', 'Family', 'Dismissed', '2023-06-16', '2021-12-21', 'Fixed', 66057.7, 'Pending', 'Settled', 309, 'd15825f3-560f-410f-9', 'e1e8d8c6-2140-41ca-a'),
('ccce1209-03a7-4549-a', 'Commercial', 'Settled', '2022-03-28', '2020-09-24', 'Variable', 3271.95, 'Failed', 'Conviction', 286, 'b4c7ff88-0b49-41b2-9', 'c825f93f-6cfa-4f68-8'),
('0744db92-5a0b-4b44-9', 'Commercial', 'Settled', '2020-02-21', '2021-05-19', 'Variable', 7710.74, 'Paid', 'Dismissed', 224, '6f8318ac-fbb2-422b-9', '0e541fb3-ae86-4e90-9'),
('15802fe7-ec75-41aa-8', 'Criminal', 'Closed', '2024-03-04', '2022-06-01', 'Variable', 41368.7, 'Pending', 'Settled', 31, '2f986008-e4b0-4c82-a', 'e667788d-9ea2-4b98-9'),
('40feddee-a1bd-4134-8', 'Family', 'Settled', '2020-10-05', '2020-06-28', 'Fixed', 67530.2, 'Paid', 'Conviction', 315, 'c83a86cf-1ab7-4005-8', '4c791300-b8dd-46c5-b'),
('32434650-fdae-4e10-8', 'Commercial', 'Dismissed', '2021-08-31', '2021-07-04', 'Fixed', 30781.9, 'Paid', 'Settled', 364, '6fb96b66-f921-4b36-9', 'fb29f2c8-d6a0-4034-8'),
('6af78976-c449-4938-8', 'Criminal', 'Pending', '2024-10-15', '2021-06-08', 'Variable', 45859.6, 'Paid', 'Settled', 62, '6b56a754-52dd-44af-b', '19077859-93e1-4762-b'),
('e162ea35-3fef-46b1-8', 'Labour', 'Dismissed', '2024-10-09', '2021-05-06', 'Fixed', 18497.4, 'Failed', 'Conviction', 278, '56bd7a85-e96a-4cc4-9', '84bd4104-9ccc-472b-8'),
('f86d1381-952f-4ec1-a', 'Family', 'Dismissed', '2022-12-01', '2020-10-11', 'Variable', 64746.7, 'Failed', 'Settled', 209, '26185953-56f9-414c-a', 'bfc2d093-5763-4d7e-9'),
('33294beb-e5ed-47c0-8', 'Criminal', 'Pending', '2022-04-15', '2022-03-30', 'Variable', 20506, 'Paid', 'Acquittal', 285, 'aca38b87-932e-42dd-a', '7705e945-3bdd-4856-9'),
('a2779957-163d-4370-8', 'Labour', 'Dismissed', '2020-12-03', '2021-06-25', 'Fixed', 57142.1, 'Paid', 'Acquittal', 65, '7db21429-ef7e-4f19-9', 'f21fced2-eb73-4983-8'),
('1624e378-e4f9-4161-9', 'Commercial', 'Dismissed', '2020-06-05', '2024-06-20', 'Fixed', 65555.8, 'Paid', 'Settled', 91, '2684c2d7-b96c-4399-a', '742c5fe1-59c8-4bf9-9'),
('359d2137-324e-41fa-8', 'Commercial', 'Pending', '2023-12-28', '2022-06-26', 'Variable', 27562.8, 'Paid', 'Dismissed', 301, '9208cf34-0765-4b4f-8', 'b9c3ff91-5adb-447f-a'),
('313d3e18-8fc3-4cb7-9', 'Family', 'Closed', '2021-09-17', '2020-11-23', 'Variable', 69154.1, 'Pending', 'Settled', 182, 'efaa55bd-d4b2-41ef-9', 'c94437aa-6612-431b-8'),
('2bb15c30-3ed6-4cba-8', 'Criminal', 'Settled', '2023-02-27', '2021-09-25', 'Variable', 6335.24, 'Failed', 'Acquittal', 283, 'be023a95-eabe-4362-b', '1721a01d-359c-4ceb-a'),
('a3986d68-bd51-4374-b', 'Criminal', 'Closed', '2020-07-16', '2021-10-30', 'Fixed', 14614.2, 'Paid', 'Conviction', 151, 'd07e9e40-e32b-4e8f-b', 'b4321f51-eaa7-43c4-b'),
('ed6fb6af-d1a1-4aae-9', 'Commercial', 'Settled', '2021-07-21', '2022-10-27', 'Variable', 66445.1, 'Pending', 'Settled', 359, '3599f92c-00b3-42d4-9', '8bd8210a-1757-45b2-b'),
('8d5ecb82-fb99-47c1-8', 'Commercial', 'Settled', '2022-07-06', '2022-11-10', 'Fixed', 69439.6, 'Failed', 'Settled', 199, '9fa3f6c7-dc54-4533-a', '36a5fc8d-409b-4e81-b'),
('ea665b55-18a0-4a31-a', 'Civil', 'Settled', '2021-05-15', '2023-08-08', 'Variable', 29909.6, 'Failed', 'Dismissed', 141, '8fbacbad-97a9-49fb-a', 'a44f958a-cf59-44f6-9'),
('4373f039-d512-45cb-a', 'Labour', 'Dismissed', '2021-07-30', '2024-01-21', 'Variable', 55210.4, 'Pending', 'Acquittal', 283, '6dc53cd1-3476-4531-a', '6b039d51-3056-4017-a'),
('7a17cfaf-5216-4eec-8', 'Commercial', 'Dismissed', '2022-06-20', '2021-02-17', 'Variable', 28581.8, 'Failed', 'Dismissed', 336, '320af09c-93e6-4e07-9', 'c62e555f-5154-438e-a'),
('f0492360-1357-4422-a', 'Civil', 'Dismissed', '2020-05-20', '2021-02-23', 'Variable', 76276.4, 'Pending', 'Acquittal', 287, 'ac3fe703-1b6f-4239-8', 'a2e655c4-7cf4-4ae1-a'),
('0f390990-2b92-4d77-8', 'Civil', 'Dismissed', '2023-01-29', '2021-11-11', 'Fixed', 4936.85, 'Pending', 'Acquittal', 237, '8c319476-73a9-4e02-9', '7a5a77be-55b0-4c45-a'),
('9fef094c-15a2-40ce-a', 'Labour', 'Closed', '2023-12-06', '2022-12-31', 'Fixed', 28860.1, 'Paid', 'Acquittal', 304, '464405a2-1af0-4dc6-a', 'b4c79501-f70c-4b04-8'),
('13c6dca3-f80d-4a5a-a', 'Civil', 'Dismissed', '2023-07-15', '2020-07-19', 'Variable', 59514.3, 'Failed', 'Dismissed', 340, '7335cccf-f8f0-4c36-8', 'f28a8f78-9136-4d88-a'),
('53242a47-c94d-4e77-8', 'Family', 'Closed', '2022-12-14', '2021-03-06', 'Fixed', 39771.2, 'Failed', 'Acquittal', 208, '3671dfc9-e2e2-4e10-a', 'c114175a-0e82-4d4a-9'),
('0dce0fe1-42ae-4292-a', 'Labour', 'Settled', '2023-01-23', '2024-05-10', 'Fixed', 3846.5, 'Pending', 'Dismissed', 95, '7da79d63-1811-4304-8', '0eb58b6d-4ea4-44e0-b'),
('138a6a96-e27d-40b1-9', 'Criminal', 'Closed', '2020-08-02', '2024-11-13', 'Variable', 81395.2, 'Pending', 'Acquittal', 191, '45406285-c4dc-432c-a', '7e925729-de8f-45df-b'),
('99e2e8ba-72d1-4698-8', 'Criminal', 'Pending', '2022-01-19', '2023-05-14', 'Variable', 69550, 'Paid', 'Dismissed', 221, '6119d633-d76a-440d-9', '35e7f9a3-55e8-41d7-a'),
('508109a8-722a-442a-b', 'Criminal', 'Settled', '2022-02-20', '2022-06-03', 'Fixed', 95989.8, 'Pending', 'Acquittal', 268, '33e412f8-bfcd-42fd-8', '7393acf8-fe6c-41ac-9'),
('529b437a-b09c-4900-9', 'Criminal', 'Pending', '2024-10-28', '2022-06-09', 'Variable', 64370, 'Pending', 'Conviction', 123, '9025c153-3487-4afa-a', '31d2da4e-87dd-4c3c-8'),
('f587e053-ad68-4a51-8', 'Commercial', 'Closed', '2022-01-16', '2021-03-15', 'Fixed', 49763.6, 'Paid', 'Settled', 349, 'c52cb92b-1e24-4940-b', '23223d8a-e29a-4d53-8'),
('0b92f09e-ec8e-4bf4-8', 'Criminal', 'Pending', '2024-05-16', '2021-05-31', 'Fixed', 5664.24, 'Paid', 'Conviction', 78, 'b0f91ff8-9982-4048-b', '33261d3f-0fde-4674-b'),
('5f8b77e8-2088-481a-a', 'Civil', 'Closed', '2020-03-10', '2024-04-08', 'Fixed', 57450, 'Pending', 'Conviction', 258, '00121f3e-a8bd-418b-8', '7b9111cc-9d9d-4f1c-9'),
('39865332-ed62-4d89-a', 'Labour', 'Dismissed', '2021-12-30', '2022-07-16', 'Fixed', 68862.8, 'Paid', 'Settled', 231, 'e271242c-9b6c-4827-a', 'c7f46a05-b4fd-4f2c-b'),
('f866e0c4-ee2d-44ef-a', 'Civil', 'Dismissed', '2022-09-29', '2023-05-17', 'Variable', 87729.1, 'Failed', 'Dismissed', 287, '28a7dc6e-eb7b-492a-8', '16976583-628d-4d35-a'),
('8a2767f3-c580-4ae0-b', 'Labour', 'Dismissed', '2023-03-08', '2023-09-04 00:00:00', 'Variable', 66513.8, 'Pending', 'Settled', 355, '62ce07e6-0ff2-4b49-b', '2a778f77-ed55-4865-a'),
('3368c5d9-b158-4c10-9', 'Family', 'Pending', '2021-02-11', '2024-05-07 00:00:00', 'Variable', 82186.9, 'Failed', 'Acquittal', 252, '36c2d088-ca2d-488c-9', '65b0e80f-66ee-44de-b'),
('3eeb7768-9463-4da5-9', 'Commercial', 'Closed', '2022-06-18', '2022-04-10 00:00:00', 'Variable', 48318.9, 'Paid', 'Dismissed', 278, '9f13983b-f041-4a42-b', '26b95e86-26cc-457e-9'),
('dc9873c5-483b-46d5-a', 'Commercial', 'Pending', '2020-07-27', '2023-11-04 00:00:00', 'Variable', 50347.3, 'Pending', 'Settled', 213, '00b2bb03-cc6e-4b76-b', '4fad4997-0da7-4931-a'),
('abf39f15-1c80-4ca5-9', 'Labour', 'Closed', '2021-11-14', '2024-03-27 00:00:00', 'Variable', 12130.6, 'Pending', 'Dismissed', 106, '5c7eb707-0456-4c5b-9', 'eb7416c6-052d-44c2-8'),
('fac9ee27-c920-4159-b', 'Commercial', 'Closed', '2023-09-25', '2021-04-30 00:00:00', 'Fixed', 48967, 'Failed', 'Settled', 331, '91469519-2482-4486-b', '9c514dad-ae35-49df-9'),
('a2065daa-29ee-480f-9', 'Commercial', 'Settled', '2023-10-15', '2022-10-15 00:00:00', 'Variable', 47388.1, 'Paid', 'Acquittal', 73, 'bd690063-6698-4890-9', 'c2121582-0e99-49af-8'),
('b5309fa0-10c5-4a1f-8', 'Family', 'Settled', '2021-01-23', '2023-03-26 00:00:00', 'Fixed', 95697.3, 'Failed', 'Dismissed', 250, '5fe42617-7c13-4cd5-9', 'cbbea9b5-bdb3-4ccb-8'),
('3c63698f-a9cf-42aa-b', 'Civil', 'Settled', '2024-08-15', '2022-12-08 00:00:00', 'Variable', 74270.3, 'Paid', 'Dismissed', 342, '37d9a45f-6ea3-48f5-a', '944ecd12-7f7a-4577-8'),
('2861f6d5-85eb-4259-8', 'Labour', 'Closed', '2024-02-21', '2021-11-03 00:00:00', 'Fixed', 37786.8, 'Paid', 'Dismissed', 158, '4fa1ca10-742b-400e-9', 'dd05674b-37f9-4342-a'),
('93a2b020-aa20-467a-b', 'Civil', 'Settled', '2021-08-05', '2021-12-07 00:00:00', 'Fixed', 98715.6, 'Pending', 'Acquittal', 73, 'e8d4eec9-599e-4509-8', '01603b84-0705-4aca-a'),
('58253fbf-d6a5-4882-a', 'Commercial', 'Pending', '2020-12-03', '2024-11-19 00:00:00', 'Fixed', 84075.8, 'Failed', 'Conviction', 257, 'ff441c03-e771-43b4-b', '874df824-2cc3-4877-b'),
('709acd27-b132-4353-b', 'Commercial', 'Closed', '2023-04-08', '2020-11-11 00:00:00', 'Variable', 51324.3, 'Failed', 'Dismissed', 224, '1512544e-9d83-4693-8', 'd6889279-b203-4748-9'),
('dee0e511-55ad-473e-9', 'Criminal', 'Pending', '2024-07-21', '2021-09-05 00:00:00', 'Fixed', 8853.63, 'Paid', 'Acquittal', 302, '7689bff7-2b84-4a38-9', 'f8d30ef1-b556-4918-b'),
('cc0142f0-004b-4e8b-8', 'Criminal', 'Settled', '2022-08-28', '2020-07-26 00:00:00', 'Variable', 51656.6, 'Paid', 'Dismissed', 236, 'a5d114e8-e178-466b-9', 'eb4c5140-88b3-42e3-9'),
('9c1c55b2-3abd-4b25-9', 'Labour', 'Closed', '2023-08-29', '2022-05-17 00:00:00', 'Fixed', 92756.5, 'Failed', 'Settled', 109, 'b4d329e4-770b-4c96-a', '9ec0b206-496c-42aa-8'),
('43d47d08-97a9-4441-9', 'Criminal', 'Settled', '2020-12-27', '2022-10-05 00:00:00', 'Variable', 31695.4, 'Paid', 'Dismissed', 223, 'df6efda2-77e9-4903-9', '873a296b-2d25-43a5-a'),
('47ec7f67-1c12-4c2b-8', 'Family', 'Pending', '2023-12-19', '2023-04-20 00:00:00', 'Variable', 15110, 'Paid', 'Dismissed', 130, '5280665c-4e11-4039-b', '5a4322f9-95c1-4478-8'),
('241b0d64-e8da-42af-b', 'Civil', 'Pending', '2020-05-24', '2022-12-05 00:00:00', 'Fixed', 95645.8, 'Failed', 'Conviction', 162, '1186938f-a9bc-4380-b', 'fc22113a-3602-4155-b'),
('f97bfc8d-e953-4f33-9', 'Labour', 'Pending', '2021-10-10', '2021-05-15 00:00:00', 'Fixed', 49793.8, 'Paid', 'Settled', 174, 'd75476f9-fb84-4d9e-a', 'd3baf2bf-1dfa-4649-8'),
('626d316d-2b8f-4ceb-8', 'Labour', 'Settled', '2022-01-22', '2022-02-15 00:00:00', 'Variable', 74334.3, 'Pending', 'Settled', 277, 'e7df6103-3f31-42e5-b', '58620ead-12ed-4440-b'),
('0fb9b991-b50a-4893-9', 'Commercial', 'Settled', '2020-01-03', '2024-06-28 00:00:00', 'Variable', 80597.4, 'Pending', 'Dismissed', 322, 'ddedbdfd-40dc-468e-a', 'de6565db-f0e6-4487-a'),
('0d7f8ee3-2e77-4e22-9', 'Family', 'Pending', '2021-03-11', '2020-11-02 00:00:00', 'Fixed', 87685.3, 'Failed', 'Settled', 302, '0c95de6d-732c-4866-8', '4138e352-b463-4410-9'),
('5e08d000-8195-4bc1-9', 'Labour', 'Closed', '2023-09-09', '2023-02-03 00:00:00', 'Fixed', 95551.3, 'Paid', 'Settled', 246, '126f1cc8-56ab-4e17-a', 'c9c84990-067c-4ede-b'),
('c65bac11-122f-4397-9', 'Civil', 'Settled', '2023-02-21', '2023-04-21 00:00:00', 'Fixed', 93370.6, 'Pending', 'Acquittal', 202, '26a07656-0dda-4e4d-9', 'dbdcdce9-6d8d-4dde-a'),
('1b3121c5-bb31-4f12-8', 'Labour', 'Dismissed', '2024-09-19', '2020-07-14 00:00:00', 'Fixed', 63417.2, 'Pending', 'Settled', 353, '59104775-bfbb-4301-9', '227b7858-29ae-4fa6-8'),
('6c1e4eb6-49aa-410f-a', 'Civil', 'Dismissed', '2024-05-15', '2021-06-07 00:00:00', 'Variable', 11854.1, 'Failed', 'Acquittal', 326, '062eed1e-b900-477b-a', 'f4e6f502-b11e-45d0-9'),
('470e3421-efef-466b-a', 'Family', 'Closed', '2021-05-19', '2023-04-13 00:00:00', 'Fixed', 77845.9, 'Failed', 'Acquittal', 284, '8fb1bb77-4aa4-4bfc-9', '6d82cf53-a46b-4645-a'),
('dffee6af-efcd-4f15-9', 'Criminal', 'Settled', '2024-02-19', '2024-10-05 00:00:00', 'Fixed', 16468.8, 'Pending', 'Acquittal', 319, '71dbd066-d37a-4643-a', '5665039e-b043-4d73-9'),
('14ec7c5a-0d30-45c1-8', 'Civil', 'Settled', '2021-08-14', '2023-04-24 00:00:00', 'Fixed', 73075.4, 'Failed', 'Settled', 352, 'f5fd606b-2f4d-471b-9', '585efa68-cd48-4dc7-b'),
('96c55840-f020-4db2-b', 'Civil', 'Dismissed', '2023-10-10', '2023-10-24 00:00:00', 'Fixed', 23402, 'Pending', 'Acquittal', 154, '9ff0cbf0-bded-4d8a-b', 'c7e70e57-4d3d-4d73-a'),
('1ed3aec0-4143-4334-9', 'Family', 'Pending', '2024-05-10', '2020-05-17 00:00:00', 'Fixed', 25541, 'Pending', 'Acquittal', 73, 'c01b03a5-b8c9-4725-9', '4cfa277b-d978-4fad-a'),
('e2325770-ffcb-4e53-9', 'Commercial', 'Settled', '2023-02-21', '2021-04-28 00:00:00', 'Variable', 64099.3, 'Pending', 'Acquittal', 275, '8d2d7ca4-05c8-4bf9-b', '11fb94e3-b160-437f-b'),
('52d5ab87-bd97-471e-a', 'Civil', 'Dismissed', '2020-01-24', '2022-06-09 00:00:00', 'Variable', 7884.4, 'Failed', 'Acquittal', 305, '5a726d8d-7480-4b41-b', '4a204e85-05f6-4c55-b'),
('f052810c-ad10-4ed5-b', 'Civil', 'Pending', '2023-07-13', '2023-06-14 00:00:00', 'Fixed', 64229.3, 'Failed', 'Acquittal', 172, '7318548d-6b29-430a-b', 'a5994541-0c81-4c39-8'),
('946d95e6-8a9b-4c41-9', 'Commercial', 'Dismissed', '2021-12-17', '2021-09-02 00:00:00', 'Fixed', 16864.2, 'Paid', 'Settled', 75, '0e14c97f-f920-41b4-9', '4d6883c5-93f1-4e94-8'),
('a53f038a-5f70-4a4b-9', 'Family', 'Settled', '2020-02-08', '2020-05-03 00:00:00', 'Variable', 41400.2, 'Paid', 'Conviction', 142, '2f67b0c9-8c62-415e-9', '1cd312a5-6e75-4d3d-9'),
('4040564b-707c-4b7a-a', 'Civil', 'Closed', '2022-07-05', '2022-03-20 00:00:00', 'Variable', 90905.6, 'Paid', 'Dismissed', 364, 'ee037dd2-cbfc-41b7-9', '9f893027-1539-4e9e-9'),
('635f8e61-a787-4d92-b', 'Labour', 'Dismissed', '2023-03-24', '2020-05-28 00:00:00', 'Variable', 84442.1, 'Paid', 'Conviction', 34, '61b61b51-c334-48e1-8', '8486bc24-6464-4d6e-b'),
('3dbe8738-621b-4ca5-a', 'Criminal', 'Dismissed', '2024-09-25', '2023-07-08 00:00:00', 'Variable', 88384, 'Pending', 'Settled', 244, 'c89f1d84-59ce-4599-8', '1fc3adb1-a2fb-43fa-9'),
('fe0b7e3b-263a-4840-8', 'Family', 'Closed', '2024-09-01', '2024-02-22 00:00:00', 'Variable', 92997.5, 'Paid', 'Dismissed', 109, '554dbc77-adfa-47e1-b', 'eae09d10-fa01-472d-9'),
('6d8a6310-46ea-4421-b', 'Civil', 'Dismissed', '2021-03-02', '2021-10-24 00:00:00', 'Fixed', 19153.9, 'Paid', 'Acquittal', 230, 'c6d1ac33-00c8-4ad5-b', 'a6e187fd-aff5-40f2-8'),
('9cc82fa2-cbb6-4c6f-9', 'Criminal', 'Dismissed', '2022-11-01', '2021-11-19 00:00:00', 'Variable', 71666.9, 'Failed', 'Dismissed', 252, '0751df82-fe37-4df4-a', 'a768295b-f58d-4404-b'),
('8c17909e-5883-47da-b', 'Criminal', 'Dismissed', '2024-05-26', '2022-06-27 00:00:00', 'Variable', 41358.8, 'Failed', 'Settled', 107, '68bb6fa0-6252-4844-9', '9d476112-258e-43f3-9'),
('b107bc63-89b8-4652-a', 'Civil', 'Closed', '2021-05-28', '2022-05-20 00:00:00', 'Variable', 97746.8, 'Failed', 'Acquittal', 357, 'f8c31285-aa18-455e-b', 'f723cdcf-8de6-4669-b'),
('ae624fdc-94bb-4d9c-b', 'Civil', 'Pending', '2020-10-08', '2020-02-20 00:00:00', 'Variable', 16320.4, 'Failed', 'Acquittal', 217, '97ee1895-c9b9-4795-9', 'e32a16ff-cdd3-43d4-a'),
('ab5bbc89-79e4-4f03-9', 'Family', 'Settled', '2023-10-20', '2021-12-28 00:00:00', 'Variable', 42831, 'Paid', 'Acquittal', 76, '558ecb3c-5493-48d4-9', '804744ee-7d83-4ceb-a'),
('3b909a87-2ba0-49b7-b', 'Family', 'Closed', '2021-08-08', '2020-10-22 00:00:00', 'Variable', 55661.9, 'Failed', 'Conviction', 40, '40771bf7-9a10-4e1d-9', '310c47bb-6060-4200-9'),
('d8f60125-4803-412b-a', 'Criminal', 'Settled', '2022-04-04', '2021-11-24 00:00:00', 'Variable', 44719, 'Pending', 'Dismissed', 351, 'd279028a-a6a3-43cf-9', '10662048-0bc2-423e-8'),
('8e3ab827-894f-4159-9', 'Labour', 'Dismissed', '2020-04-29', '2021-08-07 00:00:00', 'Fixed', 28554.8, 'Pending', 'Conviction', 91, 'ef02297e-9493-418b-8', '85090442-100c-435e-9'),
('82b7ce5c-9d05-4e85-9', 'Labour', 'Pending', '2022-05-14', '2020-09-29 00:00:00', 'Variable', 75415.2, 'Pending', 'Conviction', 164, 'a094485c-41d0-46fb-b', '1414163d-5096-4e0e-b'),
('e44048a5-2aa9-42b2-9', 'Civil', 'Dismissed', '2024-10-29', '2022-05-03 00:00:00', 'Fixed', 12291.5, 'Pending', 'Dismissed', 231, '2df882bc-caa3-4596-8', '32e3ae46-f40b-4c7d-a'),
('a404328c-db7e-4547-9', 'Criminal', 'Dismissed', '2024-07-09', '2024-02-20 00:00:00', 'Variable', 92350.3, 'Paid', 'Dismissed', 165, '343cdbae-1114-47b5-9', '12a1d7fe-e1e1-472f-9'),
('e70bb67f-7e35-4339-a', 'Criminal', 'Settled', '2021-11-22', '2023-02-28 00:00:00', 'Fixed', 58646.5, 'Failed', 'Settled', 316, '26c1df43-e2f8-43e6-b', '375e9535-414f-4ef9-9'),
('17b30e87-dcf0-4967-a', 'Labour', 'Pending', '2021-12-31', '2023-04-02 00:00:00', 'Variable', 69338.1, 'Pending', 'Conviction', 62, 'ed8acd26-9461-4cf8-8', 'c4fa52fd-b870-4063-a'),
('9e66b36d-3a3d-4299-9', 'Civil', 'Settled', '2021-01-23', '2020-10-10 00:00:00', 'Fixed', 69411.3, 'Failed', 'Settled', 233, '663f6f0d-9da3-4111-9', '7e8f8e33-ea70-4f40-8'),
('d6e363d7-a2af-41e9-9', 'Labour', 'Pending', '2024-05-07', '2022-04-01 00:00:00', 'Variable', 57153.1, 'Failed', 'Conviction', 177, '250571b9-fa52-47f7-b', '2a59b922-bbe0-42da-a'),
('2c52f8e1-f9a5-4459-8', 'Commercial', 'Pending', '2021-05-24', '2020-02-25 00:00:00', 'Variable', 86623.6, 'Paid', 'Acquittal', 284, '29234217-406d-4d1f-8', 'c22b0819-a1fb-4320-8'),
('98ed5deb-c7b9-474d-b', 'Civil', 'Closed', '2023-08-09', '2024-05-15 00:00:00', 'Fixed', 61666.5, 'Failed', 'Dismissed', 227, 'e4784efe-764c-4b7a-8', 'e56afd6d-f325-425d-9'),
('adc2e9f0-5efd-4b8a-9', 'Civil', 'Settled', '2022-05-11', '2022-04-19 00:00:00', 'Variable', 78672.4, 'Pending', 'Settled', 155, '745ad464-f8fc-423e-b', '66916f2c-f870-4268-b'),
('0590a596-e481-47ea-a', 'Criminal', 'Settled', '2021-10-06', '2022-12-10 00:00:00', 'Fixed', 26942, 'Pending', 'Acquittal', 356, 'b015979c-4009-4b8d-b', '5a5a5fa2-0f7b-4169-9'),
('02f313ab-dbf0-4c94-a', 'Civil', 'Pending', '2024-08-30', '2021-10-15 00:00:00', 'Fixed', 39956.5, 'Paid', 'Settled', 151, 'c992542e-7a8f-4d4d-9', '9d227dcc-9bd6-4191-a'),
('ee3f1e98-82df-4d47-9', 'Commercial', 'Closed', '2024-05-24', '2023-05-23 00:00:00', 'Variable', 65372.9, 'Pending', 'Acquittal', 124, 'ed3ef324-cc32-4c78-9', 'ffb10670-7f60-49f4-a'),
('30c1eeb3-5288-4ff0-a', 'Labour', 'Dismissed', '2020-09-07', '2021-05-10 00:00:00', 'Fixed', 85415.4, 'Paid', 'Conviction', 259, '86e204e5-2659-494a-8', '2cf6f9d9-cb93-40d5-a'),
('d49e6df0-1b16-4548-9', 'Family', 'Dismissed', '2023-06-16', '2021-12-21 00:00:00', 'Fixed', 66057.7, 'Pending', 'Settled', 309, 'd15825f3-560f-410f-9', 'e1e8d8c6-2140-41ca-a'),
('ccce1209-03a7-4549-a', 'Commercial', 'Settled', '2022-03-28', '2020-09-24 00:00:00', 'Variable', 3271.95, 'Failed', 'Conviction', 286, 'b4c7ff88-0b49-41b2-9', 'c825f93f-6cfa-4f68-8'),
('0744db92-5a0b-4b44-9', 'Commercial', 'Settled', '2020-02-21', '2021-05-19 00:00:00', 'Variable', 7710.74, 'Paid', 'Dismissed', 224, '6f8318ac-fbb2-422b-9', '0e541fb3-ae86-4e90-9'),
('15802fe7-ec75-41aa-8', 'Criminal', 'Closed', '2024-03-04', '2022-06-01 00:00:00', 'Variable', 41368.7, 'Pending', 'Settled', 31, '2f986008-e4b0-4c82-a', 'e667788d-9ea2-4b98-9'),
('40feddee-a1bd-4134-8', 'Family', 'Settled', '2020-10-05', '2020-06-28 00:00:00', 'Fixed', 67530.2, 'Paid', 'Conviction', 315, 'c83a86cf-1ab7-4005-8', '4c791300-b8dd-46c5-b'),
('32434650-fdae-4e10-8', 'Commercial', 'Dismissed', '2021-08-31', '2021-07-04 00:00:00', 'Fixed', 30781.9, 'Paid', 'Settled', 364, '6fb96b66-f921-4b36-9', 'fb29f2c8-d6a0-4034-8'),
('6af78976-c449-4938-8', 'Criminal', 'Pending', '2024-10-15', '2021-06-08 00:00:00', 'Variable', 45859.6, 'Paid', 'Settled', 62, '6b56a754-52dd-44af-b', '19077859-93e1-4762-b'),
('e162ea35-3fef-46b1-8', 'Labour', 'Dismissed', '2024-10-09', '2021-05-06 00:00:00', 'Fixed', 18497.4, 'Failed', 'Conviction', 278, '56bd7a85-e96a-4cc4-9', '84bd4104-9ccc-472b-8'),
('f86d1381-952f-4ec1-a', 'Family', 'Dismissed', '2022-12-01', '2020-10-11 00:00:00', 'Variable', 64746.7, 'Failed', 'Settled', 209, '26185953-56f9-414c-a', 'bfc2d093-5763-4d7e-9'),
('33294beb-e5ed-47c0-8', 'Criminal', 'Pending', '2022-04-15', '2022-03-30 00:00:00', 'Variable', 20506, 'Paid', 'Acquittal', 285, 'aca38b87-932e-42dd-a', '7705e945-3bdd-4856-9'),
('a2779957-163d-4370-8', 'Labour', 'Dismissed', '2020-12-03', '2021-06-25 00:00:00', 'Fixed', 57142.1, 'Paid', 'Acquittal', 65, '7db21429-ef7e-4f19-9', 'f21fced2-eb73-4983-8'),
('1624e378-e4f9-4161-9', 'Commercial', 'Dismissed', '2020-06-05', '2024-06-20 00:00:00', 'Fixed', 65555.8, 'Paid', 'Settled', 91, '2684c2d7-b96c-4399-a', '742c5fe1-59c8-4bf9-9'),
('359d2137-324e-41fa-8', 'Commercial', 'Pending', '2023-12-28', '2022-06-26 00:00:00', 'Variable', 27562.8, 'Paid', 'Dismissed', 301, '9208cf34-0765-4b4f-8', 'b9c3ff91-5adb-447f-a'),
('313d3e18-8fc3-4cb7-9', 'Family', 'Closed', '2021-09-17', '2020-11-23 00:00:00', 'Variable', 69154.1, 'Pending', 'Settled', 182, 'efaa55bd-d4b2-41ef-9', 'c94437aa-6612-431b-8'),
('2bb15c30-3ed6-4cba-8', 'Criminal', 'Settled', '2023-02-27', '2021-09-25 00:00:00', 'Variable', 6335.24, 'Failed', 'Acquittal', 283, 'be023a95-eabe-4362-b', '1721a01d-359c-4ceb-a'),
('a3986d68-bd51-4374-b', 'Criminal', 'Closed', '2020-07-16', '2021-10-30 00:00:00', 'Fixed', 14614.2, 'Paid', 'Conviction', 151, 'd07e9e40-e32b-4e8f-b', 'b4321f51-eaa7-43c4-b'),
('ed6fb6af-d1a1-4aae-9', 'Commercial', 'Settled', '2021-07-21', '2022-10-27 00:00:00', 'Variable', 66445.1, 'Pending', 'Settled', 359, '3599f92c-00b3-42d4-9', '8bd8210a-1757-45b2-b'),
('8d5ecb82-fb99-47c1-8', 'Commercial', 'Settled', '2022-07-06', '2022-11-10 00:00:00', 'Fixed', 69439.6, 'Failed', 'Settled', 199, '9fa3f6c7-dc54-4533-a', '36a5fc8d-409b-4e81-b'),
('ea665b55-18a0-4a31-a', 'Civil', 'Settled', '2021-05-15', '2023-08-08 00:00:00', 'Variable', 29909.6, 'Failed', 'Dismissed', 141, '8fbacbad-97a9-49fb-a', 'a44f958a-cf59-44f6-9'),
('4373f039-d512-45cb-a', 'Labour', 'Dismissed', '2021-07-30', '2024-01-21 00:00:00', 'Variable', 55210.4, 'Pending', 'Acquittal', 283, '6dc53cd1-3476-4531-a', '6b039d51-3056-4017-a'),
('7a17cfaf-5216-4eec-8', 'Commercial', 'Dismissed', '2022-06-20', '2021-02-17 00:00:00', 'Variable', 28581.8, 'Failed', 'Dismissed', 336, '320af09c-93e6-4e07-9', 'c62e555f-5154-438e-a'),
('f0492360-1357-4422-a', 'Civil', 'Dismissed', '2020-05-20', '2021-02-23 00:00:00', 'Variable', 76276.4, 'Pending', 'Acquittal', 287, 'ac3fe703-1b6f-4239-8', 'a2e655c4-7cf4-4ae1-a'),
('0f390990-2b92-4d77-8', 'Civil', 'Dismissed', '2023-01-29', '2021-11-11 00:00:00', 'Fixed', 4936.85, 'Pending', 'Acquittal', 237, '8c319476-73a9-4e02-9', '7a5a77be-55b0-4c45-a'),
('9fef094c-15a2-40ce-a', 'Labour', 'Closed', '2023-12-06', '2022-12-31 00:00:00', 'Fixed', 28860.1, 'Paid', 'Acquittal', 304, '464405a2-1af0-4dc6-a', 'b4c79501-f70c-4b04-8'),
('13c6dca3-f80d-4a5a-a', 'Civil', 'Dismissed', '2023-07-15', '2020-07-19 00:00:00', 'Variable', 59514.3, 'Failed', 'Dismissed', 340, '7335cccf-f8f0-4c36-8', 'f28a8f78-9136-4d88-a'),
('53242a47-c94d-4e77-8', 'Family', 'Closed', '2022-12-14', '2021-03-06 00:00:00', 'Fixed', 39771.2, 'Failed', 'Acquittal', 208, '3671dfc9-e2e2-4e10-a', 'c114175a-0e82-4d4a-9'),
('0dce0fe1-42ae-4292-a', 'Labour', 'Settled', '2023-01-23', '2024-05-10 00:00:00', 'Fixed', 3846.5, 'Pending', 'Dismissed', 95, '7da79d63-1811-4304-8', '0eb58b6d-4ea4-44e0-b'),
('138a6a96-e27d-40b1-9', 'Criminal', 'Closed', '2020-08-02', '2024-11-13 00:00:00', 'Variable', 81395.2, 'Pending', 'Acquittal', 191, '45406285-c4dc-432c-a', '7e925729-de8f-45df-b'),
('99e2e8ba-72d1-4698-8', 'Criminal', 'Pending', '2022-01-19', '2023-05-14 00:00:00', 'Variable', 69550, 'Paid', 'Dismissed', 221, '6119d633-d76a-440d-9', '35e7f9a3-55e8-41d7-a'),
('508109a8-722a-442a-b', 'Criminal', 'Settled', '2022-02-20', '2022-06-03 00:00:00', 'Fixed', 95989.8, 'Pending', 'Acquittal', 268, '33e412f8-bfcd-42fd-8', '7393acf8-fe6c-41ac-9'),
('529b437a-b09c-4900-9', 'Criminal', 'Pending', '2024-10-28', '2022-06-09 00:00:00', 'Variable', 64370, 'Pending', 'Conviction', 123, '9025c153-3487-4afa-a', '31d2da4e-87dd-4c3c-8'),
('f587e053-ad68-4a51-8', 'Commercial', 'Closed', '2022-01-16', '2021-03-15 00:00:00', 'Fixed', 49763.6, 'Paid', 'Settled', 349, 'c52cb92b-1e24-4940-b', '23223d8a-e29a-4d53-8'),
('0b92f09e-ec8e-4bf4-8', 'Criminal', 'Pending', '2024-05-16', '2021-05-31 00:00:00', 'Fixed', 5664.24, 'Paid', 'Conviction', 78, 'b0f91ff8-9982-4048-b', '33261d3f-0fde-4674-b'),
('5f8b77e8-2088-481a-a', 'Civil', 'Closed', '2020-03-10', '2024-04-08 00:00:00', 'Fixed', 57450, 'Pending', 'Conviction', 258, '00121f3e-a8bd-418b-8', '7b9111cc-9d9d-4f1c-9'),
('39865332-ed62-4d89-a', 'Labour', 'Dismissed', '2021-12-30', '2022-07-16 00:00:00', 'Fixed', 68862.8, 'Paid', 'Settled', 231, 'e271242c-9b6c-4827-a', 'c7f46a05-b4fd-4f2c-b'),
('f866e0c4-ee2d-44ef-a', 'Civil', 'Dismissed', '2022-09-29', '2023-05-17 00:00:00', 'Variable', 87729.1, 'Failed', 'Dismissed', 287, '28a7dc6e-eb7b-492a-8', '16976583-628d-4d35-a'),
('8a2767f3-c580-4ae0-b', 'Labour', 'Dismissed', '2023-03-08', '2023-09-04 00:00:00', 'Variable', 66513.8, 'Pending', 'Settled', 355, '62ce07e6-0ff2-4b49-b', '2a778f77-ed55-4865-a'),
('3368c5d9-b158-4c10-9', 'Family', 'Pending', '2021-02-11', '2024-05-07 00:00:00', 'Variable', 82186.9, 'Failed', 'Acquittal', 252, '36c2d088-ca2d-488c-9', '65b0e80f-66ee-44de-b'),
('3eeb7768-9463-4da5-9', 'Commercial', 'Closed', '2022-06-18', '2022-04-10 00:00:00', 'Variable', 48318.9, 'Paid', 'Dismissed', 278, '9f13983b-f041-4a42-b', '26b95e86-26cc-457e-9'),
('dc9873c5-483b-46d5-a', 'Commercial', 'Pending', '2020-07-27', '2023-11-04 00:00:00', 'Variable', 50347.3, 'Pending', 'Settled', 213, '00b2bb03-cc6e-4b76-b', '4fad4997-0da7-4931-a'),
('abf39f15-1c80-4ca5-9', 'Labour', 'Closed', '2021-11-14', '2024-03-27 00:00:00', 'Variable', 12130.6, 'Pending', 'Dismissed', 106, '5c7eb707-0456-4c5b-9', 'eb7416c6-052d-44c2-8'),
('fac9ee27-c920-4159-b', 'Commercial', 'Closed', '2023-09-25', '2021-04-30 00:00:00', 'Fixed', 48967, 'Failed', 'Settled', 331, '91469519-2482-4486-b', '9c514dad-ae35-49df-9'),
('a2065daa-29ee-480f-9', 'Commercial', 'Settled', '2023-10-15', '2022-10-15 00:00:00', 'Variable', 47388.1, 'Paid', 'Acquittal', 73, 'bd690063-6698-4890-9', 'c2121582-0e99-49af-8'),
('b5309fa0-10c5-4a1f-8', 'Family', 'Settled', '2021-01-23', '2023-03-26 00:00:00', 'Fixed', 95697.3, 'Failed', 'Dismissed', 250, '5fe42617-7c13-4cd5-9', 'cbbea9b5-bdb3-4ccb-8'),
('3c63698f-a9cf-42aa-b', 'Civil', 'Settled', '2024-08-15', '2022-12-08 00:00:00', 'Variable', 74270.3, 'Paid', 'Dismissed', 342, '37d9a45f-6ea3-48f5-a', '944ecd12-7f7a-4577-8'),
('2861f6d5-85eb-4259-8', 'Labour', 'Closed', '2024-02-21', '2021-11-03 00:00:00', 'Fixed', 37786.8, 'Paid', 'Dismissed', 158, '4fa1ca10-742b-400e-9', 'dd05674b-37f9-4342-a'),
('93a2b020-aa20-467a-b', 'Civil', 'Settled', '2021-08-05', '2021-12-07 00:00:00', 'Fixed', 98715.6, 'Pending', 'Acquittal', 73, 'e8d4eec9-599e-4509-8', '01603b84-0705-4aca-a'),
('58253fbf-d6a5-4882-a', 'Commercial', 'Pending', '2020-12-03', '2024-11-19 00:00:00', 'Fixed', 84075.8, 'Failed', 'Conviction', 257, 'ff441c03-e771-43b4-b', '874df824-2cc3-4877-b'),
('709acd27-b132-4353-b', 'Commercial', 'Closed', '2023-04-08', '2020-11-11 00:00:00', 'Variable', 51324.3, 'Failed', 'Dismissed', 224, '1512544e-9d83-4693-8', 'd6889279-b203-4748-9'),
('dee0e511-55ad-473e-9', 'Criminal', 'Pending', '2024-07-21', '2021-09-05 00:00:00', 'Fixed', 8853.63, 'Paid', 'Acquittal', 302, '7689bff7-2b84-4a38-9', 'f8d30ef1-b556-4918-b'),
('cc0142f0-004b-4e8b-8', 'Criminal', 'Settled', '2022-08-28', '2020-07-26 00:00:00', 'Variable', 51656.6, 'Paid', 'Dismissed', 236, 'a5d114e8-e178-466b-9', 'eb4c5140-88b3-42e3-9'),
('9c1c55b2-3abd-4b25-9', 'Labour', 'Closed', '2023-08-29', '2022-05-17 00:00:00', 'Fixed', 92756.5, 'Failed', 'Settled', 109, 'b4d329e4-770b-4c96-a', '9ec0b206-496c-42aa-8'),
('43d47d08-97a9-4441-9', 'Criminal', 'Settled', '2020-12-27', '2022-10-05 00:00:00', 'Variable', 31695.4, 'Paid', 'Dismissed', 223, 'df6efda2-77e9-4903-9', '873a296b-2d25-43a5-a'),
('47ec7f67-1c12-4c2b-8', 'Family', 'Pending', '2023-12-19', '2023-04-20 00:00:00', 'Variable', 15110, 'Paid', 'Dismissed', 130, '5280665c-4e11-4039-b', '5a4322f9-95c1-4478-8'),
('241b0d64-e8da-42af-b', 'Civil', 'Pending', '2020-05-24', '2022-12-05 00:00:00', 'Fixed', 95645.8, 'Failed', 'Conviction', 162, '1186938f-a9bc-4380-b', 'fc22113a-3602-4155-b'),
('f97bfc8d-e953-4f33-9', 'Labour', 'Pending', '2021-10-10', '2021-05-15 00:00:00', 'Fixed', 49793.8, 'Paid', 'Settled', 174, 'd75476f9-fb84-4d9e-a', 'd3baf2bf-1dfa-4649-8'),
('626d316d-2b8f-4ceb-8', 'Labour', 'Settled', '2022-01-22', '2022-02-15 00:00:00', 'Variable', 74334.3, 'Pending', 'Settled', 277, 'e7df6103-3f31-42e5-b', '58620ead-12ed-4440-b'),
('0fb9b991-b50a-4893-9', 'Commercial', 'Settled', '2020-01-03', '2024-06-28 00:00:00', 'Variable', 80597.4, 'Pending', 'Dismissed', 322, 'ddedbdfd-40dc-468e-a', 'de6565db-f0e6-4487-a'),
('0d7f8ee3-2e77-4e22-9', 'Family', 'Pending', '2021-03-11', '2020-11-02 00:00:00', 'Fixed', 87685.3, 'Failed', 'Settled', 302, '0c95de6d-732c-4866-8', '4138e352-b463-4410-9'),
('5e08d000-8195-4bc1-9', 'Labour', 'Closed', '2023-09-09', '2023-02-03 00:00:00', 'Fixed', 95551.3, 'Paid', 'Settled', 246, '126f1cc8-56ab-4e17-a', 'c9c84990-067c-4ede-b'),
('c65bac11-122f-4397-9', 'Civil', 'Settled', '2023-02-21', '2023-04-21 00:00:00', 'Fixed', 93370.6, 'Pending', 'Acquittal', 202, '26a07656-0dda-4e4d-9', 'dbdcdce9-6d8d-4dde-a'),
('1b3121c5-bb31-4f12-8', 'Labour', 'Dismissed', '2024-09-19', '2020-07-14 00:00:00', 'Fixed', 63417.2, 'Pending', 'Settled', 353, '59104775-bfbb-4301-9', '227b7858-29ae-4fa6-8'),
('6c1e4eb6-49aa-410f-a', 'Civil', 'Dismissed', '2024-05-15', '2021-06-07 00:00:00', 'Variable', 11854.1, 'Failed', 'Acquittal', 326, '062eed1e-b900-477b-a', 'f4e6f502-b11e-45d0-9'),
('470e3421-efef-466b-a', 'Family', 'Closed', '2021-05-19', '2023-04-13 00:00:00', 'Fixed', 77845.9, 'Failed', 'Acquittal', 284, '8fb1bb77-4aa4-4bfc-9', '6d82cf53-a46b-4645-a'),
('dffee6af-efcd-4f15-9', 'Criminal', 'Settled', '2024-02-19', '2024-10-05 00:00:00', 'Fixed', 16468.8, 'Pending', 'Acquittal', 319, '71dbd066-d37a-4643-a', '5665039e-b043-4d73-9'),
('14ec7c5a-0d30-45c1-8', 'Civil', 'Settled', '2021-08-14', '2023-04-24 00:00:00', 'Fixed', 73075.4, 'Failed', 'Settled', 352, 'f5fd606b-2f4d-471b-9', '585efa68-cd48-4dc7-b'),
('96c55840-f020-4db2-b', 'Civil', 'Dismissed', '2023-10-10', '2023-10-24 00:00:00', 'Fixed', 23402, 'Pending', 'Acquittal', 154, '9ff0cbf0-bded-4d8a-b', 'c7e70e57-4d3d-4d73-a'),
('1ed3aec0-4143-4334-9', 'Family', 'Pending', '2024-05-10', '2020-05-17 00:00:00', 'Fixed', 25541, 'Pending', 'Acquittal', 73, 'c01b03a5-b8c9-4725-9', '4cfa277b-d978-4fad-a'),
('e2325770-ffcb-4e53-9', 'Commercial', 'Settled', '2023-02-21', '2021-04-28 00:00:00', 'Variable', 64099.3, 'Pending', 'Acquittal', 275, '8d2d7ca4-05c8-4bf9-b', '11fb94e3-b160-437f-b'),
('52d5ab87-bd97-471e-a', 'Civil', 'Dismissed', '2020-01-24', '2022-06-09 00:00:00', 'Variable', 7884.4, 'Failed', 'Acquittal', 305, '5a726d8d-7480-4b41-b', '4a204e85-05f6-4c55-b'),
('f052810c-ad10-4ed5-b', 'Civil', 'Pending', '2023-07-13', '2023-06-14 00:00:00', 'Fixed', 64229.3, 'Failed', 'Acquittal', 172, '7318548d-6b29-430a-b', 'a5994541-0c81-4c39-8'),
('946d95e6-8a9b-4c41-9', 'Commercial', 'Dismissed', '2021-12-17', '2021-09-02 00:00:00', 'Fixed', 16864.2, 'Paid', 'Settled', 75, '0e14c97f-f920-41b4-9', '4d6883c5-93f1-4e94-8'),
('a53f038a-5f70-4a4b-9', 'Family', 'Settled', '2020-02-08', '2020-05-03 00:00:00', 'Variable', 41400.2, 'Paid', 'Conviction', 142, '2f67b0c9-8c62-415e-9', '1cd312a5-6e75-4d3d-9'),
('4040564b-707c-4b7a-a', 'Civil', 'Closed', '2022-07-05', '2022-03-20 00:00:00', 'Variable', 90905.6, 'Paid', 'Dismissed', 364, 'ee037dd2-cbfc-41b7-9', '9f893027-1539-4e9e-9'),
('635f8e61-a787-4d92-b', 'Labour', 'Dismissed', '2023-03-24', '2020-05-28 00:00:00', 'Variable', 84442.1, 'Paid', 'Conviction', 34, '61b61b51-c334-48e1-8', '8486bc24-6464-4d6e-b'),
('3dbe8738-621b-4ca5-a', 'Criminal', 'Dismissed', '2024-09-25', '2023-07-08 00:00:00', 'Variable', 88384, 'Pending', 'Settled', 244, 'c89f1d84-59ce-4599-8', '1fc3adb1-a2fb-43fa-9'),
('fe0b7e3b-263a-4840-8', 'Family', 'Closed', '2024-09-01', '2024-02-22 00:00:00', 'Variable', 92997.5, 'Paid', 'Dismissed', 109, '554dbc77-adfa-47e1-b', 'eae09d10-fa01-472d-9'),
('6d8a6310-46ea-4421-b', 'Civil', 'Dismissed', '2021-03-02', '2021-10-24 00:00:00', 'Fixed', 19153.9, 'Paid', 'Acquittal', 230, 'c6d1ac33-00c8-4ad5-b', 'a6e187fd-aff5-40f2-8'),
('9cc82fa2-cbb6-4c6f-9', 'Criminal', 'Dismissed', '2022-11-01', '2021-11-19 00:00:00', 'Variable', 71666.9, 'Failed', 'Dismissed', 252, '0751df82-fe37-4df4-a', 'a768295b-f58d-4404-b'),
('8c17909e-5883-47da-b', 'Criminal', 'Dismissed', '2024-05-26', '2022-06-27 00:00:00', 'Variable', 41358.8, 'Failed', 'Settled', 107, '68bb6fa0-6252-4844-9', '9d476112-258e-43f3-9'),
('b107bc63-89b8-4652-a', 'Civil', 'Closed', '2021-05-28', '2022-05-20 00:00:00', 'Variable', 97746.8, 'Failed', 'Acquittal', 357, 'f8c31285-aa18-455e-b', 'f723cdcf-8de6-4669-b'),
('ae624fdc-94bb-4d9c-b', 'Civil', 'Pending', '2020-10-08', '2020-02-20 00:00:00', 'Variable', 16320.4, 'Failed', 'Acquittal', 217, '97ee1895-c9b9-4795-9', 'e32a16ff-cdd3-43d4-a'),
('ab5bbc89-79e4-4f03-9', 'Family', 'Settled', '2023-10-20', '2021-12-28 00:00:00', 'Variable', 42831, 'Paid', 'Acquittal', 76, '558ecb3c-5493-48d4-9', '804744ee-7d83-4ceb-a'),
('3b909a87-2ba0-49b7-b', 'Family', 'Closed', '2021-08-08', '2020-10-22 00:00:00', 'Variable', 55661.9, 'Failed', 'Conviction', 40, '40771bf7-9a10-4e1d-9', '310c47bb-6060-4200-9'),
('d8f60125-4803-412b-a', 'Criminal', 'Settled', '2022-04-04', '2021-11-24 00:00:00', 'Variable', 44719, 'Pending', 'Dismissed', 351, 'd279028a-a6a3-43cf-9', '10662048-0bc2-423e-8'),
('8e3ab827-894f-4159-9', 'Labour', 'Dismissed', '2020-04-29', '2021-08-07 00:00:00', 'Fixed', 28554.8, 'Pending', 'Conviction', 91, 'ef02297e-9493-418b-8', '85090442-100c-435e-9'),
('82b7ce5c-9d05-4e85-9', 'Labour', 'Pending', '2022-05-14', '2020-09-29 00:00:00', 'Variable', 75415.2, 'Pending', 'Conviction', 164, 'a094485c-41d0-46fb-b', '1414163d-5096-4e0e-b'),
('e44048a5-2aa9-42b2-9', 'Civil', 'Dismissed', '2024-10-29', '2022-05-03 00:00:00', 'Fixed', 12291.5, 'Pending', 'Dismissed', 231, '2df882bc-caa3-4596-8', '32e3ae46-f40b-4c7d-a'),
('a404328c-db7e-4547-9', 'Criminal', 'Dismissed', '2024-07-09', '2024-02-20 00:00:00', 'Variable', 92350.3, 'Paid', 'Dismissed', 165, '343cdbae-1114-47b5-9', '12a1d7fe-e1e1-472f-9'),
('e70bb67f-7e35-4339-a', 'Criminal', 'Settled', '2021-11-22', '2023-02-28 00:00:00', 'Fixed', 58646.5, 'Failed', 'Settled', 316, '26c1df43-e2f8-43e6-b', '375e9535-414f-4ef9-9'),
('17b30e87-dcf0-4967-a', 'Labour', 'Pending', '2021-12-31', '2023-04-02 00:00:00', 'Variable', 69338.1, 'Pending', 'Conviction', 62, 'ed8acd26-9461-4cf8-8', 'c4fa52fd-b870-4063-a'),
('9e66b36d-3a3d-4299-9', 'Civil', 'Settled', '2021-01-23', '2020-10-10 00:00:00', 'Fixed', 69411.3, 'Failed', 'Settled', 233, '663f6f0d-9da3-4111-9', '7e8f8e33-ea70-4f40-8'),
('d6e363d7-a2af-41e9-9', 'Labour', 'Pending', '2024-05-07', '2022-04-01 00:00:00', 'Variable', 57153.1, 'Failed', 'Conviction', 177, '250571b9-fa52-47f7-b', '2a59b922-bbe0-42da-a'),
('2c52f8e1-f9a5-4459-8', 'Commercial', 'Pending', '2021-05-24', '2020-02-25 00:00:00', 'Variable', 86623.6, 'Paid', 'Acquittal', 284, '29234217-406d-4d1f-8', 'c22b0819-a1fb-4320-8'),
('98ed5deb-c7b9-474d-b', 'Civil', 'Closed', '2023-08-09', '2024-05-15 00:00:00', 'Fixed', 61666.5, 'Failed', 'Dismissed', 227, 'e4784efe-764c-4b7a-8', 'e56afd6d-f325-425d-9'),
('adc2e9f0-5efd-4b8a-9', 'Civil', 'Settled', '2022-05-11', '2022-04-19 00:00:00', 'Variable', 78672.4, 'Pending', 'Settled', 155, '745ad464-f8fc-423e-b', '66916f2c-f870-4268-b'),
('0590a596-e481-47ea-a', 'Criminal', 'Settled', '2021-10-06', '2022-12-10 00:00:00', 'Fixed', 26942, 'Pending', 'Acquittal', 356, 'b015979c-4009-4b8d-b', '5a5a5fa2-0f7b-4169-9'),
('02f313ab-dbf0-4c94-a', 'Civil', 'Pending', '2024-08-30', '2021-10-15 00:00:00', 'Fixed', 39956.5, 'Paid', 'Settled', 151, 'c992542e-7a8f-4d4d-9', '9d227dcc-9bd6-4191-a'),
('ee3f1e98-82df-4d47-9', 'Commercial', 'Closed', '2024-05-24', '2023-05-23 00:00:00', 'Variable', 65372.9, 'Pending', 'Acquittal', 124, 'ed3ef324-cc32-4c78-9', 'ffb10670-7f60-49f4-a'),
('30c1eeb3-5288-4ff0-a', 'Labour', 'Dismissed', '2020-09-07', '2021-05-10 00:00:00', 'Fixed', 85415.4, 'Paid', 'Conviction', 259, '86e204e5-2659-494a-8', '2cf6f9d9-cb93-40d5-a'),
('d49e6df0-1b16-4548-9', 'Family', 'Dismissed', '2023-06-16', '2021-12-21 00:00:00', 'Fixed', 66057.7, 'Pending', 'Settled', 309, 'd15825f3-560f-410f-9', 'e1e8d8c6-2140-41ca-a'),
('ccce1209-03a7-4549-a', 'Commercial', 'Settled', '2022-03-28', '2020-09-24 00:00:00', 'Variable', 3271.95, 'Failed', 'Conviction', 286, 'b4c7ff88-0b49-41b2-9', 'c825f93f-6cfa-4f68-8'),
('0744db92-5a0b-4b44-9', 'Commercial', 'Settled', '2020-02-21', '2021-05-19 00:00:00', 'Variable', 7710.74, 'Paid', 'Dismissed', 224, '6f8318ac-fbb2-422b-9', '0e541fb3-ae86-4e90-9'),
('15802fe7-ec75-41aa-8', 'Criminal', 'Closed', '2024-03-04', '2022-06-01 00:00:00', 'Variable', 41368.7, 'Pending', 'Settled', 31, '2f986008-e4b0-4c82-a', 'e667788d-9ea2-4b98-9'),
('40feddee-a1bd-4134-8', 'Family', 'Settled', '2020-10-05', '2020-06-28 00:00:00', 'Fixed', 67530.2, 'Paid', 'Conviction', 315, 'c83a86cf-1ab7-4005-8', '4c791300-b8dd-46c5-b'),
('32434650-fdae-4e10-8', 'Commercial', 'Dismissed', '2021-08-31', '2021-07-04 00:00:00', 'Fixed', 30781.9, 'Paid', 'Settled', 364, '6fb96b66-f921-4b36-9', 'fb29f2c8-d6a0-4034-8'),
('6af78976-c449-4938-8', 'Criminal', 'Pending', '2024-10-15', '2021-06-08 00:00:00', 'Variable', 45859.6, 'Paid', 'Settled', 62, '6b56a754-52dd-44af-b', '19077859-93e1-4762-b'),
('e162ea35-3fef-46b1-8', 'Labour', 'Dismissed', '2024-10-09', '2021-05-06 00:00:00', 'Fixed', 18497.4, 'Failed', 'Conviction', 278, '56bd7a85-e96a-4cc4-9', '84bd4104-9ccc-472b-8'),
('f86d1381-952f-4ec1-a', 'Family', 'Dismissed', '2022-12-01', '2020-10-11 00:00:00', 'Variable', 64746.7, 'Failed', 'Settled', 209, '26185953-56f9-414c-a', 'bfc2d093-5763-4d7e-9'),
('33294beb-e5ed-47c0-8', 'Criminal', 'Pending', '2022-04-15', '2022-03-30 00:00:00', 'Variable', 20506, 'Paid', 'Acquittal', 285, 'aca38b87-932e-42dd-a', '7705e945-3bdd-4856-9'),
('a2779957-163d-4370-8', 'Labour', 'Dismissed', '2020-12-03', '2021-06-25 00:00:00', 'Fixed', 57142.1, 'Paid', 'Acquittal', 65, '7db21429-ef7e-4f19-9', 'f21fced2-eb73-4983-8'),
('1624e378-e4f9-4161-9', 'Commercial', 'Dismissed', '2020-06-05', '2024-06-20 00:00:00', 'Fixed', 65555.8, 'Paid', 'Settled', 91, '2684c2d7-b96c-4399-a', '742c5fe1-59c8-4bf9-9'),
('359d2137-324e-41fa-8', 'Commercial', 'Pending', '2023-12-28', '2022-06-26 00:00:00', 'Variable', 27562.8, 'Paid', 'Dismissed', 301, '9208cf34-0765-4b4f-8', 'b9c3ff91-5adb-447f-a'),
('313d3e18-8fc3-4cb7-9', 'Family', 'Closed', '2021-09-17', '2020-11-23 00:00:00', 'Variable', 69154.1, 'Pending', 'Settled', 182, 'efaa55bd-d4b2-41ef-9', 'c94437aa-6612-431b-8'),
('2bb15c30-3ed6-4cba-8', 'Criminal', 'Settled', '2023-02-27', '2021-09-25 00:00:00', 'Variable', 6335.24, 'Failed', 'Acquittal', 283, 'be023a95-eabe-4362-b', '1721a01d-359c-4ceb-a'),
('a3986d68-bd51-4374-b', 'Criminal', 'Closed', '2020-07-16', '2021-10-30 00:00:00', 'Fixed', 14614.2, 'Paid', 'Conviction', 151, 'd07e9e40-e32b-4e8f-b', 'b4321f51-eaa7-43c4-b'),
('ed6fb6af-d1a1-4aae-9', 'Commercial', 'Settled', '2021-07-21', '2022-10-27 00:00:00', 'Variable', 66445.1, 'Pending', 'Settled', 359, '3599f92c-00b3-42d4-9', '8bd8210a-1757-45b2-b'),
('8d5ecb82-fb99-47c1-8', 'Commercial', 'Settled', '2022-07-06', '2022-11-10 00:00:00', 'Fixed', 69439.6, 'Failed', 'Settled', 199, '9fa3f6c7-dc54-4533-a', '36a5fc8d-409b-4e81-b'),
('ea665b55-18a0-4a31-a', 'Civil', 'Settled', '2021-05-15', '2023-08-08 00:00:00', 'Variable', 29909.6, 'Failed', 'Dismissed', 141, '8fbacbad-97a9-49fb-a', 'a44f958a-cf59-44f6-9'),
('4373f039-d512-45cb-a', 'Labour', 'Dismissed', '2021-07-30', '2024-01-21 00:00:00', 'Variable', 55210.4, 'Pending', 'Acquittal', 283, '6dc53cd1-3476-4531-a', '6b039d51-3056-4017-a'),
('7a17cfaf-5216-4eec-8', 'Commercial', 'Dismissed', '2022-06-20', '2021-02-17 00:00:00', 'Variable', 28581.8, 'Failed', 'Dismissed', 336, '320af09c-93e6-4e07-9', 'c62e555f-5154-438e-a'),
('f0492360-1357-4422-a', 'Civil', 'Dismissed', '2020-05-20', '2021-02-23 00:00:00', 'Variable', 76276.4, 'Pending', 'Acquittal', 287, 'ac3fe703-1b6f-4239-8', 'a2e655c4-7cf4-4ae1-a'),
('0f390990-2b92-4d77-8', 'Civil', 'Dismissed', '2023-01-29', '2021-11-11 00:00:00', 'Fixed', 4936.85, 'Pending', 'Acquittal', 237, '8c319476-73a9-4e02-9', '7a5a77be-55b0-4c45-a'),
('9fef094c-15a2-40ce-a', 'Labour', 'Closed', '2023-12-06', '2022-12-31 00:00:00', 'Fixed', 28860.1, 'Paid', 'Acquittal', 304, '464405a2-1af0-4dc6-a', 'b4c79501-f70c-4b04-8'),
('13c6dca3-f80d-4a5a-a', 'Civil', 'Dismissed', '2023-07-15', '2020-07-19 00:00:00', 'Variable', 59514.3, 'Failed', 'Dismissed', 340, '7335cccf-f8f0-4c36-8', 'f28a8f78-9136-4d88-a'),
('53242a47-c94d-4e77-8', 'Family', 'Closed', '2022-12-14', '2021-03-06 00:00:00', 'Fixed', 39771.2, 'Failed', 'Acquittal', 208, '3671dfc9-e2e2-4e10-a', 'c114175a-0e82-4d4a-9'),
('0dce0fe1-42ae-4292-a', 'Labour', 'Settled', '2023-01-23', '2024-05-10 00:00:00', 'Fixed', 3846.5, 'Pending', 'Dismissed', 95, '7da79d63-1811-4304-8', '0eb58b6d-4ea4-44e0-b'),
('138a6a96-e27d-40b1-9', 'Criminal', 'Closed', '2020-08-02', '2024-11-13 00:00:00', 'Variable', 81395.2, 'Pending', 'Acquittal', 191, '45406285-c4dc-432c-a', '7e925729-de8f-45df-b'),
('99e2e8ba-72d1-4698-8', 'Criminal', 'Pending', '2022-01-19', '2023-05-14 00:00:00', 'Variable', 69550, 'Paid', 'Dismissed', 221, '6119d633-d76a-440d-9', '35e7f9a3-55e8-41d7-a'),
('508109a8-722a-442a-b', 'Criminal', 'Settled', '2022-02-20', '2022-06-03 00:00:00', 'Fixed', 95989.8, 'Pending', 'Acquittal', 268, '33e412f8-bfcd-42fd-8', '7393acf8-fe6c-41ac-9'),
('529b437a-b09c-4900-9', 'Criminal', 'Pending', '2024-10-28', '2022-06-09 00:00:00', 'Variable', 64370, 'Pending', 'Conviction', 123, '9025c153-3487-4afa-a', '31d2da4e-87dd-4c3c-8'),
('f587e053-ad68-4a51-8', 'Commercial', 'Closed', '2022-01-16', '2021-03-15 00:00:00', 'Fixed', 49763.6, 'Paid', 'Settled', 349, 'c52cb92b-1e24-4940-b', '23223d8a-e29a-4d53-8'),
('0b92f09e-ec8e-4bf4-8', 'Criminal', 'Pending', '2024-05-16', '2021-05-31 00:00:00', 'Fixed', 5664.24, 'Paid', 'Conviction', 78, 'b0f91ff8-9982-4048-b', '33261d3f-0fde-4674-b'),
('5f8b77e8-2088-481a-a', 'Civil', 'Closed', '2020-03-10', '2024-04-08 00:00:00', 'Fixed', 57450, 'Pending', 'Conviction', 258, '00121f3e-a8bd-418b-8', '7b9111cc-9d9d-4f1c-9'),
('39865332-ed62-4d89-a', 'Labour', 'Dismissed', '2021-12-30', '2022-07-16 00:00:00', 'Fixed', 68862.8, 'Paid', 'Settled', 231, 'e271242c-9b6c-4827-a', 'c7f46a05-b4fd-4f2c-b'),
('f866e0c4-ee2d-44ef-a', 'Civil', 'Dismissed', '2022-09-29', '2023-05-17 00:00:00', 'Variable', 87729.1, 'Failed', 'Dismissed', 287, '28a7dc6e-eb7b-492a-8', '16976583-628d-4d35-a');

-- --------------------------------------------------------

--
-- Table structure for table `dim_case_type`
--

CREATE TABLE `dim_case_type` (
  `Case_Type_ID` int(11) NOT NULL,
  `Case_Type_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dim_case_type`
--

INSERT INTO `dim_case_type` (`Case_Type_ID`, `Case_Type_Name`) VALUES
(2, 'Commercial'),
(3, 'Family'),
(4, 'Family'),
(5, 'Civil'),
(6, 'Criminal'),
(7, 'Civil'),
(8, 'Family'),
(60, 'Family'),
(66, 'Labour'),
(80, 'Labour'),
(98, 'Criminal'),
(158, 'Civil'),
(521, 'Civil'),
(625, 'Criminal'),
(919, 'Labour'),
(1000, 'Civil'),
(1462, 'Labour'),
(4989, 'Family'),
(6667, 'Civil'),
(7731, 'Civil'),
(8361, 'Civil'),
(8385, 'Commercial'),
(28535, 'Civil'),
(38716, 'Civil'),
(66131, 'Commercial'),
(210872, 'Labour'),
(14085269, 'Family'),
(2147483647, 'Family');

-- --------------------------------------------------------

--
-- Table structure for table `dim_case_types`
--

CREATE TABLE `dim_case_types` (
  `Case_Type_ID` int(11) NOT NULL,
  `Case_Type_Name` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dim_courts`
--

CREATE TABLE `dim_courts` (
  `Court_ID` int(11) NOT NULL,
  `Court_Name` varchar(100) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `Court_Location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dim_courts`
--

INSERT INTO `dim_courts` (`Court_ID`, `Court_Name`, `Location`, `Court_Location`) VALUES
(1, 'Jones Ltd Court', NULL, 'Takoradi'),
(2, 'Mcmillan-Rodriguez Court', NULL, 'Ho'),
(3, 'Jackson-Daniels Court', NULL, 'Bolgatanga'),
(4, 'Hamilton, Parrish and Riley Court', NULL, 'Koforidua'),
(5, 'Mcmillan Inc Court', NULL, 'Bolgatanga'),
(6, 'Moore-Carpenter Court', NULL, 'Bolgatanga'),
(7, 'Soto and Sons Court', NULL, 'Takoradi'),
(9, 'Curtis, Moreno and Evans Court', NULL, 'Tamale'),
(14, 'Blake Inc Court', NULL, 'Tamale'),
(15, 'Bates, Hanna and Jordan Court', NULL, 'Koforidua'),
(22, 'Buchanan LLC Court', NULL, 'Koforidua'),
(33, 'Perez, Howe and Perry Court', NULL, 'Tamale'),
(43, 'Ward Ltd Court', NULL, 'Takoradi'),
(48, 'Hale, Rodriguez and Carter Court', NULL, 'Kumasi'),
(60, 'Wheeler-Arroyo Court', NULL, 'Bolgatanga'),
(68, 'Palmer Ltd Court', NULL, 'Sekondi'),
(77, 'Harvey LLC Court', NULL, 'Accra'),
(86, 'Garcia-Johnson Court', NULL, 'Cape Coast'),
(95, 'Sullivan, Hull and Roy Court', NULL, 'Sunyani'),
(120, 'Payne LLC Court', NULL, 'Accra'),
(128, 'Clark PLC Court', NULL, 'Accra'),
(129, 'Jackson-Lawson Court', NULL, 'Tamale'),
(262, 'Black, Decker and Velez Court', NULL, 'Koforidua'),
(268, 'Evans, Fuller and Warren Court', NULL, 'Tamale'),
(304, 'Morgan Ltd Court', NULL, 'Bolgatanga'),
(357, 'Gonzalez, Ramos and Andrews Court', NULL, 'Takoradi'),
(639, 'Wiley and Sons Court', NULL, 'Ho'),
(646, 'Adams-Arnold Court', NULL, 'Bolgatanga'),
(726, 'Woods, Douglas and Ortiz Court', NULL, 'Sekondi'),
(730, 'Wells and Sons Court', NULL, 'Sekondi'),
(846, 'Rodgers-Adams Court', NULL, 'Takoradi'),
(898, 'Harrington-Collins Court', NULL, 'Accra'),
(1513, 'Bradley, Bailey and Carey Court', NULL, 'Kumasi'),
(3428, 'Mahoney PLC Court', NULL, 'Tamale'),
(7536, 'Anderson, Ford and Franklin Court', NULL, 'Bolgatanga'),
(19076, 'Lane-Hull Court', NULL, 'Takoradi'),
(26346, 'Pena, Craig and Herring Court', NULL, 'Takoradi'),
(40653, 'Smith and Sons Court', NULL, 'Tamale'),
(53464, 'Fernandez, Sutton and West Court', NULL, 'Bolgatanga'),
(56236, 'Mueller, Gibbs and Moore Court', NULL, 'Cape Coast'),
(87638, 'Cooper-Williams Court', NULL, 'Kumasi'),
(95342, 'Leonard and Sons Court', NULL, 'Tamale'),
(99698, 'Fleming, Conner and Johnston Court', NULL, 'Sekondi'),
(362562, 'Gamble, Mcclure and Gardner Court', NULL, 'Koforidua'),
(520212, 'Fischer-Kennedy Court', NULL, 'Takoradi'),
(629796, 'Hanson-Chase Court', NULL, 'Kumasi'),
(892229, 'Young Ltd Court', NULL, 'Kumasi'),
(6499512, 'Parker-Clark Court', NULL, 'Sunyani'),
(7530682, 'Pratt, Davis and Dickerson Court', NULL, 'Sunyani'),
(11886590, 'Lang and Sons Court', NULL, 'Sunyani'),
(54383491, 'Barnes-Nelson Court', NULL, 'Accra'),
(200000000, 'Roberts, Carter and Brooks Court', NULL, 'Koforidua'),
(2147483647, 'Ruiz-Harris Court', NULL, 'Bolgatanga');

-- --------------------------------------------------------

--
-- Table structure for table `dim_judges`
--

CREATE TABLE `dim_judges` (
  `Judge_ID` varchar(36) NOT NULL,
  `Judge_Name` varchar(100) DEFAULT NULL,
  `Experience_Years` int(11) DEFAULT NULL,
  `Specialization` varchar(50) DEFAULT NULL,
  `Assigned_Court` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dim_judges`
--

INSERT INTO `dim_judges` (`Judge_ID`, `Judge_Name`, `Experience_Years`, `Specialization`, `Assigned_Court`) VALUES
('019becde-ea91-44da-8a00-535aa0168592', 'Akosua Jones', 5, 'Civil', 'Barber Group Court'),
('0249cbfc-276b-47c2-9b66-7c6a0bd2ddb2', 'Kofi Parsons', 16, 'Criminal', 'Peters PLC Court'),
('04f6dd44-f8c4-4f6f-9cdf-17d931e65f51', 'Kwame Hill', 22, 'Commercial', 'Fuentes PLC Court'),
('08070546-0cf0-4e5b-bdde-116d33fb0e96', 'Yaw Moore', 8, 'Criminal', 'Lamb, Kline and Brewer Court'),
('0959907a-723d-4a9b-9674-ba8fe521e154', 'Esi Harvey', 32, 'Civil', 'Santiago, Owens and Wang Court'),
('106e1407-4d22-43ce-b6d6-af837067e2f1', 'Akosua Byrd', 11, 'Commercial', 'Richardson-Mendez Court'),
('12562f74-702f-43ba-8374-56579a377a6a', 'Akua Bonilla', 8, 'Criminal', 'Rivas, Morse and English Court'),
('1a5f2cd3-8b8e-4831-8b9b-4e3e054b755f', 'Akosua Martin', 30, 'Criminal', 'Wood, Alvarez and Gonzales Court'),
('1b34e706-9532-4ac7-8202-2813c7626a76', 'Kwabena Gould', 28, 'Family', 'Jones Group Court'),
('20ca45f6-b1ac-4935-8089-3204eedd2c30', 'Kwabena Rice', 28, 'Commercial', 'Nunez, Serrano and Moyer Court'),
('21e87417-6659-4390-89e7-a9cbdf1ea50b', 'Abena Frazier', 29, 'Commercial', 'Mitchell Group Court'),
('220c5272-1cdd-4f4d-9128-1f4cdabfd4bd', 'Akua Anderson', 16, 'Civil', 'Lopez and Sons Court'),
('272b6377-8e7a-48ee-85a2-b832f2adcb4a', 'Ama Davis', 30, 'Commercial', 'Wood-Miller Court'),
('2c62d0ab-860f-4a41-85bd-cc96eabb39ff', 'Yaw Kane', 32, 'Criminal', 'Smith-Rubio Court'),
('32875e5a-4c33-444b-87d3-b36997bc929f', 'Kofi Mcclure', 10, 'Commercial', 'Davis Inc Court'),
('34a29fbd-6ae5-4bf9-bbeb-78079ba3e991', 'Afia Thomas', 8, 'Family', 'Kelly-Gonzalez Court'),
('3912aafd-f775-4bb1-a33e-340e727785f3', 'Akosua Montgomery', 7, 'Commercial', 'Price-Copeland Court'),
('3bc0ad4c-0e5b-4ce2-aa74-3da55778ff42', 'Ama Smith', 18, 'Commercial', 'Lloyd, Knox and Powers Court'),
('3fdc0550-42bb-479a-bb82-94351f8f569d', 'Yaw Reid', 32, 'Commercial', 'Moore, Hobbs and Compton Court'),
('41456b4e-2a94-4941-96f5-6f0bdf45eefe', 'Esi Marsh', 29, 'Civil', 'Lewis-Campos Court'),
('42ecedd4-ee64-4c9f-a120-3f626e6d569d', 'Yaw Guzman', 29, 'Criminal', 'Johnson LLC Court'),
('475b8cea-33e1-4570-8051-c1c7d3040a9c', 'Ama Ortiz', 6, 'Commercial', 'Robertson, Norris and Adams Court'),
('4839135b-7407-4c98-888b-0b05136dc44b', 'Akosua Walker', 5, 'Civil', 'Sandoval Group Court'),
('4bec7549-8cf4-4eb9-be8f-cd4570744d3a', 'Ama Mcdaniel', 19, 'Criminal', 'Dunn Inc Court'),
('4c06224e-b1d0-42b5-9f8c-644bb80b6213', 'Esi Payne', 13, 'Family', 'Cruz, Wilson and Norman Court'),
('4e935f11-4e07-4178-887e-79aac685a2ff', 'Kwame Hale', 20, 'Family', 'Thompson Group Court'),
('54aadc66-ee48-4a5f-b79b-f05624ae4dfc', 'Akosua Jones', 35, 'Commercial', 'Taylor-Holmes Court'),
('54e93de9-7230-4cf8-9622-fbd6462747ae', 'Abena Cunningham', 32, 'Civil', 'Lee, Wagner and Williams Court'),
('5534dc9a-6a5d-41d8-b45d-ccc48468b991', 'Akua Peters', 30, 'Family', 'Brown-Davis Court'),
('55c2f944-3382-46ff-8698-4f719b7e6de6', 'Akosua Robinson', 27, 'Civil', 'Walter LLC Court'),
('55e818a6-cf85-4f03-b4dd-95f5aa7435ab', 'Ama Davis', 26, 'Criminal', 'Wolf, Kaiser and Wilson Court'),
('5a287148-e9c0-45a0-88dd-9bf94290bdd4', 'Kwabena Freeman', 16, 'Family', 'Morris Inc Court'),
('5c49d315-fd50-4808-a329-0628fdd5d1f0', 'Kwame Martin', 31, 'Commercial', 'Jones-Sellers Court'),
('5d7d0774-904a-4566-8203-c5a935c82a7c', 'Ama Zimmerman', 35, 'Civil', 'Garcia-Palmer Court'),
('616420b9-3c15-4c09-ae68-47014e55e29c', 'Ama Farmer', 14, 'Commercial', 'Harrison-Taylor Court'),
('63321c6c-8dac-4eda-b6cd-c383e2ade354', 'Kwame Howard', 6, 'Civil', 'Robinson and Sons Court'),
('67bd1aa1-aa78-4661-8d95-baba255b0963', 'Kwame Franklin', 17, 'Commercial', 'Peters-Gay Court'),
('67faf4f9-d98f-46fe-b07c-cec86f429f06', 'Kwabena Martin', 35, 'Civil', 'Vargas Group Court'),
('68587a1b-95ac-4c55-ad5c-e8273a6c4565', 'Abena Downs', 15, 'Commercial', 'Mclaughlin-Acosta Court'),
('7772da4e-e16a-4f31-9040-281baf03c2ad', 'Kwame Garrison', 31, 'Family', 'Green-White Court'),
('78f31f64-4b20-434a-be5c-520edd658a49', 'Kwabena Lee', 23, 'Commercial', 'Miller, Willis and Martinez Court'),
('78f34d24-a6cd-4e26-abf2-cf6d7d1c6d5a', 'Kofi Wright', 28, 'Commercial', 'Kirk and Sons Court'),
('7f83c8ad-bcd2-4a1f-b1d6-c5f2281520dc', 'Akua Daugherty', 25, 'Commercial', 'Stone and Sons Court'),
('82c62b8b-f245-4e53-b0a6-3d8fadf766a2', 'Akua Jackson', 33, 'Commercial', 'Mayer, Johnson and Hensley Court'),
('82f0b90f-d98f-4e2b-82c3-4820a05d9a55', 'Kwabena Williams', 27, 'Criminal', 'Burke, Mejia and Smith Court'),
('8555daf9-e0b1-4b0d-a6d9-f547047af4c6', 'Akua Reilly', 19, 'Criminal', 'Sanders, Diaz and Anderson Court'),
('87be4036-9bb5-4a26-bf03-2bde9d74f466', 'Esi Rodriguez', 18, 'Commercial', 'Garcia-Anderson Court'),
('8bcb4f0f-a6b5-4380-ad34-be0a75327e47', 'Akosua Ross', 12, 'Civil', 'Bates, Daniels and Aguilar Court'),
('8bdb5b91-4719-4b50-8e51-a2ab78dfacb4', 'Abena Edwards', 15, 'Family', 'King Group Court'),
('8ec2dd84-5574-4a1c-a96c-a6eb5a0b0b08', 'Kofi Dodson', 16, 'Family', 'Pearson, Smith and Turner Court'),
('96d26e47-6a52-4dc9-844d-255e8c7a2308', 'Ama Mitchell', 9, 'Civil', 'Lawrence and Sons Court'),
('970709a7-456e-4b65-a1c6-f803b930b43a', 'Ama Clark', 30, 'Family', 'Dennis PLC Court'),
('9a9daaae-8d42-413e-ba09-33ac6086ebd8', 'Afia Rodriguez', 20, 'Criminal', 'Downs LLC Court'),
('9f930b4f-8e57-4efc-9283-79065366fba7', 'Kofi Washington', 10, 'Criminal', 'Moore, White and Sharp Court'),
('9fadf814-2d75-4b9d-8b17-be1c4ecd33fd', 'Abena Zimmerman', 17, 'Criminal', 'Zimmerman Ltd Court'),
('aba912ea-6757-41e6-95f9-114517dc51d5', 'Ama Gilbert', 16, 'Civil', 'James-Scott Court'),
('ac66bfef-2fcc-41e2-91ce-f0e888b00ff9', 'Esi Scott', 10, 'Criminal', 'Smith, Taylor and Hamilton Court'),
('ae4532ed-7e07-4fe7-aacf-4c50e117517e', 'Esi Phillips', 17, 'Criminal', 'Hernandez Inc Court'),
('ae633331-6f5a-4601-b229-8eee27a50807', 'Akosua Johnson', 30, 'Commercial', 'Rice, Harper and Gomez Court'),
('ae8e1e20-55d1-43da-98f3-95a47ef979ee', 'Esi Snyder', 34, 'Family', 'Melendez-Carroll Court'),
('aebbedb7-4be6-418b-93f1-3e0a54d91bfc', 'Yaw Harper', 18, 'Civil', 'Johnson Group Court'),
('b0cb81da-0556-4060-89f8-e8ab46d1c5f4', 'Esi Long', 14, 'Criminal', 'Larsen-Harris Court'),
('b0e9b2fd-5a51-4fdd-a96e-224e85c67328', 'Kofi Clay', 31, 'Criminal', 'Berg, Fuller and Miller Court'),
('b2b69686-9cd4-4da1-b218-2a3d68e88b2b', 'Kofi Burke', 24, 'Criminal', 'Barnett PLC Court'),
('b5115cd0-3099-4eff-bbfe-7c30a5481d18', 'Akua Gonzalez', 35, 'Criminal', 'Nichols-Hoffman Court'),
('bcc84c0f-dcd0-485c-9044-57cbe0eb6f52', 'Kwame Martin', 29, 'Commercial', 'Silva, Williams and Browning Court'),
('bd93b191-5129-4c70-9b27-65f449b888b3', 'Kwabena Logan', 29, 'Criminal', 'Miller Group Court'),
('c172ab58-f8e3-4627-8dfb-aa0fe1c0776d', 'Esi Leon', 33, 'Commercial', 'Cox, Carey and Hoover Court'),
('c2ebfae2-cdf7-4f09-aa4e-76e9e6f138b9', 'Kwame Shaw', 23, 'Family', 'Jackson-Boone Court'),
('c31305d3-da3d-4812-a4fc-330b2bb1f225', 'Akua Adkins', 23, 'Criminal', 'Moore, Kennedy and Green Court'),
('c549ed3e-ec30-4625-9fd1-10f7c0374c49', 'Kwabena Wu', 27, 'Criminal', 'George, Nelson and Walters Court'),
('c55cafa6-9ae0-4201-9df3-2312b0d98c23', 'Kofi Schmidt', 32, 'Civil', 'Riley-Foster Court'),
('c833aaf0-a510-43e4-be63-6e29ff655dd2', 'Akua Black', 23, 'Commercial', 'Robbins, Johnson and Galloway Court'),
('cb25b1d5-e8ad-44ac-8ac9-b7a6ec43fe86', 'Ama Smith', 19, 'Civil', 'Bryan PLC Court'),
('cdc7a373-b429-41f4-b08f-6e95456e0f28', 'Ama Ferguson', 10, 'Criminal', 'Maynard-James Court'),
('ce540631-d15a-4f9d-8d63-ddbae8eb3ac8', 'Akosua Arroyo', 18, 'Civil', 'Campbell-Lozano Court'),
('d08db0bc-cd63-44a6-baed-254391e042fb', 'Afia Nunez', 31, 'Family', 'Padilla-Williams Court'),
('d2d8dc62-cc26-426c-a7e4-3ecfbd4d4056', 'Yaw Mcintyre', 27, 'Criminal', 'Jones, Hernandez and Burton Court'),
('d3993836-2d5f-4328-b5dd-d370e5214b26', 'Akosua White', 23, 'Family', 'Mckinney-Kennedy Court'),
('d5fbc94a-12b8-49cc-a1a0-af0f95f52ea0', 'Kofi Jackson', 10, 'Civil', 'Roberson-Ferguson Court'),
('d600cc46-0f35-4329-8a6f-1a410ab08303', 'Akosua Brown', 31, 'Commercial', 'Murphy LLC Court'),
('d7d72500-12f8-4ffb-a2c8-456d8cef75ae', 'Kwabena Murphy', 7, 'Civil', 'Meza-Brown Court'),
('d9029f4b-b4cc-4afb-863f-9af16f750ce2', 'Ama Grant', 12, 'Family', 'Cooley, Jones and Martinez Court'),
('de5aded2-8c3f-4920-96ec-70a9c5a7fa2d', 'Esi Day', 6, 'Civil', 'Gonzalez PLC Court'),
('e09668e4-30f4-4952-b174-42fd1953fc2a', 'Abena Ray', 28, 'Civil', 'House Group Court'),
('e3e96446-f9c2-45c0-894f-2d993f9183b1', 'Afia Ewing', 21, 'Criminal', 'James, Stafford and Anderson Court'),
('e72bf28b-f172-4791-97e8-7e72fa508d96', 'Akua Hernandez', 18, 'Civil', 'Smith and Sons Court'),
('ed0bf9bc-a1de-4dbc-9656-785d71c438be', 'Afia Mcpherson', 17, 'Civil', 'Doyle LLC Court'),
('f002a126-4391-4bb8-9267-64d97c242d81', 'Ama Crawford', 22, 'Civil', 'Day-Young Court'),
('f0350be9-f6e0-4a1f-b43e-775adbe68018', 'Yaw Williams', 33, 'Commercial', 'Garcia, Sutton and Parker Court'),
('f16ca905-98c2-4f7e-88d9-73e0ad5405b8', 'Akua Hayes', 33, 'Civil', 'Farmer-Ramirez Court'),
('f2cbc91d-b45c-47e6-95a6-13cf4a316b8d', 'Yaw Myers', 35, 'Commercial', 'Weber PLC Court'),
('f5c1fff9-0464-4698-90d1-ddefc914e4be', 'Esi Gutierrez', 27, 'Family', 'Walter-Miller Court'),
('f685c064-2f6d-4a4f-a42c-d6f94b73570e', 'Kofi Clarke', 34, 'Criminal', 'Wood-Wong Court'),
('f7c87e57-3362-4ef5-8d9f-ee6350be2c4c', 'Akua Proctor', 30, 'Civil', 'Gardner and Sons Court'),
('f9949d40-2088-4db5-b1bc-6db261045dc2', 'Kwame Payne', 32, 'Civil', 'Li, Jordan and Travis Court'),
('fc806ba1-a055-4ab8-856b-12560e511f17', 'Abena Rich', 18, 'Family', 'Hurst-Roth Court'),
('fdbd8899-4c99-4265-99dc-7a23e48d6cc6', 'Esi Thompson', 17, 'Commercial', 'Martin, Robinson and Willis Court'),
('feb44065-87dc-4278-b7e7-b4b1eda0c543', 'Esi Smith', 14, 'Commercial', 'Rodriguez, Allen and Smith Court'),
('ffae4d49-9302-425c-a59a-a19fdb1b83a9', 'Kofi Wood', 23, 'Family', 'Fischer, Wilson and Rice Court');

-- --------------------------------------------------------

--
-- Table structure for table `dim_outcome_types`
--

CREATE TABLE `dim_outcome_types` (
  `Outcome_Type_ID` VARCHAR(50) NOT NULL,
  `Outcome_Name` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Outcome_Type_Name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dim_outcome_types`
--

INSERT INTO `dim_outcome_types` (`Outcome_Type_ID`, `Outcome_Name`, `Description`, `Outcome_Type_Name`) VALUES
(3, 'Settled', 'Reduce student step race state notice.', 'Interim'),
(4, 'Acquittal', 'Local sound daughter professional technology.', 'Interim'),
(5, 'Acquittal', 'Much hospital total firm road decision.', 'Interim'),
(7, 'Settled', 'Tree politics dog hope.', 'Final'),
(30, 'Settled', 'Its mission impact since.', 'Interim'),
(31, 'Settled', 'Away stock rock story south.', 'Final'),
(54, 'Conviction', 'Bar detail hope old bag drop fact might.', 'Final'),
(102, 'Settled', 'Up trip what piece debate training.', 'Final'),
(315, 'Settled', 'None let light bag safe wish life.', 'Interim'),
(349, 'Acquittal', 'Run voice bring free protect analysis.', 'Final'),
(996, 'Dismissed', 'Space much who Republican wind.', 'Interim'),
(1415, 'Settled', 'Approach leg enter specific.', 'Interim'),
(1870, 'Dismissed', 'Each admit artist begin. Factor pass last.', 'Interim'),
(13758, 'Conviction', 'Sense natural edge outside however.', 'Interim'),
(183882, 'Conviction', 'Anything almost car nearly home.', 'Final'),
(860790, 'Dismissed', 'Sea manager key while wonder yard.', 'Final'),
(4119818, 'Settled', 'Start card kid among meeting time build.', 'Interim'),
(32500535, 'Dismissed', 'Police design reflect development.', 'Final'),
(2147483647, 'Dismissed', 'Heart check sound. Possible population at.', 'Final');

-- --------------------------------------------------------

--
-- Table structure for table `dim_parties_involved`
--

CREATE TABLE `dim_parties_involved` (
  `Party_ID` varchar(20) NOT NULL,
  `Party_Type` varchar(50) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Legal_Representation` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dim_parties_involved`
--

INSERT INTO `dim_parties_involved` (`Party_ID`, `Party_Type`, `Gender`, `Age`, `Legal_Representation`) VALUES
('04968850-0c50-4793-b', 'Plaintiff', 'Female', 44, 'No'),
('05fd2cf2-1fa9-4a4d-a', 'Plaintiff', 'Female', 27, 'Yes'),
('089a5fea-5f00-4ddd-8', 'Plaintiff', 'Female', 56, 'Yes'),
('0a49034a-7809-4ccb-a', 'Witness', 'Male', 67, 'No'),
('0e79b60c-14d4-42e8-a', 'Plaintiff', 'Female', 49, 'Yes'),
('11b3e666-b87e-4538-a', 'Defendant', 'Female', 39, 'No'),
('1480d1cd-a3e6-4095-a', 'Witness', 'Female', 25, 'Yes'),
('15d36754-6aa3-4e25-9', 'Defendant', 'Male', 35, 'No'),
('16dc6905-a87b-43fd-9', 'Defendant', 'Male', 55, 'Yes'),
('1ac1c79f-4b67-4fad-b', 'Witness', 'Male', 50, 'No'),
('1ae311ad-ce57-4d86-a', 'Witness', 'Male', 39, 'No'),
('1f895625-de0a-4a34-a', 'Plaintiff', 'Female', 26, 'No'),
('20d0cae9-ff06-4283-b', 'Plaintiff', 'Female', 63, 'No'),
('220e6668-bcad-4745-a', 'Defendant', 'Male', 38, 'Yes'),
('270a11f5-28f4-4da8-8', 'Plaintiff', 'Female', 21, 'Yes'),
('28ee3a98-51d2-49d5-a', 'Plaintiff', 'Male', 29, 'Yes'),
('29b25662-99b4-401e-9', 'Witness', 'Female', 19, 'Yes'),
('2f31e721-d767-4f3a-9', 'Defendant', 'Male', 47, 'No'),
('324a0502-b0c0-4902-b', 'Plaintiff', 'Male', 52, 'Yes'),
('3892c30a-f653-49c9-a', 'Defendant', 'Male', 31, 'No'),
('3a185ba8-58ed-4680-b', 'Plaintiff', 'Male', 60, 'No'),
('3a6e68e6-b1f1-4634-a', 'Witness', 'Female', 61, 'Yes'),
('3acb3a2d-4592-4517-8', 'Defendant', 'Female', 26, 'Yes'),
('3b5ab57e-3c02-4c25-a', 'Plaintiff', 'Male', 68, 'Yes'),
('3cbf2eca-b145-46c0-8', 'Defendant', 'Female', 69, 'Yes'),
('3fb97c0a-cc11-4d2b-b', 'Plaintiff', 'Male', 47, 'No'),
('409ec369-0153-4819-8', 'Witness', 'Male', 21, 'No'),
('42596dc8-ef8a-4ae5-b', 'Plaintiff', 'Female', 29, 'Yes'),
('441d9e13-8e44-4a16-b', 'Plaintiff', 'Male', 59, 'Yes'),
('47b4fd1c-5fe3-403b-b', 'Plaintiff', 'Male', 32, 'No'),
('4a4e0681-0d04-4ffa-9', 'Plaintiff', 'Male', 26, 'No'),
('4d80f218-1082-40a9-8', 'Defendant', 'Male', 27, 'Yes'),
('5202dba1-2af0-4583-b', 'Defendant', 'Female', 37, 'Yes'),
('55d1f39b-e57e-4a63-9', 'Witness', 'Female', 22, 'Yes'),
('55eb3c16-89cd-47b4-9', 'Witness', 'Male', 53, 'No'),
('5f0577e6-7b2d-476b-a', 'Plaintiff', 'Male', 40, 'No'),
('602f7be2-5b84-49b0-8', 'Defendant', 'Female', 28, 'No'),
('637ea3bc-276c-4d3c-9', 'Witness', 'Male', 54, 'Yes'),
('68343edd-bdc6-4e9e-9', 'Defendant', 'Female', 24, 'No'),
('747c0593-5267-4ba6-b', 'Plaintiff', 'Male', 41, 'No'),
('75a4c90b-63eb-43d5-a', 'Witness', 'Male', 18, 'Yes'),
('7a288bb5-9f44-43fc-a', 'Defendant', 'Male', 35, 'No'),
('7a29398d-5796-4107-b', 'Witness', 'Female', 60, 'No'),
('7cb1d7a7-92c1-45a8-8', 'Witness', 'Female', 65, 'Yes'),
('7d5b52f3-e999-4b2d-b', 'Plaintiff', 'Male', 49, 'No'),
('7ded6873-af4b-466e-8', 'Witness', 'Male', 47, 'Yes'),
('82a62261-4681-4628-a', 'Defendant', 'Male', 50, 'No'),
('84504e42-5e01-433a-9', 'Defendant', 'Female', 68, 'Yes'),
('8465b052-4cf7-4505-b', 'Plaintiff', 'Female', 34, 'Yes'),
('87e4bcee-9983-4523-8', 'Defendant', 'Female', 68, 'No'),
('89477e07-5af1-49c8-8', 'Defendant', 'Female', 29, 'No'),
('8a148f01-fbb7-4347-8', 'Defendant', 'Female', 37, 'Yes'),
('8b0088be-ae43-423f-8', 'Witness', 'Male', 47, 'No'),
('8ba7b344-bb66-499a-9', 'Witness', 'Female', 49, 'No'),
('8fa24a7c-8124-4dce-b', 'Defendant', 'Male', 63, 'No'),
('913e1d33-c494-4c4b-a', 'Plaintiff', 'Male', 33, 'No'),
('969132be-c563-4b81-9', 'Witness', 'Male', 64, 'Yes'),
('972a40ac-a2c3-46e1-a', 'Plaintiff', 'Male', 33, 'No'),
('9af86a3f-911b-48dc-b', 'Defendant', 'Male', 60, 'No'),
('9e87264a-7537-4bdc-9', 'Defendant', 'Female', 42, 'Yes'),
('a0dd0774-783a-4739-8', 'Defendant', 'Male', 27, 'No'),
('a4ea4653-f199-4af2-b', 'Plaintiff', 'Female', 23, 'No'),
('a6382e07-a112-46c8-9', 'Witness', 'Female', 19, 'Yes'),
('a6cf0556-67bf-411f-9', 'Plaintiff', 'Male', 58, 'No'),
('aecd720b-6b1f-4aa6-a', 'Defendant', 'Male', 32, 'Yes'),
('aecdeda6-0462-4440-b', 'Plaintiff', 'Female', 31, 'No'),
('b07f069a-af51-4ca0-9', 'Plaintiff', 'Male', 54, 'No'),
('bb8d66e2-bb24-4b84-9', 'Defendant', 'Male', 29, 'No'),
('bb951109-e477-4b6b-a', 'Witness', 'Female', 38, 'No'),
('bdb52fbe-fb89-4c59-b', 'Witness', 'Female', 56, 'No'),
('bebd32ee-5c14-4de5-9', 'Witness', 'Female', 37, 'Yes'),
('bff518f4-dd31-4e62-9', 'Witness', 'Male', 43, 'No'),
('c5d36bbb-f582-4407-b', 'Defendant', 'Male', 29, 'Yes'),
('c734fd09-fa2e-4925-a', 'Witness', 'Female', 49, 'No'),
('c7acbf80-f752-4afa-a', 'Witness', 'Female', 51, 'Yes'),
('c90af848-79fd-4882-a', 'Defendant', 'Female', 57, 'Yes'),
('cea4a55e-9929-4722-a', 'Defendant', 'Female', 20, 'No'),
('cf37d618-50ed-4385-a', 'Plaintiff', 'Male', 45, 'Yes'),
('d1f704bf-0339-46d5-9', 'Defendant', 'Female', 62, 'No'),
('d4e62a8f-7d8e-46bd-9', 'Witness', 'Female', 67, 'Yes'),
('d5563f34-7095-4dab-a', 'Witness', 'Male', 27, 'Yes'),
('d56a659b-86e1-4727-9', 'Witness', 'Male', 69, 'Yes'),
('d75a56d9-90eb-4404-8', 'Plaintiff', 'Female', 60, 'No'),
('db035d07-f19c-42f5-8', 'Witness', 'Male', 59, 'Yes'),
('de7d0766-21db-4273-9', 'Plaintiff', 'Male', 33, 'Yes'),
('e464b4b5-16c0-4334-8', 'Plaintiff', 'Female', 37, 'No'),
('e4ae1e94-a15e-4ecf-b', 'Witness', 'Male', 65, 'No'),
('e6769907-361c-4fd7-8', 'Witness', 'Male', 35, 'No'),
('ecd555e3-37b3-4edf-b', 'Witness', 'Female', 46, 'Yes'),
('ed4af70d-690d-4933-9', 'Defendant', 'Male', 31, 'No'),
('ee3773b7-9bc5-4b5f-a', 'Plaintiff', 'Female', 53, 'Yes'),
('ee67feda-b1c7-460f-8', 'Defendant', 'Male', 32, 'No'),
('efbc74ac-50d3-465f-9', 'Witness', 'Male', 52, 'No'),
('f3cf3420-0997-4fe8-b', 'Plaintiff', 'Male', 18, 'No'),
('f50e91fa-37d3-42f1-a', 'Witness', 'Female', 35, 'No'),
('f91560e5-78b3-428f-9', 'Witness', 'Female', 28, 'Yes'),
('f9c0c196-97be-4c08-a', 'Plaintiff', 'Male', 63, 'Yes'),
('fb8fb8f3-eb47-4364-b', 'Plaintiff', 'Male', 69, 'Yes'),
('fd0e3ed8-ac54-4ad9-9', 'Plaintiff', 'Female', 63, 'No'),
('ffb18bdc-ba24-451f-9', 'Witness', 'Female', 34, 'No');

-- --------------------------------------------------------

--
-- Table structure for table `dim_payment_status`
--

CREATE TABLE `dim_payment_status` (
  `Payment_Status_ID` int(11) NOT NULL,
  `Payment_Status_Name` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dim_payment_status`
--

INSERT INTO `dim_payment_status` (`Payment_Status_ID`, `Payment_Status_Name`, `Description`) VALUES
(1, 'Partially Paid', NULL),
(2, 'Unpaid', NULL),
(3, 'Partially Paid', NULL),
(4, 'Unpaid', NULL),
(5, 'Paid', NULL),
(6, 'Paid', NULL),
(7, 'Paid', NULL),
(8, 'Unpaid', NULL),
(9, 'Unpaid', NULL),
(10, 'Partially Paid', NULL),
(11, 'Partially Paid', NULL),
(12, 'Paid', NULL),
(13, 'Partially Paid', NULL),
(14, 'Unpaid', NULL),
(15, 'Partially Paid', NULL),
(16, 'Partially Paid', NULL),
(17, 'Unpaid', NULL),
(18, 'Paid', NULL),
(19, 'Partially Paid', NULL),
(20, 'Unpaid', NULL),
(21, 'Paid', NULL),
(22, 'Paid', NULL),
(23, 'Unpaid', NULL),
(24, 'Paid', NULL),
(25, 'Paid', NULL),
(26, 'Partially Paid', NULL),
(27, 'Unpaid', NULL),
(28, 'Unpaid', NULL),
(29, 'Partially Paid', NULL),
(30, 'Partially Paid', NULL),
(31, 'Unpaid', NULL),
(32, 'Paid', NULL),
(33, 'Unpaid', NULL),
(34, 'Unpaid', NULL),
(35, 'Paid', NULL),
(36, 'Paid', NULL),
(37, 'Partially Paid', NULL),
(38, 'Partially Paid', NULL),
(39, 'Paid', NULL),
(40, 'Unpaid', NULL),
(41, 'Unpaid', NULL),
(42, 'Partially Paid', NULL),
(43, 'Unpaid', NULL),
(44, 'Partially Paid', NULL),
(45, 'Unpaid', NULL),
(46, 'Unpaid', NULL),
(47, 'Partially Paid', NULL),
(48, 'Unpaid', NULL),
(49, 'Unpaid', NULL),
(50, 'Unpaid', NULL),
(51, 'Unpaid', NULL),
(52, 'Paid', NULL),
(53, 'Unpaid', NULL),
(54, 'Paid', NULL),
(55, 'Paid', NULL),
(56, 'Unpaid', NULL),
(57, 'Partially Paid', NULL),
(58, 'Unpaid', NULL),
(59, 'Paid', NULL),
(60, 'Unpaid', NULL),
(61, 'Partially Paid', NULL),
(62, 'Paid', NULL),
(63, 'Unpaid', NULL),
(64, 'Partially Paid', NULL),
(65, 'Unpaid', NULL),
(66, 'Partially Paid', NULL),
(67, 'Partially Paid', NULL),
(68, 'Partially Paid', NULL),
(69, 'Unpaid', NULL),
(70, 'Unpaid', NULL),
(71, 'Partially Paid', NULL),
(72, 'Partially Paid', NULL),
(73, 'Paid', NULL),
(74, 'Unpaid', NULL),
(75, 'Unpaid', NULL),
(76, 'Unpaid', NULL),
(77, 'Paid', NULL),
(78, 'Paid', NULL),
(79, 'Unpaid', NULL),
(80, 'Paid', NULL),
(81, 'Paid', NULL),
(82, 'Paid', NULL),
(83, 'Paid', NULL),
(84, 'Paid', NULL),
(85, 'Unpaid', NULL),
(86, 'Partially Paid', NULL),
(87, 'Partially Paid', NULL),
(88, 'Partially Paid', NULL),
(89, 'Unpaid', NULL),
(90, 'Unpaid', NULL),
(91, 'Partially Paid', NULL),
(92, 'Unpaid', NULL),
(93, 'Unpaid', NULL),
(94, 'Unpaid', NULL),
(95, 'Paid', NULL),
(96, 'Partially Paid', NULL),
(97, 'Paid', NULL),
(98, 'Unpaid', NULL),
(99, 'Partially Paid', NULL),
(100, 'Unpaid', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dim_case_type`
--
ALTER TABLE `dim_case_type`
  ADD PRIMARY KEY (`Case_Type_ID`);

--
-- Indexes for table `dim_case_types`
--
ALTER TABLE `dim_case_types`
  ADD PRIMARY KEY (`Case_Type_ID`);

--
-- Indexes for table `dim_courts`
--
ALTER TABLE `dim_courts`
  ADD PRIMARY KEY (`Court_ID`);

--
-- Indexes for table `dim_judges`
--
ALTER TABLE `dim_judges`
  ADD PRIMARY KEY (`Judge_ID`);

--
-- Indexes for table `dim_outcome_types`
--
ALTER TABLE `dim_outcome_types`
  ADD PRIMARY KEY (`Outcome_Type_ID`);

--
-- Indexes for table `dim_parties_involved`
--
ALTER TABLE `dim_parties_involved`
  ADD PRIMARY KEY (`Party_ID`);

--
-- Indexes for table `dim_payment_status`
--
ALTER TABLE `dim_payment_status`
  ADD PRIMARY KEY (`Payment_Status_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dim_case_type`
--
ALTER TABLE `dim_case_type`
  MODIFY `Case_Type_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT for table `dim_case_types`
--
ALTER TABLE `dim_case_types`
  MODIFY `Case_Type_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dim_courts`
--
ALTER TABLE `dim_courts`
  MODIFY `Court_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT for table `dim_outcome_types`
--
ALTER TABLE `dim_outcome_types`
  MODIFY `Outcome_Type_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT for table `dim_payment_status`
--
ALTER TABLE `dim_payment_status`
  MODIFY `Payment_Status_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
