
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
