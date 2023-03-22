CREATE TABLE produtos (
	id_produto VARCHAR PRIMARY KEY,
	descricao VARCHAR,
	valor_unitario VARCHAR,
	categoria VARCHAR,
	qtde_estoque NUMERIC
);

CREATE TABLE funcionarios (
	id_funcionario VARCHAR PRIMARY KEY,
	cpf_funcionario VARCHAR,
	nome_funcionario VARCHAR,
	cargo VARCHAR,
	departamento VARCHAR,
	salario VARCHAR
);

CREATE TABLE clientes (
	id_cliente VARCHAR PRIMARY KEY,
	cpf_cliente VARCHAR,
	nome_cliente VARCHAR
);

CREATE TABLE vendas (
	id_venda VARCHAR PRIMARY KEY,
	dataehora VARCHAR,
	forma_pgto VARCHAR,
	fk_cliente VARCHAR REFERENCES clientes (id_cliente),
	fk_funcionario VARCHAR REFERENCES funcionarios (id_funcionario)
);

CREATE TABLE produtos_vendas (
	fk_venda VARCHAR REFERENCES vendas (id_venda),
	fk_produto VARCHAR REFERENCES produtos (id_produto),
	qtde_adquirida NUMERIC
);

CREATE TABLE produtos_auditoria (
	id_log BIGSERIAL PRIMARY KEY,
	operacao VARCHAR,
	dataehora VARCHAR,
	id_funcionario VARCHAR,
	fk_produto VARCHAR
);

INSERT INTO produtos (id_produto, descricao, valor_unitario, categoria, qtde_estoque) VALUES
	('VVKLD', 'Arroz', '12,00', 'Alimento', '55'),
	('SPMAN', 'Feijão', '8,00', 'Alimento', '40'),
	('VACPW', 'Açucar', '10,00', 'Alimento', '25'),
	('HRLJR', 'Café', '12,00', 'Alimento', '70'),
	('DSWEN', 'Farinha De Trigo', '7,00', 'Alimento', '25'),
	('JLAZA', 'Leite Condensado', '5,50', 'Alimento', '40'),
	('XETXG', 'Leite', '4,50', 'Alimento', '60'),
	('DRMTG', 'Tempero', '3,25', 'Alimento', '15'),
	('UBRER', 'Sal', '6,00', 'Alimento', '50'),
	('RYJKT', 'Leite Em Pó', '25,00', 'Alimento', '60'),
	('CGPUC', 'Água', '2,00', 'Bebida', '100'),
	('EUEJA', 'Cerveja Heineken 350ml', '5,50', 'Bebida', '60'),
	('AEFDT', 'Suco Tang Maracuja', '1,25', 'Bebida', '15'),
	('FKJPS', 'Suco Tang Uva', '1,25', 'Bebida', '25'),
	('CLTHF', 'Suco Tang Laranja', '1,25', 'Bebida', '50'),
	('CAASL', 'Frango', '25,00', 'Carnes', '20'),
	('ZVHQA', 'Bovina', '45,00', 'Carnes', '20'),
	('PJZAU', 'Porco', '45,00', 'Carnes', '20'),
	('LQWDL', 'Abacaxi', '8,00', 'Frutas,Verduras', '15'),
	('ATKLQ', 'Alface', '2,25', 'Frutas,Verduras', '25'),
	('NXBXT', 'Batata', '3,00', 'Frutas,Verduras', '30'),
	('DJVTB', 'Uva', '12,00', 'Frutas,Verduras', '50'),
	('VAZBQ', 'Papel-Higienico', '15,00', 'Higiene', '30'),
	('XJWWW', 'Fio-Dental', '5,00', 'Higiene', '50'),
	('PWRAA', 'Desodorante', '15,00', 'Higiene', '30'),
	('MAYEC', 'Sabonete', '3,00', 'Higiene', '30'),
	('GZQKK', 'Vassoura', '25,00', 'Limpeza', '50'),
	('PVLBX', 'Esponja', '2,00', 'Limpeza', '30'),
	('ALNFH', 'Laranja', '5,00', 'Frutas,Verduras', '25');

INSERT INTO funcionarios (id_funcionario, cpf_funcionario, nome_funcionario, cargo, departamento, salario) VALUES
	('202301', '432.414.104-55 ', 'Flavia de Souza Viana', 'Operador De Caixa', 'Venda', '1,300'),
	('202302', '654.614.281-34', 'Emmanuel Filho Alfradique', 'Estoquista', 'Estoque', '1,600'),
	('202303', '051.433.354-50', 'Roseanne Augusto Almeida', 'Câmera Fria', 'Frios', '1,800'),
	('202304', '716.626.282-69', 'Gian Billé Saraiva', 'Gerente', 'Gerente', '2,900');
	
INSERT INTO clientes (id_cliente, cpf_cliente, nome_cliente) VALUES
	('332', '332.212.714-17', 'Elio Nogueira Dinis'),
	('932', '932.428.224-71', 'Lucas Borralho Campos'),
	('551', '551.849.842-08', 'Jayne Camara Mendes'),
	('562', '562.533.060-30', 'Caio Dantas Belmiro'),
	('767', '767.435.521-78', 'Marcelo Elias Alentejo'),
	('326', '326.878.211-60', 'Manoel Fundão Donato'),
	('352', '352.125.803-31', 'Juraci Gonçalves Gripp'),
	('262', '262.558.421-18', 'Jacqueline Alves Couto'),
	('238', '238.584.483-46', 'Maria Beatriz Loureiro Billé'),
	('284', '284.187.381-11', 'Kaique Annunziato Jardim');

CREATE FUNCTION produtos_auditoria ()
RETURNS TRIGGER AS $$
BEGIN
	CASE TG_OP
		WHEN 'INSERT' THEN
			INSERT INTO produtos_auditoria (operacao, dataehora, id_funcionario, fk_produto)
			VALUES ('INSERT', CURRENT_TIMESTAMP, USER, NEW.id_produto);
		RETURN NEW;
		WHEN 'UPDATE' THEN
			INSERT INTO produtos_auditoria (operacao, dataehora, id_funcionario, fk_produto)
			VALUES ('UPDATE', CURRENT_TIMESTAMP, USER, OLD.id_produto);
		RETURN NEW;
		WHEN 'DELETE' THEN
			INSERT INTO produtos_auditoria (operacao, dataehora, id_funcionario, fk_produto)
			VALUES ('DELETE', CURRENT_TIMESTAMP, USER, OLD.id_produto);
		RETURN OLD;
		ELSE 
			RAISE NOTICE 'Operação Invalida%', TG_OP;
	END CASE;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_produtos_auditoria
AFTER INSERT OR UPDATE OR DELETE ON produtos
FOR EACH ROW
EXECUTE FUNCTION produtos_auditoria (id_produto);

INSERT INTO produtos ("id_produto", "descricao", "valor_unitario", "categoria", "qtde_estoque") VALUES
	('MFBB', 'Lasanha', '24,00', 'Alimento', '20')

UPDATE produtos SET valor_unitario = '22,00' WHERE id_produto = 'MFBB'

DELETE FROM produtos WHERE id_produto = 'MFBB'

CREATE FUNCTION registrarvenda ()
RETURNS TRIGGER AS $$
BEGIN
	IF qtde_estoque >= NEW.qtde_adquirida FROM produtos WHERE NEW.fk_produto = id_produto THEN
	UPDATE produtos SET qtde_estoque = qtde_estoque - NEW.qtde_adquirida WHERE id_produto = NEW.fk_produto;
	ELSE
		RAISE NOTICE 'Não Tem Essa Quantidade Em Estoque %', NEW;
		RETURN 'Erro';
	END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_registro_venda
BEFORE INSERT ON produtos_vendas
FOR EACH ROW
EXECUTE FUNCTION registrarvenda ();

INSERT INTO vendas (id_venda, dataehora, forma_pgto, fk_cliente, fk_funcionario)
VALUES ('XPTO', '21/03/2023 15:15', 'PIX', '238', '202301')
INSERT INTO vendas (id_venda, dataehora, forma_pgto, fk_cliente, fk_funcionario)
VALUES ('XHIJ', '22/03/2023 14:55', 'Cartão De Credito', '332', '202301')
INSERT INTO vendas (id_venda, dataehora, forma_pgto, fk_cliente, fk_funcionario)
VALUES ('UVHE', '22/03/2023 13:25', 'Cartão De Debito', '932', '202301')
INSERT INTO vendas (id_venda, dataehora, forma_pgto, fk_cliente, fk_funcionario)
VALUES ('WXYR', '20/03/2023 12:25', 'PIX', '326', '202301')

INSERT INTO produtos_vendas (fk_venda, fk_produto, qtde_adquirida)
VALUES ('XPTO', 'AEFDT', 15)
INSERT INTO produtos_vendas (fk_venda, fk_produto, qtde_adquirida)
VALUES ('XHIJ', 'CGPUC', 25)
INSERT INTO produtos_vendas (fk_venda, fk_produto, qtde_adquirida)
VALUES ('UVHE', 'UBRER', 30)
INSERT INTO produtos_vendas (fk_venda, fk_produto, qtde_adquirida)
VALUES ('WXYR', 'UBRER', 10)


CREATE VIEW total_produtos_por_categoria AS
SELECT categoria, COUNT(*) AS total_produtos FROM produtos
GROUP BY categoria
ORDER BY total_produtos DESC;

CREATE VIEW produtos_mais_vendidos AS
SELECT fk_produto, SUM(qtde_adquirida) FROM produtos_vendas
GROUP BY fk_produto
ORDER BY fk_produto DESC;

CREATE VIEW vendas_por_funcionario AS
SELECT fk_funcionario, COUNT(*) AS total_produtos FROM vendas
GROUP BY fk_funcionario
ORDER BY total_produtos DESC;

CREATE ROLE funcionario WITH 
LOGIN 
ENCRYPTED PASSWORD 'loja2023'; 

CREATE ROLE gerente WITH 
LOGIN 
ENCRYPTED PASSWORD 'gerente1596';

REVOKE ALL ON produtos_vendas FROM public;
REVOKE ALL ON vendas FROM public;

GRANT EXECUTE ON FUNCTION produtos_auditoria() TO funcionario;
GRANT EXECUTE ON FUNCTION registrarvenda() TO funcionario;

GRANT SELECT ON produtos_mais_vendidos TO gerente;
GRANT SELECT ON total_produtos_por_categoria TO gerente;
GRANT SELECT ON vendas_por_funcionario TO gerente;