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

## Comandos com operadores lógicos

#### Adiciona 4 gêneros

```sql
INSERT INTO generos(nome)
VALUES ('Terror'), ('Suspense'), ('Fantasia'), ('Ação');
```

#### Adiciona filmes 


```sql
INSERT INTO filme(nome, data_de_lancamento, genero_id)
VALUES (
    'Pânico',
    '1996-12-20',
    1
    )

INSERT INTO filme(nome, data_de_lancamento, genero_id)
VALUES (
    'fuja',
    '2020-04-13',
    2
    );

INSERT INTO filme(nome, data_de_lancamento, genero_id)
VALUES (
    'A Bela e a Fera',
    '2017-03-02',
    3
    );

INSERT INTO filme(nome, data_de_lancamento, genero_id)
VALUES (
    'Até o Último Homem',
    '2017-01-26',
    4
    );
``` 

#### Adiciona detalhes dos filmes 

```sql
INSERT INTO detalhes_do_filme(filme_id, duracao_minutos, sinopse, bilheteria, orcamento)
VALUES (
    1,
    90.60,
    'Na pequena cidade de Woodsboro, um grupo de jovens do ensino médio enfrenta um assassino mascarado que testa seus conhecimentos sobre filmes de terror. Sidney Prescott, traumatizada após o brutal assassinato de sua mãe, é o alvo preferido do misterioso homicida que aterroriza a outrora pacata comunidade.',
    908000000000.00,
    15000000000.00
    );

     (
    2,
    78,
    'Após anos vivendo isolada do mundo e sendo cuidada por sua rígida mãe, Chloe começa a desconfiar que há algo extremamente errado em sua vida.',
    1000000000.00,
    15000000000.00
    );

     (
    3,
    126,
    'Moradora de uma pequena aldeia francesa, Bela tem o pai capturado pela Fera e decide entregar sua vida ao estranho ser em troca da liberdade do progenitor. No castelo, ela conhece objetos mágicos e descobre que a Fera é na verdade um príncipe que precisa de amor para voltar à forma humana.',
    1000000000.00,
    15000000000.00
    );

     (
    4,
    131.4,
    'Acompanhe a história de Desmond T. Doss, um médico do exército americano que, durante a Segunda Guerra Mundial, se recusa a pegar em armas. Durante a Batalha de Okinawa ele trabalha na ala médica e salva cerca de 75 homens.',
    1000000000.00,
    15000000000.00
    );
```

#### SELECT
```sql
SELECT duracao_minutos FROM detalhes_do_filme
WHERE orcamento >= 1000000000.00 
```

```sql
DELETE FROM detalhes_do_filme WHERE id = 1;
```
```sql
UPDATE generos SET nome = 'Romance'
WHERE id = 1;
```

### Operações e funções de agregação

```sql
-- mostrar filme e genero do filme
SELECT
    filme.nome AS Filmes,
    generos.nome AS Gêneros
FROM filme INNER JOIN generos
ON filme.genero_id = generos.id
ORDER BY Filmes ASC, Gêneros DESC;
```

```sql
SELECT
    filme.nome AS Filme,
    detalhes_do_filme.sinopse AS Sinopse
FROM filme 
    INNER JOIN detalhes_do_filme
ON detalhes_do_filme.filme_id = filme.id 
ORDER BY Filme ASC, Sinopse DESC;
```








