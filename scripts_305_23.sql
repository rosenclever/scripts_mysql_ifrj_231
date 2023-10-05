
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


alter table clientes
add constraint clientes_dia_niver_ck check(dia_niver >= 1 and dia_niver <= 31),
add constraint clientes_mes_niver_ck check(mes_niver >= 1 and mes_niver <= 12);

alter table clientes
modify uf varchar(2);

alter table clientes
change uf estado char(2);

alter table clientes
drop estado;

alter table clientes
rename parceiros;

-- fixação - correção
create database academico_305_23;

use academico_305_23;

create table instituicoes(
    id integer not null,
    constraint instituicoes_pk 
        primary key(id),
    nome varchar(100) not null,
    email varchar(100) not null,
    constraint instituicoes_email_uq
        unique(email)
);

create table professores(
	prof_matr numeric(6) not null,
    constraint professores_pk
		primary key (prof_matr),
	prof_nome varchar(100) not null,
    prof_email varchar(150) not null,
    constraint prof_email_uq unique(prof_email),
    prof_salario numeric(18,2),
    constraint prof_sal_ck
		check(prof_salario > 700)
);

alter table professores
add dia_niver int,
add mes_niver int;

desc professores;

alter table professores
add constraint prof_dia_ck
	check(dia_niver >=1 and dia_niver <=31),
add constraint prof_mes_ck
	check(mes_niver >=1 and mes_niver <13);

alter table professores
add prof_cep char(9);

alter table parceiros rename to clientes;

create table contas(
	id int not null auto_increment,
    constraint contas_pk primary key(id),
    idcliente int not null,
    constraint contas_clientes_fk
		foreign key(idcliente)
        references clientes(id),
	tipo varchar(20) not null,
    saldo decimal(18,2) not null,
    limite decimal(18,2) not null
);

select * from clientes;

insert into clientes(nome, email, dia_niver, mes_niver)
values('Ana', 'ana@gmail.com', 30, 7);
insert into clientes(nome, email, dia_niver, mes_niver)
values('Pedro', 'comecaP@gmail.com', 26, 4),
('Zico', 'zico@gmail.com', 17, 12);

insert into contas(idcliente, tipo, limite, saldo)
values(3, 'Corrente Comum', 1000, 3000);
insert into contas(idcliente, tipo, limite, saldo)
values(1, 'Poupanca', 100, 2000),
(2, 'Corrente Especial', 500, 1500);

select * from contas;

desc instituicoes;
alter table instituicoes
add ins_telefone varchar(14);

create table cursos(
	cur_id int not null,
    constraint cursos_pk primary key(cur_id),
    cur_nome varchar(45) not null,
    cur_instituicao int not null,
     constraint cursos_instituicoes_fk
		foreign key(cur_instituicao)
        references instituicoes(id)
);

create table turmas(
	tur_cod int not null,
    constraint turmas_pk primary key(tur_cod),
    tur_identificacao varchar(10) not null,
    tur_ano int not null,
    tur_semestre int not null,
    tur_curso int not null,
    constraint tumas_cursos_fk
		foreign key(tur_curso)
		references cursos(cur_id)
);

create table alunos(
	alu_id int not null,
    constraint alunos_pk primary key(alu_id),
    alu_nome varchar(45) not null,
    alu_numero int,
    alu_matricula int
);

create table matriculas(
	mat_ano int not null,
    mat_semestre int not null,
    mat_aluno int not null,
    constraint matriculas_alunos_fk
		foreign key(mat_aluno)
        references alunos(alu_id),
	mat_turma int not null,
    constraint matriculas_turmas_fk
		foreign key(mat_turma)
        references turmas(tur_cod),
	constraint matriculas_pk
		primary key(mat_aluno, mat_semestre, mat_ano, mat_turma)
);

select * from clientes;

insert into clientes(nome, email, dia_niver, mes_niver)
values('Maria', 'teste@mail.com', 17, 01),
('Leticia', 'teste@mail.com', 26, 02);

update clientes
set email = 'novoemail@mail.com'
where nome = 'Maria';

alter table clientes
add constraint clientes_email_uq unique(email);

select * from contas;

update contas 
set limite=2000
where tipo = 'Corrente Comum';

update contas
set saldo = 4000
where tipo like '%Pou%';

insert into clientes(nome, email, dia_niver, mes_niver)
values('Rosen', 'rosenclever@ig.com.br', 7, 10);

select * from clientes;

update contas
set idcliente = 6
where tipo like '%especial%';

desc instituicoes;
alter table instituicoes
add uf char(2);

insert into instituicoes(id, nome, email, uf)
values(1, 'XPTO', 'xpto@email.com', 'BA'),
(2, 'House Software', 'housesoft@hack.mail.com', 'RJ'),
(3, 'Movies Studios', 'mv@films.org', 'RS'),
(4,'Enhancements Worker', 'workerenhancements@mail.com', 'SP');
select * from instituicoes;

update instituicoes
set uf = 'CE', email = 'xptoce@mail.net'
where nome = 'xpto';