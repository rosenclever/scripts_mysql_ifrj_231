
-- criar a tabela cliente
create table clientes(
    id int not null auto_increment,
    nome varchar(100) not null,
    email varchar(100) not null,
    constraint clientes_pk primary key(id)
);

alter table clientes
add uf char(2) default 'RJ';

alter table clientes
add dia_niver int,
add mes_niver int;

-- para excluir uma coluna
alter table clientes 
drop  dia_niver;

alter table clientes
add constraint clientes_dia_niver_ck check(dia_niver >= 1 and dia_niver <= 31),
add constraint clientes_mes_niver_ck check(mes_niver >= 1 and mes_niver <= 12);

alter table clientes
modify uf varchar(2);

alter table clientes
change uf estado char(2);

alter table clientes
drop estado;

alter table clientes rename parceiros;

create database academico;
use academico;
create table instituicoes(
    id int not null,
    constraint instituicoes_pk primary key(id),
    nome varchar(100) not null,
    email varchar(100) not null,
    constraint instituicoes_nome_uq unique(email)
);

alter table instituicoes
    add uf char(2) default 'RJ';

create table professores(
    prof_matr numeric(6) not null,
    prof_nome varchar(100) not null,
    prof_email varchar(150) not null,
    prof_salario decimal(18,2),
    constraint professores_prof_matr_pk
        primary key(prof_matr),
    constraint professores_prof_email_uq
        unique(prof_email),
    constraint professores_prof_salario_ck
        check(prof_salario > 700)
);

alter table professores
modify prof_matr int(6);

alter table professores
add dia_niver int,
add mes_niver int;

desc professores;

alter table professores
add constraint professores_dia_niver_ck
    check(dia_niver >= 1 and dia_niver <= 31),
add constraint professores_mes_niver_ck
    check(mes_niver >= 1 and mes_niver < 13),
add prof_cep char(9);

desc professores;
