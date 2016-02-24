-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Mar 23 Février 2016 à 20:37
-- Version du serveur: 5.1.54
-- Version de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `cesb_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `centraleachat`
--

CREATE TABLE IF NOT EXISTS `centraleachat` (
  `CODECENTRALE` char(32) NOT NULL,
  `NOM` char(32) DEFAULT NULL,
  PRIMARY KEY (`CODECENTRALE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `centraleachat`
--

INSERT INTO `centraleachat` (`CODECENTRALE`, `NOM`) VALUES
('CENTRALE_SORBONNE', 'Centrale d''achat pour la Sorbonn');

-- --------------------------------------------------------

--
-- Structure de la table `compose`
--

CREATE TABLE IF NOT EXISTS `compose` (
  `CODEING` char(5) NOT NULL,
  `CODEPRODUIT` char(6) NOT NULL,
  `NBRINGREDIENT` int(2) DEFAULT NULL,
  PRIMARY KEY (`CODEING`,`CODEPRODUIT`),
  KEY `I_FK_COMPOSE_PRODUIT` (`CODEPRODUIT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `compose`
--

INSERT INTO `compose` (`CODEING`, `CODEPRODUIT`, `NBRINGREDIENT`) VALUES
('CAROT', 'SALCAR', 50);

-- --------------------------------------------------------

--
-- Structure de la table `contient`
--

CREATE TABLE IF NOT EXISTS `contient` (
  `NUMVENTE` int(2) NOT NULL,
  `CODEPRODUIT` char(5) NOT NULL,
  `NOMBRE` int(5) NOT NULL,
  PRIMARY KEY (`NUMVENTE`,`CODEPRODUIT`),
  KEY `I_FK_CONTIENT_VENTE` (`NUMVENTE`),
  KEY `I_FK_CONTIENT_PRODUIT` (`CODEPRODUIT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `contient`
--

INSERT INTO `contient` (`NUMVENTE`, `CODEPRODUIT`, `NOMBRE`) VALUES
(1, 'COLA', 1);

-- --------------------------------------------------------

--
-- Structure de la table `familleproduit`
--

CREATE TABLE IF NOT EXISTS `familleproduit` (
  `CODEFAMILLE` char(32) NOT NULL,
  `LIBELLEFAMILLE` char(32) DEFAULT NULL,
  PRIMARY KEY (`CODEFAMILLE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `familleproduit`
--

INSERT INTO `familleproduit` (`CODEFAMILLE`, `LIBELLEFAMILLE`) VALUES
('BOISS', 'Boisson'),
('SAND', 'Sandwich');

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE IF NOT EXISTS `ingredient` (
  `CODEING` char(5) NOT NULL,
  `NOM` char(32) DEFAULT NULL,
  `MESURE` char(32) DEFAULT NULL,
  PRIMARY KEY (`CODEING`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ingredient`
--

INSERT INTO `ingredient` (`CODEING`, `NOM`, `MESURE`) VALUES
('SALAD', 'Salade', 'Piece'),
('CAROT', 'Carottes', 'Gramme'),
('COLA', 'Soda Cola', 'Cl');

-- --------------------------------------------------------

--
-- Structure de la table `magasin`
--

CREATE TABLE IF NOT EXISTS `magasin` (
  `CODEMAG` char(32) NOT NULL,
  `NOM` char(32) DEFAULT NULL,
  `ADRESSE` char(64) DEFAULT NULL,
  `NUMCOMPTE` int(2) DEFAULT NULL,
  `SOLDECOMPTE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CODEMAG`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `magasin`
--

INSERT INTO `magasin` (`CODEMAG`, `NOM`, `ADRESSE`, `NUMCOMPTE`, `SOLDECOMPTE`) VALUES
('SB01', 'Cafétéria de la Sorbonne', '90 rue de Tolbiac 75013 Paris', 1, 9000);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE IF NOT EXISTS `personne` (
  `MATRICULE` int(2) NOT NULL,
  `CODEMAG` char(32) NOT NULL,
  `CODETYPE` char(32) NOT NULL,
  `NOM` char(32) DEFAULT NULL,
  `PRENOM` char(32) DEFAULT NULL,
  `NUMTEL` bigint(10) DEFAULT NULL,
  `LOGIN` char(32) DEFAULT NULL,
  `MDP` char(32) DEFAULT NULL,
  PRIMARY KEY (`MATRICULE`),
  KEY `I_FK_PERSONNE_MAGASIN` (`CODEMAG`),
  KEY `I_FK_PERSONNE_TYPE` (`CODETYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `personne`
--

INSERT INTO `personne` (`MATRICULE`, `CODEMAG`, `CODETYPE`, `NOM`, `PRENOM`, `NUMTEL`, `LOGIN`, `MDP`) VALUES
(1, 'SB01', 'ADM', 'AdmPisu', 'Em', 146668342, 'admpi', 'admpi'),
(2, 'SB01', 'MEM', 'MemPisu', 'Em', 123456789, 'mempi', 'mempi');

-- --------------------------------------------------------

--
-- Structure de la table `possede`
--

CREATE TABLE IF NOT EXISTS `possede` (
  `CODEMAG` char(32) NOT NULL,
  `CODEING` char(5) NOT NULL,
  `NBRENSTOCK` int(2) DEFAULT NULL,
  PRIMARY KEY (`CODEMAG`,`CODEING`),
  KEY `I_FK_POSSEDE_MAGASIN` (`CODEMAG`),
  KEY `fk_ingredient` (`CODEING`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `possede`
--

INSERT INTO `possede` (`CODEMAG`, `CODEING`, `NBRENSTOCK`) VALUES
('SB01', 'SALAD', 200),
('SB01', 'CAROT', 5000),
('SB01', 'COLA', 200);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `CODEPRODUIT` char(6) NOT NULL,
  `CODEFAMILLE` char(32) NOT NULL,
  `NOM` char(32) DEFAULT NULL,
  `PRIX` int(2) DEFAULT NULL,
  PRIMARY KEY (`CODEPRODUIT`),
  KEY `I_FK_PRODUIT_FAMILLEPRODUIT` (`CODEFAMILLE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`CODEPRODUIT`, `CODEFAMILLE`, `NOM`, `PRIX`) VALUES
('COLA', 'BOISS', 'Soda Cola', 1),
('SALCAR', 'SAND', 'Sandwich salade carottes', 3);

-- --------------------------------------------------------

--
-- Structure de la table `propose`
--

CREATE TABLE IF NOT EXISTS `propose` (
  `CODECENTRALE` char(32) NOT NULL,
  `CODEPRODUIT` int(2) NOT NULL,
  `PRIXACHAT` int(2) DEFAULT NULL,
  PRIMARY KEY (`CODECENTRALE`,`CODEPRODUIT`),
  KEY `I_FK_PROPOSE_CENTRALEACHAT` (`CODECENTRALE`),
  KEY `I_FK_PROPOSE_PRODUIT` (`CODEPRODUIT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `propose`
--

INSERT INTO `propose` (`CODECENTRALE`, `CODEPRODUIT`, `PRIXACHAT`) VALUES
('CENTRALE_SORBONNE', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `CODETYPE` char(32) NOT NULL,
  `LIBELLETYPE` char(32) DEFAULT NULL,
  PRIMARY KEY (`CODETYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `type`
--

INSERT INTO `type` (`CODETYPE`, `LIBELLETYPE`) VALUES
('ADM', 'Admin'),
('MEM', 'Membre');

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE IF NOT EXISTS `vente` (
  `NUMVENTE` int(2) NOT NULL,
  `MATRICULE` int(2) NOT NULL,
  `DATEVENTE` char(32) DEFAULT NULL,
  `HEUREVENTE` char(32) DEFAULT NULL,
  PRIMARY KEY (`NUMVENTE`),
  KEY `I_FK_VENTE_PERSONNE` (`MATRICULE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vente`
--

INSERT INTO `vente` (`NUMVENTE`, `MATRICULE`, `DATEVENTE`, `HEUREVENTE`) VALUES
(1, 2, '23/02/2016', '18:49');
