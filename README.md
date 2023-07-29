# database_biblioteca
Projeto Individual do módulo 3 da Resília

Este banco de dados foi criado utilizando o dbDiagram para modelagem das tabelas e o MySQL Workbench para construção do banco de dados.
A partir deste banco de dados pode-se obter informações sobre os livros, autores, editora e empréstimos de uma biblioteca.

Abaixo descreve-se o objetivo de cada uma das tabelas:
* Endereço -> guarda a informação sobre o endereço de cada uma das editoras; foi criada com o objetivo de facilitar a visualização do endereço de uma editora;
* Editora -> descreve as características da editora de um livro;
* Livros -> descreve as informações dos livros presentes na biblioteca;
* Autores -> descreve as informações dos autores de um livro;
* Usuários -> guarda as informações de um usuário cadastrado no sistema da biblioteca para que este possa realizar o empréstimo de livros;
* Empréstimo -> guarda a informação da data de empréstimo e devolução de um livro, bem como qual é este livro e qual usuário está utilizando.
