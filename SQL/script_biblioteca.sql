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


#inserção de valores nas tabelas

insert into enderecos (cidade, uf, rua, cep, numero, complemento)
values ('São Paulo', 'SP', 'Rua das Letras', '01234567', '1234', 'Sala 10'),
       ('Rio de Janeiro', 'RJ', 'Avenida do Português', '20000123', '567', 'Sala 101'),
       ('Belo Horizonte', 'MG', 'Rua dos Livros', '30000456', '789', 'Conjunto C'),
       ('Porto Alegre', 'RS', 'Praça da Cultura', '90000789', '321', 'Andar 5'),
       ('Salvador', 'BA', 'Avenida dos Escritores', '40000987', '1234', 'Andar 6'),
       ('Fortaleza', 'CE', 'Travessa dos Poetas', '60000543', '4321', 'Conjunto B'),
       ('Recife', 'PE', 'Alameda dos Autores', '50000321', '987', 'Bloco A');

insert into editora (nome, data_criacao, quant_livros_publicados, id_endereco_fk)
values ('Editora Brasileira A', '1990-02-15', 50, 1),
       ('Editora Brasil Livros', '1985-06-30', 80, 2),
       ('Livros do Brasil', '2000-11-25', 30, 3),
       ('Editora Nacional', '1978-12-10', 120, 4),
       ('Edições Brasileiras', '2005-08-20', 65, 5),
       ('Livros Nacionais', '1995-12-03', 90, 6),
       ('Editora Nacional Brasil', '2010-05-05', 55, 7);

insert into autores (nome, data_nascimento, quant_livros_publicados, genero_escrita)
values ('J.K. Rowling', '1965-07-31', 14, 'Fantasia'),
	   ('George R.R. Martin', '1948-09-20', 9, 'Fantasia épica'),
	   ('Agatha Christie', '1890-09-15', 66, 'Mistério'),
	   ('Stephen King', '1947-09-21', 61, 'Terror'),
       ('Jane Austen', '1775-12-16', 6, 'Romance'),
       ('Gabriel García Márquez', '1927-03-06', 12, 'Realismo mágico'),
       ('Emily Dickinson', '1830-12-10', 0, 'Poesia'),
	   ('Haruki Murakami', '1949-01-12', 23, 'Ficção contemporânea');

insert into livros (titulo, data_publicacao, numero_pags, genero, id_autores_fk, id_editora_fk)
values ('Harry Potter e a Pedra Filosofal', '1997-06-26', 223, 'Fantasia', 1, 1),
       ('A Guerra dos Tronos', '1996-08-01', 704, 'Fantasia épica', 2, 2),
       ('Assassinato no Expresso Oriente', '1934-01-01', 256, 'Mistério', 3,3),
       ('O Iluminado', '1977-01-28', 447, 'Terror', 4,4),
       ('Orgulho e Preconceito', '1813-01-28', 432, 'Romance', 5,5),
       ('Cem Anos de Solidão', '1967-05-30', 417, 'Realismo mágico', 6,6),
       ('Poesias Completas de Emily Dickinson', '1890-01-01', 320, 'Poesia', 7,7),
       ('Norwegian Wood', '1987-09-04', 389, 'Ficção contemporânea', 8, 5);

insert into usuarios (nome, cpf, nascimento, email, senha)
values ('João Silva', '12345678900', '1990-05-15', 'joao.silva@example.com', 'senha123'),
       ('Maria Oliveira', '98765432100', '1985-08-25', 'maria.oliveira@example.com', 'senha456'),
       ('Pedro Santos', '11122233344', '1995-02-10', 'pedro.santos@example.com', 'senha789'),
       ('Ana Souza', '55566677788', '1982-11-20', 'ana.souza@example.com', 'senha1bc'),
       ('Lucas Pereira', '99988877766', '1998-07-05', 'lucas.pereira@example.com', 'senha8yz'),
       ('Julia Rodrigues', '44455566677', '1993-12-30', 'julia.rodrigues@example.com', 'senha345'),
       ('Rafael Almeida', '22233344455', '1991-09-18', 'rafael.almeida@example.com', 'senha543'),
       ('Rafaela Lima', '12547815687', '1992-10-15', 'rafaela.lima@example.com', 'senha883');