use `loja_virtual`;

create table tb_usuario (
	id int auto_increment,
    nome varchar(100) not null,
    email varchar(255) not null,
    senha varchar(12) not null,
    primary key tb_usuario_id_pk (id)
);

create table tb_upload (
	id int auto_increment,
    nome varchar(20) not null,
	primary key tb_upload_id_pk (id)
);

create table tb_frase_motivadora(
	id int auto_increment,
    frase varchar(200) not null,
    primary key (id)
);

insert into tb_frase_motivadora(frase) values ('Se voce ja esta no fundo do poço passar disso não passa'),
('Nem tudo esta perdido so ter fé'), ('o dia ta ruim não esquenta pode piorar :D'), ('FALA GALEEEERA, Não bata no seu amiguinho'),
('BOM DIA, a mensagem mais odiada do planeta, culpem as tias');

alter table tb_usuario
modify senha varchar(32) not null;

truncate table tb_usuario;

insert into tb_usuario (nome, email, senha)
values ('Administrador', 'adm@senac.com.br', md5('123'));

select * from tb_usuario;

