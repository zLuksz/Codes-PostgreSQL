CREATE TABLE CadastroPJ 
( 
 idpj INT PRIMARY KEY,  
 cnpj VARCHAR NOT NULL,  
 razaosocial VARCHAR NOT NULL,  
 nomefantasia VARCHAR NOT NULL,  
 idFlagPJ INT,  
 UNIQUE (cnpj)
); 

CREATE TABLE CadastroPF 
( 
 uf VARCHAR NOT NULL,  
 cidade VARCHAR NOT NULL,  
 cpf VARCHAR NOT NULL,  
 idpf INT PRIMARY KEY,  
 idFlagPF INT,  
 UNIQUE (cpf)
); 

CREATE TABLE CadastrodeLocal 
( 
 idcadastrolocal INT PRIMARY KEY,  
 nome VARCHAR NOT NULL,  
 descricao VARCHAR NOT NULL,  
 localizacao VARCHAR NOT NULL,  
 valor INT NOT NULL,  
 diasdefuncionamento DATE NOT NULL,  
 horariodefuncionamento INT NOT NULL  
); 

CREATE TABLE CadastroDeEvento 
( 
 idcadastroevento INT PRIMARY KEY,  
 nome VARCHAR NOT NULL,  
 descricao VARCHAR NOT NULL,  
 valor INT NOT NULL,  
 localizacao VARCHAR NOT NULL,  
 datadeinicio DATE NOT NULL,  
 datadetermino DATE NOT NULL 
); 

CREATE TABLE CadastroDeAvalição 
( 
 ruim CHAR,  
 regular CHAR,  
 bom CHAR,  
 pessimo CHAR,  
 otimo CHAR,  
 idFlagPF INT,  
 idavaliacao INT PRIMARY KEY  
); 

CREATE TABLE FlagPJ 
( 
 idflagpj INT PRIMARY KEY,  
 agentepublico CHAR,  
 empresa CHAR 
); 

CREATE TABLE FlagPF 
( 
 cegueiratotal CHAR,  
 cegueiraparcial CHAR,  
 daltonismo CHAR,  
 baixavisao CHAR,  
 usuariodeoculos CHAR,  
 cadeirante CHAR,  
 muletaoubengala CHAR,  
 tea CHAR,  
 tdah CHAR,  
 transtornosfobicoansiosos CHAR,  
 transtornosdehumor CHAR,  
 transtornosdepersonalidade CHAR,  
 transtornosdoneurodesenvolvimento CHAR,  
 surdeztotal CHAR,  
 surdezparcial CHAR,  
 fluenteembraille CHAR,  
 fluenteemlibras CHAR,  
 sindromededown CHAR,  
 lgbtqiamais CHAR,  
 idflagpf INT PRIMARY KEY
); 

CREATE TABLE FlagCadastroLocal 
( 
 idflaglocal INT PRIMARY KEY,  
 espacoparacadeirantesnosambientescomuns CHAR,  
 rampadeacesso CHAR,  
 elevadorespecial INT,  
 alturaacessiveldemesascadeirasebalcoes INT,  
 Cardapioembraille CHAR,  
 cardapioqrcode CHAR,  
 atendimentoemlibras CHAR,  
 customizacaodeprodutoseservicos CHAR,  
 pisotatil CHAR,  
 entradadecaoguia CHAR,  
 banheirosparacadeiranteseoupessoascommobilidadereduzida CHAR,  
 ambientacaohiperestimulante CHAR,  
 banheirofamiliaoudeusounico CHAR,  
 banheiroparacadeirantes CHAR,  
 aceitacriancas CHAR,  
 brinquedotecaouespacoinfantilcommonitor CHAR,  
 brinquedotecaouespacoinfantilsemmonitor CHAR,  
 idCadastrodeLocal INT 
); 

CREATE TABLE FlagsCadastroEvento 
( 
 idflagevento INT PRIMARY KEY,  
 audiodescricao CHAR,  
 assentosreservadosapessoascommobilidadereduzida CHAR,  
 interpretedelibras CHAR,  
 atracaocomefeitoestroboscopio CHAR,  
 direcionadaaopublicolgbtqiamais CHAR,  
 banheirofamiliaoudeusounico CHAR,  
 banheiroparacadeirantes CHAR,  
 consumodebebidasalcoolicas CHAR,  
 permitidaentradademenoresacompanhados CHAR,  
 idCadastroDeEvento INT 
); 

CREATE TABLE cadastrar 
( 
 idflagpj INT PRIMARY KEY,  
 idcadastrolocal INT PRIMARY KEY,  
 idcadastroevento INT PRIMARY KEY  
); 

ALTER TABLE CadastroPJ ADD FOREIGN KEY(idFlagPJ) REFERENCES FlagPJ (idFlagPJ);
ALTER TABLE CadastroPF ADD FOREIGN KEY(idFlagPF) REFERENCES FlagPF (idFlagPF);
ALTER TABLE CadastroDeAvalição ADD FOREIGN KEY(idFlagPF) REFERENCES FlagPF (idFlagPF);
ALTER TABLE FlagCadastroLocal ADD FOREIGN KEY(idCadastrodeLocal) REFERENCES CadastrodeLocal (idCadastrodeLocal);
ALTER TABLE FlagsCadastroEvento ADD FOREIGN KEY(idCadastroDeEvento) REFERENCES CadastroDeEvento (idCadastroDeEvento);
ALTER TABLE cadastrar ADD FOREIGN KEY(idflagpj) REFERENCES FlagPJ (idflagpj);
ALTER TABLE cadastrar ADD FOREIGN KEY(idcadastrolocal) REFERENCES CadastrodeLocal (idcadastrolocal);
ALTER TABLE cadastrar ADD FOREIGN KEY(idcadastroevento) REFERENCES CadastroDeEvento (idcadastroevento);
