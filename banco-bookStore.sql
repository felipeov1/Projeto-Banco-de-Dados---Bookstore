CREATE DATABASE BooksCo;

USE BooksCo;

CREATE TABLE Livro (
    ID_Livro INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    Autor VARCHAR(255) NOT NULL,
    Editora VARCHAR(255) NOT NULL,
    Ano_Publicacao YEAR NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    Estoque INT NOT NULL
);

CREATE TABLE Cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    Endereco VARCHAR(255) NOT NULL
);

CREATE TABLE Fornecedor (
    ID_Fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Contato VARCHAR(255) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    Endereco VARCHAR(255) NOT NULL
);

CREATE TABLE Venda (
    ID_Venda INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    Data_Venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    Total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Item_Venda (
    ID_Item_Venda INT AUTO_INCREMENT PRIMARY KEY,
    ID_Venda INT,
    ID_Livro INT,
    Quantidade INT NOT NULL,
    Preco_Unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Venda) REFERENCES Venda(ID_Venda),
    FOREIGN KEY (ID_Livro) REFERENCES Livro(ID_Livro)
);

INSERT INTO Livro (Titulo, Autor, Editora, Ano_Publicacao, Preco, Estoque) VALUES
('Livro 1', 'Autor A', 'Editora X', 1899, 29.90, 100),
('Livro 2', 'Autor B', 'Editora Y', 1988, 39.90, 50),
('Livro 3', 'Autor C', 'Editora Z', 1949, 29.90, 75);

INSERT INTO Cliente (Nome, Email, Telefone, Endereco) VALUES
('Maria Silva', 'maria@email.com', '123456789', 'Rua A, 123'),
('João Pereira', 'joao@email.com', '987654321', 'Rua B, 456');

INSERT INTO Fornecedor (Nome, Contato, Telefone, Endereco) VALUES
('Fornecedor A', 'Contato A', '555123456', 'Avenida C, 789'),
('Fornecedor B', 'Contato B', '555987654', 'Avenida D, 101');

INSERT INTO Venda (ID_Cliente, Total) VALUES
(1, 69.80), 
(2, 29.90); 

INSERT INTO Item_Venda (ID_Venda, ID_Livro, Quantidade, Preco_Unitario) VALUES
(1, 1, 2, 29.90), 
(1, 2, 1, 39.90),
(2, 3, 1, 29.90);