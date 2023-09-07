CREATE DATABASE IF NOT EXISTS imoveisDB;

USE imoveisDB;


CREATE TABLE IF NOT EXISTS estado (
    sgEstado CHAR(2) NOT NULL PRIMARY KEY,
    nmEstado VARCHAR(50) NOT NULL
);


CREATE TABLE IF NOT EXISTS cidade (
    idCidade INTEGER NOT NULL PRIMARY KEY,
    nmCidade VARCHAR(50) NOT NULL,
    sgEstado CHAR(2) NOT NULL,
    FOREIGN KEY (sgEstado) REFERENCES estado(sgEstado)
);


CREATE TABLE IF NOT EXISTS bairro (
    idBairro INTEGER NOT NULL PRIMARY KEY,
    nmBairro VARCHAR (50) NOT NULL,
    cidade INTEGER NOT NULL,
    sgEstado CHAR(2) NOT NULL,
    FOREIGN KEY (cidade) REFERENCES cidade(idCidade),
    FOREIGN KEY (sgEstado) REFERENCES estado(sgEstado)
);


CREATE TABLE IF NOT EXISTS compradores (
    idComprador INTEGER NOT NULL PRIMARY KEY,
    nmComprador VARCHAR(50) NOT NULL,
    nmEnderecoComprador VARCHAR(255) NOT NULL,
    nrCpfComprador NUMERIC(11,0) UNIQUE,
    cidade INTEGER NOT NULL,
    bairro INTEGER NOT NULL,
    sgEstado CHAR(2) NOT NULL,
    telComprador NUMERIC(11,0) NOT NULL,
    FOREIGN KEY (cidade) REFERENCES cidade(idCidade),
    FOREIGN KEY (bairro) REFERENCES bairro(idBairro),
    FOREIGN KEY (sgEstado) REFERENCES estado(sgEstado)
);


CREATE TABLE IF NOT EXISTS vendedor (
    idVendedor INTEGER NOT NULL PRIMARY KEY,
    nmVendedor VARCHAR(50) NOT NULL,
    nmEndereco VARCHAR(255) NOT NULL,
    nrCpf NUMERIC(11,0) UNIQUE,
    cidade INTEGER NOT NULL,
    bairro INTEGER NOT NULL,
    sgEstado CHAR(2) NOT NULL,
    telefone NUMERIC(11,0) NOT NULL,
    dataNasc DATE NOT NULL,
    FOREIGN KEY (cidade) REFERENCES cidade(idCidade),
    FOREIGN KEY (bairro) REFERENCES bairro(idBairro),
    FOREIGN KEY (sgEstado) REFERENCES estado(sgEstado)
);


CREATE TABLE IF NOT EXISTS faixa_imovel (
    idFaixa INTEGER NOT NULL PRIMARY KEY,
    nmFaixa VARCHAR(50) NOT NULL,
    vlMinimo FLOAT NOT NULL,
    vlMaximo FLOAT NOT NULL
);


CREATE TABLE IF NOT EXISTS imovel (
    idImovel INTEGER NOT NULL PRIMARY KEY,
    vendedor INTEGER NOT NULL,
    bairro INTEGER NOT NULL,
    cidade INTEGER NOT NULL,
    sgEstado CHAR(2) NOT NULL,
    faixa INTEGER NOT NULL,
    oferta INTEGER NOT NULL,
    nmEndereco VARCHAR(255) NOT NULL,
    nrAreaUtil FLOAT NOT NULL,
    nrAreaTotal FLOAT NOT NULL,
    vlPreco FLOAT NOT NULL,
    stVendido VARCHAR(20),
    dataLancto DATE NOT NULL,
    FOREIGN KEY (vendedor) REFERENCES vendedor(idVendedor),
    FOREIGN KEY (bairro) REFERENCES bairro(idBairro),
    FOREIGN KEY (cidade) REFERENCES cidade(idCidade),
    FOREIGN KEY (sgEstado) REFERENCES estado(sgEstado),
    FOREIGN KEY (faixa) REFERENCES faixa_imovel(idFaixa)
);


CREATE TABLE IF NOT EXISTS oferta (
    idOferta INTEGER NOT NULL PRIMARY KEY,
    imovel INTEGER NOT NULL,
    comprador INTEGER NOT NULL,
    vlOferta FLOAT NOT NULL,
    dtOferta DATE NOT NULL,
    FOREIGN KEY (imovel) REFERENCES imovel(idImovel),
    FOREIGN KEY (comprador) REFERENCES compradores(idComprador)
);


ALTER TABLE imovel ADD FOREIGN KEY (oferta) REFERENCES oferta(idOferta);


INSERT INTO estado
VALUES ('AC','Acre'),
       ('AL','Alagoas'),
       ('AP','Amapá'),
       ('AM','Amazonas'),
       ('BA','Bahia'),
       ('CE','Ceará'),
       ('DF','Distrito Federal'),
       ('ES','Espírito Santo'),
       ('GO','Goiás'),
       ('MA','Maranhão'),
       ('MT','Mato Grosso'),
       ('MS','Mato Grosso do Sul'),
       ('MG','Minas Gerais'),
       ('PA','Pará'),
       ('PB','Paraíba'),
       ('PR','Paraná'),
       ('PE','Pernambuco'),
       ('PI','Piauí'),
       ('RJ','Rio de Janeiro'),
       ('RN','Rio Grande do Norte'),
       ('RS','Rio Grande do Sul'),
       ('RO','Rondônia'),
       ('RR','Roraima'),
       ('SC','Santa Catarina'),
       ('SP','São Paulo'),
       ('SE','Sergipe'),
       ('TO','Tocantins');


INSERT INTO cidade
VALUES (1,'Aracaju','SE'),
       (2,'Belém','PA'),
       (3,'Belo Horizonte','MG'),
       (4,'Boa Vista','RR'),
       (5,'Brasília','DF'),
       (6,'Campo Grande','MS'),
       (7,'Cuiabá','MT'),
       (8,'Curitiba','PR'),
       (9,'Florianópolis','SC'),
       (10,'Fortaleza','CE'),
       (11,'Goiânia','GO'),
       (12,'João Pessoa','PB'),
       (13,'Macapá','AP'),
       (14,'Maceió','AL'),
       (15,'Manaus','AM'),
       (16,'Natal','RN'),
       (17,'Palmas','TO'),
       (18,'Porto Alegre','RS'),
       (19,'Porto Velho','RO'),
       (20,'Recife','PE'),
       (21,'Rio Branco','AC'),
       (22,'Rio de Janeiro','RJ'),
       (23,'Salvador','BA'),
       (24,'São Luís','MA'),
       (25,'São Paulo','SP'),
       (26,'Teresina','PI'),
       (27,'Vitória','ES'),
       (28,'Cruzeiro do Sul','AC'),
       (29,'Sena Madureira','AC'),
       (30,'Arapiraca','AL'),
       (31,'Rio Largo','AL'),
       (32,'Santana','AP'),
       (33,'Laranjal do Jari','AP'),
       (34,'Itacoatiara','AM'),
       (35,'Manacapuru','AM'),
       (36,'Feira de Santana','BA'),
       (37,'Vitória da Conquista','BA'),
       (38,'Caucaia','CE'),
       (39,'Juazeiro do Norte','CE'),
       (40,'Serra','ES'),
       (41,'Vila Velha','ES'),
       (42,'Aparecida de Goiânia','GO'),
       (43,'Anápolis','GO'),
       (44,'Imperatriz','MA'),
       (45,'São José de Ribamar','MA'),
       (46,'Várzea Grande','MT'),
       (47,'Rondonópolis','MT'),
       (48,'Dourados','MS'),
       (49,'Três Lagoas','MS'),
       (50,'Uberlândia','MG'),
       (51,'Contagem','MG'),
       (52,'Campina Grande','PB'),
       (53,'Santa Rita','PB'),
       (54,'Londrina','PR'),
       (55,'Maringá','PR'),
       (56,'Jaboatão dos Guararapes','PE'),
       (57,'Olinda','PE'),
       (58,'Parnaíba','PI'),
       (59,'Picos','PI'),
       (60,'São Gonçalo','RJ'),
       (61,'Duque de Caxias','RJ'),
       (62,'Mossoró','RN'),
       (63,'Parnamirim','RN'),
       (64,'Caxias do Sul','RS'),
       (65,'Canoas','RS'),
       (66,'Ji-Paraná','RO'),
       (67,'Ariquemes','RO'),
       (68,'Bonfim','RR'),
       (69,'Cantá','RR'),
       (70,'Joinville','SC'),
       (71,'Blumenau','SC'),
       (72,'Guarulhos','SP'),
       (73,'Campinas','SP'),
       (74,'Nossa Senhora do Socorro','SE'),
       (75,'Itabaiana','SE'),
       (76,'Araguaína','TO'),
       (77,'Gurupi','TO'),
       (78,'Ananindeua','PA'),
       (79,'Santarém','PA');


INSERT INTO bairro
VALUES (1,'Atalaia',1,'SE'),
       (2,'Jardins',1,'SE'),
       (3,'Nazaré',2,'PA'),
       (4,'Batista Campos',2,'PA'),
       (5,'Savassi',3,'MG'),
       (6,'Lourdes',3,'MG'),
       (7,'Caçari',4,'RR'),
       (8,'Macejana',4,'RR'),
       (9,'Asa Norte',5,'DF'),
       (10,'Asa Sul',5,'DF'),
       (11,'Cidade Jardim',6,'MS'),
       (12,'Tiradentes',6,'MS'),
       (13,'Goiabeiras',7,'MT'),
       (14,'Jardim das Américas',7,'MT'),
       (15,'Água Verde',8,'PR'),
       (16,'Batel',8,'PR'),
       (17,'Agronômica',9,'SC'),
       (18,'Campeche',9,'SC'),
       (19,'Meireles',10,'CE'),
       (20,'Aldeota',10,'CE'),
       (21,'Setor Bueno',11,'GO'),
       (22,'Setor Marista',11,'GO'),
       (23,'Manaíra',12,'PB'),
       (24,'Tambaú',12,'PB'),
       (25,'Santa Inês',13,'AP'),
       (26,'Laguinho',13,'AP'),
       (27,'Ponta Verde',14,'AL'),
       (28,'Jatiúca',14,'AL'),
       (29,'Ponta Negra',15,'AM'),
       (30,'Adrianópolis',15,'AM'),
       (31,'Petrópolis',16,'RN'),
       (32,'Capim Macio',16,'RN'),
       (33,'Plano Diretor Sul',17,'TO'),
       (34,'Taquaralto',17,'TO'),
       (35,'Moinhos de Vento',18,'RS'),
       (36,'Bela Vista',18,'RS'),
       (37,'Caiari',19,'RO'),
       (38,'Olaria',19,'RO'),
       (39,'Boa Viagem',20,'PE'),
       (40,'Pina',20,'PE'),
       (41,'Bosque',21,'AC'),
       (42,'Jardim Primavera',21,'AC'),
       (43,'Copacabana',22,'RJ'),
       (44,'Ipanema',22,'RJ'),
       (45,'Alphaville',23,'BA'),
       (46,'Barra',23,'BA'),
       (47,'Renascença',24,'MA'),
       (48,'Cohama',24,'MA'),
       (49,'Liberdade',25,'SP'),
       (50,'Pinheiros',25,'SP'),
       (51,'Jóquei',26,'PI'),
       (52,'Fátima',26,'PI'),
       (53,'Praia do Canto',27,'ES'),
       (54,'Jardim da Penha',27,'ES'),
       (55,'Remanso',28,'AC'),
       (56,'Mocinha Magalhães',28,'AC'),
       (57,'Pista',29,'AC'),
       (58,'Eugênio Areal',29,'AC'),
       (59,'Baixão',30,'AL'),
       (60,'Capiatã',30,'AL'),
       (61,'São Jorge',31,'AL'),
       (62,'Canaã',31,'AL'),
       (63,'Nova Brasília',32,'AP'),
       (64,'Provedor I',32,'AP'),
       (65,'Murici',33,'AP'),
       (66,'Cidade Nova',33,'AP'),
       (67,'Vila Lindóia',34,'AM'),
       (68,'São Cristóvão',34,'AM'),
       (69,'Nova Manacá',35,'AM'),
       (70,'Vale Verde',35,'AM'),
       (71,'Sobradinho',36,'BA'),
       (72,'Queimadinha',36,'BA'),
       (73,'Candeias',37,'BA'),
       (74,'Felícia',37,'BA'),
       (75,'Jurema',38,'CE'),
       (76,'Parque Potira',38,'CE'),
       (77,'Lagoa Seca',39,'CE'),
       (78,'Triângulo',39,'CE'),
       (79,'Laranjeiras',40,'ES'),
       (80,'Jardim Limoeiro',40,'ES'),
       (81,'Praia da Costa',41,'ES'),
       (82,'Itapuã',41,'ES'),
       (83,'Setor Garavelo',42,'GO'),
       (84,'Jardim Buriti Sereno',42,'GO'),
       (85,'Jundiaí',43,'GO'),
       (86,'Lourdes',43,'GO'),
       (87,'Bacuri',44,'MA'),
       (88,'Três Poderes',44,'MA'),
       (89,'Araçagy',45,'MA'),
       (90,'Loteamento Jardim Turu',45,'MA'),
       (91,'Cristo Rei',46,'MT'),
       (92,'Jardim Glória',46,'MT'),
       (93,'Vila Aurora',47,'MT'),
       (94,'Jardim Atlântico',47,'MT'),
       (95,'Jardim Água Boa',48,'MS'),
       (96,'Jardim Europa',48,'MS'),
       (97,'Jardim Alvorada',49,'MS'),
       (98,'Jardim das Oliveiras',49,'MS'),
       (99,'Santa Mônica',50,'MG'),
       (100,'Umuarama ',50,'MG'),
       (101,'Eldorado',51,'MG'),
       (102,'Riacho das Pedras',51,'MG'),
       (103,'Catolé',52,'PB'),
       (104,'José Pinheiro',52,'PB'),
       (105,'Várzea Nova',53,'PB'),
       (106,'Popular',53,'PB'),
       (107,'Esperança',54,'PR'),
       (108,'Gleba Palhano',54,'PR'),
       (109,'Zona 7',55,'PR'),
       (110,'Jardim Alvorada',55,'PR'),
       (111,'Candeias',56,'PE'),
       (112,'Piedade',56,'PE'),
       (113,'Casa Caiada',57,'PE'),
       (114,'Bairro Novo',57,'PE'),
       (115,'Sabiazal',58,'PI'),
       (116,'João XXIII',58,'PI'),
       (117,'Junco',59,'PI'),
       (118,'Morada do Sol',59,'PI'),
       (119,'Alcântara',60,'RJ'),
       (120,'Mutondo',60,'RJ'),
       (121,'Saracuruna',61,'RJ'),
       (122,'Jardim Primavera',61,'RJ'),
       (123,'Nova Betânia',62,'RN'),
       (124,'Alto de São Manoel',62,'RN'),
       (125,'Nova Parnamirim',63,'RN'),
       (126,'Emaús',63,'RN'),
       (127,'São Pelegrino',64,'RS'),
       (128,'Pioneiro',64,'RS'),
       (129,'Niterói',65,'RS'),
       (130,'Igara',65,'RS'),
       (131,'Riachuelo',66,'RO'),
       (132,'Nova Brasília',66,'RO'),
       (133,'Setor 2',67,'RO'),
       (134,'Setor 10',67,'RO'),
       (135,'Centro',68,'RR'),
       (136,'Nova Esperança',68,'RR'),
       (137,'Santa Celília',69,'RR'),
       (138,'Bairro Novo',69,'RR'),
       (139,'Iririú',70,'SC'),
       (140,'Saguaçu',70,'SC'),
       (141,'Itoupava Seca',71,'SC'),
       (142,'Vila Nova',71,'SC'),
       (143,'Vila Galvão',72,'SP'),
       (144,'Gopoúva',72,'SP'),
       (145,'Cambuí',73,'SP'),
       (146,'Nova Campinas',73,'SP'),
       (147,'Taiçoca de Fora',74,'SE'),
       (148,'Albano Franco',74,'SE'),
       (149,'São Cristóvão',75,'SE'),
       (150,'Marcela',75,'SE'),
       (151,'Setor Central',76,'TO'),
       (152,'Bairro da Cimba',76,'TO'),
       (153,'Setor Central',77,'TO'),
       (154,'Jardim Eldorado',77,'TO'),
       (155,'Cidade Nova',78,'PA'),
       (156,'Águas Lindas:',78,'PA'),
       (157,'Aeroporto Velho',79,'PA'),
       (158,'Aldeia',79,'PA');


INSERT INTO compradores
VALUES (1,'André Vitor Moreira','Avenida Getúlio Vargas',26929421243,21,41,'AC',68981445172),
       (2,'Cláudio Diego Cardoso','Rua Desembargador Alfredo Gaspar de Mendonça',63661826476,14,28,'AL',82988647383),
       (3,'Joaquim Cláudio Felipe Moraes','Travessa José Trajano',15664200243,13,25,'AP',96999851686),
       (4,'Enzo Leonardo Santos','Rua Litorânea',57195248275,15,29,'AM',92969311559),
       (5,'Daniela Nina da Conceição','Rua Monte de Jesus',80926125524,23,46,'BA',71988847960),
       (6,'Isaac Roberto Vinicius Campos','Rua Afonso Celso',58803922369,10,20,'CE',88981513708),
       (7,'Caroline Regina Rosângela Sales','Quadra CLN 403 Bloco C',38067705143,5,9,'DF',61997341653),
       (8,'Emanuel Samuel Ruan Aragão','Rua Maria de Lourdes Poyares Labuto',94542063704,27,54,'ES',28980705556),
       (9,'Noah Otávio Silveira','Avenida T 63',30380686163,11,21,'GO',62975609516),
       (10,'Adriana Daniela Nicole Jesus','Rua Heráclito Graça',58850544367,24,48,'MA',99987182217);


INSERT INTO vendedor
VALUES (1,'Brenda Stella Isabella Porto','Rua Manágua',84421927198,7,14,'MT',65976256080,'1967-10-14'),
       (2,'Sophia Alessandra Peixoto','Rua Maria do Carmo Ferro',12246355150,6,12,'MS',67983450273,'1992-04-13'),
       (3,'Julia Tatiane Ramos','Vila Casf',41348523409,2,3,'PA',93986232427,'1981-03-22'),
       (4,'Marina Agatha Elza Melo','Rua Coronel Antônio Ferreira',37037919420,12,23,'PB',83967720871,'1974-03-19'),
       (5,'Débora Pietra Pinto','Praça Hee Wing',56172928970,8,15,'PR',45998651573,'1996-01-19'),
       (6,'Noah Filipe Hugo Barbosa','Rua dos Jasmins',12739284403,20,40,'PE',45998651573,'1965-03-30'),
       (7,'Priscila Sophia Vera Ribeiro','Rua Matias Olímpio',97161463378,26,51,'PI',89995806542,'1977-04-18'),
       (8,'Caroline Andreia Emily Viana','Rua Santa Clara',58973277774,22,43,'RJ',21969610583,'1984-10-27'),
       (9,'Sara Sandra Louise dos Santos','Travessa Doutor Manoel Dantas',32885272430,16,31,'RN',84981505665,'1963-03-04'),
       (10,'Sophia Fernanda Antonella da Luz','Parque Moinhos de Vento',12328607004,18,35,'RS',53971348603,'1995-03-11'),
       (11,'Marcelo Carlos Bruno Martins','Avenida Farquar',31202963250,19,38,'RO',69981854147,'1966-12-17'),
       (12,'Erick Hugo Silva','Rua do Sabiá',76485303251,4,8,'RR',95999242414,'1955-08-27'),
       (13,'Yasmin Vera Moura','Servidão Coruja do Campo',41795777982,9,18,'SC',48971162008,'1970-09-21'),
       (14,'Heitor Augusto Roberto Gomes','Rua dos Pinheiros',88083795828,25,50,'SP',11979623904,'1955-11-04'),
       (15,'Alícia Emily Heloisa da Costa','Alameda Celi Prado de Oliveira',34279285519,1,2,'SE',79972083364,'1994-08-28');
