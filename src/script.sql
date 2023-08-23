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