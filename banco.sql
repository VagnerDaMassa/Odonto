use Odonto;
/*
drop table tb_usuario;

drop table tb_funcionarios;

drop table tb_cargos;

drop table tb_procedimento;

drop table tb_consulta;

drop table tb_consultorio;

drop table tb_Agendamento;

SET FOREIGN_KEY_CHECKS = 1;
*/

ALTER TABLE tb_Usuario
    CHANGE nome paciente VARCHAR(20) NOT NULL;
    
ALTER TABLE tb_Funcionarios
    CHANGE nome Funcionario VARCHAR(20) NOT NULL;

desc tb_Usuario;

create table tb_Usuario(
  id_Usuario int auto_increment,
  nome varchar(20) not null,
  dataNascimento date not null,
  Email varchar(25) not null,
  Telefone varchar(15) not null,
  Celular varchar(15) not null,
  primary key(id_Usuario)
);


create table tb_Funcionarios(
  id_Funcionarios int auto_increment not null,
  id_Cargos int not null,
  nome varchar(20) not null,
  dataNascimento date not null,
  Telefone varchar(15) not null,
  Celular varchar(15) not null,
  RG varchar(15) not null,
  CPF varchar(15) not null,
  primary key(id_Funcionarios),
  constraint fk_tb_Funcionarios_id foreign key(id_Cargos) references tb_Cargos(id_Cargos)
);

create table tb_Cargos(
  id_Cargos int auto_increment,
  nome varchar(20) not null,
  salario decimal(10, 2) not null,
  primary key(id_Cargos)
);

create table tb_Procedimento(
  id_Procedimento int auto_increment not null,	
  Procedimento varchar(20) not null,
  Valor decimal(10) not null,
  primary key(id_Procedimento)
);

create table tb_Consulta(
  id_Consulta int auto_increment not null,	
  id_Funcionarios int not null,
  id_Usuario int not null,
  id_Procedimento int not null,
  Historico_Procedimento varchar(20) not null,
  primary key(id_Consulta),
  constraint fk_tb_Consulta_id_Usuario foreign key(id_Usuario) references tb_Usuario(id_Usuario),
  constraint fk_tb_Consulta_id foreign key(id_Funcionarios) references tb_Funcionarios(id_Funcionarios),
  constraint fk_tb_Consulta_id_Procedimento foreign key(id_Procedimento) references tb_Procedimento(id_Procedimento)
);

create table tb_Agendamento(
  id_Agendamento int auto_increment,
  id_Consulta int not null,
  Horario varchar(10) not null,
  Data_Agendamento date not null,
  primary key(id_Agendamento),
  constraint fk_tb_Agendamento_id foreign key(id_Consulta) references tb_Consulta(id_Consulta)
);

create table tb_Consultorio(
  id_Consultorio int auto_increment not null,
  id_Consulta int not null,
  primary key(id_Consultorio),
  constraint fk_tb_Consultorio_id foreign key(id_Consulta) references tb_Consulta(id_Consulta)
);

#Select

select * from tb_Cargos;

select * from tb_Usuario;

select * from tb_Funcionarios;

select * from tb_Procedimento;

select * from tb_Consulta;

select * from tb_Consultorio;

select * from tb_Agendamento;

#Insert

insert into tb_Usuario (Paciente, DataNascimento, Email, Telefone, Celular) values ("Robert", "20", "robertoficial123@gmail.com", "1111-1111", "2222-22222");

insert into tb_Funcionarios (Funcionario, DataNascimento,id_Cargos, Telefone, Celular, RG, CPF) values ("Vagner", '1999-03-09',1, "1111-1111", "2222-22222", "39.480.087-4", "111.222.333-45");

insert into tb_Cargos (nome, salario) values ("Auxiliar de dentista", 2000);

insert into tb_Procedimento (Procedimento, Valor) values ("Limpeza", 150);

insert into tb_Consulta (id_Usuario, id_Funcionarios, id_Procedimento, Historico_Procedimento) values (1, 3, 1, "Limpeza");

insert into tb_Agendamento (id_Consulta, horario, Data_Agendamento) values (7, "13:00", '2019-04-29');

#Inner join


SELECT 
    Funcionarios.Funcionario, Cargos.salario
FROM
    tb_Cargos Cargos
        INNER JOIN
    tb_Funcionarios Funcionarios ON Funcionarios.id_Funcionarios;


SELECT 
    Funcionarios.Funcionario, Usuario.Paciente
FROM
    tb_Usuario Usuario
        INNER JOIN
    tb_Funcionarios Funcionarios ON Funcionarios.id_Funcionarios;
