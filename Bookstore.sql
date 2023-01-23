CREATE TABLE Livros 
( 
 ano INT NOT NULL,  
 editora VARCHAR NOT NULL,  
 titulo VARCHAR NOT NULL,  
 idLivro INT PRIMARY KEY,  
 idCategoria INT
);

CREATE TABLE Autores 
( 
 nacionalidade VARCHAR NOT NULL,  
 nome VARCHAR NOT NULL,  
 idAutor INT PRIMARY KEY,  
 UNIQUE (nome)
);

CREATE TABLE Categorias 
( 
 descricao VARCHAR NOT NULL,  
 idCategoria INT PRIMARY KEY,  
 UNIQUE (descricao)
); 

CREATE TABLE LivrosAutores 
( 
 idAutor INT,  
 idLivro INT
); 

-- Popular tabela "categorias"
INSERT INTO categorias (idcategoria, descricao) VALUES 
(1, 'Romance'),
(2, 'Fantasia');

-- Popular tabela "autores"
INSERT INTO autores (idautor, nome, nacionalidade) VALUES 
(1, 'Machado de Assis', 'Brasileiro'),
(2, 'Clarice Lispector', 'Brasileira'),
(3, 'George R.R. Martin', 'Norte Americano'),
(4, 'Aluízio Azevedo', 'Brasileiro'),
(5, 'Linda Antonsson', 'Norte Americana'),
(6, 'Elio Garcia Jr.', 'Norte Americano');

-- Popular tabela "livros"
INSERT INTO livros (idlivro, idcategoria, titulo, editora, ano) VALUES 
(1, 1, 'Dom Casmurro', 'Thoth', '1899'),
(2, 1, 'A Hora Da Estrela', 'Rocco', '1977'),
(3, 2, 'A Game Of Thrones', 'LeYa', '2011'),
(4, 1, 'O Alienista', 'Grupo Companhia das Letras', '1988'),
(5, 1, 'O Cortiço', 'B.L Garner', '1890'),
(6, 2, 'Mundo de Gelo e Fogo', 'LeYa', '2014');

-- Popular tabela "livrosautores"
INSERT INTO livrosautores (idlivro, idautor) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 4),
(6, 3),
(6, 5),
(6, 6);