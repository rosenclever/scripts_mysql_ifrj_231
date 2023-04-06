
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

use  bancodb_licomp_231;
alter table parceiros rename clientes;

insert into clientes(nome, email)
values('Pedro', 'comecaP@gmail.com');

insert into clientes
values(2, 'Ana', 'ana@gmail.com', null, null);

insert into clientes(nome, email)
values('Maria', 'teste@email.com');

insert into clientes(nome, email)
values('Letícia', 'teste@email.com'),
('Zico', 'zico@email.com');

update clientes
set email = 'teste@email.com';

update clientes
set email = 'zico@email.com'
where id = 5;

update clientes
set email = 'ana@gmail.com'
where nome like 'ana';

insert into clientes(nome, email)
values('Paulo', '.');

select * from clientes;

update clientes
set email = 'comecaP@gmail.com'
where nome like 'p%';

select * from clientes;

-- modifique a tabela clientes de modo a atender as especificações a seguir:
-- altere o dia do aniversário de todos os clientes cujo id seja superior a 3 para 7
update clientes
set dia_niver = 7
where id > 3;
-- altere o mes aniversário de todos os clientes que possuem a letra E em seu nome para 10
update clientes
set mes_niver = 10
where nome like '%e%';
-- altere o dia e mês de aniversário de todos os clientes que tenham o nome iniciado em A ou Z para dia: 14 e mês 04
update clientes
set dia_niver = 14, mes_niver = 4
where nome like 'A%' or nome like 'Z%';
-- liste o conteúdo da tabela

create table bancos(
    numero int not null,
    nome varchar(100) not null,
    constraint bancos_pk primary key(numero)
);

create table agencias(
    numero varchar(100) not null,
    nome varchar(100) not null,
    telefone int not null,
    banco int not null,
    constraint agencias_pk primary key (numero)
);

alter table bancos
add constraint bancos_nome_uq unique(nome);

alter table agencias
add constraint agencias_nome_uq unique(nome),
add constraint agencias_telefone_uq unique(telefone),
add constraint agencias_banco_fk
    foreign key(banco) references bancos(numero);

-- alterar o campo numero da tabela agências para integer
alter table agencias
modify numero int;
