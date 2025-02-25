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
INSERT INTO produtos(nome, descrição, preco, quantidade, fabricante_id)
VALUES(
    'Ultrabook', 
    'Equipamento de última geração cheio de recursos.',
    4000.96,
    10,
    2 --id do fabricante Dell
);
```