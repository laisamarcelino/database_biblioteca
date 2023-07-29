create database if not exists biblioteca;
use biblioteca;

create table if not exists enderecos(
	id_endero int unique primary key not null,
    cidade varchar(45),
    uf varchar(2),
    rua varchar(45),
    cep varchar(8),
    numero varchar(10),
    complemento varchar(20)
);

create table if not exists editora(
	id_editora int unique primary key not null,
    nome varchar(45),
    data_criacao date,
    quant_livros_publicados int,
    id_endereco_fk int
);

create table if not exists autores(
	id_autores int unique primary key not null,
    nome varchar(250),
    data_nascimento date,
    quant_livros_publicados int,
    genero_escrita varchar(45)
);

create table if not exists livros(
	id_livro int unique primary key not null,
    titulo varchar(100),
    data_publicacao date,
    numero_pags int,
    genero varchar(45),
    id_autores_fk int,
    id_editora_fk int
);

create table if not exists usuarios(
	id_usuario int unique primary key not null,
    nome varchar(250),
    cpf varchar(11),
    nascimento date,
    email varchar(100),
    senha varchar(8)
);

create table if not exists emprestimo(
	id_emprestimo int unique primary key not null,
    data_emprestimo date,
    data_devolucao date,
    id_livro_fk int,
    id_usuario_fk int
);

