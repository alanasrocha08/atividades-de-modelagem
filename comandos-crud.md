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

