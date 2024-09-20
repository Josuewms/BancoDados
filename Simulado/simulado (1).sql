-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Set-2024 às 02:56
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `simulado`
--
CREATE DATABASE IF NOT EXISTS `simulado` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `simulado`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `animal`
--

CREATE TABLE `animal` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `id-cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `animal`
--

INSERT INTO `animal` (`id`, `nome`, `tipo`, `id-cliente`) VALUES
(1, 'Garfield', 'cachorro', 4),
(2, 'Chapisco', 'gato', 1),
(3, 'Robinho', 'cachorro', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` int(11) NOT NULL,
  `telefone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `cpf`, `telefone`) VALUES
(1, 'Josué Marçal', 2147483647, 419960850),
(4, 'Adolfe biladen', 557849569, 449975213),
(6, 'Marco polo', 736487541, 117727543);

-- --------------------------------------------------------

--
-- Estrutura da tabela `consulta`
--

CREATE TABLE `consulta` (
  `id` int(11) NOT NULL,
  `id_animal` int(11) NOT NULL,
  `id_veterinario` int(11) NOT NULL,
  `valor_total` float NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `consulta`
--

INSERT INTO `consulta` (`id`, `id_animal`, `id_veterinario`, `valor_total`, `data`, `hora`) VALUES
(1, 17, 3, 50, '2024-09-18', '14:30:00'),
(2, 19, 2, 80, '2024-09-20', '08:15:00'),
(3, 18, 1, 150, '2024-09-19', '09:30:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `consulta_procedimento`
--

CREATE TABLE `consulta_procedimento` (
  `id` int(11) NOT NULL,
  `id_consulta` int(11) NOT NULL,
  `id_procedimento` int(11) NOT NULL,
  `valor_total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `consulta_procedimento`
--

INSERT INTO `consulta_procedimento` (`id`, `id_consulta`, `id_procedimento`, `valor_total`) VALUES
(1, 3, 2, 580),
(2, 2, 1, 280),
(3, 1, 3, 150);

-- --------------------------------------------------------

--
-- Estrutura da tabela `porocedimento`
--

CREATE TABLE `porocedimento` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `porocedimento`
--

INSERT INTO `porocedimento` (`id`, `nome`, `valor`) VALUES
(1, 'Castração', 200),
(2, 'Drenagem', 430),
(3, 'Apodamento', 100);

-- --------------------------------------------------------

--
-- Estrutura da tabela `veterinario`
--

CREATE TABLE `veterinario` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` int(11) NOT NULL,
  `dataEntrada` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `veterinario`
--

INSERT INTO `veterinario` (`id`, `nome`, `telefone`, `dataEntrada`) VALUES
(1, 'Jussiosvaildu', 996414988, '2001-09-11'),
(2, 'Robsreiçu', 996085022, '2020-05-20'),
(3, 'jardoniudo', 997249428, '2022-12-03');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id-cliente` (`id-cliente`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk2` (`id_animal`),
  ADD KEY `fk3` (`id_veterinario`);

--
-- Índices para tabela `consulta_procedimento`
--
ALTER TABLE `consulta_procedimento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk4` (`id_consulta`),
  ADD KEY `fk5` (`id_procedimento`);

--
-- Índices para tabela `porocedimento`
--
ALTER TABLE `porocedimento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animal`
--
ALTER TABLE `animal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `consulta_procedimento`
--
ALTER TABLE `consulta_procedimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `porocedimento`
--
ALTER TABLE `porocedimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`id-cliente`) REFERENCES `cliente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
