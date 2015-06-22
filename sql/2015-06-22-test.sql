-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Hoszt: localhost
-- Létrehozás ideje: 2015. Jún 22. 15:27
-- Szerver verzió: 5.5.43-0ubuntu0.14.04.1
-- PHP verzió: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Adatbázis: `test`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `annual_revenue` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  `phone_office` varchar(100) DEFAULT NULL,
  `phone_alternate` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `ownership` varchar(100) DEFAULT NULL,
  `employees` varchar(10) DEFAULT NULL,
  `ticker_symbol` varchar(10) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `sic_code` varchar(10) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accnt_id_del` (`id`,`deleted`),
  KEY `idx_accnt_name_del` (`name`,`deleted`),
  KEY `idx_accnt_assigned_del` (`deleted`,`assigned_user_id`),
  KEY `idx_accnt_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `accounts_audit`
--

CREATE TABLE IF NOT EXISTS `accounts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_accounts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `accounts_bugs`
--

CREATE TABLE IF NOT EXISTS `accounts_bugs` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_bug_acc` (`account_id`),
  KEY `idx_acc_bug_bug` (`bug_id`),
  KEY `idx_account_bug` (`account_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `accounts_cases`
--

CREATE TABLE IF NOT EXISTS `accounts_cases` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_case_acc` (`account_id`),
  KEY `idx_acc_acc_case` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `accounts_contacts`
--

CREATE TABLE IF NOT EXISTS `accounts_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_contact` (`account_id`,`contact_id`),
  KEY `idx_contid_del_accid` (`contact_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `accounts_opportunities`
--

CREATE TABLE IF NOT EXISTS `accounts_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_opportunity` (`account_id`,`opportunity_id`),
  KEY `idx_oppid_del_accid` (`opportunity_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `acl_actions`
--

CREATE TABLE IF NOT EXISTS `acl_actions` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `acltype` varchar(100) DEFAULT NULL,
  `aclaccess` int(3) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclaction_id_del` (`id`,`deleted`),
  KEY `idx_category_name` (`category`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `acl_actions`
--

INSERT INTO `acl_actions` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `category`, `acltype`, `aclaccess`, `deleted`) VALUES
('11b0d143-ef1f-94ad-e038-55880b3f1491', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'ProspectLists', 'module', 90, 0),
('11e3aea0-a655-800d-cc0c-55880b2a08b8', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'Project', 'module', 90, 0),
('14efbfb9-2be2-35eb-4a70-55880b877a0d', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'Campaigns', 'module', 89, 0),
('158d0bb7-dbdd-28f8-6220-55880b652db5', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'Cases', 'module', 89, 0),
('17cba7de-58a9-abf0-6556-55880b52a54f', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'ProspectLists', 'module', 90, 0),
('17fde2cc-9ae9-85f2-3634-55880b29989c', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'Project', 'module', 90, 0),
('1d18cd2f-db9c-31e0-e500-55880b106f1e', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'Campaigns', 'module', 90, 0),
('1db12edd-fea1-bb8a-af19-55880b34f967', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'Cases', 'module', 90, 0),
('1e201cb6-92ec-4b23-4e2b-55880b564f15', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'Project', 'module', 90, 0),
('20c007e9-285f-eee1-91d0-55880b8b10f7', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'Leads', 'module', 90, 0),
('23d26f09-c344-ec3e-45e3-55880b770731', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'Cases', 'module', 90, 0),
('253f85d3-41cb-f1cd-4ab9-55880be55d85', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'Campaigns', 'module', 90, 0),
('2740f86f-c39c-4792-a344-55880b105dfb', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'Meetings', 'module', 89, 0),
('29f3ed92-fba6-3e9b-1245-55880b76533d', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'Cases', 'module', 90, 0),
('2d6a9d91-0806-492a-3ee9-55880b8a9706', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'Campaigns', 'module', 90, 0),
('30119377-8aa3-be50-b29b-55880b9ffccf', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'Cases', 'module', 90, 0),
('359b1f4f-bd32-dec4-27d9-55880b29cb82', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'Campaigns', 'module', 90, 0),
('3632b95a-ddfa-2925-6413-55880b153088', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'Cases', 'module', 90, 0),
('36400938-b753-a1c5-49fe-55880bc7f435', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'Meetings', 'module', 90, 0),
('36955e49-5e46-b2d3-03f2-55880bc9d4a2', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'Calls', 'module', 89, 0),
('36f6dbb1-aea9-7373-f58e-55880b15d167', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'Prospects', 'module', 89, 0),
('3ab34f5a-c307-7c47-5c38-55880b13d1bf', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'Documents', 'module', 90, 0),
('3c502073-3a4b-4bc8-2e23-55880bf67eb5', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'Cases', 'module', 90, 0),
('3d138f28-15d5-99b3-9cc6-55880b630acc', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'Prospects', 'module', 90, 0),
('3db79759-012c-513b-ebec-55880bb346e1', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'Campaigns', 'module', 90, 0),
('3ec1a5db-1641-adf0-1bb9-55880b52ca44', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'Calls', 'module', 90, 0),
('41c53337-3c6a-ade8-5147-55880bbf1f3d', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'Meetings', 'module', 90, 0),
('42701830-5773-6dc1-dcae-55880b66f43f', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'Cases', 'module', 90, 0),
('42da933c-2d5d-5d32-8433-55880b0b7dbd', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'Documents', 'module', 90, 0),
('4334373b-b8d5-0df5-e7cc-55880ba3b63c', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'Prospects', 'module', 90, 0),
('438973cb-4956-09bc-38ea-55880b793311', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'Users', 'module', 89, 0),
('45e1b800-2f18-77c7-b77f-55880be39f84', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'Campaigns', 'module', 90, 0),
('46e6ec3d-a460-1604-cf1f-55880bb99733', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'Calls', 'module', 90, 0),
('495caa75-13c4-414a-b16f-55880b01a482', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'Prospects', 'module', 90, 0),
('4b074750-b1c2-4602-42c6-55880b307bd8', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'Documents', 'module', 90, 0),
('4bb5d18f-99c8-d012-c6b6-55880b56173e', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'Users', 'module', 90, 0),
('4cc80de1-ca3f-5610-6cb6-55880b45d38b', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'EmailMarketing', 'module', 90, 0),
('4ccf917f-6984-834b-a561-55880bf509ca', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'Tasks', 'module', 89, 0),
('4e11c634-026d-afb1-56dd-55880b6d9a17', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'Campaigns', 'module', 90, 0),
('4f0bbf3a-d40d-b60a-2cf8-55880b721e51', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'Calls', 'module', 90, 0),
('4f70d4d6-2c13-4648-c07b-55880b0b190b', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'Prospects', 'module', 90, 0),
('5238f8b3-924e-9955-7c1c-55880b4ad501', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'EmailTemplates', 'module', 89, 0),
('53dfbe8b-df60-16de-f65d-55880bf351c8', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'Users', 'module', 90, 0),
('55377bb9-fe3a-32f8-6e9c-55880b567f2e', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'Tasks', 'module', 90, 0),
('55932847-4dd9-1004-8ded-55880bc52669', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'Prospects', 'module', 90, 0),
('56e66958-3192-f96c-3780-55880b063e01', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'EAPM', 'module', 89, 0),
('57130e7c-2c99-c672-1963-55880beafa55', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'ProspectLists', 'module', 90, 0),
('573ae91d-2286-edcd-a80c-55880b756623', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'Calls', 'module', 90, 0),
('5a65277b-5871-297b-3405-55880b0cb0c1', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'EmailTemplates', 'module', 90, 0),
('5ac90cb3-6a2f-0724-930c-55880b001eb2', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'Project', 'module', 90, 0),
('5bbfad3a-39e5-84cc-256d-55880b43baa0', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'Prospects', 'module', 90, 0),
('5c04182e-5182-5f90-a61a-55880badd9dd', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'Users', 'module', 90, 0),
('5d3d6537-29a0-13ac-f874-55880b2edd7c', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'Tasks', 'module', 90, 0),
('5d6d2c01-1a83-6440-c900-55880b8a2d91', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'Calls', 'module', 90, 0),
('5f0ccbf8-42c0-a02c-fb28-55880b20bed7', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'EAPM', 'module', 90, 0),
('61dc7e7e-b13f-448c-d699-55880be91763', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'Prospects', 'module', 90, 0),
('62bc9633-20d4-c229-307a-55880b577463', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'EmailTemplates', 'module', 90, 0),
('6376f12b-c253-dcf8-a187-55880b0c33c9', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'Calls', 'module', 90, 0),
('64305430-bd07-ce0e-8ece-55880be1f1af', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'Users', 'module', 90, 0),
('654f5420-273b-2890-e5af-55880b98dbb2', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'Tasks', 'module', 90, 0),
('672fdadf-3459-dde8-c234-55880ba109c0', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'EAPM', 'module', 90, 0),
('6984e2c5-0faa-4d88-f764-55880be77ea9', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'Opportunities', 'module', 89, 0),
('69944d69-414e-16f7-80cc-55880b505840', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'Calls', 'module', 90, 0),
('6adf8099-96bc-e014-3ee0-55880b5f92a7', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'EmailTemplates', 'module', 90, 0),
('6af9076b-afd6-8558-7c94-55880bca4fdd', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'Documents', 'module', 89, 0),
('6c584347-0b01-ee19-1249-55880b214c04', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'Users', 'module', 90, 0),
('6d7ac86d-f7e6-2c4d-aeb4-55880b0b3b5c', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'Tasks', 'module', 90, 0),
('6dc2e658-79c0-7533-8aa4-55880be94b33', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'Meetings', 'module', 90, 0),
('6f5f6a2d-44f5-735a-1e9e-55880b7e1854', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'EAPM', 'module', 90, 0),
('6fa5bf6c-f221-1d4c-9e52-55880b5b558a', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'Opportunities', 'module', 90, 0),
('6fd93640-421c-eec5-df01-55880bbe645b', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'ProjectTask', 'module', 89, 0),
('72e2a737-741f-86ab-3ace-55880b0bff39', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'EmailTemplates', 'module', 90, 0),
('73221451-c261-a7e8-674f-55880b5ad07a', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'Documents', 'module', 90, 0),
('7480882f-d783-6c40-cedd-55880b4c160e', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'Users', 'module', 90, 0),
('74f11370-a610-f173-b203-55880b2f5b5e', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'Accounts', 'module', 89, 0),
('75a42da2-2482-6cf2-4b33-55880b11d009', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'Tasks', 'module', 90, 0),
('75c28b8b-d336-f608-90ba-55880bb657ad', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'Opportunities', 'module', 90, 0),
('75f7d427-3d85-2ebf-c6cb-55880b8bd75e', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'ProjectTask', 'module', 90, 0),
('77822bea-dbaf-e59f-dd24-55880b633adf', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'EAPM', 'module', 90, 0),
('7b006b17-b591-22ff-e2ba-55880b441eea', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'EmailTemplates', 'module', 90, 0),
('7b4f3981-4874-1d58-042f-55880b9593ab', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'Documents', 'module', 90, 0),
('7be44290-0909-08d8-63eb-55880b24d308', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'Opportunities', 'module', 90, 0),
('7c14526f-34ed-1a85-6a2e-55880b77fc71', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'ProjectTask', 'module', 90, 0),
('7ca4dfcc-6dd1-cac7-41b4-55880b17e52e', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'Users', 'module', 90, 0),
('7d14cec7-eeff-3fe5-4464-55880b3483e0', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'Accounts', 'module', 90, 0),
('7dcaecf9-27b7-5584-25bc-55880be00015', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'Tasks', 'module', 90, 0),
('7fa6c745-59c5-ade0-b921-55880bd2d498', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'EAPM', 'module', 90, 0),
('8203c050-042f-11c7-b866-55880bdcf3ca', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'Opportunities', 'module', 90, 0),
('82471319-8189-42b8-c939-55880bef3385', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'ProjectTask', 'module', 90, 0),
('83330464-c8a7-ca77-8b74-55880b27eb9f', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'EmailTemplates', 'module', 90, 0),
('837b9370-6dbc-ce81-27c2-55880b78aa17', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'Documents', 'module', 90, 0),
('853e4f42-f228-000a-69a2-55880beda081', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'Accounts', 'module', 90, 0),
('85f38d67-0b07-f3a7-a302-55880b1e2f4a', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'Tasks', 'module', 90, 0),
('87d53271-77db-7f76-a98d-55880b9de228', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'EAPM', 'module', 90, 0),
('8b518a8f-f9c9-6934-9b13-55880bbd9b1a', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'EmailTemplates', 'module', 90, 0),
('8c6db748-b81a-fd49-4c56-55880b94cc2d', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'ProjectTask', 'module', 90, 0),
('8ffaae29-5119-32b4-4860-55880b4f2b08', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'EAPM', 'module', 90, 0),
('928c8733-016c-9443-83fb-55880bc7b0dc', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'ProjectTask', 'module', 90, 0),
('9384849c-2b1d-73c0-adff-55880b8738c2', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'Accounts', 'module', 90, 0),
('98aff588-0a27-3b97-6151-55880b95e3d4', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'ProjectTask', 'module', 90, 0),
('9bb5f459-7220-866b-b702-55880b98e605', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'Accounts', 'module', 90, 0),
('a07f9ef9-745f-362d-1979-55880b1d920e', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'Bugs', 'module', 89, 0),
('a0c247ea-5dd5-e1a8-b1e1-55880b7de1c5', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'Emails', 'module', 89, 0),
('a0d66325-b844-f27d-5ff6-55880b10e1c4', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'ProjectTask', 'module', 90, 0),
('a3dacd3d-aa8f-c3d0-d9aa-55880b5ff8b7', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'Accounts', 'module', 90, 0),
('a6063cf5-2058-bfa0-59d0-55880b9e935c', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'Documents', 'module', 90, 0),
('a65f6a1f-cbe5-157f-aa42-55880bc52b74', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'Meetings', 'module', 90, 0),
('a69948ba-f1ff-a917-bc2c-55880bc17405', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'Bugs', 'module', 90, 0),
('a6acbc19-1ce0-b51b-3026-55880b443f29', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'Contacts', 'module', 89, 0),
('a6e65633-c775-c9a6-f640-55880be939a7', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'Emails', 'module', 90, 0),
('a7821323-b083-88c9-5003-55880b07c79c', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'Opportunities', 'module', 90, 0),
('ac00ab68-9365-3ceb-a5da-55880b0b7831', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'Accounts', 'module', 90, 0),
('acbe8f4e-2276-847c-e805-55880b213250', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'Bugs', 'module', 90, 0),
('accd9c35-b27d-8a3f-85c2-55880bbc8ba3', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'Contacts', 'module', 90, 0),
('ad0998cf-5e27-4231-0b9a-55880bb630c8', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'Emails', 'module', 90, 0),
('b034567c-ca02-e931-efee-55880bbb6c2f', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'Notes', 'module', 89, 0),
('b2d766fc-09c2-655e-64e0-55880b31102a', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'Bugs', 'module', 90, 0),
('b2e79895-d173-7fe0-1cf7-55880b9b2407', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'Contacts', 'module', 90, 0),
('b3282762-6815-0f62-ea79-55880b2d21d9', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'Emails', 'module', 90, 0),
('b430a66c-a1c3-903d-8b97-55880bce10ef', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'Accounts', 'module', 90, 0),
('b85e9d8d-1e2f-4b12-7e18-55880bc95710', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'Notes', 'module', 90, 0),
('b8fcf92e-6f55-3326-3fb2-55880ba00956', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'Bugs', 'module', 90, 0),
('b8fd0024-3342-9f07-a37e-55880b5d5da1', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'ProspectLists', 'module', 90, 0),
('b90d98f0-7d3c-a2a7-3d38-55880b230869', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'Contacts', 'module', 90, 0),
('b941d50a-0cfe-e008-4025-55880b0dca65', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'Emails', 'module', 90, 0),
('bb274032-dd1e-757e-d813-55880bdffc8b', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'Leads', 'module', 89, 0),
('bcb5048d-3025-7cb9-acd5-55880be61c4d', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'Project', 'module', 90, 0),
('bf19099e-ff13-4328-1af8-55880b72ab5d', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'Bugs', 'module', 90, 0),
('bf63c9f7-60e0-ea76-acec-55880be7719d', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'Emails', 'module', 90, 0),
('bf8e27bd-beaf-758c-7111-55880b90c03c', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'Contacts', 'module', 90, 0),
('c087b176-94ca-e668-657d-55880b6e27b1', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'Notes', 'module', 90, 0),
('c34a1893-c3b6-f1ed-c1a0-55880b32b99d', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'Leads', 'module', 90, 0),
('c5331f8f-c5b5-e668-50ee-55880b043d48', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'Opportunities', 'module', 90, 0),
('c53cad06-bcd5-ebff-bf6a-55880b6dae26', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'Bugs', 'module', 90, 0),
('c57c4a64-5f26-612f-9be2-55880bb4acd2', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'Emails', 'module', 90, 0),
('c5b0f806-ed87-004c-c252-55880b309c41', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'Contacts', 'module', 90, 0),
('c7fdb05a-e4bf-86a8-9f86-55880b61ea7b', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'EmailMarketing', 'module', 89, 0),
('c8afe50c-b14f-0685-3a20-55880be31c1d', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'Notes', 'module', 90, 0),
('cb4fe1ed-229d-02eb-0ac5-55880bfc1d93', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'Opportunities', 'module', 90, 0),
('cb584a37-f935-3a0d-ba45-55880b97ecce', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'Bugs', 'module', 90, 0),
('cb71df33-8cf2-5ecf-2ba9-55880bf1a779', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'Leads', 'module', 90, 0),
('cba3cef5-6418-3250-5afe-55880b217231', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'Emails', 'module', 90, 0),
('cbcd0ac8-d81b-6647-63d2-55880bc80de0', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'Contacts', 'module', 90, 0),
('cf730163-3807-fac8-4ca9-55880b3382b4', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'EmailMarketing', 'module', 90, 0),
('d01faa7b-89da-c1bc-7c28-55880ba54247', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'EmailMarketing', 'module', 90, 0),
('d0da0a8f-47d4-9de1-599a-55880b8c5b44', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'Notes', 'module', 90, 0),
('d1f03a23-9c4c-b233-0ad5-55880ba7a9a8', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'Contacts', 'module', 90, 0),
('d3a22aca-5fdb-999c-3278-55880bf15a3f', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'Leads', 'module', 90, 0),
('d5708e3e-42c1-6355-a2ae-55880baef1de', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'Meetings', 'module', 90, 0),
('d7ca0101-54f5-5ef3-972e-55880b52da62', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'Meetings', 'module', 90, 0),
('d84f75b0-ae9f-ae37-782b-55880b898370', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'EmailMarketing', 'module', 90, 0),
('d90205a8-b1f3-530c-b13a-55880b6cdbde', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'Notes', 'module', 90, 0),
('dbccf091-a7c8-a5d3-a168-55880b13763f', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'Leads', 'module', 90, 0),
('e0712f3f-c0a5-8cfc-7e35-55880ba0ad1c', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'EmailMarketing', 'module', 90, 0),
('e1185b81-74c1-2ec4-7bc2-55880b50a85b', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'ProspectLists', 'module', 89, 0),
('e1276313-fcfb-06d8-2ad9-55880b38cc41', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'Notes', 'module', 90, 0),
('e3e7c529-43d5-d20e-fb78-55880b0c3281', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'Leads', 'module', 90, 0),
('e724a9dd-7934-2cfd-66b1-55880b0153de', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'Meetings', 'module', 90, 0),
('e72d8847-33b8-a5a4-f98f-55880b60c085', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'ProspectLists', 'module', 90, 0),
('e76184fb-1f3a-3aeb-8e69-55880ba3efb5', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'access', 'Project', 'module', 89, 0),
('e89af745-08a4-4411-442c-55880b1cf93d', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'delete', 'EmailMarketing', 'module', 90, 0),
('e94eeead-b3e4-7a25-8e9f-55880b4c579f', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'massupdate', 'Notes', 'module', 90, 0),
('ec1e2665-5c85-b68a-d5c7-55880b478d72', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'export', 'Leads', 'module', 90, 0),
('ed53dbd7-eb90-cf5c-77f3-55880b9bda6a', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'ProspectLists', 'module', 90, 0),
('ed84977b-d9a1-d9e4-94f7-55880babb9f8', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'view', 'Project', 'module', 90, 0),
('f0c898f0-ca2d-d0aa-55ea-55880ba47991', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'import', 'EmailMarketing', 'module', 90, 0),
('f371a8b6-128a-0ff4-3f37-55880be29ac8', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'edit', 'ProspectLists', 'module', 90, 0),
('f39fc1b8-dab4-e039-4a5d-55880bf8001e', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '', 'list', 'Project', 'module', 90, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `acl_roles`
--

CREATE TABLE IF NOT EXISTS `acl_roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `acl_roles_actions`
--

CREATE TABLE IF NOT EXISTS `acl_roles_actions` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `action_id` varchar(36) DEFAULT NULL,
  `access_override` int(3) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acl_role_id` (`role_id`),
  KEY `idx_acl_action_id` (`action_id`),
  KEY `idx_aclrole_action` (`role_id`,`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `acl_roles_users`
--

CREATE TABLE IF NOT EXISTS `acl_roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id` (`role_id`),
  KEY `idx_acluser_id` (`user_id`),
  KEY `idx_aclrole_user` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `address_book`
--

CREATE TABLE IF NOT EXISTS `address_book` (
  `assigned_user_id` char(36) NOT NULL,
  `bean` varchar(50) DEFAULT NULL,
  `bean_id` char(36) NOT NULL,
  KEY `ab_user_bean_idx` (`assigned_user_id`,`bean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bugs`
--

CREATE TABLE IF NOT EXISTS `bugs` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `bug_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `found_in_release` varchar(255) DEFAULT NULL,
  `fixed_in_release` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `product_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bugsnumk` (`bug_number`),
  KEY `bug_number` (`bug_number`),
  KEY `idx_bug_name` (`name`),
  KEY `idx_bugs_assigned_user` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bugs_audit`
--

CREATE TABLE IF NOT EXISTS `bugs_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_bugs_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `calls`
--

CREATE TABLE IF NOT EXISTS `calls` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(2) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `direction` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_call_name` (`name`),
  KEY `idx_status` (`status`),
  KEY `idx_calls_date_start` (`date_start`),
  KEY `idx_calls_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_calls_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `calls_contacts`
--

CREATE TABLE IF NOT EXISTS `calls_contacts` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_call_call` (`call_id`),
  KEY `idx_con_call_con` (`contact_id`),
  KEY `idx_call_contact` (`call_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `calls_leads`
--

CREATE TABLE IF NOT EXISTS `calls_leads` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_call_call` (`call_id`),
  KEY `idx_lead_call_lead` (`lead_id`),
  KEY `idx_call_lead` (`call_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `calls_users`
--

CREATE TABLE IF NOT EXISTS `calls_users` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_call_call` (`call_id`),
  KEY `idx_usr_call_usr` (`user_id`),
  KEY `idx_call_users` (`call_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `campaigns`
--

CREATE TABLE IF NOT EXISTS `campaigns` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_count` int(11) DEFAULT '0',
  `refer_url` varchar(255) DEFAULT 'http://',
  `tracker_text` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `impressions` int(11) DEFAULT '0',
  `currency_id` char(36) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `expected_cost` double DEFAULT NULL,
  `actual_cost` double DEFAULT NULL,
  `expected_revenue` double DEFAULT NULL,
  `campaign_type` varchar(100) DEFAULT NULL,
  `objective` text,
  `content` text,
  `frequency` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `camp_auto_tracker_key` (`tracker_key`),
  KEY `idx_campaign_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `campaigns_audit`
--

CREATE TABLE IF NOT EXISTS `campaigns_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_campaigns_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `campaign_log`
--

CREATE TABLE IF NOT EXISTS `campaign_log` (
  `id` char(36) NOT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `target_tracker_key` varchar(36) DEFAULT NULL,
  `target_id` varchar(36) DEFAULT NULL,
  `target_type` varchar(100) DEFAULT NULL,
  `activity_type` varchar(100) DEFAULT NULL,
  `activity_date` datetime DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `list_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `more_information` varchar(100) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_camp_tracker` (`target_tracker_key`),
  KEY `idx_camp_campaign_id` (`campaign_id`),
  KEY `idx_camp_more_info` (`more_information`),
  KEY `idx_target_id` (`target_id`),
  KEY `idx_target_id_deleted` (`target_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `campaign_trkrs`
--

CREATE TABLE IF NOT EXISTS `campaign_trkrs` (
  `id` char(36) NOT NULL,
  `tracker_name` varchar(30) DEFAULT NULL,
  `tracker_url` varchar(255) DEFAULT 'http://',
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `is_optout` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `campaign_tracker_key_idx` (`tracker_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cases`
--

CREATE TABLE IF NOT EXISTS `cases` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` text,
  `work_log` text,
  `account_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `casesnumk` (`case_number`),
  KEY `case_number` (`case_number`),
  KEY `idx_case_name` (`name`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_cases_stat_del` (`assigned_user_id`,`status`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cases_audit`
--

CREATE TABLE IF NOT EXISTS `cases_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_cases_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cases_bugs`
--

CREATE TABLE IF NOT EXISTS `cases_bugs` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cas_bug_cas` (`case_id`),
  KEY `idx_cas_bug_bug` (`bug_id`),
  KEY `idx_case_bug` (`case_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `category` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` text,
  KEY `idx_config_cat` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `config`
--

INSERT INTO `config` (`category`, `name`, `value`) VALUES
('notify', 'fromaddress', 'do_not_reply@example.com'),
('notify', 'fromname', 'SugarCRM'),
('notify', 'send_by_default', '1'),
('notify', 'on', '1'),
('notify', 'send_from_assigning_user', '0'),
('info', 'sugar_version', '6.5.16'),
('MySettings', 'tab', 'YToxNjp7aTowO3M6NDoiSG9tZSI7aToxO3M6ODoiQWNjb3VudHMiO2k6MjtzOjg6IkNvbnRhY3RzIjtpOjM7czoxMzoiT3Bwb3J0dW5pdGllcyI7aTo0O3M6NToiTGVhZHMiO2k6NTtzOjg6IkNhbGVuZGFyIjtpOjY7czo5OiJEb2N1bWVudHMiO2k6NztzOjY6IkVtYWlscyI7aTo4O3M6OToiQ2FtcGFpZ25zIjtpOjk7czo1OiJDYWxscyI7aToxMDtzOjg6Ik1lZXRpbmdzIjtpOjExO3M6NToiVGFza3MiO2k6MTI7czo1OiJOb3RlcyI7aToxMztzOjU6IkNhc2VzIjtpOjE0O3M6OToiUHJvc3BlY3RzIjtpOjE1O3M6MTM6IlByb3NwZWN0TGlzdHMiO30='),
('portal', 'on', '0'),
('tracker', 'Tracker', '1'),
('system', 'skypeout_on', '1'),
('sugarfeed', 'enabled', '1'),
('sugarfeed', 'module_UserFeed', '1'),
('sugarfeed', 'module_Contacts', '1'),
('sugarfeed', 'module_Opportunities', '1'),
('sugarfeed', 'module_Cases', '1'),
('sugarfeed', 'module_Leads', '1'),
('Update', 'CheckUpdates', 'manual'),
('system', 'name', 'SugarCRM Test'),
('system', 'adminwizard', '1'),
('notify', 'allow_default_outbound', '0');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `lead_source` varchar(255) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cont_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_contacts_del_last` (`deleted`,`last_name`),
  KEY `idx_cont_del_reports` (`deleted`,`reports_to_id`,`last_name`),
  KEY `idx_reports_to_id` (`reports_to_id`),
  KEY `idx_del_id_user` (`deleted`,`id`,`assigned_user_id`),
  KEY `idx_cont_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `contacts_audit`
--

CREATE TABLE IF NOT EXISTS `contacts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_contacts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `contacts_bugs`
--

CREATE TABLE IF NOT EXISTS `contacts_bugs` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_bug_con` (`contact_id`),
  KEY `idx_con_bug_bug` (`bug_id`),
  KEY `idx_contact_bug` (`contact_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `contacts_cases`
--

CREATE TABLE IF NOT EXISTS `contacts_cases` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_case_con` (`contact_id`),
  KEY `idx_con_case_case` (`case_id`),
  KEY `idx_contacts_cases` (`contact_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `contacts_users`
--

CREATE TABLE IF NOT EXISTS `contacts_users` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_users_con` (`contact_id`),
  KEY `idx_con_users_user` (`user_id`),
  KEY `idx_contacts_users` (`contact_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cron_remove_documents`
--

CREATE TABLE IF NOT EXISTS `cron_remove_documents` (
  `id` varchar(36) NOT NULL,
  `bean_id` varchar(36) DEFAULT NULL,
  `module` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cron_remove_document_bean_id` (`bean_id`),
  KEY `idx_cron_remove_document_stamp` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `id` char(36) NOT NULL,
  `name` varchar(36) DEFAULT NULL,
  `symbol` varchar(36) DEFAULT NULL,
  `iso4217` varchar(3) DEFAULT NULL,
  `conversion_rate` double DEFAULT '0',
  `status` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_currency_name` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `custom_fields`
--

CREATE TABLE IF NOT EXISTS `custom_fields` (
  `bean_id` varchar(36) DEFAULT NULL,
  `set_num` int(11) DEFAULT '0',
  `field0` varchar(255) DEFAULT NULL,
  `field1` varchar(255) DEFAULT NULL,
  `field2` varchar(255) DEFAULT NULL,
  `field3` varchar(255) DEFAULT NULL,
  `field4` varchar(255) DEFAULT NULL,
  `field5` varchar(255) DEFAULT NULL,
  `field6` varchar(255) DEFAULT NULL,
  `field7` varchar(255) DEFAULT NULL,
  `field8` varchar(255) DEFAULT NULL,
  `field9` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_beanid_set_num` (`bean_id`,`set_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT 'Sugar',
  `doc_url` varchar(255) DEFAULT NULL,
  `active_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `subcategory_id` varchar(100) DEFAULT NULL,
  `status_id` varchar(100) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `related_doc_id` char(36) DEFAULT NULL,
  `related_doc_rev_id` char(36) DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT '0',
  `template_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_doc_cat` (`category_id`,`subcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `documents_accounts`
--

CREATE TABLE IF NOT EXISTS `documents_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_accounts_account_id` (`account_id`,`document_id`),
  KEY `documents_accounts_document_id` (`document_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `documents_bugs`
--

CREATE TABLE IF NOT EXISTS `documents_bugs` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_bugs_bug_id` (`bug_id`,`document_id`),
  KEY `documents_bugs_document_id` (`document_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `documents_cases`
--

CREATE TABLE IF NOT EXISTS `documents_cases` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_cases_case_id` (`case_id`,`document_id`),
  KEY `documents_cases_document_id` (`document_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `documents_contacts`
--

CREATE TABLE IF NOT EXISTS `documents_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_contacts_contact_id` (`contact_id`,`document_id`),
  KEY `documents_contacts_document_id` (`document_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `documents_opportunities`
--

CREATE TABLE IF NOT EXISTS `documents_opportunities` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_docu_opps_oppo_id` (`opportunity_id`,`document_id`),
  KEY `idx_docu_oppo_docu_id` (`document_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `document_revisions`
--

CREATE TABLE IF NOT EXISTS `document_revisions` (
  `id` varchar(36) NOT NULL,
  `change_log` varchar(255) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT NULL,
  `doc_url` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `file_ext` varchar(100) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `revision` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documentrevision_mimetype` (`file_mime_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `eapm`
--

CREATE TABLE IF NOT EXISTS `eapm` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `application` varchar(100) DEFAULT 'webex',
  `api_data` text,
  `consumer_key` varchar(255) DEFAULT NULL,
  `consumer_secret` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `oauth_secret` varchar(255) DEFAULT NULL,
  `validated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_app_active` (`assigned_user_id`,`application`,`validated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `emailman`
--

CREATE TABLE IF NOT EXISTS `emailman` (
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  `list_id` char(36) DEFAULT NULL,
  `send_date_time` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `in_queue` tinyint(1) DEFAULT '0',
  `in_queue_date` datetime DEFAULT NULL,
  `send_attempts` int(11) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `related_id` char(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_eman_list` (`list_id`,`user_id`,`deleted`),
  KEY `idx_eman_campaign_id` (`campaign_id`),
  KEY `idx_eman_relid_reltype_id` (`related_id`,`related_type`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `emails`
--

CREATE TABLE IF NOT EXISTS `emails` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `flagged` tinyint(1) DEFAULT NULL,
  `reply_to_status` tinyint(1) DEFAULT NULL,
  `intent` varchar(100) DEFAULT 'pick',
  `mailbox_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_name` (`name`),
  KEY `idx_message_id` (`message_id`),
  KEY `idx_email_parent_id` (`parent_id`),
  KEY `idx_email_assigned` (`assigned_user_id`,`type`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `emails_beans`
--

CREATE TABLE IF NOT EXISTS `emails_beans` (
  `id` char(36) NOT NULL,
  `email_id` char(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `campaign_data` text,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emails_beans_bean_id` (`bean_id`),
  KEY `idx_emails_beans_email_bean` (`email_id`,`bean_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `emails_email_addr_rel`
--

CREATE TABLE IF NOT EXISTS `emails_email_addr_rel` (
  `id` char(36) NOT NULL,
  `email_id` char(36) NOT NULL,
  `address_type` varchar(4) DEFAULT NULL,
  `email_address_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eearl_email_id` (`email_id`,`address_type`),
  KEY `idx_eearl_address_id` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `emails_text`
--

CREATE TABLE IF NOT EXISTS `emails_text` (
  `email_id` char(36) NOT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `reply_to_addr` varchar(255) DEFAULT NULL,
  `to_addrs` text,
  `cc_addrs` text,
  `bcc_addrs` text,
  `description` longtext,
  `description_html` longtext,
  `raw_source` longtext,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`email_id`),
  KEY `emails_textfromaddr` (`from_addr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `email_addresses`
--

CREATE TABLE IF NOT EXISTS `email_addresses` (
  `id` char(36) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `email_address_caps` varchar(255) DEFAULT NULL,
  `invalid_email` tinyint(1) DEFAULT '0',
  `opt_out` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ea_caps_opt_out_invalid` (`email_address_caps`,`opt_out`,`invalid_email`),
  KEY `idx_ea_opt_out_invalid` (`email_address`,`opt_out`,`invalid_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `email_addresses`
--

INSERT INTO `email_addresses` (`id`, `email_address`, `email_address_caps`, `invalid_email`, `opt_out`, `date_created`, `date_modified`, `deleted`) VALUES
('5ffbb0fb-c51d-23b2-f82e-55880b55a5c8', 'test@example.com', 'TEST@EXAMPLE.COM', 0, 0, '2015-06-22 13:22:06', '2015-06-22 13:22:06', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `email_addr_bean_rel`
--

CREATE TABLE IF NOT EXISTS `email_addr_bean_rel` (
  `id` char(36) NOT NULL,
  `email_address_id` char(36) NOT NULL,
  `bean_id` char(36) NOT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `primary_address` tinyint(1) DEFAULT '0',
  `reply_to_address` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_email_address_id` (`email_address_id`),
  KEY `idx_bean_id` (`bean_id`,`bean_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `email_addr_bean_rel`
--

INSERT INTO `email_addr_bean_rel` (`id`, `email_address_id`, `bean_id`, `bean_module`, `primary_address`, `reply_to_address`, `date_created`, `date_modified`, `deleted`) VALUES
('5fe37378-02fe-28bc-6b75-55880b95b49e', '5ffbb0fb-c51d-23b2-f82e-55880b55a5c8', '1', 'Users', 1, 0, '2015-06-22 13:22:06', '2015-06-22 13:22:06', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `email_cache`
--

CREATE TABLE IF NOT EXISTS `email_cache` (
  `ie_id` char(36) DEFAULT NULL,
  `mbox` varchar(60) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `fromaddr` varchar(100) DEFAULT NULL,
  `toaddr` varchar(255) DEFAULT NULL,
  `senddate` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `mailsize` int(10) unsigned DEFAULT NULL,
  `imap_uid` int(10) unsigned DEFAULT NULL,
  `msgno` int(10) unsigned DEFAULT NULL,
  `recent` tinyint(4) DEFAULT NULL,
  `flagged` tinyint(4) DEFAULT NULL,
  `answered` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `draft` tinyint(4) DEFAULT NULL,
  KEY `idx_ie_id` (`ie_id`),
  KEY `idx_mail_date` (`ie_id`,`mbox`,`senddate`),
  KEY `idx_mail_from` (`ie_id`,`mbox`,`fromaddr`),
  KEY `idx_mail_subj` (`subject`),
  KEY `idx_mail_to` (`toaddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `email_marketing`
--

CREATE TABLE IF NOT EXISTS `email_marketing` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `from_addr` varchar(100) DEFAULT NULL,
  `reply_to_name` varchar(100) DEFAULT NULL,
  `reply_to_addr` varchar(100) DEFAULT NULL,
  `inbound_email_id` varchar(36) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `template_id` char(36) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `all_prospect_lists` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emmkt_name` (`name`),
  KEY `idx_emmkit_del` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `email_marketing_prospect_lists`
--

CREATE TABLE IF NOT EXISTS `email_marketing_prospect_lists` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `email_marketing_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `email_mp_prospects` (`email_marketing_id`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `email_templates`
--

CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `published` varchar(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `body_html` text,
  `deleted` tinyint(1) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `text_only` tinyint(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_template_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `email_templates`
--

INSERT INTO `email_templates` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `published`, `name`, `description`, `subject`, `body`, `body_html`, `deleted`, `assigned_user_id`, `text_only`, `type`) VALUES
('18295f6c-c796-f9a4-1927-55880b7727ca', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '1', 'off', 'System-generated password email', 'This template is used when the System Administrator sends a new password to a user.', 'New account information', '\nHere is your account username and temporary password:\nUsername : $contact_user_user_name\nPassword : $contact_user_user_hash\n\n$config_site_url\n\nAfter you log in using the above password, you may be required to reset the password to one of your own choice.', '<div><table width="550"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : $contact_user_user_name </p><p>Password : $contact_user_user_hash </p><br /><p>$config_site_url</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr></tbody></table></div>', 0, NULL, 0, NULL),
('22415e7d-fc84-bed9-d94e-55880b5884ab', '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '1', 'off', 'Forgot Password email', 'This template is used to send a user a link to click to reset the user''s account password.', 'Reset your account password', '\nYou recently requested on $contact_user_pwd_last_changed to be able to reset your account password.\n\nClick on the link below to reset your password:\n\n$contact_user_link_guid', '<div><table width="550"><tbody><tr><td><p>You recently requested on $contact_user_pwd_last_changed to be able to reset your account password. </p><p>Click on the link below to reset your password:</p><p> $contact_user_link_guid </p>  </td>         </tr><tr><td></td>         </tr></tbody></table></div>', 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `fields_meta_data`
--

CREATE TABLE IF NOT EXISTS `fields_meta_data` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vname` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `help` varchar(255) DEFAULT NULL,
  `custom_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `len` int(11) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `default_value` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `audited` tinyint(1) DEFAULT '0',
  `massupdate` tinyint(1) DEFAULT '0',
  `duplicate_merge` smallint(6) DEFAULT '0',
  `reportable` tinyint(1) DEFAULT '1',
  `importable` varchar(255) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  `ext3` varchar(255) DEFAULT NULL,
  `ext4` text,
  PRIMARY KEY (`id`),
  KEY `idx_meta_id_del` (`id`,`deleted`),
  KEY `idx_meta_cm_del` (`custom_module`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `folders`
--

CREATE TABLE IF NOT EXISTS `folders` (
  `id` char(36) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `folder_type` varchar(25) DEFAULT NULL,
  `parent_folder` char(36) DEFAULT NULL,
  `has_child` tinyint(1) DEFAULT '0',
  `is_group` tinyint(1) DEFAULT '0',
  `is_dynamic` tinyint(1) DEFAULT '0',
  `dynamic_query` text,
  `assign_to_id` char(36) DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_folder` (`parent_folder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `folders_rel`
--

CREATE TABLE IF NOT EXISTS `folders_rel` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `polymorphic_module` varchar(25) DEFAULT NULL,
  `polymorphic_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_poly_module_poly_id` (`polymorphic_module`,`polymorphic_id`),
  KEY `idx_fr_id_deleted_poly` (`folder_id`,`deleted`,`polymorphic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `folders_subscriptions`
--

CREATE TABLE IF NOT EXISTS `folders_subscriptions` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `assigned_user_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder_id_assigned_user_id` (`folder_id`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `import_maps`
--

CREATE TABLE IF NOT EXISTS `import_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(254) DEFAULT NULL,
  `source` varchar(36) DEFAULT NULL,
  `enclosure` varchar(1) DEFAULT ' ',
  `delimiter` varchar(1) DEFAULT ',',
  `module` varchar(36) DEFAULT NULL,
  `content` text,
  `default_values` text,
  `has_header` tinyint(1) DEFAULT '1',
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_published` varchar(3) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `idx_owner_module_name` (`assigned_user_id`,`module`,`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `inbound_email`
--

CREATE TABLE IF NOT EXISTS `inbound_email` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Active',
  `server_url` varchar(100) DEFAULT NULL,
  `email_user` varchar(100) DEFAULT NULL,
  `email_password` varchar(100) DEFAULT NULL,
  `port` int(5) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `mailbox` text,
  `delete_seen` tinyint(1) DEFAULT '0',
  `mailbox_type` varchar(10) DEFAULT NULL,
  `template_id` char(36) DEFAULT NULL,
  `stored_options` text,
  `group_id` char(36) DEFAULT NULL,
  `is_personal` tinyint(1) DEFAULT '0',
  `groupfolder_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `inbound_email_autoreply`
--

CREATE TABLE IF NOT EXISTS `inbound_email_autoreply` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `autoreplied_to` varchar(100) DEFAULT NULL,
  `ie_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ie_autoreplied_to` (`autoreplied_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `inbound_email_cache_ts`
--

CREATE TABLE IF NOT EXISTS `inbound_email_cache_ts` (
  `id` varchar(255) NOT NULL,
  `ie_timestamp` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `job_queue`
--

CREATE TABLE IF NOT EXISTS `job_queue` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `scheduler_id` char(36) DEFAULT NULL,
  `execute_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `resolution` varchar(20) DEFAULT NULL,
  `message` text,
  `target` varchar(255) DEFAULT NULL,
  `data` text,
  `requeue` tinyint(1) DEFAULT '0',
  `retry_count` tinyint(4) DEFAULT NULL,
  `failure_count` tinyint(4) DEFAULT NULL,
  `job_delay` int(11) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status_scheduler` (`status`,`scheduler_id`),
  KEY `idx_status_time` (`status`,`execute_time`,`date_entered`),
  KEY `idx_status_entered` (`status`,`date_entered`),
  KEY `idx_status_modified` (`status`,`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `leads`
--

CREATE TABLE IF NOT EXISTS `leads` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `converted` tinyint(1) DEFAULT '0',
  `refered_by` varchar(100) DEFAULT NULL,
  `lead_source` varchar(100) DEFAULT NULL,
  `lead_source_description` text,
  `status` varchar(100) DEFAULT NULL,
  `status_description` text,
  `reports_to_id` char(36) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_description` text,
  `contact_id` char(36) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `opportunity_name` varchar(255) DEFAULT NULL,
  `opportunity_amount` varchar(50) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `portal_name` varchar(255) DEFAULT NULL,
  `portal_app` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lead_acct_name_first` (`account_name`,`deleted`),
  KEY `idx_lead_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_lead_del_stat` (`last_name`,`status`,`deleted`,`first_name`),
  KEY `idx_lead_opp_del` (`opportunity_id`,`deleted`),
  KEY `idx_leads_acct_del` (`account_id`,`deleted`),
  KEY `idx_del_user` (`deleted`,`assigned_user_id`),
  KEY `idx_lead_assigned` (`assigned_user_id`),
  KEY `idx_lead_contact` (`contact_id`),
  KEY `idx_reports_to` (`reports_to_id`),
  KEY `idx_lead_phone_work` (`phone_work`),
  KEY `idx_leads_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `leads_audit`
--

CREATE TABLE IF NOT EXISTS `leads_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_leads_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `linked_documents`
--

CREATE TABLE IF NOT EXISTS `linked_documents` (
  `id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `parent_type` varchar(25) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_document` (`parent_type`,`parent_id`,`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `meetings`
--

CREATE TABLE IF NOT EXISTS `meetings` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `join_url` varchar(200) DEFAULT NULL,
  `host_url` varchar(400) DEFAULT NULL,
  `displayed_url` varchar(400) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `external_id` varchar(50) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `type` varchar(255) DEFAULT 'Sugar',
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mtg_name` (`name`),
  KEY `idx_meet_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_meet_stat_del` (`assigned_user_id`,`status`,`deleted`),
  KEY `idx_meet_date_start` (`date_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `meetings_contacts`
--

CREATE TABLE IF NOT EXISTS `meetings_contacts` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_mtg_mtg` (`meeting_id`),
  KEY `idx_con_mtg_con` (`contact_id`),
  KEY `idx_meeting_contact` (`meeting_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `meetings_leads`
--

CREATE TABLE IF NOT EXISTS `meetings_leads` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_meeting_meeting` (`meeting_id`),
  KEY `idx_lead_meeting_lead` (`lead_id`),
  KEY `idx_meeting_lead` (`meeting_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `meetings_users`
--

CREATE TABLE IF NOT EXISTS `meetings_users` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_mtg_mtg` (`meeting_id`),
  KEY `idx_usr_mtg_usr` (`user_id`),
  KEY `idx_meeting_users` (`meeting_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `portal_flag` tinyint(1) DEFAULT NULL,
  `embed_flag` tinyint(1) DEFAULT '0',
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_note_name` (`name`),
  KEY `idx_notes_parent` (`parent_id`,`parent_type`),
  KEY `idx_note_contact` (`contact_id`),
  KEY `idx_notes_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `oauth_consumer`
--

CREATE TABLE IF NOT EXISTS `oauth_consumer` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `c_key` varchar(255) DEFAULT NULL,
  `c_secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ckey` (`c_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `oauth_nonce`
--

CREATE TABLE IF NOT EXISTS `oauth_nonce` (
  `conskey` varchar(32) NOT NULL,
  `nonce` varchar(32) NOT NULL,
  `nonce_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`conskey`,`nonce`),
  KEY `oauth_nonce_keyts` (`conskey`,`nonce_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `oauth_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_tokens` (
  `id` char(36) NOT NULL,
  `secret` varchar(32) DEFAULT NULL,
  `tstate` varchar(1) DEFAULT NULL,
  `consumer` char(36) NOT NULL,
  `token_ts` bigint(20) DEFAULT NULL,
  `verify` varchar(32) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `callback_url` varchar(255) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`,`deleted`),
  KEY `oauth_state_ts` (`tstate`,`token_ts`),
  KEY `constoken_key` (`consumer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `opportunities`
--

CREATE TABLE IF NOT EXISTS `opportunities` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `opportunity_type` varchar(255) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `lead_source` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `amount_usdollar` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  `next_step` varchar(100) DEFAULT NULL,
  `sales_stage` varchar(255) DEFAULT NULL,
  `probability` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_opp_name` (`name`),
  KEY `idx_opp_assigned` (`assigned_user_id`),
  KEY `idx_opp_id_deleted` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `opportunities_audit`
--

CREATE TABLE IF NOT EXISTS `opportunities_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_opportunities_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `opportunities_contacts`
--

CREATE TABLE IF NOT EXISTS `opportunities_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_opp_con` (`contact_id`),
  KEY `idx_con_opp_opp` (`opportunity_id`),
  KEY `idx_opportunities_contacts` (`opportunity_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `outbound_email`
--

CREATE TABLE IF NOT EXISTS `outbound_email` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(15) DEFAULT 'user',
  `user_id` char(36) NOT NULL,
  `mail_sendtype` varchar(8) DEFAULT 'smtp',
  `mail_smtptype` varchar(20) DEFAULT 'other',
  `mail_smtpserver` varchar(100) DEFAULT NULL,
  `mail_smtpport` int(5) DEFAULT '0',
  `mail_smtpuser` varchar(100) DEFAULT NULL,
  `mail_smtppass` varchar(100) DEFAULT NULL,
  `mail_smtpauth_req` tinyint(1) DEFAULT '0',
  `mail_smtpssl` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `oe_user_id_idx` (`id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `outbound_email`
--

INSERT INTO `outbound_email` (`id`, `name`, `type`, `user_id`, `mail_sendtype`, `mail_smtptype`, `mail_smtpserver`, `mail_smtpport`, `mail_smtpuser`, `mail_smtppass`, `mail_smtpauth_req`, `mail_smtpssl`) VALUES
('c65500b4-3f08-31ac-8ebe-55880b4cef3b', 'system', 'system', '1', 'SMTP', 'other', '', 25, '', '', 1, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `estimated_start_date` date DEFAULT NULL,
  `estimated_end_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `projects_accounts`
--

CREATE TABLE IF NOT EXISTS `projects_accounts` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_acct_proj` (`project_id`),
  KEY `idx_proj_acct_acct` (`account_id`),
  KEY `projects_accounts_alt` (`project_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `projects_bugs`
--

CREATE TABLE IF NOT EXISTS `projects_bugs` (
  `id` varchar(36) NOT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_bug_proj` (`project_id`),
  KEY `idx_proj_bug_bug` (`bug_id`),
  KEY `projects_bugs_alt` (`project_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `projects_cases`
--

CREATE TABLE IF NOT EXISTS `projects_cases` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_case_proj` (`project_id`),
  KEY `idx_proj_case_case` (`case_id`),
  KEY `projects_cases_alt` (`project_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `projects_contacts`
--

CREATE TABLE IF NOT EXISTS `projects_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_con_proj` (`project_id`),
  KEY `idx_proj_con_con` (`contact_id`),
  KEY `projects_contacts_alt` (`project_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `projects_opportunities`
--

CREATE TABLE IF NOT EXISTS `projects_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_opp_proj` (`project_id`),
  KEY `idx_proj_opp_opp` (`opportunity_id`),
  KEY `projects_opportunities_alt` (`project_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `projects_products`
--

CREATE TABLE IF NOT EXISTS `projects_products` (
  `id` varchar(36) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_prod_project` (`project_id`),
  KEY `idx_proj_prod_product` (`product_id`),
  KEY `projects_products_alt` (`project_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `project_task`
--

CREATE TABLE IF NOT EXISTS `project_task` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `project_id` char(36) NOT NULL,
  `project_task_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `description` text,
  `predecessors` text,
  `date_start` date DEFAULT NULL,
  `time_start` int(11) DEFAULT NULL,
  `time_finish` int(11) DEFAULT NULL,
  `date_finish` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `duration_unit` text,
  `actual_duration` int(11) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  `date_due` date DEFAULT NULL,
  `time_due` time DEFAULT NULL,
  `parent_task_id` int(11) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT NULL,
  `order_number` int(11) DEFAULT '1',
  `task_number` int(11) DEFAULT NULL,
  `estimated_effort` int(11) DEFAULT NULL,
  `actual_effort` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `utilization` int(11) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `project_task_audit`
--

CREATE TABLE IF NOT EXISTS `project_task_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_project_task_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `prospects`
--

CREATE TABLE IF NOT EXISTS `prospects` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `birthdate` date DEFAULT NULL,
  `lead_id` char(36) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prospect_auto_tracker_key` (`tracker_key`),
  KEY `idx_prospects_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_prospecs_del_last` (`last_name`,`deleted`),
  KEY `idx_prospects_id_del` (`id`,`deleted`),
  KEY `idx_prospects_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `prospect_lists`
--

CREATE TABLE IF NOT EXISTS `prospect_lists` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_type` varchar(100) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `description` text,
  `domain_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prospect_list_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `prospect_lists_prospects`
--

CREATE TABLE IF NOT EXISTS `prospect_lists_prospects` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_plp_pro_id` (`prospect_list_id`),
  KEY `idx_plp_rel_id` (`related_id`,`related_type`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `prospect_list_campaigns`
--

CREATE TABLE IF NOT EXISTS `prospect_list_campaigns` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `campaign_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pro_id` (`prospect_list_id`),
  KEY `idx_cam_id` (`campaign_id`),
  KEY `idx_prospect_list_campaigns` (`prospect_list_id`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `relationships`
--

CREATE TABLE IF NOT EXISTS `relationships` (
  `id` char(36) NOT NULL,
  `relationship_name` varchar(150) DEFAULT NULL,
  `lhs_module` varchar(100) DEFAULT NULL,
  `lhs_table` varchar(64) DEFAULT NULL,
  `lhs_key` varchar(64) DEFAULT NULL,
  `rhs_module` varchar(100) DEFAULT NULL,
  `rhs_table` varchar(64) DEFAULT NULL,
  `rhs_key` varchar(64) DEFAULT NULL,
  `join_table` varchar(128) DEFAULT NULL,
  `join_key_lhs` varchar(128) DEFAULT NULL,
  `join_key_rhs` varchar(128) DEFAULT NULL,
  `relationship_type` varchar(64) DEFAULT NULL,
  `relationship_role_column` varchar(64) DEFAULT NULL,
  `relationship_role_column_value` varchar(50) DEFAULT NULL,
  `reverse` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rel_name` (`relationship_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `relationships`
--

INSERT INTO `relationships` (`id`, `relationship_name`, `lhs_module`, `lhs_table`, `lhs_key`, `rhs_module`, `rhs_table`, `rhs_key`, `join_table`, `join_key_lhs`, `join_key_rhs`, `relationship_type`, `relationship_role_column`, `relationship_role_column_value`, `reverse`, `deleted`) VALUES
('1260b77d-7e92-0399-e408-55880b5f673c', 'opportunity_notes', 'Opportunities', 'opportunities', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('1395015e-b498-3e86-4e15-55880b64c041', 'documents_cases', 'Documents', 'documents', 'id', 'Cases', 'cases', 'id', 'documents_cases', 'document_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('146f2129-61dd-2d56-08e3-55880b9a41eb', 'bug_emails', 'Bugs', 'bugs', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('153ffab2-1b45-7205-0500-55880b04465e', 'email_template_email_marketings', 'EmailTemplates', 'email_templates', 'id', 'EmailMarketing', 'email_marketing', 'template_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('15aa4479-9997-aeca-84cf-55880b329161', 'documents_contacts', 'Documents', 'documents', 'id', 'Contacts', 'contacts', 'id', 'documents_contacts', 'document_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('16f4d17c-08b3-82da-c22c-55880bea95de', 'contact_direct_reports', 'Contacts', 'contacts', 'id', 'Contacts', 'contacts', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('17be7f00-3ca7-5361-029d-55880befa15f', 'account_notes', 'Accounts', 'accounts', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('1878dffd-9a29-10ce-d294-55880b9ed503', 'opportunity_emails', 'Opportunities', 'opportunities', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('191058e7-f6c8-b8a4-4f10-55880b112a81', 'leads_modified_user', 'Users', 'users', 'id', 'Leads', 'leads', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1a920ebd-802f-6009-0ca9-55880bf23ad8', 'bug_notes', 'Bugs', 'bugs', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('1b49ade2-d4d5-0c07-e434-55880b0e6442', 'meetings_modified_user', 'Users', 'users', 'id', 'Meetings', 'meetings', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1bfa2852-7906-e83a-44a7-55880b6d8fee', 'calls_leads', 'Calls', 'calls', 'id', 'Leads', 'leads', 'id', 'calls_leads', 'call_id', 'lead_id', 'many-to-many', NULL, NULL, 0, 0),
('1d11bda5-acaf-7275-d05b-55880b08ba29', 'contact_leads', 'Contacts', 'contacts', 'id', 'Leads', 'leads', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1e1cdc89-5756-9adf-b22f-55880b0f94ec', 'prospectlists_assigned_user', 'Users', 'users', 'id', 'prospectlists', 'prospect_lists', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1e9fdcf8-09e1-8f44-8add-55880be7b61a', 'opportunity_leads', 'Opportunities', 'opportunities', 'id', 'Leads', 'leads', 'opportunity_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1fe295f6-ff91-2674-6055-55880b976a8c', 'account_meetings', 'Accounts', 'accounts', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('20b50324-4d2e-f8a1-eb20-55880b279705', 'bugs_release', 'Releases', 'releases', 'id', 'Bugs', 'bugs', 'found_in_release', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('20d46394-de54-f6bc-23e5-55880bffd07e', 'leads_created_by', 'Users', 'users', 'id', 'Leads', 'leads', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('20e4063e-869b-516c-92d3-55880b6f1274', 'bug_tasks', 'Bugs', 'bugs', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('21f70164-d0f7-a62a-d80e-55880b9a45ec', 'meetings_created_by', 'Users', 'users', 'id', 'Meetings', 'meetings', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('248844ed-502c-4d70-feed-55880b2455cb', 'projects_notes', 'Project', 'project', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('261e0aba-0371-c4b0-f6ef-55880bb2bd69', 'emails_leads_rel', 'Emails', 'emails', 'id', 'Leads', 'leads', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Leads', 0, 0),
('27efba58-58ce-07f0-a2e4-55880b63c7f7', 'contact_notes', 'Contacts', 'contacts', 'id', 'Notes', 'notes', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2801e4d8-73db-fbf8-6db8-55880b38ba2f', 'opportunity_currencies', 'Opportunities', 'opportunities', 'currency_id', 'Currencies', 'currencies', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('28dc82d0-f04c-adbd-e1e3-55880ba62283', 'bugs_fixed_in_release', 'Releases', 'releases', 'id', 'Bugs', 'bugs', 'fixed_in_release', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('28fd907e-f35e-b01f-272e-55880b1581f7', 'leads_assigned_user', 'Users', 'users', 'id', 'Leads', 'leads', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2a032913-5fc3-f1e1-d047-55880bf87d68', 'account_calls', 'Accounts', 'accounts', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('2a1e8dfc-8aa2-07f5-61ea-55880b6c1caa', 'meetings_assigned_user', 'Users', 'users', 'id', 'Meetings', 'meetings', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2c63d7b7-f6d9-97a5-befa-55880bd44a4f', 'projects_tasks', 'Project', 'project', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('2cb54775-7ba7-67eb-aabb-55880bd724b3', 'projects_contacts', 'Project', 'project', 'id', 'Contacts', 'contacts', 'id', 'projects_contacts', 'project_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('2e26ee65-fb5a-ee30-efee-55880b07faac', 'sugarfeed_modified_user', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2fdcc3ab-79c9-bc78-4133-55880b614417', 'campaign_campaigntrakers', 'Campaigns', 'campaigns', 'id', 'CampaignTrackers', 'campaign_trkrs', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('312703a2-c27d-cfeb-88f7-55880bb0f834', 'leads_email_addresses', 'Leads', 'leads', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Leads', 0, 0),
('3261f1f4-8dd2-290e-594c-55880b3f7f89', 'meetings_notes', 'Meetings', 'meetings', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Meetings', 0, 0),
('32873d9d-fcd3-ae2e-5e29-55880b5e1aa8', 'projects_meetings', 'Project', 'project', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('35feed19-8d58-7238-5772-55880bb5c2cd', 'opportunities_campaign', 'Campaigns', 'campaigns', 'id', 'Opportunities', 'opportunities', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3619dd14-2c11-e853-1376-55880b673d0b', 'sugarfeed_created_by', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('364ac973-fa52-1e7c-45fc-55880b12a5f6', 'contact_tasks', 'Contacts', 'contacts', 'id', 'Tasks', 'tasks', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3666809e-98ff-f54a-b59b-55880b653aa5', 'documents_opportunities', 'Documents', 'documents', 'id', 'Opportunities', 'opportunities', 'id', 'documents_opportunities', 'document_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('38af0616-d553-4cf9-5660-55880bb668c3', 'projects_calls', 'Project', 'project', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('394d949c-50ff-b8bb-a7c2-55880b9f394f', 'leads_email_addresses_primary', 'Leads', 'leads', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('39ede135-560f-361f-7f09-55880b2ce6c4', 'account_emails', 'Accounts', 'accounts', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('3c39fe4a-fc03-7a58-0302-55880b84054f', 'sugarfeed_assigned_user', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3d0fe365-be33-d46a-8012-55880be5c837', 'calls_users', 'Calls', 'calls', 'id', 'Users', 'users', 'id', 'calls_users', 'call_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('3ec01ade-eb00-abe9-e981-55880b3584d2', 'projects_emails', 'Project', 'project', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('4134c88b-38db-ccca-e258-55880bcdc22c', 'projects_opportunities', 'Project', 'project', 'id', 'Opportunities', 'opportunities', 'id', 'projects_opportunities', 'project_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('41765c8b-4475-9367-632f-55880b7fa2c3', 'lead_direct_reports', 'Leads', 'leads', 'id', 'Leads', 'leads', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('41c942c0-ce3e-82d6-c33a-55880ba913f4', 'contact_tasks_parent', 'Contacts', 'contacts', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Contacts', 0, 0),
('44dd011c-dc7a-71e3-7e8c-55880b5b7c78', 'projects_project_tasks', 'Project', 'project', 'id', 'ProjectTask', 'project_task', 'project_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('46af5444-2bbd-91e6-6c4b-55880be01a3d', 'account_leads', 'Accounts', 'accounts', 'id', 'Leads', 'leads', 'account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('49a064b4-b9f5-8064-77b4-55880bfa93d0', 'lead_tasks', 'Leads', 'leads', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('4a220cc0-cfbd-db48-a707-55880befbbd3', 'contact_notes_parent', 'Contacts', 'contacts', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Contacts', 0, 0),
('4afd8703-457e-c550-aa21-55880b050e6e', 'projects_assigned_user', 'Users', 'users', 'id', 'Project', 'project', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4ed4b212-08b2-8364-0274-55880bf6a4ff', 'account_campaign_log', 'Accounts', 'accounts', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Accounts', 0, 0),
('511b8fba-3239-ee68-d16d-55880ba1b97d', 'projects_modified_user', 'Users', 'users', 'id', 'Project', 'project', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('51c6eea2-2ef0-ff91-a5d2-55880b8d6040', 'lead_notes', 'Leads', 'leads', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('5219198a-c419-aeef-25d5-55880b6cd532', 'contact_campaign_log', 'Contacts', 'contacts', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Contacts', 0, 0),
('53706293-ca68-7f26-4b0d-55880bfb2c05', 'documents_modified_user', 'Users', 'users', 'id', 'Documents', 'documents', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5377ab1e-a458-e654-b031-55880ba613e4', 'cases_bugs', 'Cases', 'cases', 'id', 'Bugs', 'bugs', 'id', 'cases_bugs', 'case_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('551aea5e-cf8b-b851-e104-55880b5f72d2', 'cases_modified_user', 'Users', 'users', 'id', 'Cases', 'cases', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('573de71a-634e-632c-3f3e-55880b2a4375', 'projects_created_by', 'Users', 'users', 'id', 'Project', 'project', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('57730cf4-6514-7b88-8383-55880b15e69b', 'notes_modified_user', 'Users', 'users', 'id', 'Notes', 'notes', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('59f0cebb-9ae5-63c5-06f1-55880b0b40fa', 'lead_meetings', 'Leads', 'leads', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('5ad4e236-6f40-9a76-02c7-55880b03e424', 'leads_documents', 'Leads', 'leads', 'id', 'Documents', 'documents', 'id', 'linked_documents', 'parent_id', 'document_id', 'many-to-many', 'parent_type', 'Leads', 0, 0),
('5b0cdd7b-bed5-2cf8-e4d4-55880bad537c', 'cases_created_by', 'Users', 'users', 'id', 'Cases', 'cases', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5b4cb817-c048-e779-1214-55880bb3ca1d', 'documents_created_by', 'Users', 'users', 'id', 'Documents', 'documents', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5cc7095c-e6e2-6ae3-19d9-55880bf2684e', 'calls_contacts', 'Calls', 'calls', 'id', 'Contacts', 'contacts', 'id', 'calls_contacts', 'call_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('61161fc2-742c-4aec-5aca-55880b022938', 'cases_assigned_user', 'Users', 'users', 'id', 'Cases', 'cases', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('61e61ad6-9262-ae72-1890-55880b224905', 'prospect_list_campaigns', 'ProspectLists', 'prospect_lists', 'id', 'Campaigns', 'campaigns', 'id', 'prospect_list_campaigns', 'prospect_list_id', 'campaign_id', 'many-to-many', NULL, NULL, 0, 0),
('6217f70c-5db7-8ee0-708a-55880b8f63e8', 'lead_calls', 'Leads', 'leads', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('623905e4-a145-7c99-a234-55880b578098', 'opportunity_meetings', 'Opportunities', 'opportunities', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('63720e56-fc1b-1d1a-f30a-55880b589e55', 'documents_assigned_user', 'Users', 'users', 'id', 'Documents', 'documents', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6715fd75-1e45-f0f3-673d-55880b9b7234', 'campaigns_modified_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('673695ac-da92-dd5c-14c9-55880b5f745b', 'case_calls', 'Cases', 'cases', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('6a390a46-0989-bf0e-aed2-55880b11770a', 'contacts_email_addresses', 'Contacts', 'contacts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Contacts', 0, 0),
('6a3d5d42-c817-3c29-88b7-55880ba21946', 'lead_emails', 'Leads', 'leads', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('6a45a2bd-64cf-4861-bdf7-55880b592d42', 'prospects_modified_user', 'Users', 'users', 'id', 'Prospects', 'prospects', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6a56d35d-9f69-b111-4419-55880bd58028', 'contacts_bugs', 'Contacts', 'contacts', 'id', 'Bugs', 'bugs', 'id', 'contacts_bugs', 'contact_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('6ba00fac-11fa-6e61-525c-55880bb4ade9', 'document_revisions', 'Documents', 'documents', 'id', 'DocumentRevisions', 'document_revisions', 'document_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6d5485c7-3f07-ee2f-564d-55880b9e67f8', 'case_tasks', 'Cases', 'cases', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('6d61ff73-53ab-3330-2be6-55880b1a3dfc', 'schedulers_created_by_rel', 'Users', 'users', 'id', 'Schedulers', 'schedulers', 'created_by', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('6ebe4a95-df59-5074-f760-55880b111f49', 'campaigns_created_by', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6f0d1f8a-5dbd-e760-84f6-55880b02ca94', 'meetings_contacts', 'Meetings', 'meetings', 'id', 'Contacts', 'contacts', 'id', 'meetings_contacts', 'meeting_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('6ff84931-399e-f33f-7bea-55880b83dce6', 'calls_modified_user', 'Users', 'users', 'id', 'Calls', 'calls', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('721a1c06-2d6c-27a8-ebad-55880beb080e', 'prospects_created_by', 'Users', 'users', 'id', 'Prospects', 'prospects', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7268fe7e-3363-4baf-ed99-55880bd1bc86', 'lead_campaign_log', 'Leads', 'leads', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Leads', 0, 0),
('736c1e0e-529d-7af3-e0dd-55880b041246', 'schedulers_modified_user_id_rel', 'Users', 'users', 'id', 'Schedulers', 'schedulers', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7372cb1e-7129-b521-2b7c-55880bc861f6', 'case_notes', 'Cases', 'cases', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('76dccbd5-95e7-8199-1712-55880b2de002', 'campaigns_assigned_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7847f4ae-c246-1513-be58-55880b40af92', 'prospects_assigned_user', 'Users', 'users', 'id', 'Prospects', 'prospects', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('786d06ee-f6f4-b8f3-5c0c-55880b8fe650', 'account_cases', 'Accounts', 'accounts', 'id', 'Cases', 'cases', 'account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('787eca4e-d333-6e5a-0bda-55880b5adcaa', 'prospect_list_contacts', 'ProspectLists', 'prospect_lists', 'id', 'Contacts', 'contacts', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Contacts', 0, 0),
('79883fc6-8358-f3f0-ccfd-55880bdd82fd', 'schedulers_jobs_rel', 'Schedulers', 'schedulers', 'id', 'SchedulersJobs', 'job_queue', 'scheduler_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7994e4ec-7051-467b-2b95-55880b6b5779', 'case_meetings', 'Cases', 'cases', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('79dc5547-956f-f66d-2e06-55880b07fd90', 'email_marketing_prospect_lists', 'EmailMarketing', 'email_marketing', 'id', 'ProspectLists', 'prospect_lists', 'id', 'email_marketing_prospect_lists', 'email_marketing_id', 'prospect_list_id', 'many-to-many', NULL, NULL, 0, 0),
('7d60069b-6640-f729-1da3-55880b13fcbe', 'contacts_assigned_user', 'Users', 'users', 'id', 'Contacts', 'contacts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7e023a20-c031-8eb5-05fe-55880b8dd691', 'calls_created_by', 'Users', 'users', 'id', 'Calls', 'calls', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7e6acbe6-7b4d-1671-8322-55880b712f13', 'prospects_email_addresses', 'Prospects', 'prospects', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Prospects', 0, 0),
('7f0bb1b0-1f65-1c43-2c0c-55880b1436b3', 'campaign_accounts', 'Campaigns', 'campaigns', 'id', 'Accounts', 'accounts', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7f5c086f-7f3c-6f83-64c5-55880b2ca51f', 'projects_cases', 'Project', 'project', 'id', 'Cases', 'cases', 'id', 'projects_cases', 'project_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('7fb3af05-95d3-28a8-700b-55880b8a0804', 'case_emails', 'Cases', 'cases', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('808dc77e-951f-bf4d-9274-55880b242546', 'prospect_list_prospects', 'ProspectLists', 'prospect_lists', 'id', 'Prospects', 'prospects', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Prospects', 0, 0),
('80d57896-9cbf-6019-3dfb-55880b9475e4', 'contacts_cases', 'Contacts', 'contacts', 'id', 'Cases', 'cases', 'id', 'contacts_cases', 'contact_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('82f8097e-59e3-81ab-86aa-55880bec212d', 'bug_meetings', 'Bugs', 'bugs', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('8377dae4-0521-eb9a-e542-55880b9fe345', 'meetings_leads', 'Meetings', 'meetings', 'id', 'Leads', 'leads', 'id', 'meetings_leads', 'meeting_id', 'lead_id', 'many-to-many', NULL, NULL, 0, 0),
('8413a097-aa68-072a-9ff5-55880b8ca11c', 'calls_assigned_user', 'Users', 'users', 'id', 'Calls', 'calls', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8488a160-9f8c-b8b2-6b06-55880bbeda31', 'prospects_email_addresses_primary', 'Prospects', 'prospects', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('8500dc67-2fd6-84d1-4b85-55880b36a799', 'user_direct_reports', 'Users', 'users', 'id', 'Users', 'users', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('855c160f-5ade-35c9-dfcd-55880b849910', 'accounts_bugs', 'Accounts', 'accounts', 'id', 'Bugs', 'bugs', 'id', 'accounts_bugs', 'account_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('865a607a-cb70-4dad-2e40-55880b45aefe', 'revisions_created_by', 'Users', 'users', 'id', 'DocumentRevisions', 'document_revisions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8737c3f6-e080-3238-3a99-55880bb74b68', 'campaign_contacts', 'Campaigns', 'campaigns', 'id', 'Contacts', 'contacts', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('882a002f-7ec4-3c3e-4c0f-55880bb3a661', 'emails_meetings_rel', 'Emails', 'emails', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('88b60477-f882-9cca-5f4f-55880b32061c', 'prospect_list_leads', 'ProspectLists', 'prospect_lists', 'id', 'Leads', 'leads', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Leads', 0, 0),
('8a2fe63a-7ba0-c460-3af9-55880b3f294d', 'calls_notes', 'Calls', 'calls', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Calls', 0, 0),
('8a9fc802-e170-edb7-d306-55880b810c9b', 'prospect_tasks', 'Prospects', 'prospects', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('8cf6b5a8-97e4-a445-af85-55880b9a1c14', 'users_email_addresses', 'Users', 'users', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Users', 0, 0),
('8e5a2857-db6f-0fc8-12e5-55880bef6587', 'tasks_modified_user', 'Users', 'users', 'id', 'Tasks', 'tasks', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8e5fff41-aef1-b3df-c444-55880b9cd0ec', 'emails_bugs_rel', 'Emails', 'emails', 'id', 'Bugs', 'bugs', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Bugs', 0, 0),
('8f57c372-662b-eeb6-3d60-55880b78d769', 'campaign_leads', 'Campaigns', 'campaigns', 'id', 'Leads', 'leads', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('90341828-3671-09ce-c80d-55880b4cb58c', 'schedulersjobs_assigned_user', 'Users', 'users', 'id', 'SchedulersJobs', 'schedulersjobs', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('90c639e1-2402-7f1d-686a-55880baccc31', 'prospect_notes', 'Prospects', 'prospects', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('90d8c918-d07b-2db6-6056-55880b3ace90', 'prospect_list_users', 'ProspectLists', 'prospect_lists', 'id', 'Users', 'users', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Users', 0, 0),
('93a2f6a4-6883-53d1-9992-55880b35c33f', 'emailtemplates_assigned_user', 'Users', 'users', 'id', 'EmailTemplates', 'email_templates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('951d45e0-1f1c-be13-a67b-55880b55e68b', 'users_email_addresses_primary', 'Users', 'users', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('966d3269-3485-863b-df08-55880b152569', 'tasks_created_by', 'Users', 'users', 'id', 'Tasks', 'tasks', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('967474ef-4bcb-0020-eb35-55880b710454', 'emails_cases_rel', 'Emails', 'emails', 'id', 'Cases', 'cases', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Cases', 0, 0),
('96e85d9d-6da7-33fb-c5d0-55880be08a81', 'prospect_meetings', 'Prospects', 'prospects', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('9783245a-586c-82ac-81a8-55880b419736', 'campaign_prospects', 'Campaigns', 'campaigns', 'id', 'Prospects', 'prospects', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('97ec19b5-412e-cd05-fd48-55880b6581ea', 'meetings_users', 'Meetings', 'meetings', 'id', 'Users', 'users', 'id', 'meetings_users', 'meeting_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('9856ad88-0065-2354-0375-55880b2b6abc', 'eapm_modified_user', 'Users', 'users', 'id', 'EAPM', 'eapm', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('98fedf98-8eb3-764a-34c3-55880bfb1b24', 'prospect_list_accounts', 'ProspectLists', 'prospect_lists', 'id', 'Accounts', 'accounts', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Accounts', 0, 0),
('9952f7b1-58f0-5481-c7f0-55880bfbc270', 'contacts_users', 'Contacts', 'contacts', 'id', 'Users', 'users', 'id', 'contacts_users', 'contact_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('9cb70b42-06ba-7bc0-1ff1-55880b8f2edf', 'emails_opportunities_rel', 'Emails', 'emails', 'id', 'Opportunities', 'opportunities', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Opportunities', 0, 0),
('9d082d83-8207-5b71-6fe4-55880bc03858', 'prospect_calls', 'Prospects', 'prospects', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('9e7fd126-5b46-4acc-7535-55880be49c5e', 'tasks_assigned_user', 'Users', 'users', 'id', 'Tasks', 'tasks', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9faa961a-8f22-2c03-c8d7-55880be9f526', 'campaign_opportunities', 'Campaigns', 'campaigns', 'id', 'Opportunities', 'opportunities', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a0498451-38ca-6a19-5e5c-55880bfa0e08', 'eapm_created_by', 'Users', 'users', 'id', 'EAPM', 'eapm', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a4c027dc-a5d3-dbef-2902-55880b881b49', 'emails_tasks_rel', 'Emails', 'emails', 'id', 'Tasks', 'tasks', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Tasks', 0, 0),
('a528e117-5293-b89d-4642-55880bfaa769', 'prospect_emails', 'Prospects', 'prospects', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('a690cd5b-b789-59f3-1cc6-55880b914356', 'tasks_notes', 'Tasks', 'tasks', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a7cefe26-fa51-656c-0836-55880b913f81', 'campaign_email_marketing', 'Campaigns', 'campaigns', 'id', 'EmailMarketing', 'email_marketing', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a8396495-cc3c-c1a9-53fd-55880bfbe98e', 'accounts_contacts', 'Accounts', 'accounts', 'id', 'Contacts', 'contacts', 'id', 'accounts_contacts', 'account_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('a86d958e-6ed2-9d37-6ce8-55880b784694', 'eapm_assigned_user', 'Users', 'users', 'id', 'EAPM', 'eapm', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ab4ab9bc-42d5-efbf-e634-55880bd49a8e', 'prospect_campaign_log', 'Prospects', 'prospects', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Prospects', 0, 0),
('add62c6f-e26c-488e-4be6-55880bf71415', 'campaignlog_contact', 'CampaignLog', 'campaign_log', 'related_id', 'Contacts', 'contacts', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('af833ef7-751d-2cec-28ee-55880bfd1768', 'inbound_email_created_by', 'Users', 'users', 'id', 'InboundEmail', 'inbound_email', 'created_by', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('aff86a59-b966-6020-2b44-55880bfc6630', 'campaign_emailman', 'Campaigns', 'campaigns', 'id', 'EmailMan', 'emailman', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b584493b-40b2-9376-d1f2-55880bef8f86', 'inbound_email_modified_user_id', 'Users', 'users', 'id', 'InboundEmail', 'inbound_email', 'modified_user_id', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('b5d99cdd-558d-98d0-496c-55880b8b02a0', 'campaignlog_lead', 'CampaignLog', 'campaign_log', 'related_id', 'Leads', 'leads', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b7850909-98d9-692f-12fd-55880bed9414', 'project_tasks_notes', 'ProjectTask', 'project_task', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('b8219caf-7683-8322-be7c-55880b9f8d70', 'campaign_campaignlog', 'Campaigns', 'campaigns', 'id', 'CampaignLog', 'campaign_log', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bab94af5-45bd-3122-1105-55880b25b166', 'opportunities_contacts', 'Opportunities', 'opportunities', 'id', 'Contacts', 'contacts', 'id', 'opportunities_contacts', 'opportunity_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('bca6e202-2a29-6dc7-1f8f-55880b1d5e99', 'accounts_opportunities', 'Accounts', 'accounts', 'id', 'Opportunities', 'opportunities', 'id', 'accounts_opportunities', 'account_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('bdeac49e-b8ed-83bb-f2d0-55880bed38d3', 'roles_users', 'Roles', 'roles', 'id', 'Users', 'users', 'id', 'roles_users', 'role_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('be08e562-f2f4-60a2-5c18-55880b31829e', 'campaignlog_created_opportunities', 'CampaignLog', 'campaign_log', 'related_id', 'Opportunities', 'opportunities', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bf7c6dfd-41ff-90f9-8ecc-55880b307b51', 'project_tasks_tasks', 'ProjectTask', 'project_task', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('c04a1c6d-e898-d92a-552f-55880bb24810', 'campaign_assigned_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c1a667d1-7e7e-6d02-ddb5-55880b3ffc04', 'oauthkeys_modified_user', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c253b8c5-9525-44bd-b1ee-55880bfe3532', 'emails_users_rel', 'Emails', 'emails', 'id', 'Users', 'users', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Users', 0, 0),
('c3d00684-42d2-efbf-01de-55880b4327eb', 'opportunity_tasks', 'Opportunities', 'opportunities', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('c5a0db73-0ddb-bb85-d173-55880b40fc25', 'project_tasks_meetings', 'ProjectTask', 'project_task', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('c6310411-da7b-ee23-083c-55880badf7fa', 'campaignlog_targeted_users', 'CampaignLog', 'campaign_log', 'target_id', 'Users', 'users', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c78c9434-84ae-ebf7-cda9-55880b795183', 'oauthkeys_created_by', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c874be34-4f5c-53bf-a3c9-55880b23dd30', 'campaign_modified_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cafb87b0-a482-b6cb-2446-55880b967b69', 'accounts_modified_user', 'Users', 'users', 'id', 'Accounts', 'accounts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cc345e7c-fc39-31da-6b83-55880bbe747c', 'saved_search_assigned_user', 'Users', 'users', 'id', 'SavedSearch', 'saved_search', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cc7b5f17-1a35-5d81-6bed-55880be3f7e0', 'documents_accounts', 'Documents', 'documents', 'id', 'Accounts', 'accounts', 'id', 'documents_accounts', 'document_id', 'account_id', 'many-to-many', NULL, NULL, 0, 0),
('cd45855a-1f75-6112-f624-55880ba4a369', 'projects_accounts', 'Project', 'project', 'id', 'Accounts', 'accounts', 'id', 'projects_accounts', 'project_id', 'account_id', 'many-to-many', NULL, NULL, 0, 0),
('cd82da40-65a3-561f-2718-55880b83bd08', 'emails_project_task_rel', 'Emails', 'emails', 'id', 'ProjectTask', 'project_task', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'ProjectTask', 0, 0),
('cdb2d04c-d394-63a4-3113-55880b60b406', 'oauthkeys_assigned_user', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cdc4b12b-d26f-8c73-4355-55880b580139', 'project_tasks_calls', 'ProjectTask', 'project_task', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('ce57a056-d0af-4222-350b-55880bb08535', 'campaignlog_sent_emails', 'CampaignLog', 'campaign_log', 'related_id', 'Emails', 'emails', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d10ecdde-3766-4d51-ce38-55880b941c18', 'acl_roles_actions', 'ACLRoles', 'acl_roles', 'id', 'ACLActions', 'acl_actions', 'id', 'acl_roles_actions', 'role_id', 'action_id', 'many-to-many', NULL, NULL, 0, 0),
('d1eeed72-1bbc-03ee-4a3b-55880be13efe', 'emails_assigned_user', 'Users', 'users', 'id', 'Emails', 'emails', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d2c729a9-2238-fff4-e116-55880b3de56b', 'accounts_created_by', 'Users', 'users', 'id', 'Accounts', 'accounts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d39db8c1-893a-f951-3b55-55880b78b9a5', 'emails_projects_rel', 'Emails', 'emails', 'id', 'Project', 'project', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Project', 0, 0),
('d5ec5290-87ba-49c7-0587-55880bc221d7', 'project_tasks_emails', 'ProjectTask', 'project_task', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('d7e0c3dc-3c61-acb2-26a0-55880bd73250', 'emails_modified_user', 'Users', 'users', 'id', 'Emails', 'emails', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d9ff0f72-6cfc-bb20-070f-55880b629313', 'notes_created_by', 'Users', 'users', 'id', 'Notes', 'notes', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('daebe6cf-e163-3d90-b659-55880bbd8bcd', 'accounts_assigned_user', 'Users', 'users', 'id', 'Accounts', 'accounts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('dbcae9a9-02b1-0824-1184-55880b672b18', 'emails_prospects_rel', 'Emails', 'emails', 'id', 'Prospects', 'prospects', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Prospects', 0, 0),
('de005a3e-3e0d-1d9b-3e8c-55880be8457f', 'emails_created_by', 'Users', 'users', 'id', 'Emails', 'emails', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('de1ace4a-5606-253c-1dfd-55880b80b8b1', 'project_tasks_assigned_user', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e0920025-d4c1-37f5-07c7-55880b802e53', 'opportunities_modified_user', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e0fcbe94-a90e-bd08-dc87-55880bfa2f30', 'documents_bugs', 'Documents', 'documents', 'id', 'Bugs', 'bugs', 'id', 'documents_bugs', 'document_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('e219b610-9865-c1d9-6638-55880bae837f', 'bugs_modified_user', 'Users', 'users', 'id', 'Bugs', 'bugs', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e3478af1-0f24-7bda-ce15-55880b382a06', 'accounts_email_addresses', 'Accounts', 'accounts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Accounts', 0, 0),
('e41f0864-68eb-4f2f-4cd9-55880bc24592', 'emails_notes_rel', 'Emails', 'emails', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e461749a-17d8-c0ab-f6c9-55880b4e7182', 'consumer_tokens', 'OAuthKeys', 'oauth_consumer', 'id', 'OAuthTokens', 'oauth_tokens', 'consumer', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e4c70db3-958a-3d36-ea4d-55880b3dec7d', 'bug_calls', 'Bugs', 'bugs', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('e57e876f-dd81-e5b5-4688-55880bdb3a15', 'acl_roles_users', 'ACLRoles', 'acl_roles', 'id', 'Users', 'users', 'id', 'acl_roles_users', 'role_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('e63a35b0-4b14-cc6d-436a-55880b44d8c0', 'project_tasks_modified_user', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e6b9f5cd-1fd2-c542-41f4-55880b55107b', 'contacts_modified_user', 'Users', 'users', 'id', 'Contacts', 'contacts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e7af59c3-6b62-88dc-20b6-55880ba6b8af', 'projects_bugs', 'Project', 'project', 'id', 'Bugs', 'bugs', 'id', 'projects_bugs', 'project_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('e7e2f343-c146-ebd2-fea1-55880bd2d754', 'opportunities_created_by', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ea074def-2f95-368a-3680-55880b72aa1c', 'bugs_created_by', 'Users', 'users', 'id', 'Bugs', 'bugs', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ea38c110-b6a4-b44b-4042-55880bdc1073', 'emails_contacts_rel', 'Emails', 'emails', 'id', 'Contacts', 'contacts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Contacts', 0, 0),
('eb6f5acb-7256-d167-5697-55880b6cb0bf', 'accounts_email_addresses_primary', 'Accounts', 'accounts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('ec6803a3-bdb3-6a6f-f0fc-55880b786516', 'oauthtokens_assigned_user', 'Users', 'users', 'id', 'OAuthTokens', 'oauth_tokens', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ecea0fe1-b29e-a4b5-8976-55880bf7182d', 'contacts_email_addresses_primary', 'Contacts', 'contacts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('ee07a0b2-1d45-5ef6-527c-55880b6043a4', 'opportunities_assigned_user', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ee64b38d-883b-f68b-8b72-55880bde67e9', 'project_tasks_created_by', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ee7e5e75-765c-87c5-3ece-55880bbeb192', 'contacts_created_by', 'Users', 'users', 'id', 'Contacts', 'contacts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f02dacd2-ea0c-3ba4-78f0-55880b1016f0', 'bugs_assigned_user', 'Users', 'users', 'id', 'Bugs', 'bugs', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f05ef932-90c0-ef57-81ca-55880b521683', 'emails_accounts_rel', 'Emails', 'emails', 'id', 'Accounts', 'accounts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Accounts', 0, 0),
('f1b12cae-80a4-9b01-5098-55880bf8dca9', 'notes_assigned_user', 'Users', 'users', 'id', 'Notes', 'notes', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f393e5bf-c617-7f2b-2b32-55880b1759e7', 'member_accounts', 'Accounts', 'accounts', 'id', 'Accounts', 'accounts', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f423d366-3109-14b6-3501-55880b42dd52', 'opportunity_calls', 'Opportunities', 'opportunities', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('f9810c8e-4ceb-9716-205e-55880bf50607', 'account_tasks', 'Accounts', 'accounts', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `releases`
--

CREATE TABLE IF NOT EXISTS `releases` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_order` int(4) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_releases` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `modules` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roles_modules`
--

CREATE TABLE IF NOT EXISTS `roles_modules` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `module_id` varchar(36) DEFAULT NULL,
  `allow` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_module_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roles_users`
--

CREATE TABLE IF NOT EXISTS `roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ru_role_id` (`role_id`),
  KEY `idx_ru_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `saved_search`
--

CREATE TABLE IF NOT EXISTS `saved_search` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `search_module` varchar(150) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `idx_desc` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `schedulers`
--

CREATE TABLE IF NOT EXISTS `schedulers` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `date_time_start` datetime DEFAULT NULL,
  `date_time_end` datetime DEFAULT NULL,
  `job_interval` varchar(100) DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `catch_up` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_schedule` (`date_time_start`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `schedulers`
--

INSERT INTO `schedulers` (`id`, `deleted`, `date_entered`, `date_modified`, `created_by`, `modified_user_id`, `name`, `job`, `date_time_start`, `date_time_end`, `job_interval`, `time_from`, `time_to`, `last_run`, `status`, `catch_up`) VALUES
('1ea9028e-dcfa-8c87-853b-55880b64e239', 0, '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '1', 'Removal of documents from filesystem', 'function::removeDocumentsFromFS', '2012-01-01 16:15:01', '2030-12-31 23:59:59', '0::3::1::*::*', NULL, NULL, NULL, 'Active', 0),
('834e07c4-b89c-deec-925e-55880bf67dec', 0, '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '1', 'Prune SugarFeed Tables', 'function::trimSugarFeeds', '2005-01-01 13:00:01', '2020-12-31 23:59:59', '0::2::1::*::*', NULL, NULL, NULL, 'Active', 1),
('c39f7405-3fc5-edbc-236d-55880b6122cb', 0, '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '1', 'Prune Tracker Tables', 'function::trimTracker', '2005-01-01 14:30:01', '2020-12-31 23:59:59', '0::2::1::*::*', NULL, NULL, NULL, 'Active', 1),
('d16a7c98-2b1c-58cb-c54b-55880bffa0bb', 0, '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '1', 'Check Inbound Mailboxes', 'function::pollMonitoredInboxes', '2005-01-01 19:15:01', '2020-12-31 23:59:59', '*::*::*::*::*', NULL, NULL, NULL, 'Active', 0),
('d783b42c-8a69-8ee6-e5ae-55880bf897c6', 0, '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '1', 'Run Nightly Process Bounced Campaign Emails', 'function::pollMonitoredInboxesForBouncedCampaignEmails', '2005-01-01 07:30:01', '2020-12-31 23:59:59', '0::2-6::*::*::*', NULL, NULL, NULL, 'Active', 1),
('dd899d26-9e4a-dd49-5ae1-55880b35f195', 0, '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '1', 'Run Nightly Mass Email Campaigns', 'function::runMassEmailCampaign', '2005-01-01 10:45:01', '2020-12-31 23:59:59', '0::2-6::*::*::*', NULL, NULL, NULL, 'Active', 1),
('e3ab25cf-2728-c76d-2d0f-55880b8f7ec8', 0, '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '1', 'Prune Database on 1st of Month', 'function::pruneDatabase', '2005-01-01 15:45:01', '2020-12-31 23:59:59', '0::4::1::*::*', NULL, NULL, NULL, 'Inactive', 0),
('e9ce7d7a-3910-7689-04c8-55880b1b569d', 0, '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '1', 'Run Email Reminder Notifications', 'function::sendEmailReminders', '2008-01-01 08:30:01', '2020-12-31 23:59:59', '*::*::*::*::*', NULL, NULL, NULL, 'Active', 0),
('eff1c0a8-67a8-5c39-80ed-55880b0d4965', 0, '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '1', 'Clean Jobs Queue', 'function::cleanJobQueue', '2012-01-01 06:15:01', '2030-12-31 23:59:59', '0::5::*::*::*', NULL, NULL, NULL, 'Active', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sugarfeed`
--

CREATE TABLE IF NOT EXISTS `sugarfeed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `related_module` varchar(100) DEFAULT NULL,
  `related_id` char(36) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sgrfeed_date` (`date_entered`,`deleted`),
  KEY `idx_sgrfeed_rmod_rid_date` (`related_module`,`related_id`,`date_entered`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `date_due_flag` tinyint(1) DEFAULT '0',
  `date_due` datetime DEFAULT NULL,
  `date_start_flag` tinyint(1) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tsk_name` (`name`),
  KEY `idx_task_con_del` (`contact_id`,`deleted`),
  KEY `idx_task_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_task_assigned` (`assigned_user_id`),
  KEY `idx_task_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tracker`
--

CREATE TABLE IF NOT EXISTS `tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_id` char(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `item_id` varchar(36) DEFAULT NULL,
  `item_summary` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `session_id` varchar(36) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tracker_iid` (`item_id`),
  KEY `idx_tracker_userid_vis_id` (`user_id`,`visible`,`id`),
  KEY `idx_tracker_userid_itemid_vis` (`user_id`,`item_id`,`visible`),
  KEY `idx_tracker_monitor_id` (`monitor_id`),
  KEY `idx_tracker_date_modified` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `upgrade_history`
--

CREATE TABLE IF NOT EXISTS `upgrade_history` (
  `id` char(36) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `id_name` varchar(255) DEFAULT NULL,
  `manifest` longtext,
  `date_entered` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `upgrade_history_md5_uk` (`md5sum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` char(36) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `user_hash` varchar(255) DEFAULT NULL,
  `system_generated_password` tinyint(1) DEFAULT NULL,
  `pwd_last_changed` datetime DEFAULT NULL,
  `authenticate_id` varchar(100) DEFAULT NULL,
  `sugar_login` tinyint(1) DEFAULT '1',
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `external_auth_only` tinyint(1) DEFAULT '0',
  `receive_notifications` tinyint(1) DEFAULT '1',
  `description` text,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phone_home` varchar(50) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `phone_other` varchar(50) DEFAULT NULL,
  `phone_fax` varchar(50) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `address_street` varchar(150) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `portal_only` tinyint(1) DEFAULT '0',
  `show_on_employees` tinyint(1) DEFAULT '1',
  `employee_status` varchar(100) DEFAULT NULL,
  `messenger_id` varchar(100) DEFAULT NULL,
  `messenger_type` varchar(100) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_name` (`user_name`,`is_group`,`status`,`last_name`,`first_name`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_hash`, `system_generated_password`, `pwd_last_changed`, `authenticate_id`, `sugar_login`, `first_name`, `last_name`, `is_admin`, `external_auth_only`, `receive_notifications`, `description`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `title`, `department`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `status`, `address_street`, `address_city`, `address_state`, `address_country`, `address_postalcode`, `deleted`, `portal_only`, `show_on_employees`, `employee_status`, `messenger_id`, `messenger_type`, `reports_to_id`, `is_group`) VALUES
('1', 'admin', '$1$lJpVAgjf$SWewFp3xx7G3ycywi6bzK1', 0, NULL, NULL, 1, NULL, 'Administrator', 1, 0, 1, NULL, '2015-06-22 13:20:10', '2015-06-22 13:22:06', '1', '', 'Administrator', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'Active', NULL, NULL, '', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users_feeds`
--

CREATE TABLE IF NOT EXISTS `users_feeds` (
  `user_id` varchar(36) DEFAULT NULL,
  `feed_id` varchar(36) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_ud_user_id` (`user_id`,`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users_last_import`
--

CREATE TABLE IF NOT EXISTS `users_last_import` (
  `id` char(36) NOT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `import_module` varchar(36) DEFAULT NULL,
  `bean_type` varchar(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users_password_link`
--

CREATE TABLE IF NOT EXISTS `users_password_link` (
  `id` char(36) NOT NULL,
  `username` varchar(36) DEFAULT NULL,
  `date_generated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users_signatures`
--

CREATE TABLE IF NOT EXISTS `users_signatures` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `signature` text,
  `signature_html` text,
  PRIMARY KEY (`id`),
  KEY `idx_usersig_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_preferences`
--

CREATE TABLE IF NOT EXISTS `user_preferences` (
  `id` char(36) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_userprefnamecat` (`assigned_user_id`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `user_preferences`
--

INSERT INTO `user_preferences` (`id`, `category`, `deleted`, `date_entered`, `date_modified`, `assigned_user_id`, `contents`) VALUES
('10a00b0b-fc95-9c8c-200a-55880b063679', 'Home2_OPPORTUNITY', 0, '2015-06-22 13:22:06', '2015-06-22 13:22:06', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('115b2572-f634-49bd-3d78-55880b8d1bc0', 'Home2_LEAD', 0, '2015-06-22 13:22:06', '2015-06-22 13:22:06', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('197cf1a7-d866-881d-3bad-55880ba4f7da', 'Home2_SUGARFEED', 0, '2015-06-22 13:22:06', '2015-06-22 13:22:06', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('70640ff6-2d3f-55df-49dc-55880bcf6b52', 'ETag', 0, '2015-06-22 13:22:06', '2015-06-22 13:22:06', '1', 'YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),
('9342092d-540b-94ee-d69e-55880bac9bb4', 'Home2_ACCOUNT', 0, '2015-06-22 13:22:06', '2015-06-22 13:22:06', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('b34a4943-6c2f-155b-7983-55880b0e434f', 'global', 0, '2015-06-22 13:20:10', '2015-06-22 13:22:06', '1', 'YToyNzp7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MzY6ImIzMjQ2YWEwLTJhMzktMmQ5NS02YmMyLTU1ODgwYjU5YjdkOCI7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWdhcjUiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6MTgwMDtzOjEyOiJtYWlsbWVyZ2Vfb24iO3M6Mjoib24iO3M6ODoidGltZXpvbmUiO3M6MTU6IkV1cm9wZS9CdWRhcGVzdCI7czoxNjoic3dhcF9sYXN0X3ZpZXdlZCI7czowOiIiO3M6MTQ6InN3YXBfc2hvcnRjdXRzIjtzOjA6IiI7czoxOToibmF2aWdhdGlvbl9wYXJhZGlnbSI7czoyOiJnbSI7czoxMzoic3VicGFuZWxfdGFicyI7czowOiIiO3M6MTQ6Im1vZHVsZV9mYXZpY29uIjtzOjA6IiI7czo5OiJoaWRlX3RhYnMiO2E6MDp7fXM6MTE6InJlbW92ZV90YWJzIjthOjA6e31zOjc6Im5vX29wcHMiO3M6Mzoib2ZmIjtzOjE5OiJlbWFpbF9yZW1pbmRlcl90aW1lIjtpOi0xO3M6MjoidXQiO3M6MToiMSI7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjU6ImRhdGVmIjtzOjU6Im0vZC9ZIjtzOjU6InRpbWVmIjtzOjQ6Img6aWEiO3M6MjY6ImRlZmF1bHRfbG9jYWxlX25hbWVfZm9ybWF0IjtzOjU6InMgZiBsIjtzOjE0OiJ1c2VfcmVhbF9uYW1lcyI7czoyOiJvbiI7czoxNzoibWFpbF9zbXRwYXV0aF9yZXEiO3M6MDoiIjtzOjEyOiJtYWlsX3NtdHBzc2wiO2k6MDtzOjE3OiJlbWFpbF9zaG93X2NvdW50cyI7aTowO3M6MTk6InRoZW1lX2N1cnJlbnRfZ3JvdXAiO3M6MzoiQWxsIjt9'),
('db3413cf-c2a1-cbb1-01de-55880b6dab2a', 'Home', 0, '2015-06-22 13:22:06', '2015-06-22 13:22:13', '1', 'YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6ImI2MTA1OTc3LWIzMmYtZDA5My1iNzAyLTU1ODgwYmNhNjk5YyI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6ImI4ZjlmYjE0LWY4OTktZmJiMC1iZWJiLTU1ODgwYmYyM2ZlMSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImI5N2E4ZWQxLTFhZDctMjFiMy0zYTRlLTU1ODgwYmY5MmIwNyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImI5ZjI1MzY1LTVmZjgtNzBjNC01Y2U5LTU1ODgwYmI2ZmJmNSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiYmE5MGQ1ZDEtMTk1Yi04NDBkLTM5NTAtNTU4ODBiOWM2NGI3IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiYmI0MWY4OGUtYjk5ZC03NTZmLWUyZWQtNTU4ODBiNDc1YzQ4IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MTtzOjM2OiJiOGY5ZmIxNC1mODk5LWZiYjAtYmViYi01NTg4MGJmMjNmZTEiO2k6MjtzOjM2OiJiOTdhOGVkMS0xYWQ3LTIxYjMtM2E0ZS01NTg4MGJmOTJiMDciO2k6MztzOjM2OiJiOWYyNTM2NS01ZmY4LTcwYzQtNWNlOS01NTg4MGJiNmZiZjUiO2k6NDtzOjM2OiJiYTkwZDVkMS0xOTViLTg0MGQtMzk1MC01NTg4MGI5YzY0YjciO2k6NTtzOjM2OiJiYjQxZjg4ZS1iOTlkLTc1NmYtZTJlZC01NTg4MGI0NzVjNDgiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6ImI2MTA1OTc3LWIzMmYtZDA5My1iNzAyLTU1ODgwYmNhNjk5YyI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIyIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),
('e4f34ef9-1d32-616c-ea10-55880be1debf', 'Home2_CALL', 0, '2015-06-22 13:22:06', '2015-06-22 13:22:06', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('ed06dc30-420c-f23e-970b-55880b71b548', 'Home2_MEETING', 0, '2015-06-22 13:22:06', '2015-06-22 13:22:06', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ==');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vcals`
--

CREATE TABLE IF NOT EXISTS `vcals` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `idx_vcal` (`type`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `versions`
--

CREATE TABLE IF NOT EXISTS `versions` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_version` varchar(255) DEFAULT NULL,
  `db_version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_version` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `versions`
--

INSERT INTO `versions` (`id`, `deleted`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `file_version`, `db_version`) VALUES
('13530db4-6c7c-3d95-e38b-55880b628410', 0, '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '1', 'Rebuild Extensions', '4.0.0', '4.0.0'),
('7fca00e8-bb62-953f-3b5c-55880b08bc9e', 0, '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '1', 'Chart Data Cache', '3.5.1', '3.5.1'),
('cc27d5d9-a63c-63f1-3fce-55880b2b763d', 0, '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '1', 'htaccess', '3.5.1', '3.5.1'),
('dff72d2d-5c57-3e3e-8274-55880bd01775', 0, '2015-06-22 13:20:10', '2015-06-22 13:20:10', '1', '1', 'Rebuild Relationships', '4.0.0', '4.0.0');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
