-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 25 mai 2023 à 10:17
-- Version du serveur :  5.7.19-log
-- Version de PHP : 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `greta_blog_v1_0`
--

-- --------------------------------------------------------

--
-- Structure de la table `belongsto`
--

DROP TABLE IF EXISTS `belongsto`;
CREATE TABLE IF NOT EXISTS `belongsto` (
  `id` int(11) NOT NULL,
  `id_Post` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_Post`),
  KEY `Belongsto_Post0_FK` (`id_Post`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `belongsto`
--

INSERT INTO `belongsto` (`id`, `id_Post`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `id_Category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Category_Category0_FK` (`id_Category`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `id_Category`) VALUES
(1, 'Surf', 'surf', NULL),
(2, 'Découvrir', 'decouvrir', NULL),
(3, 'Niragagua', 'nicaragua', 2);

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` tinytext NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `id_User` int(11) NOT NULL,
  `id_Post` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Comment_User_FK` (`id_User`),
  KEY `Comment_Post0_FK` (`id_Post`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `content`, `createdAt`, `updatedAt`, `id_User`, `id_Post`) VALUES
(1, 'Superbe article !', '2023-05-24 14:55:22', '2023-05-24 14:55:51', 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `liker`
--

DROP TABLE IF EXISTS `liker`;
CREATE TABLE IF NOT EXISTS `liker` (
  `id` int(11) NOT NULL,
  `id_Post` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_Post`),
  KEY `Liker_Post0_FK` (`id_Post`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
CREATE TABLE IF NOT EXISTS `newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `paramsite`
--

DROP TABLE IF EXISTS `paramsite`;
CREATE TABLE IF NOT EXISTS `paramsite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteName` varchar(150) NOT NULL,
  `slogan` varchar(150) NOT NULL,
  `contactAddress` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `id_User` int(11) NOT NULL,
  `id_Category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Post_User_FK` (`id_User`),
  KEY `Post_Category0_FK` (`id_Category`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `title`, `slug`, `content`, `image`, `createdAt`, `updatedAt`, `id_User`, `id_Category`) VALUES
(1, '12 RAISONS DE PARTIR SURFER AU NICARAGUA', '12-raisons-de-partir-surfer-au-nicaragua', 'Le Nicaragua vivait des heures sombres alors que son voisin, le Costa Rica et son image de destination touristique à la mode, se transformait en refuge pour retraités américains et européens. Depuis, son image de pays troublé lui a collé à la peau, laissant ses plages intactes et ses vagues vierges. Depuis la fin des années 90, le pays est resté figé et il commence seulement à se réveiller. Avec sa côte, considérée comme l’une des plus consistante au monde, c’est aujourd’hui un paradis pour les surfeurs. Partir surfer au Nicaragua, c’est partir dans un lieu hors du temps.', 'IMG_3571.jpg', '2023-05-24 14:20:43', NULL, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `slug` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tag`
--

INSERT INTO `tag` (`id`, `name`, `slug`) VALUES
(1, 'Voyage', 'voyage'),
(2, 'Nicaragua', 'nicaragua');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `displayName` varchar(30) NOT NULL,
  `roles` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `isValid` tinyint(1) NOT NULL,
  `email` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_AK` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `displayName`, `roles`, `password`, `isValid`, `email`) VALUES
(1, 'PhG', '{\"MODERATEUR\"}', 'gh45fgh4fsh54fg5h4f5gh4sf5gh4fg5h45sfjh4f5g54n', 1, 'phgiraud@cogitium.com'),
(2, 'Joe', '{\"USER\"}', 'dfg41e5fg4er5g46er5g46er5ge5rg45r', 1, 'joe@mail.com');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `belongsto`
--
ALTER TABLE `belongsto`
  ADD CONSTRAINT `Belongsto_Post0_FK` FOREIGN KEY (`id_Post`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `Belongsto_Tag_FK` FOREIGN KEY (`id`) REFERENCES `tag` (`id`);

--
-- Contraintes pour la table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `Category_Category0_FK` FOREIGN KEY (`id_Category`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `Comment_Post0_FK` FOREIGN KEY (`id_Post`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `Comment_User_FK` FOREIGN KEY (`id_User`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `liker`
--
ALTER TABLE `liker`
  ADD CONSTRAINT `Liker_Post0_FK` FOREIGN KEY (`id_Post`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `Liker_User_FK` FOREIGN KEY (`id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `Post_Category0_FK` FOREIGN KEY (`id_Category`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `Post_User_FK` FOREIGN KEY (`id_User`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
