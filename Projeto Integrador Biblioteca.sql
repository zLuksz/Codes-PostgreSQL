CREATE TABLE Autor 
( 
 idautor SERIAL PRIMARY KEY,  
 nome VARCHAR NOT NULL,  
 nacionalidade VARCHAR NOT NULL,  
 nobel BOOLEAN 
); 

CREATE TABLE Editora 
( 
 ideditora SERIAL PRIMARY KEY,  
 nome VARCHAR NOT NULL,  
 localeditora VARCHAR,  
 fone VARCHAR NOT NULL UNIQUE,  
 email VARCHAR NOT NULL
); 

CREATE TABLE Livro 
( 
 idlivro SERIAL PRIMARY KEY,  
 titulo VARCHAR NOT NULL,  
 genero VARCHAR NOT NULL, 
 faixetaria VARCHAR NOT NULL,
 exemplares INT NOT NULL,
 anopubli INT NOT NULL,
 bestseller BOOLEAN,
 fkautor INT,
 fkeditora INT,
 FOREIGN KEY (fkautor) REFERENCES Autor (idautor),
 FOREIGN KEY (fkeditora) REFERENCES Editora (ideditora)
); 

CREATE TABLE Usuario 
( 
 idusuario SERIAL PRIMARY KEY,  
 cpf VARCHAR NOT NULL UNIQUE,  
 nome VARCHAR NOT NULL,  
 datanasc DATE NOT NULL,  
 fone VARCHAR NOT NULL UNIQUE,  
 email VARCHAR NOT NULL
); 

CREATE TABLE Emprestimo 
( 
 idemprestimo INT PRIMARY KEY,  
 fkusuario INT,
 fklivro INT,
 dataretirada DATE NOT NULL,  
 datadevolucao DATE NOT NULL,  
 multa NUMERIC(10,2),
 FOREIGN KEY (fkusuario) REFERENCES Usuario (idusuario),
 FOREIGN KEY (fklivro) REFERENCES Livro (idlivro)
); 

INSERT INTO autor (idautor, nome, nacionalidade)
VALUES (1, 'Machado de Assis', 'Brasileiro'),
	(2, 'José de Alencar', 'Brasileiro'),
	(3, 'Lima Barreto', 'Brasileiro'),
	(4, 'Joaquim Manuel de Macedo', 'Brasileiro'),
	(5, 'João Cabral de Melo Neto', 'Brasileiro'),
	(6, 'Euclides da Cunha', 'Brasileiro'),
	(7, 'Graciliano Ramos', 'Brasileiro'),
	(8, 'José Lins do Rêgo', 'Brasileiro'),
	(9, 'Cecília Meireles', 'Brasileira'),
	(10, 'Lygia Fagundes Telles', 'Brasileira'),
	(11, 'Clarice Lispector', 'Brasileira'),
	(12, 'Érico Veríssimo', 'Brasileiro'),
	(13, 'Manuel Antônio de Almeida', 'Brasileiro'),
	(14, 'Pablo Neruda', 'Chileno'),
	(15, 'Gabriel Garcia Márquez', 'Colombiano'),
	(16, 'Carlos Ruiz Zafón', 'Espanhol');
		
INSERT INTO editora (ideditora, nome, localeditora, fone, email)
VALUES (1, 'Editora Globo', 'Porto Alegre', '40039393', 'trafegoeditora@edglobo.com.br'),
	(2, 'Editora Aleph', 'São Paulo', '(11) 3743-3202', 'marketing@editoraaleph.com.br'),
	(3, 'Editora 34', 'São Paulo', '(11) 3811-6777', 'vendas@editora34.com.br'),
	(4, 'Editora Rocco', 'Rio de Janeiro', '(21) 3525-2000', 'rocco@rocco.com.br'),
	(5, 'Companhia das Letras', 'São Paulo', '(11) 3707-3500', 'socorro@companhiadasletras.com.br ');
	
INSERT INTO usuario (idusuario, cpf, nome, datanasc, fone, email)
VALUES (1, '42388082587', 'José da Silva', '16/03/1994', '(64) 3487-8755', 'josedasilva@hotmail.com'),
	(2, '57643718482', 'João da Silva', '27/10/1979', '(84) 3682-3431', 'joaodasilva@hotmail.com'),
	(3, '04350935843', 'Ana da Silva', '13/03/1983', '(19) 2686-5624', 'anadasilva@hotmail.com'),
	(4, '86486776617', 'Maria Aparecida', '28/11/1995', '(47) 2614-4042', 'mariaparecida@hotmail.com'),
	(5, '75295195813', 'Maria das Graças', '25/07/1970', '(44) 3856-2925', 'mariadasgracas@hotmail.com'),
	(6, '30288363434', 'Maria José', '16/12/1958', '(24) 2321-3208', 'mariajose@hotmail.com'),
	(7, '52604421720', 'Joana Pereira', '24/09/2000', '(61) 2658-7218', 'joanapereira@hotmail.com'),
	(8, '53743295296', 'Ana Pereira', '28/12/2006', '(84) 3849-8371', 'anapereira@hotmail.com'),
	(9, '61172661626', 'Bento Ferreira', '18/02/2003', '(69) 3228-5685', 'bentoferreira@hotmail.com'),
	(10, '13196147525', 'Cláudio Ferreira', '07/02/2009', '(83) 2244-3054', 'claudioferr@hotmail.com');

INSERT INTO livro (idlivro, fkautor, fkeditora, titulo, genero, faixetaria, exemplares, anopubli, bestseller)
VALUES (1, 1, 1, 'Dom Casmurro', 'Romance', 'Livre', '10', '1899', 'TRUE'),
	(2, 2, 1, 'Iracema', 'Romance', '12 Anos a cima', '4', '2017', 'FALSE'),
	(3, 2, 1, 'O guarani', 'Ficção', '13 Anos a cima', '8', '1857', 'TRUE'),
	(4, 2, 1, 'Senhora', 'Romance', '15 Anos a cima', '3', '1875', 'FALSE'),
	(5, 3, 1, 'Triste fim de Policarpo Quaresma', 'Ficção', '9 Anos a cima', '5', '1915', 'TRUE'),
	(6, 4, 1, 'A moreninha', 'Romance', 'Livre', '5', '1844', 'FALSE'),
	(7, 5, 2, 'Morte e vida Severina', 'Poema', 'Livre', '2', '1955', 'FALSE'),
	(8, 6, 2, 'Os sertões', 'Romance', 'Livre', '3', '1902', 'FALSE'),
	(9, 1, 2, 'Memórias póstumas de Brás Cubas', 'Romance', '12 Anos a cima', '8', '1881', 'TRUE'),
	(10, 7, 3, 'Vidas secas', 'Romance', 'Livre', '4', '1938', 'TRUE'),
	(11, 8, 3, 'Menino de engenho', 'Romance', 'Livre', '7', '1932', 'TRUE'),
	(12, 9, 3, 'Romanceiro da inconfidência', 'Poesia', 'Livre', '1', '1953', 'TRUE'),
	(13, 10, 3, 'Ciranda de pedra', 'Ficção', 'Livre', '10', '1954', 'FALSE'),
	(14, 11, 3, 'Perto do coração selvagem', 'Romance', 'Livre', '6', '1943', 'TRUE'),
	(15, 11, 3, 'A hora da estrela', 'Romance', 'Livre', '6', '1977', 'FALSE'),
	(16, 12, 4, 'O tempo e o vento – O continente – Volume 1', 'Ficcção', 'Livre', '4', '1949', 'TRUE'),
	(17, 12, 4, 'O tempo e o vento – O continente – Volume 2', 'Ficção', 'Livre', '4', '1949', 'TRUE'),
	(18, 12, 4, 'O tempo e o vento – O retrato – Volume 1', 'Ficção', 'Livre', '4', '1995', 'TRUE'),
	(19, 12, 4, 'O tempo e o vento – O retrato – Volume 2', 'Ficção', 'Livre', '4', '2017', 'TRUE'),
	(20, 12, 4, 'O tempo e o vento – O arquipélago – Volume 1', 'Ficção', 'Livre', '2', '1962', 'TRUE'),
	(21, 12, 4, 'O tempo e o vento – O arquipélago – Volume 2', 'Ficção', 'Livre', '2', '1962', 'TRUE'),
	(22, 12, 4, 'O tempo e o vento – O arquipélago – Volume 3', 'Ficção', 'Livre', '2', '1962', 'TRUE'),
	(23, 13, 4, 'Memórias de um sargento de milícias', 'Romance', 'Livre', '15', '1853', 'TRUE'),
	(24, 14, 4, 'Cem sonetos de amor', 'Poesia', 'Livre', '15', '1959', 'TRUE'),
	(25, 14, 4, 'Crepusculário', 'Poesia', 'Livre', '7', '1923', 'FALSE'),
	(26, 15, 5, 'Cem anos de solidão', 'Romance', 'Livre', '12', '1967', 'TRUE'),
	(27, 16, 5, 'A sombra do vento', 'Romance', 'Livre', '3', '2001', 'FALSE'),
	(28, 16, 5, 'O jogo do anjo', 'Romance', 'Livre', '3', '2008', 'TRUE'),
	(29, 16, 5, 'O prisioneiro do céu', 'Romance', 'Livre', '3', '2011', 'TRUE'),
	(30, 16, 5, 'O labirinto dos espíritos', 'Romance', 'Livre', '1', '2016', 'TRUE'),
	(31, 4, 1, 'A Luneta Mágica', 'Romance', 'Livre', '0', '1869', 'TRUE');

ALTER TABLE emprestimo ADD COLUMN dataprevista DATE;

UPDATE livro SET exemplares = 9 WHERE idlivro = 1;
DELETE FROM emprestimo WHERE idemprestimo = 1;

CREATE FUNCTION emprestimo_livros ()
RETURNS TRIGGER AS $$
BEGIN
	IF exemplares > 0 FROM livro WHERE NEW.fklivro = idlivro THEN
		UPDATE livro SET exemplares = exemplares -1 WHERE (idlivro = new.fklivro);
	ELSE
		RAISE EXCEPTION 'Sem Exemplares %', NEW;
	RETURN 'Erro';
	END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_emprestimo_livro 
BEFORE INSERT ON emprestimo 
FOR EACH ROW EXECUTE PROCEDURE emprestimo_livros ();

INSERT INTO emprestimo (idemprestimo, fkusuario, fklivro, dataretirada, dataprevista)
VALUES (1, 1, 1, '06/03/2023', '13/03/2023');

INSERT INTO emprestimo (idemprestimo, fkusuario, fklivro, dataretirada, dataprevista)
VALUES (2, 1, 2, '07/03/2023', '13/03/2023');



CREATE FUNCTION emprestimo_com_multa ()
RETURNS TRIGGER AS $$
BEGIN
	UPDATE livro SET exemplares = exemplares + 1 WHERE OLD.fklivro = idlivro;
		IF NEW.datadevolucao > OLD.dataprevista THEN
			UPDATE emprestimo SET multa = (datadevolucao - dataprevista) * 1;
		ELSE
			UPDATE emprestimo SET multa = '0.0';
		END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_emprestimo_com_multa
AFTER UPDATE ON emprestimo
FOR EACH ROW WHEN (pg_trigger_depth() = 0)EXECUTE PROCEDURE emprestimo_com_multa ();

UPDATE emprestimo SET datadevolucao = '13/03/2023' WHERE idemprestimo = 1;
UPDATE emprestimo SET datadevolucao = '15/03/2023' WHERE idemprestimo = 2;


CREATE TABLE emprestimo_bkp (
	idemprestimo_bkp VARCHAR,
	fkusuario_bkp VARCHAR,
	fklivro_bkp VARCHAR,
	multa_bkp NUMERIC,
	dataprevista_bkp DATE,
	datadevolucao_bkp DATE
);

CREATE FUNCTION emprestimos_bkp ()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO emprestimo_bkp (idemprestimo_bkp, fkusuario_bkp, fklivro_bkp, multa_bkp, dataprevista_bkp, datadevolucao_bkp)
  VALUES (NEW.idemprestimo, NEW.fkusuario, NEW.fklivro, NEW.multa, NEW.dataprevista, NEW.datadevolucao);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_emprestimos_bkp
AFTER INSERT OR UPDATE ON emprestimo
FOR EACH ROW
EXECUTE FUNCTION emprestimos_bkp();

ALTER TABLE autor DROP COLUMN nobel;

ALTER TABLE autor ADD COLUMN sexo CHAR(1);
ALTER TABLE usuario ADD COLUMN sexo CHAR(1);

SELECT nome, COUNT(*) AS total_livros FROM livro FULL JOIN autor
ON livro.fkautor = autor.idautor
GROUP BY nome
ORDER BY total_livros DESC;

SELECT genero, COUNT(*) FROM livro
GROUP BY genero;

SELECT nacionalidade, COUNT(*) FROM autor
GROUP BY nacionalidade;

SELECT sexo, COUNT(*) FROM autor
GROUP BY sexo;

SELECT * FROM livro
WHERE bestseller = 'TRUE'

SELECT * FROM livro RIGHT JOIN autor
ON livro.fkautor=autor.idautor
WHERE nome='José de Alencar';

SELECT * FROM livro
WHERE titulo LIKE 'O tempo e o vento%';

SELECT * FROM usuario 
WHERE nome LIKE '%Silva';

SELECT * FROM usuario
WHERE nome LIKE 'Maria%';

SELECT * FROM usuario
WHERE nome LIKE '%eira';

SELECT * FROM usuario
WHERE nome LIKE '%ana%';

SELECT * FROM livro
WHERE genero = (SELECT MAX(genero) FROM livro);

SELECT exemplares, COUNT(*) FROM livro
GROUP BY exemplares;

SELECT titulo,exemplares, COUNT(*) FROM livro
GROUP BY titulo,exemplares
ORDER BY titulo;

CREATE VIEW idade_por_ano AS
SELECT (CURRENT_DATE - datanasc) /365 AS idades_por_ano FROM usuario
GROUP BY datanasc;

SELECT
	(SELECT COUNT(*) FROM idade_por_ano
WHERE idades_por_ano > 18) AS maiordeidade,
	(SELECT COUNT(*) FROM idade_por_ano
WHERE idades_por_ano BETWEEN 12 AND 16) AS entre12e16anos;

SELECT
(SELECT COUNT(*) FROM livro
WHERE anopubli > 2000) AS seculo_atual,
(SELECT COUNT(*) FROM livro 
WHERE anopubli < 2000) AS seculo_passado;

SELECT * FROM usuario FULL JOIN emprestimo
ON usuario.idusuario = emprestimo.fkusuario
WHERE emprestimo ISNULL;

SELECT nome FROM usuario FULL JOIN emprestimo
ON usuario.idusuario = emprestimo.fkusuario
WHERE fklivro = (SELECT MAX(fklivro) FROM emprestimo);

SELECT nome FROM usuario FULL JOIN emprestimo
ON usuario.idusuario = emprestimo.fkusuario
WHERE multa > 0;

SELECT
(SELECT COUNT(*) FROM autor
WHERE sexo='M' AND nacionalidade='Brasileiro') AS Homens,
(SELECT COUNT(*) FROM autor
WHERE sexo='F' AND nacionalidade='Brasileira') AS Mulheres;

SELECT nome FROM editora FULL JOIN livro
ON editora.ideditora = livro.fkeditora
WHERE fkeditora = (SELECT MIN(fkeditora) FROM livro)
GROUP BY nome;

SELECT titulo, nome FROM editora FULL JOIN livro
ON editora.ideditora = livro.fkeditora
WHERE fkeditora = (SELECT MAX(fkeditora) FROM livro)
GROUP BY titulo, nome;

SELECT ROUND (AVG(idlivro),2) FROM autor FULL JOIN livro
ON autor.idautor=livro.fkautor
WHERE sexo='M'

SELECT ROUND (AVG(idlivro),2) FROM autor FULL JOIN livro
ON autor.idautor=livro.fkautor
WHERE sexo='F'

SELECT fklivro, nome FROM emprestimo LEFT JOIN autor
ON emprestimo.fklivro = autor.idautor
WHERE nacionalidade LIKE  'Brasilei%' 
GROUP BY fklivro, nome;

SELECT titulo, bestseller FROM emprestimo LEFT JOIN livro
ON emprestimo.fklivro = livro.idlivro
WHERE bestseller = 'TRUE';