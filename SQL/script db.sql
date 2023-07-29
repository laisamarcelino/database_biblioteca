CREATE TABLE [enderecos] (
  [id_endereco] int UNIQUE PRIMARY KEY NOT NULL,
  [cidade] varchar(45),
  [uf] varchar(2),
  [rua] varchar(45),
  [cep] varchar(8),
  [numero] varchar(10),
  [complemento] varchar(45)
)
GO

CREATE TABLE [editora] (
  [id_editora] int UNIQUE PRIMARY KEY NOT NULL,
  [nome] varchar(45),
  [data_criacao] date,
  [quant_livros_publicados] int,
  [id_endereco_fk] int
)
GO

CREATE TABLE [autores] (
  [id_autores] int UNIQUE PRIMARY KEY NOT NULL,
  [nome] varchar(45),
  [data_nascimento] date,
  [quant_livros_publicados] int,
  [genero_escrita] varchar(45)
)
GO

CREATE TABLE [livros] (
  [id_livro] int UNIQUE PRIMARY KEY NOT NULL,
  [titulo] varchar(45),
  [data_publicacao] date,
  [numero_pags] int,
  [genero] varchar(45),
  [id_autores_fk] int,
  [id_editora_fk] int
)
GO

CREATE TABLE [usuarios] (
  [id_usuario] int UNIQUE PRIMARY KEY NOT NULL,
  [nome] varchar(45),
  [nascimento] date,
  [cpf] varchar(11),
  [email] varchar(45),
  [senha] varchar(8)
)
GO

CREATE TABLE [emprestimo] (
  [id_emprestimo] int UNIQUE PRIMARY KEY NOT NULL,
  [data_emprestimo] date,
  [data_devolucao] date,
  [id_livro_fk] int,
  [id_usuario_fk] int
)
GO

ALTER TABLE [editora] ADD FOREIGN KEY ([id_endereco_fk]) REFERENCES [enderecos] ([id_endereco])
GO

ALTER TABLE [livros] ADD FOREIGN KEY ([id_autores_fk]) REFERENCES [autores] ([id_autores])
GO

ALTER TABLE [livros] ADD FOREIGN KEY ([id_editora_fk]) REFERENCES [editora] ([id_editora])
GO

ALTER TABLE [emprestimo] ADD FOREIGN KEY ([id_livro_fk]) REFERENCES [livros] ([id_livro])
GO

ALTER TABLE [emprestimo] ADD FOREIGN KEY ([id_usuario_fk]) REFERENCES [usuarios] ([id_usuario])
GO
