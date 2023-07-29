#criaçao do banco de dados
create database if not exists biblioteca;
use biblioteca;

#criaçao das tabelas
create table if not exists enderecos(
	id_endereco int unique primary key not null auto_increment,
    cidade varchar(45),
    uf varchar(2),
    rua varchar(45),
    cep varchar(8),
    numero varchar(10),
    complemento varchar(20)
);

create table if not exists editora(
	id_editora int unique primary key not null auto_increment,
    nome varchar(45),
    data_criacao date,
    quant_livros_publicados int,
    id_endereco_fk int
);

create table if not exists autores(
	id_autores int unique primary key not null auto_increment,
    nome varchar(250),
    data_nascimento date,
    quant_livros_publicados int,
    genero_escrita varchar(45)
);

create table if not exists livros(
	id_livro int unique primary key not null auto_increment,
    titulo varchar(100),
    data_publicacao date,
    numero_pags int,
    genero varchar(45),
    id_autores_fk int,
    id_editora_fk int
);

create table if not exists usuarios(
	id_usuario int unique primary key not null auto_increment,
    nome varchar(250),
    cpf varchar(11),
    nascimento date,
    email varchar(100),
    senha varchar(8)
);

create table if not exists emprestimo(
	id_emprestimo int unique primary key not null auto_increment,
    data_emprestimo date,
    data_devolucao date,
    id_livro_fk int,
    id_usuario_fk int
);

#criação das chaves estrangeiras

alter table editora 
add foreign key (id_endereco_fk)
references enderecos(id_endereco);

alter table livros 
add foreign key (id_autores_fk)
references autores(id_autores);

alter table livros 
add foreign key (id_editora_fk)
references editora(id_editora);

alter table emprestimo 
add foreign key (id_livro_fk)
references livros(id_livro);

alter table emprestimo
add foreign key (id_usuario_fk)
references usuarios(id_usuario);


#inserção dos valores nas tabelas
insert into enderecos (cidade, uf, rua, cep, numero, complemento)
values ('São Paulo', 'SP', 'Rua das Letras', '01234567', '1234', 'Sala 10'),
       ('Rio de Janeiro', 'RJ', 'Avenida do Português', '20000123', '567', 'Sala 101'),
       ('Belo Horizonte', 'MG', 'Rua dos Livros', '30000456', '789', 'Conjunto C'),
       ('Porto Alegre', 'RS', 'Praça da Cultura', '90000789', '321', 'Andar 5'),
       ('Salvador', 'BA', 'Avenida dos Escritores', '40000987', '1234', 'Andar 6'),
       ('Fortaleza', 'CE', 'Travessa dos Poetas', '60000543', '4321', 'Conjunto B'),
       ('Recife', 'PE', 'Alameda dos Autores', '50000321', '987', 'Bloco A');