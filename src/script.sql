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
    nrCpfComprador NUMERIC(11) UNIQUE,
    cidade INTEGER NOT NULL,
    bairro INTEGER NOT NULL,
    sgEstado CHAR(2) NOT NULL,
    telComprador INTEGER NOT NULL,
    FOREIGN KEY (cidade) REFERENCES cidade(idCidade),
    FOREIGN KEY (bairro) REFERENCES bairro(idBairro),
    FOREIGN KEY (sgEstado) REFERENCES estado(sgEstado)
);


CREATE TABLE IF NOT EXISTS vendedor (
    idVendedor INTEGER NOT NULL PRIMARY KEY,
    nmVendedor VARCHAR(50) NOT NULL,
    nmEndereco VARCHAR(50) NOT NULL,
    nrCpf NUMERIC(11) UNIQUE,
    cidade INTEGER NOT NULL,
    bairro INTEGER NOT NULL,
    sgEstado CHAR(2) NOT NULL,
    telefone INTEGER NOT NULL,
    dataNasc DATE NOT NULL,
    FOREIGN KEY (cidade) REFERENCES cidade(idCidade),
    FOREIGN KEY (bairro) REFERENCES bairro(idBairro),
    FOREIGN KEY (sgEstado) REFERENCES estado(sgEstado)
);


CREATE TABLE IF NOT EXISTS imovel (
    idImovel INTEGER NOT NULL PRIMARY KEY,
    vendedor INTEGER NOT NULL,
    bairro INTEGER NOT NULL,
    cidade INTEGER NOT NULL,
    sgEstado CHAR(2) NOT NULL,
    nmEndereco VARCHAR(255) NOT NULL,
    nrAreaUtil FLOAT NOT NULL,
    nrAreaTotal FLOAT NOT NULL,
    vlPreco FLOAT NOT NULL,
    oferta INTEGER NOT NULL,
    stVendido VARCHAR(20),
    dataLancto DATE NOT NULL
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


CREATE TABLE IF NOT EXISTS faixa_imovel (
    idFaixa INTEGER NOT NULL PRIMARY KEY,
    nmFaixa VARCHAR(50) NOT NULL,
    vlMinimo FLOAT NOT NULL,
    vlMaximo FLOAT NOT NULL
);


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
       (68,'Rorainópolis','RR'),
       (69,'Caracaraí','RR'),
       (70,'Joinville','SC'),
       (71,'Blumenau','SC'),
       (72,'Guarulhos','SP'),
       (73,'Campinas','SP'),
       (74,'Nossa Senhora do Socorro','SE'),
       (75,'Itabaiana','SE'),
       (76,'Araguína','TO'),
       (77,'Gurupi','TO');