create database cadastro
		default character set utf8
		default collate utf8_general_ci;

use cadastro; /* ativar banco*/

create table pessoas (  /* criar tabela*/
	id int auto_increment not null.
    nome varchar(30) not null,
    nascimento date,
		sexo enum('M', 'F'),
    peso decimal(5,2),
    altura decimal(3,2),
	nacionalidade varchar(20) default 'Brasil',
	primary key(id)
)default charset = utf8; /*formato dos caracteres*/

insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Godofredo', '1984-02-01', 'M', '78.5', '1.83', 'Brasil');

insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Creuza', '1978-05-13', 'F', '72.2', '1.65', default);

insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Izaura', '1918-08-13', 'F', '62.2', '1.56', default),
('Angela', '1936-05-13', 'F', '67.8', '1.62', 'Alemanha'),
('Ashelay', '1993-02-15', 'F', '72.5', '1.75', 'EUA'),
('Van Nisteroy', '1965-05-15', 'M', '82.2', '1.87', 'Holanda');

select * from pessoas;

desc pessoas; /*descreve a tabeta*/

alter table pessoas
add column profissao varchar(10); /* adicionando coluna à tabela*/

alter table pessoas /*excului colunas*/
drop column profissao;

alter table pessoas
add column profissao varchar(10) after nome; /*insere coluna e add no lugar definido pelo usuario*/

alter table pessoas
modify column profissao varchar(20) not null;

create table if not exists cursos(
	nome varchar(30) not null unique,
    descricao text,
    carga int unsigned,
    totaulas int unsigned,
    ano year default '2016'
) default charset utf8;

insert into cursos values
/*(id_curso, nome, descricao, carga, totaulas, ano)*/

(default, 'html4', 'Curso de HTML5', '40', '37', '2014'),
(default,'Algoritimos', 'Lógica de Programação', '20', '15', '2014'),
(default,'Photoshop', 'Dicas de Photoshop CC', '10', '8', '2014'),
(default,'PGP', 'Curso de PHP para iniciantes', '40', '20', '2010'),
(default,'Jarva', 'Introdução à linguagem Java', '10', '29', '2000'),
(default,'MySql', 'Banco de Dados MysQl', '30', '15','2016'),
(default,'Word', 'Curso completo de Word', '40', '30', '2016'),
(default,'Box', 'Cuso da nobre Arte', '40', '30', '2018'),
(default,'Jiu-Jitsu', 'A arte do indefeso.', '40', '30', '2018'),
(default,'Youtube', 'Gerar polêmica e ganhar inscritos.', '5', '2', '2018');


update cursos
set nome = 'Java', ano = '2015', carga = '40'
where id_curso = '5';

update cursos
set nome = 'Java', ano = '2015', carga = '40'
where id_curso = 5
limit 1;

delete from cursos
where id_curso = 10;

delete from cursos
where id_curso = 10;

select nome, carga, ano from cursos
order by ano, nome;

select * from cursos
where ano = 2015
order by nome;

select nome, carga, ano from cursos
order by nome;

select * from cursos
where ano = 2015
order by nome;

select * from cursos
where ano between 2014 and 2016
order by nome;

select * from cursos
where ano between 2014 and 2016
order by ano, nome;

select nome, descricao, ano from cursos
where ano in(2014, 2016)
order by ano desc, nome;

select * from cursos
where carga > 35 and totaulas < 30;

select * from cursos
where nome like 'p%';

select * from cursos
where nome like '%a';

select distinct carga from cursos
order by carga;

select carga, count(nome) from cursos
group by carga;

select totaulas, count(*) from cursos
group by totaulas
order by totaulas;

select ano, count(*) from cursos
group by ano
having count(ano) >= '5'
order by count(*);

alter table pessoas add column curso_preferido int;

alter table pessoas
add foreign key(curso_preferido)
references cursos(id_curso);

update pessoas set curso_preferido = '6' where id = '1';

select pessoas.nome, pessoas.curso_preferido,
cursos.nome, cursos.ano from pessoas join cursos
on cursos.id_curso = pessoas.curso_preferido;

select p.nome, p.curso_preferido,
c.nome, c.ano from pessoas as p join cursos as c
on c.id_curso = p.curso_preferido
order by p.nome;

UPDATE `cadastro`.`pessoas` SET `curso_preferido`='8' WHERE `id`='3';
UPDATE `cadastro`.`pessoas` SET `curso_preferido`='5' WHERE `id`='4';
UPDATE `cadastro`.`pessoas` SET `curso_preferido`='25' WHERE `id`='5';
UPDATE `cadastro`.`pessoas` SET `curso_preferido`='22' WHERE `id`='6';
UPDATE `cadastro`.`pessoas` SET `curso_preferido`='15' WHERE `id`='7';
UPDATE `cadastro`.`pessoas` SET `curso_preferido`='' WHERE `id`='8';

select p.nome, p.curso_preferido,
c.nome, c.ano from alunos as a join cursos as c
on c.id_curso = a.curso_preferido
order by a.nome;


create table assiste_curso (
	id_assiste int not null auto_increment,
    id_aluno_assiste int,
    id_curso_assiste int,
    primary key(id_assiste),
    foreign key(id_aluno_assiste) references alunos(id),
    foreign key(id_curso_assiste) references cursos(id_curso)

) default charset = utf8;

rename table pessoas to alunos;

alter table assiste_curso
add column data_curso date after id_assiste;


INSERT INTO `cadastro`.`assiste_curso` (`data_curso`, `id_aluno_assiste`, `id_curso_assiste`) VALUES ('2015-12-22', '3', '6');
INSERT INTO `cadastro`.`assiste_curso` (`data_curso`, `id_aluno_assiste`, `id_curso_assiste`) VALUES ('2014-01-01', '8', '12');
INSERT INTO `cadastro`.`assiste_curso` (`data_curso`, `id_aluno_assiste`, `id_curso_assiste`) VALUES ('2016-05-12', '1', '19');
