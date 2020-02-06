-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.3.15-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para argosbd
CREATE DATABASE IF NOT EXISTS `argosbd` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `argosbd`;

-- Copiando estrutura para tabela argosbd.acao
CREATE TABLE IF NOT EXISTS `acao` (
  `idacao` int(11) NOT NULL AUTO_INCREMENT,
  `nome_acao` varchar(100) DEFAULT NULL,
  `dt_inicio` date DEFAULT NULL,
  `dt_termino` date DEFAULT NULL,
  `hr_inicio` time DEFAULT NULL,
  `hr_termino` time DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `idoperacao` int(11) NOT NULL,
  PRIMARY KEY (`idacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela argosbd.acao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `acao` DISABLE KEYS */;
/*!40000 ALTER TABLE `acao` ENABLE KEYS */;

-- Copiando estrutura para tabela argosbd.acao_indicador
CREATE TABLE IF NOT EXISTS `acao_indicador` (
  `idacao_indicadro` int(11) NOT NULL AUTO_INCREMENT,
  `idindicador` int(11) NOT NULL,
  `idacao` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`idacao_indicadro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela argosbd.acao_indicador: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `acao_indicador` DISABLE KEYS */;
/*!40000 ALTER TABLE `acao_indicador` ENABLE KEYS */;

-- Copiando estrutura para tabela argosbd.acao_instituicao
CREATE TABLE IF NOT EXISTS `acao_instituicao` (
  `idacao_instituicao` int(11) NOT NULL AUTO_INCREMENT,
  `idinstituicao` int(11) NOT NULL,
  `idacao` int(11) NOT NULL,
  `responsavel` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idacao_instituicao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela argosbd.acao_instituicao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `acao_instituicao` DISABLE KEYS */;
/*!40000 ALTER TABLE `acao_instituicao` ENABLE KEYS */;

-- Copiando estrutura para tabela argosbd.acao_ocorrencia
CREATE TABLE IF NOT EXISTS `acao_ocorrencia` (
  `idacao_ocorrencia` int(11) NOT NULL AUTO_INCREMENT,
  `idacao` int(11) NOT NULL,
  `idocorrencia` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `observacao` text DEFAULT NULL,
  PRIMARY KEY (`idacao_ocorrencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela argosbd.acao_ocorrencia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `acao_ocorrencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `acao_ocorrencia` ENABLE KEYS */;

-- Copiando estrutura para tabela argosbd.acao_recurso
CREATE TABLE IF NOT EXISTS `acao_recurso` (
  `idacao_recurso` int(11) NOT NULL AUTO_INCREMENT,
  `idacao` int(11) NOT NULL,
  `idrecurso` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  PRIMARY KEY (`idacao_recurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela argosbd.acao_recurso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `acao_recurso` DISABLE KEYS */;
/*!40000 ALTER TABLE `acao_recurso` ENABLE KEYS */;

-- Copiando estrutura para tabela argosbd.acao_status
CREATE TABLE IF NOT EXISTS `acao_status` (
  `idacao_status` int(11) NOT NULL AUTO_INCREMENT,
  `idacao` int(11) NOT NULL,
  `idstatus` int(11) NOT NULL,
  PRIMARY KEY (`idacao_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela argosbd.acao_status: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `acao_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `acao_status` ENABLE KEYS */;

-- Copiando estrutura para tabela argosbd.grupo_indicador
CREATE TABLE IF NOT EXISTS `grupo_indicador` (
  `idgrupo_indicador` int(11) NOT NULL AUTO_INCREMENT,
  `nome_grupo` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idgrupo_indicador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela argosbd.grupo_indicador: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `grupo_indicador` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_indicador` ENABLE KEYS */;

-- Copiando estrutura para tabela argosbd.indicador
CREATE TABLE IF NOT EXISTS `indicador` (
  `idindicador` int(11) NOT NULL AUTO_INCREMENT,
  `indicador` varchar(60) DEFAULT NULL,
  `idgrupo_indicador` int(11) NOT NULL,
  PRIMARY KEY (`idindicador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela argosbd.indicador: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `indicador` DISABLE KEYS */;
/*!40000 ALTER TABLE `indicador` ENABLE KEYS */;

-- Copiando estrutura para tabela argosbd.instituicao
CREATE TABLE IF NOT EXISTS `instituicao` (
  `idinstituicao` int(11) NOT NULL AUTO_INCREMENT,
  `instituicao` varchar(45) NOT NULL,
  PRIMARY KEY (`idinstituicao`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela argosbd.instituicao: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `instituicao` DISABLE KEYS */;
INSERT INTO `instituicao` (`idinstituicao`, `instituicao`) VALUES
	(1, 'PM'),
	(2, 'PF');
/*!40000 ALTER TABLE `instituicao` ENABLE KEYS */;

-- Copiando estrutura para tabela argosbd.municipio
CREATE TABLE IF NOT EXISTS `municipio` (
  `idmunicipio` int(11) NOT NULL AUTO_INCREMENT,
  `municipio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmunicipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela argosbd.municipio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;

-- Copiando estrutura para tabela argosbd.municipio_acao
CREATE TABLE IF NOT EXISTS `municipio_acao` (
  `idmunicipio_acao` int(11) NOT NULL AUTO_INCREMENT,
  `idacao` int(11) NOT NULL,
  `idmunicipio` int(11) NOT NULL,
  PRIMARY KEY (`idmunicipio_acao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela argosbd.municipio_acao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `municipio_acao` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipio_acao` ENABLE KEYS */;

-- Copiando estrutura para tabela argosbd.ocorrencia
CREATE TABLE IF NOT EXISTS `ocorrencia` (
  `idocorrencia` int(11) NOT NULL AUTO_INCREMENT,
  `ocorrencia` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idocorrencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela argosbd.ocorrencia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ocorrencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `ocorrencia` ENABLE KEYS */;

-- Copiando estrutura para tabela argosbd.operacao
CREATE TABLE IF NOT EXISTS `operacao` (
  `idoperacao` int(11) NOT NULL AUTO_INCREMENT,
  `nome_operacao` varchar(100) NOT NULL,
  PRIMARY KEY (`idoperacao`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela argosbd.operacao: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `operacao` DISABLE KEYS */;
INSERT INTO `operacao` (`idoperacao`, `nome_operacao`) VALUES
	(1, 'Operação 1'),
	(2, 'Operação 2');
/*!40000 ALTER TABLE `operacao` ENABLE KEYS */;

-- Copiando estrutura para tabela argosbd.recurso
CREATE TABLE IF NOT EXISTS `recurso` (
  `idrecurso` int(11) NOT NULL AUTO_INCREMENT,
  `recurso` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idrecurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela argosbd.recurso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `recurso` DISABLE KEYS */;
/*!40000 ALTER TABLE `recurso` ENABLE KEYS */;

-- Copiando estrutura para tabela argosbd.status
CREATE TABLE IF NOT EXISTS `status` (
  `idstatus` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`idstatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela argosbd.status: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;

-- Copiando estrutura para tabela argosbd.territorio
CREATE TABLE IF NOT EXISTS `territorio` (
  `idterritorio` int(11) NOT NULL AUTO_INCREMENT,
  `territorio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idterritorio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela argosbd.territorio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `territorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `territorio` ENABLE KEYS */;

-- Copiando estrutura para tabela argosbd.territorio_acao
CREATE TABLE IF NOT EXISTS `territorio_acao` (
  `idterritorio_acao` int(11) NOT NULL,
  `idacao` int(11) NOT NULL,
  `idterritorio` int(11) NOT NULL,
  PRIMARY KEY (`idterritorio_acao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela argosbd.territorio_acao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `territorio_acao` DISABLE KEYS */;
/*!40000 ALTER TABLE `territorio_acao` ENABLE KEYS */;

-- Copiando estrutura para tabela argosbd.transacao
CREATE TABLE IF NOT EXISTS `transacao` (
  `idtransacao` int(11) NOT NULL AUTO_INCREMENT,
  `transacao` text NOT NULL,
  `idusuario` int(11) NOT NULL,
  `dt_transacao` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idtransacao`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela argosbd.transacao: ~62 rows (aproximadamente)
/*!40000 ALTER TABLE `transacao` DISABLE KEYS */;
INSERT INTO `transacao` (`idtransacao`, `transacao`, `idusuario`, `dt_transacao`) VALUES
	(1, 'Entrou', 1, '2020-01-20 11:19:42'),
	(2, 'Entrou', 1, '2020-01-20 11:23:33'),
	(3, 'Entrou', 1, '2020-01-20 11:23:54'),
	(4, 'Entrou', 1, '2020-01-20 11:24:10'),
	(5, 'Entrou', 1, '2020-01-20 11:25:29'),
	(6, 'Entrou', 1, '2020-01-20 11:25:50'),
	(7, 'Entrou', 1, '2020-01-20 11:26:51'),
	(8, 'Entrou', 1, '2020-01-20 11:32:09'),
	(9, 'Entrou', 1, '2020-01-20 11:36:35'),
	(10, 'Entrou', 1, '2020-01-20 12:05:19'),
	(11, 'Entrou', 1, '2020-01-20 13:34:08'),
	(12, 'renovou senha do usuario ID 1', 1, '2020-01-20 13:34:15'),
	(13, 'Entrou', 1, '2020-01-20 13:34:20'),
	(14, 'Entrou', 1, '2020-01-20 13:37:47'),
	(15, 'Entrou', 1, '2020-01-20 14:10:07'),
	(16, 'inserir orgao ID 2', 1, '2020-01-20 14:13:15'),
	(17, 'alterou usuario ID 1', 1, '2020-01-20 14:13:15'),
	(18, 'Entrou', 1, '2020-01-20 14:14:47'),
	(19, 'alterou usuario ID 1', 1, '2020-01-20 14:15:24'),
	(20, 'mudou senha', 1, '2020-01-20 14:16:48'),
	(21, 'Entrou', 1, '2020-01-20 14:16:56'),
	(22, 'Entrou', 1, '2020-01-20 14:17:05'),
	(23, 'Entrou', 1, '2020-01-20 14:19:04'),
	(24, 'alterou usuario ID 1', 1, '2020-01-20 14:19:09'),
	(25, 'Entrou', 1, '2020-01-20 14:19:14'),
	(26, 'Entrou', 1, '2020-01-21 14:13:34'),
	(27, 'Entrou', 1, '2020-01-22 11:53:57'),
	(28, 'Entrou', 1, '2020-01-22 13:42:02'),
	(29, 'Entrou', 1, '2020-01-22 14:48:05'),
	(30, 'alterou usuario ID 1', 1, '2020-01-22 14:57:50'),
	(31, 'Entrou', 1, '2020-01-22 15:00:17'),
	(32, 'Entrou', 1, '2020-01-22 15:00:25'),
	(33, 'Entrou', 1, '2020-01-22 15:01:01'),
	(34, 'alterou usuario ID 1', 1, '2020-01-22 15:05:08'),
	(35, 'Entrou', 1, '2020-01-22 15:05:26'),
	(36, 'alterou usuario ID 1', 1, '2020-01-22 15:08:24'),
	(37, 'Entrou', 1, '2020-01-22 15:35:35'),
	(38, 'Entrou', 1, '2020-01-22 15:37:08'),
	(39, 'alterou usuario ID 1', 1, '2020-01-22 15:50:47'),
	(40, 'Entrou', 1, '2020-01-22 15:50:56'),
	(41, 'Entrou', 1, '2020-01-22 16:10:47'),
	(42, 'alterou usuario ID 1', 1, '2020-01-22 16:29:32'),
	(43, 'Entrou', 1, '2020-01-22 16:45:27'),
	(44, 'Entrou', 1, '2020-01-22 16:49:08'),
	(45, 'Entrou', 1, '2020-01-22 16:55:21'),
	(46, 'Entrou', 1, '2020-01-22 17:10:26'),
	(47, 'Entrou', 1, '2020-01-22 17:16:22'),
	(48, 'Entrou', 1, '2020-01-22 17:22:13'),
	(49, 'Entrou', 1, '2020-01-29 14:57:28'),
	(50, 'Entrou', 1, '2020-01-29 14:57:29'),
	(51, 'Entrou', 1, '2020-01-29 14:57:33'),
	(52, 'Entrou', 1, '2020-01-29 14:58:27'),
	(53, 'Entrou', 1, '2020-01-30 14:55:42'),
	(54, 'Entrou', 1, '2020-02-03 17:13:31'),
	(55, 'Entrou', 1, '2020-02-04 13:19:49'),
	(56, 'inserir operacao ID 1', 1, '2020-02-04 13:47:33'),
	(57, 'inserir operacao ID 2', 1, '2020-02-04 13:48:28'),
	(58, 'alterou operacao ID 1', 1, '2020-02-04 13:49:39'),
	(59, 'alterou operacao ID 2', 1, '2020-02-04 13:49:43'),
	(60, 'alterou operacao ID 2', 1, '2020-02-04 13:49:45'),
	(61, 'alterou operacao ID 2', 1, '2020-02-04 13:49:52'),
	(62, 'Entrou', 1, '2020-02-04 14:36:06');
/*!40000 ALTER TABLE `transacao` ENABLE KEYS */;

-- Copiando estrutura para tabela argosbd.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '0',
  `rg` varchar(15) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `email` varchar(45) NOT NULL DEFAULT '0',
  `dt_nascimento` date NOT NULL DEFAULT '0000-00-00',
  `senha` varchar(50) NOT NULL DEFAULT '0',
  `permissao` text NOT NULL DEFAULT '0',
  `contato` varchar(50) NOT NULL DEFAULT '0',
  `instituicao` int(11) NOT NULL,
  `ativado` char(1) NOT NULL DEFAULT 'S',
  `dt_update` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela argosbd.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`idusuario`, `nome`, `rg`, `cpf`, `email`, `dt_nascimento`, `senha`, `permissao`, `contato`, `instituicao`, `ativado`, `dt_update`) VALUES
	(1, 'Administrador', '1', '1', 'admin@admin.com', '0000-00-00', '21232f297a57a5a743894a0e4a801fc3', 'cadastrar-operacao,cadastrar-acoes,cadastrar-produtividade,cadastrar-orgao,cadastrar-recurso,cadastrar-grupo-indicador,cadastrar-indicador,tipo-ocorrencia,usuario,mudasenha', '1', 2, 'S', '2020-01-22 16:29:32');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
