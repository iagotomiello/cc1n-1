create database Atividade_01;

use Atividade_01;

create table if not exists pacientes(
CPF_paciente varchar(15) auto_increment primary key,
nome varchar(45) NOT null,
data_nasc date not null,
telefone varchar(45) not null,
email varchar(45) NOT NULL
);

create table if not exists departamentos(
cod_especialidade int auto_increment primary key,
nome_especialidade varchar(45) not null
);

create table if not exists medicos(
CRM int auto_increment,
UF char(2) not null,
nome varchar(45) not null,
email varchar(45) not null,
telefone varchar(45) not null,
cod_dep int not null,
primary key(CRM,UF),
constraint DEP_MED foreign key(cod_dep) references departamentos(cod_especialidade)
);

create table if not exists consultas(
id_cons int auto_increment,
anamnese text not null,
_data date not null,
hora time not null,
cpf_pac varchar(15) not null,
CRM_CONS int not null,
UF_CONS char(2) not null,
primary key(id_cons),
constraint MED_CONS foreign key (CRM_CONS,UF_CONS) references medicos(CRM,UF),
constraint MED_PAC foreign key (cpf_pac) references pacientes(CPF_paciente)
);
