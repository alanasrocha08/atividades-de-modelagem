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

## Comandos do exercício

