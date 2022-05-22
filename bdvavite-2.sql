-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : dim. 22 mai 2022 à 21:16
-- Version du serveur :  5.7.34
-- Version de PHP : 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bdvavite`
--

-- --------------------------------------------------------

--
-- Structure de la table `transport`
--

CREATE TABLE `transport` (
  `id` int(11) NOT NULL,
  `date` varchar(12) NOT NULL,
  `heure` varchar(5) NOT NULL,
  `typeOffre` varchar(12) NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `transport`
--

INSERT INTO `transport` (`id`, `date`, `heure`, `typeOffre`, `idUser`) VALUES
(3, '15/05/2022', '07h00', 'Départ', 1),
(4, '15/05/2022', '17h00', 'Arrivée', 1),
(5, '13/08/2022', '18:00', 'Arrivée', 1),
(6, '10/06/2022', '12:00', 'Départ', 1),
(7, '12/06/2022', '11:30', 'Départ', 1),
(8, '13/06/2022', '08:00', 'Arrivée', 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUser` int(11) NOT NULL,
  `nomUser` varchar(30) NOT NULL,
  `prenUser` varchar(20) NOT NULL,
  `mailUser` varchar(20) NOT NULL,
  `telUser` varchar(14) NOT NULL,
  `passUser` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUser`, `nomUser`, `prenUser`, `mailUser`, `telUser`, `passUser`) VALUES
(1, 'JORGE', 'Marcel', 'jmarcel@jemail.com', '0690457979', 'testgibson'),
(2, 'MALIUS', 'Bernadette', 'maliusb@jemail.com', '0690123456', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_transport_user` (`idUser`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `transport`
--
ALTER TABLE `transport`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `transport`
--
ALTER TABLE `transport`
  ADD CONSTRAINT `fk_transport_user` FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`idUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
