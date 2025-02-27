-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/02/2025 às 15:56
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `catalogo_de_filmes`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `detalhes_do_filme`
--

CREATE TABLE `detalhes_do_filme` (
  `id` int(11) NOT NULL,
  `filme_id` int(11) NOT NULL,
  `duracao_minutos` int(11) NOT NULL,
  `sinopse` text NOT NULL,
  `bilheteria` decimal(15,2) DEFAULT NULL,
  `orcamento` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `detalhes_do_filme`
--
ALTER TABLE `detalhes_do_filme`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detalhes_filme` (`filme_id`) USING BTREE;

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `detalhes_do_filme`
--
ALTER TABLE `detalhes_do_filme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `detalhes_do_filme`
--
ALTER TABLE `detalhes_do_filme`
  ADD CONSTRAINT `fk_detalhes_filme` FOREIGN KEY (`filme_id`) REFERENCES `filme` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
