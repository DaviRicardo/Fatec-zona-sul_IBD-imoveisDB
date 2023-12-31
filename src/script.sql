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
    vendedor INTEGER DEFAULT NULL,
    bairro INTEGER NOT NULL,
    cidade INTEGER NOT NULL,
    sgEstado CHAR(2) NOT NULL,
    faixa INTEGER NOT NULL,
    oferta INTEGER DEFAULT NULL,
    nmEndereco VARCHAR(255) NOT NULL,
    nrAreaUtil VARCHAR(20) NOT NULL,
    nrAreaTotal VARCHAR(20) NOT NULL,
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
       (28,'Xapuri','AC'),
       (29,'Senador Guiomard','AC'),
       (30,'Arapiraca','AL'),
       (31,'Rio Largo','AL'),
       (32,'Santana','AP'),
       (33,'Porto Grande','AP'),
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
       (68,'Rorainópolis','RR'),
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
       (34,'Plano Diretor Norte',17,'TO'),
       (35,'Moinhos de Vento',18,'RS'),
       (36,'Bela Vista',18,'RS'),
       (37,'Caiari',19,'RO'),
       (38,'Olaria',19,'RO'),
       (39,'Boa Viagem',20,'PE'),
       (40,'Pina',20,'PE'),
       (41,'Loteamento Santa Luzia',21,'AC'),
       (42,'Portal da Amazônia',21,'AC'),
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
       (55,'Laranjal',28,'AC'),
       (56,'Cageacre',28,'AC'),
       (57,'João Rodrigues',29,'AC'),
       (58,'Democracia',29,'AC'),
       (59,'Baixão',30,'AL'),
       (60,'Capiatã',30,'AL'),
       (61,'Centro',31,'AL'),
       (62,'Tabuleiro do Pinto',31,'AL'),
       (63,'Nova Brasília',32,'AP'),
       (64,'Provedor I',32,'AP'),
       (65,'Centro',33,'AP'),
       (66,'Área 6',33,'AP'),
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
       (90,'Centro',45,'MA'),
       (91,'Cristo Rei',46,'MT'),
       (92,'Jardim Glória',46,'MT'),
       (93,'Vila Aurora',47,'MT'),
       (94,'Jardim Liberdade',47,'MT'),
       (95,'Jardim Água Boa',48,'MS'),
       (96,'Parque Alvorada',48,'MS'),
       (97,'Jardim Alvorada',49,'MS'),
       (98,'Jardim Cangalha',49,'MS'),
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
       (118,'Passagem das Pedras',59,'PI'),
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
       (134,'Setor 5',67,'RO'),
       (135,'Novo Horizonte',68,'RR'),
       (136,'Centro',68,'RR'),
       (137,'Santa Celília',69,'RR'),
       (138,'Centro',69,'RR'),
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
       (152,'Jardim Esplanada',76,'TO'),
       (153,'Setor Central',77,'TO'),
       (154,'Jardim Eldorado',77,'TO'),
       (155,'Cidade Nova',78,'PA'),
       (156,'Águas Lindas',78,'PA'),
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


INSERT INTO faixa_imovel
VALUES (1,'baixo',0,105000),
       (2,'médio',105001,180000),
       (3,'alto',180001,999999);


INSERT INTO imovel (idImovel, vendedor, bairro, cidade, sgEstado, nmEndereco, nrAreaUtil, nrAreaTotal, vlPreco, stVendido, dataLancto, faixa)
VALUES (1,1,1,1,'SE','Rua José Steremberg - Atalaia, Aracaju - SE, 49035-470','212m²','450m²',650000,'NÃO','2023-07-19',3),
       (2,2,2,1,'SE','Jardim de Londres, Alameda Espanha, 145 - Jardins, Aracaju - SE, 49026-106','212m²','450m²',850000,'NÃO','2023-03-26',3),
       (3,3,3,2,'PA','Rua Boaventura da Silva, 695 - Nazaré, Belém - PA, 66055-090','81m²','94m²',830000,'NÃO','2023-08-31',3),
       (4,4,4,2,'PA','Travessa Padre Eutíquio - Batista Campos, Belem - PA, 66035-045','132m²','250m²',621000,'NÃO','2023-08-31',3),
       (5,5,5,3,'MG','Avenida Cristóvão Colombo - Savassi, Belo Horizonte - MG, 30140-140','103m²','103m²',550000,'NÃO','2023-08-07',3),
       (6,6,6,3,'MG','Rua dos Guajajaras - Lourdes, Belo Horizonte - MG, 30180-101','90m²','196m²',450000,'NÃO','2023-02-14',3),
       (7,7,7,4,'RR','Avenida Ville Roy - Caçari, Boa Vista - RR, 69307-725','146,71m²','248,23m²',919000,'NÃO','2023-05-07',3),
       (8,8,8,4,'RR','Rua Mecejana - Macejana, Boa Vista - RR, 69304-031','100m²','100m²',400000,'NÃO','2023-09-03',3),
       (9,9,9,5,'DF','SQN 404 - Asa Norte, Brasilia - DF, 70845-000','79m²','79m²',690000,'NÃO','2023-08-15',3),
       (10,10,10,5,'DF','SQS 103 - Asa Sul, Brasilia - DF, 70342-000','95m²','37m²',485000,'NÃO','2022-09-21',3),
       (11,11,11,6,'MS','Rua Corá Coralina, 153 - Cidade Jardim, Campo Grande - MS, 79040-510','172m²','271 m²',950000,'NÃO','2023-08-25',3),
       (12,12,12,6,'MS','Rua Haddock Lobo - Tiradentes, Campo Grande - MS, 79041-350','160m²','360m²',720000,'NÃO','2023-09-08',3),
       (13,13,13,7,'MT','Avenida Dom Bosco - Goiabeiras, Cuiabá - MT, 78032-065','134m²','170m²',650000,'NÃO','2023-09-09',3),
       (14,14,14,7,'MT','Avenida Tancredo Neves - Jardim das Américas, Cuiabá - MT, 78098-235','148m²','162m²',870000,'NÃO','2022-10-13',3),
       (15,15,15,8,'PR','Rua Maranhão, 1002 - Água Verde, Curitiba - PR, 80610-000','40m²','80m²',363500,'NÃO','2023-07-06',3),
       (16,NULL,16,8,'PR','Rua Padre Ildefonso, 230 - Batel, Curitiba - PR, 80240-160','124m²','156m²',760000,'NÃO','2023-07-10',3),
       (17,NULL,17,9,'SC','Rua Sidney Nocetti, 23 - Agronômica, Florianópolis - SC, 88025-320','87m²','122m²',695000,'NÃO','2023-08-03',3),
       (18,NULL,18,9,'SC','Rua Eugênio Raulino da Silva, 13 - Campeche, Florianópolis - SC, 88063-255','110m²','172m²',990000,'NÃO','2023-07-21',3),
       (19,NULL,19,10,'CE','Rua Canuto de Aguiar, 391 - Meireles, Fortaleza - CE, 60160-120','165m²','210m²',950000,'NÃO','2023-07-15',3),
       (20,NULL,20,10,'CE','Avenida Santos Dumont - Aldeota, Fortaleza - CE, 60150-162','157m²','167m²',510000,'NÃO','2023-07-21',3),
       (21,NULL,21,11,'GO','Rua T 30, 000 - Setor Bueno, Goiânia - GO, 74215-060','105m²','129m²',650000,'NÃO','2022-12-04',3),
       (22,NULL,22,11,'GO','Rua 1141, 358 - Setor Marista, Goiânia - GO, 74180-081','68m²','72m²',630000,'NÃO','2023-03-22',3),
       (23,NULL,23,12,'PB','Rua João Câncio - Manaíra, João Pessoa - PB, 58038-342','29m²','58m²',469826,'NÃO','2022-10-29',3),
       (24,NULL,24,12,'PB','Avenida Antônio Lira, 536 - Tambaú, João Pessoa - PB, 58039-050','79m²','92m²',850000,'NÃO','2023-06-12',3),
       (25,NULL,25,13,'AP','Avenida Seis de Setembro - Santa Inês, Macapá - AP, 68901-520','300m²','300m²',960000,'NÃO','2023-09-11',3),
       (26,NULL,26,13,'AP','Avenida Raimundo Álvares da Costa, 1183 - Laguinho, Macapá - AP, 68900-074','170m²','170m²',500000,'NÃO','2021-11-20',3),
       (27,NULL,27,14,'AL','Avenida Senador Rui Palmeira - Ponta Verde, Maceió - AL, 57035-250','146m²','201m²',790000,'NÃO','2023-09-08',3),
       (28,NULL,28,14,'AL','Rua Comerciário José Pontes de Magalhães, 222 - Jatiúca, Maceió - AL, 57036-250','40m²','65m²',590000,'NÃO','2023-08-07',3),
       (29,NULL,29,15,'AM','Avenida Frederico Baird, Quinta das Marinas, 511 - Ponta Negra, Manaus - AM, 69037-144','150m²','247m²',749000,'NÃO','2023-06-11',3),
       (30,NULL,30,15,'AM','Rua Professor Márciano Armond, 416 - Adrianópolis, Manaus - AM, 69057-030','118m²','153m²',750000,'NÃO','2023-08-11',3),
       (31,NULL,31,16,'RN','Rua Tuiuti - Petrópolis, Natal - RN, 59014-160','147m²','256m²',490000,'NÃO','2023-08-31',3),
       (32,NULL,32,16,'RN','Rua Missionário Gunnar Vingren, 1904 - Capim Macio, Natal - RN, 59082-080', '109,97m²', '169m²', 838000,'NÃO','2023-07-13',3),
       (33,NULL,33,17,'TO','ARSO 42 (405 Sul) - Plano Diretor Sul, Palmas - TO','167m²','225m²',720000,'NÃO','2023-06-24',3),
       (34,NULL,34,17,'TO','Quadra 508 Norte 10 - Plano Diretor Norte, Palmas - TO','102m²','114m²',390000,'NÃO','2023-10-10', 3),
       (35,NULL,35,18,'RS','Rua Mostardeiro, 488 - Moinhos de Vento, Porto Alegre - RS, 90430-000','32m²','74m²',680000,'NÃO','2023-07-15',3),
       (36,NULL,36,18,'RS','Rua Anita Garibaldi, 360 - Bela Vista, Porto Alegre - RS, 90450-000','97m²','110m²',850000,'NÃO','2023-03-30',3),
       (37,NULL,37,19,'RO','Avenida Carlos Gomes - de 382/383 a 599/600 - Caiari, Porto Velho - RO, 76801-166','224m²','224m²',650000,'NÃO','2023-01-12',3),
       (38,NULL,38,19,'RO','Avenida Lauro Sodré - Olaria, Porto Velho - RO, 76801-284','114m²','150m²',895000,'NÃO','2023-06-11',3),
       (39,NULL,39,20,'PE','Avenida Boa Viagem - Boa Viagem, Recife - PE, 51020-000','120m²','201m²',780000,'NÃO','2023-09-03',3),
       (40,NULL,40,20,'PE','Avenida Antônio de Góes, 76 - Pina, Recife - PE, 51110-000','297m²','323m²',850000,'NÃO','2023-08-23',3),
       (41,NULL,41,21,'AC','Rua 1 - Loteamento Santa Luzia, Rio Branco - AC, 69903-416','72m²','120m²',90000,'NÃO','2023-10-12', 1),
       (42,NULL,42,21,'AC','Rua Paulo Lemos de Moura Leite - Portal da Amazônia, Rio Branco - AC, 69915-777','160m²','306m²',620000,'NÃO','2023-10-12',3),
       (43,NULL,43,22,'RJ','Rua Décio Vilares - Copacabana, Rio de Janeiro - RJ, 22041-040','80m²','80m²',890000,'NÃO','2023-10-6',3),
       (44,NULL,44,22,'RJ','Rua Francisco Otaviano - Ipanema, Rio de Janeiro - RJ, 22080-045','47m²','50m²',940000,'NÃO','2023-01-24',3),
       (45,NULL,45,23,'BA','Avenida Luís Viana Filho, 1416 - Alphaville I, Salvador - BA, 41701-005','48m²','48m²',397000,'NÃO','2023-07-16',3),
       (46,NULL,46,23,'BA','Rua Comendador Bernardo Catarino - Barra, Salvador - BA, 40130-040','70m²','70m²',490000,'NÃO','2023-07-14',3),
       (47,NULL,47,24,'MA','Rua das Mitras - Jardim Renascença, São Luís - MA, 65075-770','214m²','214m²',900000,'NÃO','2023-08-26',3),
       (48,NULL,48,24,'MA','Rua Aririzal, 10 - Cohama, São Luís - MA, 65067-197','77m²','77m²',400000,'NÃO','2023-08-18',3),
       (49,NULL,49,25,'SP','Avenida da Liberdade, 800 - Liberdade, São Paulo - SP, 01502-000','32m²','35m²',636000,'NÃO','2023-08-30',3),
       (50,NULL,50,25,'SP','Rua Alves Guimarães, 982 - Pinheiros, São Paulo, SP - 05410-000','85m²','85m²',650000,'NÃO','2023-08-30',3),
       (51,NULL,51,26,'PI','Avenida Senador Area Leão - Jóquei, Teresina - PI, 64049-110','103m²','103m²',850000,'NÃO','2023-08-24',3),
       (52,NULL,52,26,'PI','Rua Cinegrafista Marques - Fátima, Teresina - PI, 64049-510','228m²','360m²',750000,'NÃO','2023-09-24',3),
       (53,NULL,53,27,'ES','Rua Desembargador Sampaio - Praia do Canto, Vitória - ES, 29055-250','105m²','134m²',850000,'NÃO','2023-10-06',3),
       (54,NULL,54,27,'ES','Rua José Neves Cypreste - Jardim da Penha, Vitória - ES, 29060-300','64m²','70m²',470000,'NÃO','2023-09-01',3),
       (55,NULL,55,28,'AC','Laranjal, Xapuri - AC, 69930-000','174m²','360m²',280000,'NÃO','2023-09-06',3),
       (56,NULL,56,28,'AC','Rua da Azeitona - Cageacre, Xapuri - AC, 69930-000','14m²','14m²',100000,'NÃO','2023-08-21',1),
       (57,NULL,57,29,'AC','Rua Wanderley Dantas - João Rodrigues, Senador Guiomard - AC, 69925-000','180m²','180m²',60000,'NÃO','2023-10-04',1),
       (58,NULL,58,29,'AC','Democracia, Senador Guiomard - AC, 69925-000','250m²','250m²',50000,'NÃO','2023-10-09',1),
       (59,NULL,59,30,'AL','Avenida Miguel Correia Amorim de 830 ao fim, lado par - Baixão, Arapiraca - AL, 57305-495','240m²','240m²',380000,'NÃO','2023-08-30',3),
       (60,NULL,60,30,'AL','Rua Natalício Cavalcante Lima - Capiatã, Arapiraca - AL, 57310-210','193m²','193m²',395000,'NÃO','2023-08-24',3),
       (61,NULL,61,31,'AL','Loteamento Vila Rica, 15 - Centro, Rio Largo - AL','125m²','175m²',344999,'NÃO','2023-10-12',3),
       (62,NULL,62,31,'AL','Conjunto Residencial Margarida Procópio, 25 - Quadra Q, 0 - Tabuleiro do Pinto, Rio Largo - AL','102m²','127,5m²',125000,'NÃO','2023-09-27',2),
       (63,NULL,63,32,'AP','Travessa 1º de Maio - Nova Brasília, Santana - AP, 68927-305','152m²','152m²',250000,'NÃO','2023-08-06',3),
       (64,NULL,64,32,'AP','Rua General Ubaldo Figueira - Provedor I, Santana - AP, 68927-366','200m²','200m²',190000,'NÃO','2023-09-18',3),
       (65,NULL,65,33,'AP','Centro, Porto Grande - AP, 68999-000','160m²','160m²',200000,'NÃO','2023-09-19',3),
       (66,NULL,66,33,'AP','Área 6, Porto Grande - AP','35m²','420m²',8000,'NÃO','2023-10-15',1),
       (67,NULL,67,34,'AM','Vila Lindóia, Itacoatiara - AM, 69113-800','300m²','4500m²',350000,'NÃO','2023-07-30',3),
       (68,NULL,68,34,'AM','Rua Aldino Reis, 32 - São Cristóvão, Itacoatiara - AM, 69103-352','60m²','200m²',60000,'NÃO','2021-05-20',1),
       (69,NULL,69,35,'AM','Rua Joaquim de Melo - Nova Manacá, Manacapuru - AM, 69401-802','100m²','100m²',120000,'NÃO','2023-08-20',2),
       (70,NULL,70,35,'AM','Rua Jerusalém - Vale Verde, Manacapuru - AM, 669403-640','138m²','138m²',120000,'NÃO','2023-05-29',2),
       (71,NULL,71,36,'BA','Rua Arivaldo de Carvalho - Sobradinho, Feira de Santana - BA, 44021-225','220m²','220m²',790000,'NÃO','2023-03-26',3),
       (72,NULL,72,36,'BA','Rua Frei Caneca, 26 - Queimadinha, Feira de Santana - BA, 44050-388','230m²','230m²',350000,'NÃO','2023-05-21',3),
       (73,NULL,73,37,'BA','Rua Pastor Valdomiro Oliveira - Candeias, Vitória da Conquista - BA, 45028-742','68m²','69m²',259000,'NÃO','2023-03-16',3),
       (74,NULL,74,37,'BA','Avenida José Fernandes Pedral Sampaio - Felícia, Vitória da Conquista - BA, 45027-345','90m²','90m²',230000,'NÃO','2023-05-15',3),
       (75,NULL,75,38,'CE','Rua 321, 51 - Nova Metrópole (Jurema), Caucaia - CE, 61658-610','200m²','200m²',550000,'NÃO','2023-10-9',3),
       (76,NULL,76,38,'CE','Rua Jurupary - Parque Potira, Caucaia - CE','110m²','110m²',320000,'NÃO','2023-10-8',3),
       (77,NULL,77,39,'CE','Rua José Ilânio Couto Gondim, 100 - Lagoa Seca, Juazeiro do Norte - CE, 63040-58','97m²','6000m²',995000,'NÃO','2023-09-23',3),
       (78,NULL,78,39,'CE','Avenida Eduardo Mclain, 141 - Triângulo, Juazeiro do Norte - CE, 63041-175','104m²','104m²',900000,'NÃO','2023-01-13',3),
       (79,NULL,79,40,'ES','Rua Álvares Cabral, 12 - Laranjeiras, Serra - ES','120m²','300m²',670000,'NÃO','2023-03-16',3),
       (80,NULL,80,40,'ES','Avenida Desembargador Mário da Silva Nunes - Jardim Limoeiro, Serra - ES, 29164-044','82m²','82m²',499000,'NÃO','2023-08-14',3),
       (81,NULL,81,41,'ES','Avenida Hugo Musso - Praia da Costa, Vila Velha - ES, 29101-280','115m²','115m²',980000,'NÃO','2023-09-24',3),
       (82,NULL,82,41,'ES','Avenida Hugo Musso - Itapuã, Vila Velha - ES, 29101-786','80m²','80m²',600000,'NÃO','2023-08-18',3),
       (83,NULL,83,42,'GO','Rua da Fraternidade - Setor Garavelo, Aparecida de Goiânia - GO, 74930-510','88m²','180m²',345000,'NÃO','2023-09-25',3),
       (84,NULL,84,42,'GO','Rua Montese - Jardim Buriti Sereno, Aparecida de Goiânia - GO, 74943-680','106,97m²','217,98m²',350000,'NÃO','2023-08-09',3),
       (85,NULL,85,43,'GO','Avenida Maranhão - Jundiaí, Anápolis - GO, 75110-470','87m²','87m²',500000,'NÃO','2023-08-14',3),
       (86,NULL,86,43,'GO','Rua 19 - Lourdes, Anápolis - GO, 75095-780','180m²','180m²',390000,'NÃO','2023-10-3',3),
       (87,NULL,87,44,'MA','Rua Projetada C - Bacuri, Imperatriz - MA, 65916-120','230m²','230m²',280000,'NÃO','2023-06-23',3),
       (88,NULL,88,44,'MA','Rua Dom Cesário - Três Poderes, Imperatriz - MA, 65903-230','203m²','203m²',960000,'NÃO','2023-02-10',3),
       (89,NULL,89,45,'MA','Condomínio Bonavita Prime, Rua Tangara, 3 - Araçagy, São José de Ribamar - MA, 65110-000','62m²','62m²',235000,'NÃO','2023-09-28',3),
       (90,NULL,90,45,'MA','Avenida General Arthur Carvalho, 100 - Centro, São José de Ribamar - MA','123,33m²','164m²',690000,'NÃO','2023-08-23',3),
       (91,NULL,91,46,'MT','Avenida Brasil - Cristo Rei, Várzea Grande - MT, 78117-030','50m²','62m²',200000,'NÃO','2023-06-20',3),
       (92,NULL,92,46,'MT','Rua Feliciano Galdino (Lot Jd Panorama) - Glória, Várzea Grande - MT, 78140-150','145m²','360m²',260000,'NÃO','2023-04-12',3),
       (93,NULL,93,47,'MT','Edifício Macaúba, Avenida Sothero Silva, 739 -  Vila Aurora I, Rondonópolis - MT, 78740-018','140m²','172m²',550000,'NÃO','2023-07-12',3),
       (94,NULL,94,47,'MT','Rua São José - Jardim Liberdade, Rondonópolis - MT, 78715-740','160m²','270m²',480000,'NÃO','2023-10-11',3),
       (95,NULL,95,48,'MS','Rua Noca Dauzaker, 1375 - Jardim Água Boa, Dourados - MS, 79812-160','134m²','375m²',250000,'NÃO','2023-05-31',3),
       (96,NULL,96,48,'MS','Rua José Domingos Baldasso - Parque Alvorada, Dourados - MT, 79823-480','126m²','199m²',730000,'NÃO','2023-09-06',3),
       (97,NULL,97,49,'MS','Avenida Jary Mercante de 1001/1002 a 2199/2200 - Jardim Alvorada, Três Lagoas - MS, 79610-001','173m²','173m²',850000,'NÃO','2023-04-07',3),
       (98,NULL,98,49,'MS','Rua José Amim, 65 - Jardim Cangalha, Três Lagoas - MS, 79604-180','267m²','360m²',450000,'NÃO','2023-09-20',3),
       (99,NULL,99,50,'MG','Avenida Francisco Ribeiro - Santa Mônica, Uberlândia - MG, 38408-186','69m²','69m²',265000,'NÃO','2023-10-10',3),
       (100,NULL,100,50,'MG','Rua David Canabarro - Umuarama, Uberlândia - MG, 38405-303','55m²','55m²',250000,'NÃO','2023-10-05',3),
       (101,NULL,101,51,'MG','Rua Acácias - Eldorado, Contagem - MG, 32310-370','111m²','111m²',550000,'NÃO','2023-09-01',3),
       (102,NULL,102,51,'MG','Rua Rio Orenoco, 172 - Riacho das Pedras, Contagem - MG, 32280-420','224m²','224m²',650000,'NÃO','2023-01-04',3),
       (103,NULL,103,52,'PB','Rua Valdemira Emília Pinto, 76 - Catolé, Campina Grande - PB, 58410-460','170m²','183m²',360000,'NÃO','2023-09-27',3),
       (104,NULL,104,52,'PB','Rua Carlos Gomes, 100 - José Pinheiro, Campina Grande - PB, 58407-346','96m²','108m²',174440,'NÃO','2023-09-24',2),
       (105,NULL,105,53,'PB','Loteamento shalom - Várzea Nova, Santa Rita - PB, 58304-500','84,92m²','84,92m²',210000,'NÃO','2023-09-18',3),
       (106,NULL,106,53,'PB','Rua Dom Adauto - Popular, Santa Rita - PB, 58301-200','125m²','125m²',90000,'NÃO','2023-09-14',1),
       (107,NULL,107,54,'PR','Avenida Gil de Abreu Souza, 5000 - Esperança, Londrina - PR, 86058-100','125m²','125m²',980000,'NÃO','2023-07-01',3),
       (108,NULL,108,54,'PR','Rua Pedro Faria - Gleba Fazenda Palhano, Londrina - PR, 86055-250','74m²','111m²',649000,'NÃO','2023-08-06',3),
       (109,NULL,109,55,'PR','Rua Rui Barbosa - Zona 07, Maringá - PR, 87020-090','98m²','98m²',620000,'NÃO','2023-05-21',3),
       (110,NULL,110,55,'PR','Rua Amazonas - Jardim Alvorada, Maringá - PR, 87033-340','150m²','220m²',550000,'NÃO','2023-09-18',3),
       (111,NULL,111,56,'PE','Avenida Bernardo Vieira de Melo, 5604, 1402 - Candeias, Jaboatão dos Guararapes - PE, 54430-770','150m²','235m²',800000,'NÃO','2023-09-27',3),
       (112,NULL,112,56,'PE','Avenida Nossa Senhora do Loreto, 1036 - Piedade, Jaboatão dos Guararapes - PE, 54420-200','162,80m²','162,80m²',900000,'NÃO','2023-09-26',3),
       (113,NULL,113,57,'PE','Avenida Ministro Marcos Freire, 2258 - Casa Caiada, Olinda - PE, 53130-540','201m²','288m²',900000,'NÃO','2023-05-06',3),
       (114,NULL,114,57,'PE','Rua Professor José Cândido Pessoa, 1445 - Bairro Novo, Olinda - PE, 53030-020','111,17m²','164,61m²',650000,'NÃO','2023-07-13',3),
       (115,NULL,115,58,'PI','Loteamento Morada dos Ventos - Sabiazal, Parnaíba - PI, 64212-722','128m²','200m²',465000,'NÃO','2023-09-24',3),
       (116,NULL,116,58,'PI','Parnaíba Residence - João XXIII, Parnaíba - PI, 64205-455','171m²','250m²',950000,'NÃO','2023-07-17',3),
       (117,NULL,117,59,'PI','Rua Lírio Balduíno - Junco, Picos - PI, 64607-685','85m²','85m²',80000,'NÃO','2023-09-11',1),
       (118,NULL,118,59,'PI','Loteamento Belo Sul - Passagem das Pedras, Picos - PI, 64600-466','110m²','110m²',250000,'NÃO','2023-10-04',3),
       (119,NULL,119,60,'RJ','Estrada dos Menezes, L07D4  - Alcântara, São Gonçalo - RJ, 24710-095','45m²','45m²',248990,'NÃO','2023-08-27',3),
       (120,NULL,120,60,'RJ','Avenida José Mendonça de Campos, 402 - Mutondo, São Gonçalo - RJ, 24450-265','60m²','60m²',295000,'NÃO','2023-08-18',3),
       (121,NULL,121,61,'RJ','Rua Fátima 75 - Saracuruna, Duque de Caxias - RJ','198m²','440m²',330000,'NÃO','2023-08-23',3),
       (122,NULL,122,61,'RJ','Alameda Américo Campos, 100 - Jardim Primavera, Duque de Caxias - RJ, 25215-300','56m²','61m²',369150,'NÃO','2023-09-23',3),
       (123,NULL,123,62,'RN','Rua Luiz Pereira - Nova Betânia, Mossoró - RN, 59612-020','173m²','173m²',850000,'NÃO','2023-09-08',3),
       (124,NULL,124,62,'RN','Rua Miro Felipe de Mendonça - Alto de São Manoel, Mossoró - RN, 59633-010','85m²','180m²',200000,'NÃO','2023-08-23',3),
       (125,NULL,125,63,'RN','Rua Samaúma, 15 - Nova Parnamirim, Parnamirim - RN, 59150-770','87m²','87m²',335000,'NÃO','2023-07-17',3),
       (126,NULL,126,63,'RN','Rua Aeroporto Cataratas do Iguaçu - Emaús, Parnamirim - RN, 59149-300','131,69m²','200m²',370000,'NÃO','2023-07-10',3),
       (127,NULL,127,64,'RS','Rua Medianeira, 201 - São Pelegrino, Caxias do Sul - RS','102m²','119m²',720000,'NÃO','2023-10-11',3),
       (128,NULL,128,64,'RS','Rua Luiz Gastaldello, 100 - Pioneiro, Caxias do Sul - RS, 95042-400','100m²','360m²',319020,'NÃO','2023-09-23',3),
       (129,NULL,129,65,'RS','Rua Tamoio - Niterói, Canoas - RS, 92120-001','100m²','100m²',600000,'NÃO','2023-08-30',3),
       (130,NULL,130,65,'RS','Rua dos Guaramirins - Igara, Canoas - RS, 92412-520','86m²','86m²',289000,'NÃO','2023-09-12',3),
       (131,NULL,131,66,'RO','Avenida Aracaju de 400 a 676 (lado par) - Riachuelo, Ji-Paraná - RO, 76913-780','80m²','175m²',230000,'NÃO','2023-07-05',3),
       (132,NULL,132,66,'RO','Rua Manoel Franco, de 776/777 a 1176/1177 - Nova Brasília, Ji-Paraná - RO, 76908-442','181m²','181m²',780000,'NÃO','2023-10-11',3),
       (133,NULL,133,67,'RO','Setor 2, Ariquemes - RO','175m²','474m²',940000,'NÃO','2023-08-28',3),
       (134,NULL,134,67,'RO','Rua Minas Gerais, até 3356/3357 - Setor 05, Ariquemes - RO, 76870-652','230m²','360m²',970000,'NÃO','2023-09-24',3),
       (135,NULL,135,68,'RR','Rua Aracaju - Novo Horizonte, Rorainópolis - RR, 69373-000','150m²','360m²',400000,'NÃO','2023-10-13',3),
       (136,NULL,136,68,'RR','Centro, Rorainópolis - RR, 69373-000','63m²','63m²',75000,'NÃO','2023-10-04',1),
       (137,NULL,137,69,'RR','Santa Cecília, Cantá - RR, 69395-000','234,51m²','487,50m²',350000,'NÃO','2023-08-12',3),
       (138,NULL,138,69,'RR','Centro, Cantá - RR, 69390-000','375m²','375m²',75000,'NÃO','2023-09-27',1),
       (139,NULL,139,70,'SC','Rua Piratuba, 299 - Iririú, Joinville - SC, 89227-075','119,32m²','156m²',460000,'NÃO','2023-10-11',3),
       (140,NULL,140,70,'SC','Rua Dona Francisca, 2851 - Saguaçu, Joinville - SC, 89221-008','69,59m²','70m²',619551,'NÃO','2023-10-11',3),
       (141,NULL,141,71,'SC','Rua São Paulo, 1750 - Itoupava Seca, Blumenau - SC, 89030-001','91m²','170,16m²',600000,'NÃO','2023-07-31',3),
       (142,NULL,142,71,'SC','Rua Almirante Barroso, 721 - Vila Nova, Blumenau - SC, 89035-401','74m²','94m²',699000,'NÃO','2023-10-11',3),
       (143,NULL,143,72,'SP','Rua Sapucaia, 61 - Vila Galvão, Guarulhos - SP','88m²','88m²',590000,'NÃO','2023-08-02',3),
       (144,NULL,144,72,'SP','Rua das Palmeiras - Gopoúva, Guarulhos - SP, 07022-000','81m²','81m²',596000,'NÃO','2023-05-25',3),
       (145,NULL,145,73,'SP','Rua Ferreira Penteado, 1552, 14 - Cambuí, Campinas - SP, 13025-357','100m²','100m²',745000,'NÃO','2023-09-09',3),
       (146,NULL,146,73,'SP','Rua Piquete, 300 - Nova Campinas, Campinas - SP','73m²','73m²',885000,'NÃO','2023-09-22',3),
       (147,NULL,147,74,'SE','RUA 07 MARCOS FREIRE 2,44,BL RUBI AP 502, Taiçoca de Fora, Nossa Senhora do Socorro','46m²','46m²',119000,'NÃO','2023-07-07',2),
       (148,NULL,148,74,'SE','Albano Franco, Nossa Senhora do Socorro - SE','160m²','160m²',280000,'NÃO','2023-09-02',3),
       (149,NULL,149,75,'SE','Avenida Doutor José Milton Machado - São Cristóvão, Itabaiana - SE, 49500-442','147m²','147m²',180000,'NÃO','2023-09-22',2),
       (150,NULL,150,75,'SE','Rua José Pereira de Jesus - Marcela, Itabaiana - SE, 49502-052','110m²','154m²',170000,'NÃO','2023-09-04',2),
       (151,NULL,151,76,'TO','Avenida Castelo Branco - Setor Central, Araguaína - TO, 77805-110','670m²','670m²',220000,'NÃO','2023-03-31',3),
       (152,NULL,152,76,'TO','Avenida Salomão Cardoso - Jardim Esplanada, Araguaína - TO, 77817-190','240m²','240m²',630000,'NÃO','2023-10-12',3),
       (153,NULL,153,77,'TO','Avenida Maranhão - Setor Central, Gurupi - TO, 77410-020','342m²','750m²',750000,'NÃO','2023-09-11',3),
       (154,NULL,154,77,'TO','Rua 6 - Jardim Eldorado, Gurupi - TO, 77403-260','168m²','360m²',290000,'NÃO','2023-04-14',3),
       (155,NULL,155,78,'PA','Travessa WE-29, 551 - Cidade Nova, Ananindeua - PA, 67133-120','398m²','398m²',530000,'NÃO','2023-02-03',3),
       (156,NULL,156,78,'PA','Rodovia BR-316, 5010 - Km 5 - Águas Lindas, Ananindeua - PA, 67020-000','62m²','62m²',320000,'NÃO','2023-01-19',3),
       (157,NULL,157,79,'PA','Travessa Natal - Aeroporto Velho, Santarém - PA, 68020-050','240m²','336m²',900000,'NÃO','2023-04-16',3),
       (158,NULL,158,79,'PA','Avenida Rui Barbosa, 2935 - Aldeia, Santarém - PA, 68040-032','95m²','95m²',630000,'NÃO','2023-09-01',3);


INSERT INTO oferta
VALUES (1,1,1,650000,'2023-07-19'),
       (2,2,1,850000,'2023-03-26'),
       (3,3,1,830000,'2023-08-31'),
       (4,4,1,621000,'2023-08-31'),
       (5,5,1,550000,'2023-08-07'),
       (6,6,2,450000,'2023-02-14'),
       (7,7,2,919000,'2023-05-07'),
       (8,8,2,400000,'2023-09-03'),
       (9,9,2,690000,'2023-08-15'),
       (10,10,2,485000,'2022-09-21'),
       (11,11,3,950000,'2023-08-25'),
       (12,12,3,720000,'2023-09-08'),
       (13,13,3,650000,'2023-09-09'),
       (14,14,3,870000,'2022-10-13'),
       (15,15,3,363500,'2023-07-06'),
       (16,16,4,760000,'2023-07-10'),
       (17,17,4,695000,'2023-08-03'),
       (18,18,4,990000,'2023-07-21'),
       (19,19,4,950000,'2023-07-15'),
       (20,20,4,510000,'2023-07-21'),
       (21,21,5,650000,'2022-12-04'),
       (22,22,5,630000,'2023-03-22'),
       (23,23,5,469826,'2022-10-29'),
       (24,24,5,850000,'2023-06-12'),
       (25,25,5,960000,'2023-09-11'),
       (26,26,6,500000,'2021-11-20'),
       (27,27,6,790000,'2023-09-08'),
       (28,28,6,590000,'2023-08-07'),
       (29,29,6,749000,'2023-06-11'),
       (30,30,6,750000,'2023-08-11'),
       (31,31,7,490000,'2023-08-31'),
       (32,32,7,838000,'2023-07-13'),
       (33,33,7,720000,'2023-06-24'),
       (34,34,7,390000,'2023-10-10'),
       (35,35,7,680000,'2023-07-15'),
       (36,36,8,850000,'2023-03-30'),
       (37,37,8,650000,'2023-01-12'),
       (38,38,8,895000,'2023-06-11'),
       (39,39,8,780000,'2023-09-03'),
       (40,40,8,850000,'2023-08-23'),
       (41,41,9,90000,'2023-10-12'),
       (42,42,9,620000,'2023-10-12'),
       (43,43,9,890000,'2023-10-6'),
       (44,44,9,940000,'2023-01-24'),
       (45,45,9,397000,'2023-07-16'),
       (46,46,10,490000,'2023-07-14'),
       (47,47,10,900000,'2023-08-26'),
       (48,48,10,400000,'2023-08-18'),
       (49,49,10,636000,'2023-08-30'),
       (50,50,10,650000,'2023-08-30');


UPDATE imovel
SET oferta =
        CASE
            WHEN idImovel = 1 THEN 1
            WHEN idImovel = 2 THEN 2
            WHEN idImovel = 3 THEN 3
            WHEN idImovel = 4 THEN 4
            WHEN idImovel = 5 THEN 5
            WHEN idImovel = 6 THEN 6
            WHEN idImovel = 7 THEN 7
            WHEN idImovel = 8 THEN 8
            WHEN idImovel = 9 THEN 9
            WHEN idImovel = 10 THEN 10
            WHEN idImovel = 11 THEN 11
            WHEN idImovel = 12 THEN 12
            WHEN idImovel = 13 THEN 13
            WHEN idImovel = 14 THEN 14
            WHEN idImovel = 15 THEN 15
            WHEN idImovel = 16 THEN 16
            WHEN idImovel = 17 THEN 17
            WHEN idImovel = 18 THEN 18
            WHEN idImovel = 19 THEN 19
            WHEN idImovel = 20 THEN 20
            WHEN idImovel = 21 THEN 21
            WHEN idImovel = 22 THEN 22
            WHEN idImovel = 23 THEN 23
            WHEN idImovel = 24 THEN 24
            WHEN idImovel = 25 THEN 25
            WHEN idImovel = 26 THEN 26
            WHEN idImovel = 27 THEN 27
            WHEN idImovel = 28 THEN 28
            WHEN idImovel = 29 THEN 29
            WHEN idImovel = 30 THEN 30
            WHEN idImovel = 31 THEN 31
            WHEN idImovel = 32 THEN 32
            WHEN idImovel = 33 THEN 33
            WHEN idImovel = 34 THEN 34
            WHEN idImovel = 35 THEN 35
            WHEN idImovel = 36 THEN 36
            WHEN idImovel = 37 THEN 37
            WHEN idImovel = 38 THEN 38
            WHEN idImovel = 39 THEN 39
            WHEN idImovel = 40 THEN 40
            WHEN idImovel = 41 THEN 41
            WHEN idImovel = 42 THEN 42
            WHEN idImovel = 43 THEN 43
            WHEN idImovel = 44 THEN 44
            WHEN idImovel = 45 THEN 45
            WHEN idImovel = 46 THEN 46
            WHEN idImovel = 47 THEN 47
            WHEN idImovel = 48 THEN 48
            WHEN idImovel = 49 THEN 49
            WHEN idImovel = 50 THEN 50
            ELSE oferta
            END
WHERE idImovel BETWEEN 1 AND 50;