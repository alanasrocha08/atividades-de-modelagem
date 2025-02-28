# Comandos para operações CRUD no Banco de Dados

## Resumo

- C -> **C**reate       -> **INSERT**: inserir dados/registros na tabela
- R -> **R**ead         ->**SELECT**: consultar/ler dados/ registros na tabela
- U -> **U**pdate       ->**UPDANTE**: atualizar dados/registros na tabela
- D -> **D**elete       ->**DELETE**: excluir dados/registros na tabela

---

## INSERT (fabricantes)

```sql
INSERT INTO fabricantes (nome) VALUES('Asus');
INSERT INTO fabricantes (nome) VALUES('Dell');
INSERT INTO fabricantes (nome) VALUES('Apple');

INSERT INTO fabricantes (nome) VALUES('LG'), ('Samsung'), ('Brastemp');


```

## SELEC (fabricantes)

```sql
SELECT * FROM fabricantes;
```

---

## INSERT (produtos)

```sql
INSERT INTO produtos(nome, descricao, preco, quantidade, fabricante_id)
VALUES(
    'Ultrabook', 
    'Equipamento de última geração cheio de recursos.',
    4000.96,
    10,
    2 --id do fabricante Dell
);

INSERT INTO produtos(nome, descricao, preco, quantidade, fabricante_id)
VALUES(
    'Tablet Android', 
    'Tablet com versão 16 do sistema operacional Android, possui tela de 10 podegadas e armazenamento de 128 GB.',
    1000,
    15,
    5 -- id do fabricante Samsung
);

INSERT INTO produtos(nome, descricao, preco, quantidade, fabricante_id)
VALUES(
    'Geladeira', 
    'Refrigerador frost-free com acesso à Internet',
    5500,
    16,
    6 -- id do fabricante Brastemp
);

INSERT INTO produtos(nome, descricao, preco, quantidade, fabricante_id)
VALUES(
    'Iphone 18 Pro Max', 
    'Smartphone Apple cheio de frescuras e muito caro...',
    9666.99,
    2,
    3 -- id do fabricante Apple
);

INSERT INTO produtos(nome, descricao, preco, quantidade, fabricante_id)
VALUES(
    'Ipad Mini', 
    'Tablet Apple com tela retina display e muito mais...',
    5009.99,
    5,
    3 --id do fabricante Apple
);
```

---

## SELECT (Produtos)

```sql
-- Lendo TODADS as colunas de TODOS os registros 
SELECT * FROM produtos;

-- Lendo somente nome e preco de todos os registros
SELECT nome, preco FROM produtos;
SELECT preco, nome FROM produtos;

-- Mostrar nome, preco e quantidade SOMENTE dos produtos que custam abaixo de 5000
SELECT nome, preco, quantidade FROM produtos
WHERE preco < 5000;

-- Mini exercício: mostre o nome e descrição somente dos produtos da Apple.
SELECT nome, descricao FROM produtos
WHERE fabricante_id = 3
```

### Operadores LÓGICOS: E, OU e NÃO

#### E (AND)

```sql
-- Exibir nome e preco dos produtos que custa, entre 2000 e 6000
SELECT nome, preco FROM produtos
WHERE preco >= 2000 and preco <= 6000   
```

#### OU (OR)

```sql
-- Mini exercício: Exibir nome, preco dos produtos da Apple e da Samsung
SELECT nome, preco FROM produtos
WHERE fabricante_id = 3  or fabricante_id = 5  

-- versão usandO a função SQL IN()
SELECT nome, descricao FROM produtos
WHERE fabricabte-id IN(3, 5);
```

#### NÃO (NOT)

```sql
-- Nome, desrição e preço de todos os produtos EXCETO da Positivo
SELECT nome, descricao, preco FROM produtos
WHERE NOT fabricante_id = 8;

--Versão usando operador relacional dde "diferença/diferente"
SELECT nome, descricao, preco FROM produtos
WHERE fabricante_id !=8;
```

---

## UPDATE (fabricante)

**☠️ Perigo! 🚨**
**SEMPRE USE** a cláusula `WHERE` em seu comando `UPDATE` especificando uma ou mais condições para a atualização.

```sql
-- Trocar o nome do fabricante Asus para Asus do Brasil
UPDATE fabricantes SET nome = 'Asus do Brasil'
WHERE id = 1;

-- Alterar a quantidade para 10 dos produtos que custam abaixo de 2000 exceto da Microsoft.
UPDATE produtos SET quantidade = 10
WHERE preco <= 2000 AND NOT fabricante_id = 8
```

---

## UPDATE (Fabricante e Produtos)

**☠️ Perigo! 🚨**
**SEMPRE USE** a cláusula `WHERE` em seu comando `UPDATE` especificando uma ou mais condições para a atualização.

```sql
-- Para remover uma linha (fabricantes)
DELETE FROM fabricantes WHERE id = 4;
DELETE FROM fabricantes WHERE id = 1;

DELETE FROM produtos WHERE id = 4;

DELETE FROM fabricantes WHERE id = 3;
```

---

## SELECT: outras formas de uso

### Classificação/Ordenação

```sql
-- DESC: ordena em ordem decrescent
-- ASC: ordena em ordem crescente (padrão)
SELECT nome, preco FROM produtos ORDER BY nome;
SELECT nome, preco FROM produtos ORDER BY preco;
SELECT nome, preco FROM produtos ORDER BY nome DESC;

SELECT nome, preco, quantidade FROM produtos
WHERE fabricante_id = 5 ORDER BY quantidade;
```

---

### Operações e funções de agregação

```sql
-- Função de SOMA (SUM)
SELECT SUM(preco) FROM produtos;

-- alias/apelido para coluna 
SELECT SUM(preco) AS Total FROM produtos; 
SELECT SUM(preco) AS "Total dos Preços dos Produtos" FROM produtos; 
SELECT nome AS Produto, preco as Preço FROM produtos; 
SELECT nome Produto,preco Preço FROM produtos; -- omitindo o AS

-- Funções de formatação/configuração: FORMAT e REPLACE
SELECT FORMAT(SUM(preco), 2) AS Total FROM produtod;
SELECT REPLACE(FORMAT(SUM(preco), 2), ",", ".") AS Total FROM produtos;

-- Função de média: AVG
SELECT AVG(preco) as "Média dos Preços" FROM produtos;
SELECT ROUND(AVG(preco), 2) AS "Média dos Preços" FROM produtos;

-- Função de contagem: COUNT
SELECT COUNT(id) AS "Qtd de Produtos" FROM produtos;
SELECT COUNT (DISTINCT fabricante_id) AS "Qtd de Fabricantes com Produtos" FROM produtos

-- Operações matemáticas
SELECT nome, preco, quantidade, (preco * quantidade) as Toltal
FROM produtos;

--- Segmentação/Agrupamento de resultados
SELECT fabricante_id, SUM(preco) AS Total FROM produtos
GROUP BY fabricante_id; 
```
## Consultas (Queries) em duas ou mais tabelas relacionadas (JUNÇÃO/JOIN)

### Exibir o nome do produto e o nome do fabricante do produto
```sql
-- SELECT nomeDaTabela1.nomeDaColuna, nomeDaTabela2.nomeDa.Coluna,
SELECT produtos.nome, fabricantes.nome

-- JOIN permite Juntar as tabelas no momento do SELECT
FROM produtos JOIN fabricantes

-- ON tabela1.chave_estrangeira = tabela2.chave_primaria
ON produtos.fabricante_id = fabricantes.id;
```

### Nome do produto, preço do produto, nome do fabricante ordenados pelo nome do produto e pelo preço

```sql
SELECT 
    produtos.nome AS Produto,
    produtos.preco AS Preço,
    fabricantes.nome AS Fabricante
FROM produtos 
    INNER JOIN fabricantes ON produtos.fabricante_id = fabricantes.id
ORDER BY Produto ASC, Preço DESC; 
```

### Fabricante, Soma dos Preços, QUnatidade de Produtos POR Fabricante
```sql
SELECT
    fabricantes.nome AS Fabricante,
    SUM(produtos.preco) AS Total, -- SUM equivale a soma, AS é o apleido da coluna
    COUNT(produtos.fabricante_id) AS "Qtd de produtos" 
FROM produtos RIGHT JOIN fabricantes -- sql JOINS
ON produtos.fabricante_id = fabricantes.id
GROUP BY Fabricante
ORDER BY Total;
```

