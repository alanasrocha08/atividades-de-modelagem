# Exercício de SQL - modelagem física

## Criar banco de dados

```sql
CREATE DATABASE catalogo_de_filmes CHARACTER SET utf8mb4;
```

### Criar tabela de gêneros

```sql
CREATE TABLE generos(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);
```

### Visualizar detalhes estruturais da tabela
```sql
DESC generos;
```

### Criar tabela filme

```sql
CREATE TABLE filme(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL, 
    titulo TEXT(50) NOT NULL,
    data_de_lancamento DATE NOT NULL,
    generos_id INT NOT NULL -- será chave estrangeira
);
```

### Criar tabela detalhes do filme

```sql
CREATE TABLE detalhes_do_filme(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    filme_id INT NOT NULL, 
    duracao_minutos INT NOT NULL,
    sinopse TEXT NOT NULL,
    bilheteria DECIMAL(15,2) NULL, 
    orcamento DECIMAL(15,2) NULL
);
```



### Criar relacionamento entre as tabelas e configurar a chave estrangeira

```sql
ALTER TABLE filmes
    ADD CONSTRAINT fk_generos_filme
    FOREIGN KEY (generos_id) REFERENCES generos(id);
```
```sql
ALTER TABLE detalhes_do_filme
    ADD CONSTRAINT fk_detalhes_filme
    FOREIGN KEY (filme_id) REFERENCES filme(id);`
```

## Comandos crud - exercício

```sql
INSERT INTO fabricantes (nome) VALUES('Positivo');
INSERT INTO fabricantes (nome) VALUES('Microsoft');
```
```sql
INSERT INTO produtos(nome, descricao, preco, quantidade, fabricante_id)
VALUES(
    'Xbox Series S', 
    'Velocidade e desempenho de última geração.',
    1997,
    5,
    8--id do fabricante Microsoft
);

INSERT INTO produtos(nome, descricao, preco, quantidade, fabricante_id)
VALUES(
    'Notebook Motion', 
    'Intel Dual Core 4GB de RAM, 128GB SSD e Tela 14,1 polegadas.',
    1213.65,
    8,
    7 --id do fabricante Positivo
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




