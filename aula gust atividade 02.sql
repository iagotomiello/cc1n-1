create database if not exists Atividade_02;

use Atividade_02;

create table if not exists passageiros(
cod_passageiro varchar(45),
nome varchar(20) not null,
sobrenome varchar(45) not null,
data_nasc date not null,
nacionalidade varchar(45) not null,
primary key (cod_passageiro)
);

create table if not exists reservas_de_voo(
cod_reserva int,
data_reserva varchar (45) not null,
forma_pagamento enum("dinheiro", "pix", "credito", "debito") not null,
valor_total decimal not null,
primary key (cod_reserva)
);

create table if not exists aeroportos(
cod_aeroporto varchar (45),
primary key (cod_aeroporto)
);

create table if not exists cias_aereas(
id_cia int auto_increment,
nome varchar (45) not null,
cnpj varchar(45) not null,
primary key (id_cia)
);

create table if not exists passageiros_reservas(
CodPassageiro varchar (45),
ReservasVoo int auto_increment,
primary key (CodPassageiro, ReservasVoo),
constraint passageiros_passageiros_reservas foreign key (CodPassageiro) references passageiros(cod_passageiro),
constraint reservas_de_voo_passageiros_reservas foreign key (ReservasVoo) references reservas_de_voo(cod_reserva)
);

create table if not exists aeronave(
cod_aeronave int,
modelo varchar (45) not null,
fabricante varchar (45) not null,
ano year not null,
quantidade_assento int not null,
cia_id int not null,
primary key (cod_aeronave),
constraint cias_aereas_aeronave foreign key (cia_id) references cias_aereas(id_cia)
);

create table if not exists voos(
id_voo int,
assento varchar (45),
data_partida date not null,
data_chegada_prev date not null,
hora_partida time not null,
hora_chegada_prev time not null,
aeronave_cod int not null,
aeroporto_cod_partida varchar (45) not null,
aeroporto_cod_chegada varchar (45) not null,
cia_id int not null,
primary key (id_voo, assento),
constraint aeronave_voos foreign key (aeronave_cod) references aeronave(cod_aeronave),
constraint aeroportos_01 foreign key (aeroporto_cod_partida) references aeroportos(cod_aeroporto),
constraint aeroportos_02 foreign key (aeroporto_cod_chegada) references aeroportos(cod_aeroporto),
constraint cias_aereas_voos foreign key (cia_id) references cias_aereas(id_cia)
);

create table if not exists voos_reservas(
voo_id int,
cod_assento varchar (45),
id_reserva int,
primary key (voo_id, cod_assento, id_reserva),
constraint voos_reservas foreign key (voo_id, cod_assento) references voos(id_voo, assento),
constraint reservas_voos foreign key (id_reserva) references reservas_de_voo(cod_reserva)
);

