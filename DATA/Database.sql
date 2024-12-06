CREATE TABLE Categoria (
    ID INTEGER PRIMARY KEY,  -- Campo ID como chave primária
    NomeCategoria VARCHAR(50),  -- Campo Nome da categoria com até 50 caracteres
    Ordem INTEGER  -- Campo Ordem como número inteiro
);

CREATE TABLE Produtos (
    ID INTEGER PRIMARY KEY,  -- Campo ID como chave primária
    NomeProduto VARCHAR(100),  -- Campo Nome do Produto
    PRONTO Boolean,  -- Campo para armazenar a referência à categoria
    ID_Categoria INTEGER,  -- Campo para armazenar a referência à categoria
    CONSTRAINT FK_Categoria FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID)  -- Chave estrangeira referenciando a tabela Categoria
);

-- Criar como PRODUTOS.fdb