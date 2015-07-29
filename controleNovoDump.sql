-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 03, 2015 at 08:09 PM
-- Server version: 5.5.43
-- PHP Version: 5.3.10-1ubuntu3.18

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `controleNovo`
--

-- --------------------------------------------------------

--
-- Table structure for table `alteracao`
--

CREATE TABLE IF NOT EXISTS `alteracao` (
  `id_alteracao` int(2) NOT NULL AUTO_INCREMENT,
  `id_militar` int(5) DEFAULT NULL,
  `id_situacao` int(3) DEFAULT NULL,
  `id_om` int(3) DEFAULT NULL,
  `data_inicio` decimal(10,0) DEFAULT NULL,
  `data_fim` decimal(10,0) DEFAULT NULL,
  `documento` varchar(50) DEFAULT NULL,
  `om_atual` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_alteracao`),
  KEY `id_militar` (`id_militar`),
  KEY `id_situacao` (`id_situacao`),
  KEY `id_om` (`id_om`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `especialidade`
--

CREATE TABLE IF NOT EXISTS `especialidade` (
  `id_especialidade` int(2) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  `tipo_de_militar` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_especialidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `especialidade`
--

INSERT INTO `especialidade` (`id_especialidade`, `descricao`, `tipo_de_militar`) VALUES
(1, 'OMT - Oficial Médico Temporário', 'Militar Temporário'),
(2, 'ODT - Oficial Dentista Temporário', 'Militar Temporário'),
(3, 'OVT - Oficial Veterinário Temporário', 'Militar Temporário'),
(4, 'OFT - Oficial Farmacêutico Temporário', 'Militar Temporário'),
(5, 'OCT - Oficial Combatente Temporário', 'Militar Temporário'),
(6, 'OIT - Ofiical Itendente Temporário ', 'Militar Temporário'),
(7, 'OMC - Oficial Médico Temporário', 'Militar de Carreira'),
(8, 'ODC - Oficial Dentista Temporário', 'Militar de Carreira'),
(9, 'OVC - Oficial Veterinário Temporário', 'Militar de Carreira'),
(10, 'OFC - Oficial Farmacêutico Temporário', 'Militar de Carreira'),
(11, 'OCC - Oficial Combatente Temporário', 'Militar de Carreira'),
(12, 'OIC - Ofiical Itendente Temporário ', 'Militar de Carreira'),
(13, 'STT - Sargento Técnico Temporário', 'Militar Temporário');

-- --------------------------------------------------------

--
-- Table structure for table `hierarquia`
--

CREATE TABLE IF NOT EXISTS `hierarquia` (
  `id_hierarquia` int(3) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_hierarquia`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `hierarquia`
--

INSERT INTO `hierarquia` (`id_hierarquia`, `descricao`) VALUES
(1, 'General de Exército Inativo'),
(2, 'General de Exército'),
(3, 'General de Divisão'),
(4, 'General de Brigada'),
(5, 'Coronel'),
(6, 'Tenente Coronel'),
(7, 'Major'),
(8, 'Capitão'),
(9, '1º Tenente'),
(10, '2º Tenente'),
(11, 'Aspirante'),
(18, 'Sub Tenente'),
(19, '1º Sargento'),
(20, '2º Sargento'),
(21, '3º Sargento'),
(22, 'Cabo Engajado'),
(27, 'Soldado do Exército'),
(28, 'Soldado Recruta'),
(30, 'Taifeiro 1ª Classe');

-- --------------------------------------------------------

--
-- Table structure for table `militar`
--

CREATE TABLE IF NOT EXISTS `militar` (
  `id_militar` int(5) NOT NULL AUTO_INCREMENT,
  `id_hierarquia` int(3) DEFAULT NULL,
  `id_especialidade` int(3) DEFAULT NULL,
  `id_usuário` int(5) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `identidade` varchar(20) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `tempo_sv_anterior` decimal(10,0) DEFAULT NULL,
  `observacao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_militar`),
  KEY `id_hierarquia` (`id_hierarquia`),
  KEY `id_especialidade` (`id_especialidade`),
  KEY `id_usuário` (`id_usuário`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `militar`
--

INSERT INTO `militar` (`id_militar`, `id_hierarquia`, `id_especialidade`, `id_usuário`, `nome`, `data_nascimento`, `identidade`, `cpf`, `telefone`, `tempo_sv_anterior`, `observacao`) VALUES
(10, 2, 11, NULL, 'Celson Da Silva Rodrigues', '0000-00-00', '6652745', '04135338402', '92214497', 122844600, 'Tempo de serviço anterior funcionário público'),
(11, 2, 11, NULL, 'Celson Da Silva Rodrigues', '0000-00-00', '6652745', '04135338402', '92214497', 122844600, 'Tempo de serviço anterior funcionário público');

-- --------------------------------------------------------

--
-- Table structure for table `om`
--

CREATE TABLE IF NOT EXISTS `om` (
  `id_om` int(3) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `uf` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_om`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `om`
--

INSERT INTO `om` (`id_om`, `nome`, `cidade`, `uf`) VALUES
(1, '10ª Cia E Cmb', 'São Bento do Una', 'PE'),
(2, '10º Esqd C Mec', 'Recife', 'PE'),
(3, '14ª Bia AAAe', 'Olinda', 'PE'),
(4, '14º B Log', 'Recife', 'PE'),
(5, '14º BI Mtz', 'Jaboatão dos Guararapes', 'PE'),
(6, '3ª DL', 'Olinda', 'PE'),
(7, '4º B Com', 'Recife', 'PE'),
(8, '4º BPE', 'Recife', 'PE'),
(9, '71º BI Mtz', 'Garanhuns', 'PE'),
(10, '72º BI Mtz', 'Petrolina', 'PE'),
(11, '7ª Cia Com', 'Recife', 'PE'),
(12, '7º D Sup', 'Recife', 'PE'),
(13, '7º GAC', 'Olinda', 'PE'),
(14, 'Cia C/10ª Bda Inf Mtz', 'Recife', 'PE'),
(15, 'Cia C/7ª RM', 'Recife', 'PE'),
(16, 'Cia C/CMNE', 'Recife', 'PE'),
(17, 'CIMNC', 'Pau d´Alho', 'PE'),
(18, 'Cmdo CMNE', 'Recife', 'PE'),
(19, 'CMR', 'Recife', 'PE'),
(20, 'CPOR/R', 'Recife', 'PE'),
(21, 'HMAR', 'Recife', 'PE'),
(22, 'HMAR', 'São Bento do Una', 'PE'),
(23, 'Pq R Mnt/7', 'Recife', 'PE'),
(24, '15º BI Mtz', 'João Pessoa', 'PB'),
(25, '16º R C Mec', 'Bayeux', 'PB'),
(26, '31º BI Mtz', 'Campina Grande', 'PB'),
(27, 'Cia C/1º Gpt E', 'João Pessoa', 'PB'),
(28, 'Cmdo 1º Gpt E', 'João Pessoa', 'PB'),
(29, 'H Gu JP', 'João Pessoa', 'PB'),
(30, 'H Gu N', 'Natal', 'RN'),
(31, 'HMAR', 'Recife', 'RN'),
(32, '16º BI Mtz', 'Natal', 'RN'),
(33, '17º GAC', 'Natal', 'RN'),
(34, '1º BEC', 'Caicó', 'RN'),
(35, '7º BE Cmb', 'Natal', 'RN'),
(36, 'Cia C/7ª Bda Inf Mtz', 'Natal', 'RN'),
(37, '20ª CSM', 'Maceió', 'AL'),
(38, '59º BI Mtz', 'Maceió', 'AL');

-- --------------------------------------------------------

--
-- Table structure for table `referenciacao`
--

CREATE TABLE IF NOT EXISTS `referenciacao` (
  `id_referenciacao` int(3) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_referenciacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=77 ;

--
-- Dumping data for table `referenciacao`
--

INSERT INTO `referenciacao` (`id_referenciacao`, `codigo`, `descricao`) VALUES
(1, '16 7600 000 000', 'Veterinária'),
(2, '16 8800 000 000', 'Dentista, Farmacêutico ou Médico'),
(3, '16 8801 000 000', 'Dentista – Qualquer Especialidade'),
(4, '16 8802 000 000', 'Dentista – Cirurgia e Traumatologia Buco–Maxilo–Fa'),
(5, '16 8803 000 000', 'Dentista – Dentística'),
(6, '16 8804 000 000', 'Dentista – Endodontia'),
(7, '16 8805 000 000', 'Dentista – Odontologia Legal'),
(8, '16 8806 000 000', 'Dentista – Odontologia Preventiva e Social'),
(9, '16 8807 000 000', 'Dentista – Odontopediatria'),
(10, '16 8808 000 000', 'Dentista – Ortodontia'),
(11, '16 8809 000 000', 'Dentista – Patologia Bucal'),
(12, '16 8810 000 000', 'Dentista – Periodontia'),
(13, '16 8811 000 000', 'Dentista – Prótese Buco–Maxilo–Facial'),
(14, '16 8812 000 000', 'Dentista – Prótese Dentária'),
(15, '16 8813 000 000', 'Dentista – Imaginologia Dento-Maxilo-Facial'),
(16, '16 8815 000 000', 'Farmacêutico – Qualquer Especialidade'),
(17, '16 8816 000 000', 'Farmacêutico – Bacteriologia'),
(18, '16 8817 000 000', 'Farmacêutico – Bioquímica'),
(19, '16 8818 000 000', 'Farmacêutico – Bromatologia (Análise de Alimentos)'),
(20, '16 8820 000 000', 'Farmacêutico – Farmacotécnica'),
(21, '16 8821 000 000', 'Farmacêutico – Hematologia'),
(22, '16 8822 000 000', 'Farmacêutico – Imunologia'),
(23, '16 8824 000 000', 'Farmacêutico – Parasitologia'),
(24, '16 8825 000 000', 'Farmacêutico – Pesquisas Clínicas'),
(25, '16 8827 000 000', 'Farmacêutico – Química Industrial e Farmacêutica'),
(26, '16 8829 000 000', 'Farmacêutico – Toxicologia'),
(27, '16 8835 000 000', 'Médico – Qualquer Especialidade'),
(28, '16 8837 000 000', 'Médico – Alergia e Imunologia'),
(29, '16 8838 000 000', 'Médico – Anestesiologia'),
(30, '16 8839 000 000', 'Médico – Angiologia'),
(31, '16 8841 000 000', 'Médico – Cancerologia'),
(32, '16 8842 000 000', 'Médico – Cardiologia'),
(33, '16 8843 000 000', 'Médico – Cirurgia Cardiovascular'),
(34, '16 8844 000 000', 'Médico – Cirurgia de Cabeça e Pescoço'),
(35, '16 8845 000 000', 'Médico – Cirurgia de Mão'),
(36, '16 8846 000 000', 'Médico – Cirurgia Geral'),
(37, '16 8847 000 000', 'Médico – Cirurgia Pediátrica'),
(38, '16 8848 000 000', 'Médico – Cirurgia Plástica'),
(39, '16 8849 000 000', 'Médico – Cirurgia Torácica'),
(40, '16 8850 000 000', 'Médico – Cirurgia Vascular'),
(41, '16 8851 000 000', 'Médico – Patologia Clínica / Medicina Laboratorial'),
(42, '16 8852 000 000', 'Médico – Dermatologia'),
(43, '16 8854 000 000', 'Médico – Endocrinologia'),
(44, '16 8855 000 000', 'Médico – Endocospia'),
(45, '16 8856 000 000', 'Médico – Medicina Física e Reabilitação'),
(46, '16 8858 000 000', 'Médico – Gastroenterologia'),
(47, '16 8859 000 000', 'Médico – Genética Médica'),
(48, '16 8860 000 000', 'Médico – Geriatria e Gerontologia'),
(49, '16 8863 000 000', 'Médico – Hematologia e Hemoterapia'),
(50, '16 8865 000 000', 'Médico – Homeopatia'),
(51, '16 8866 000 000', 'Médico – Infectologia'),
(52, '16 8869 000 000', 'Médico – Medicina Legal'),
(53, '16 8870 000 000', 'Médico – Medicina Nuclear'),
(54, '16 8871 000 000', 'Médico – Medicina de Família e Comunidade'),
(55, '16 8872 000 000', 'Médico – Medicina do Trabalho'),
(56, '16 8873 000 000', 'Médico – Nefrologia'),
(57, '16 8874 000 000', 'Médico – Neurocirurgia'),
(58, '16 8876 000 000', 'Médico – Neurologia'),
(59, '16 8879 000 000', 'Médico – Nutrologia'),
(60, '16 8881 000 000', 'Médico – Oftalmologia'),
(61, '16 8882 000 000', 'Médico – Ortopedia e Traumatologia'),
(62, '16 8883 000 000', 'Médico – Otorrinolaringologia'),
(63, '16 8884 000 000', 'Médico – Patologia'),
(64, '16 8886 000 000', 'Médico – Pediatria'),
(65, '16 8887 000 000', 'Médico – Pneumologia'),
(66, '16 8888 000 000', 'Médico – Coloproctologia'),
(67, '16 8889 000 000', 'Médico – Psiquiatria'),
(68, '16 8890 000 000', 'Médico – Radiologia e Diagnóstico por Imagem'),
(69, '16 8891 000 000', 'Médico – Radioterapia'),
(70, '16 8892 000 000', 'Médico – Reumatologia'),
(71, '16 8895 000 000', 'Médico – Urologia'),
(72, '16 8897 000 000', 'Médico – Ginecologia e Obstetrícia'),
(73, '16 8898 000 000', 'Médico – Medicina Intensiva'),
(74, '16 8899 000 000', 'Médico – Mastologia'),
(75, '16 8905 000 000', 'Médico – Clínica Médica'),
(76, '16 8909 000 000', 'Médico – Acupuntura');

-- --------------------------------------------------------

--
-- Table structure for table `referenciacao_especialidade`
--

CREATE TABLE IF NOT EXISTS `referenciacao_especialidade` (
  `id_referenciacao` int(3) NOT NULL,
  `id_especialidade` int(3) NOT NULL,
  KEY `id_referenciacao` (`id_referenciacao`),
  KEY `id_especialidade` (`id_especialidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `situacao`
--

CREATE TABLE IF NOT EXISTS `situacao` (
  `id_situacao` int(3) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_situacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `situacao`
--

INSERT INTO `situacao` (`id_situacao`, `descricao`) VALUES
(1, 'Incorporado'),
(2, 'Convocado'),
(3, 'Prorrogado'),
(4, 'Adido');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(5) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `senha` varchar(20) DEFAULT NULL,
  `secao` varchar(15) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `login`, `senha`, `secao`, `cpf`) VALUES
(1, 'teste', 'teste', 'teste', 'teste', 'teste');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `militar`
--
ALTER TABLE `militar`
  ADD CONSTRAINT `militar_ibfk_1` FOREIGN KEY (`id_hierarquia`) REFERENCES `hierarquia` (`id_hierarquia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `militar_ibfk_2` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `militar_ibfk_3` FOREIGN KEY (`id_usuário`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `referenciacao_especialidade`
--
ALTER TABLE `referenciacao_especialidade`
  ADD CONSTRAINT `referenciacao_especialidade_ibfk_1` FOREIGN KEY (`id_referenciacao`) REFERENCES `referenciacao` (`id_referenciacao`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `referenciacao_especialidade_ibfk_2` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;