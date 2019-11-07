create database biblioteca;
use biblioteca;

create table Prateleiras(
id_prateleira INT PRIMARY KEY AUTO_INCREMENT,
num_prateleira INT,
categoria_prateleira VARCHAR(45));

create table Autores(
id_autor int primary key auto_increment, 
nome_autor varchar(100) not null
);

create table Tradutores(
id_tradutor int primary key auto_increment,
nome_tradutor varchar(100) not null
);

create table Editoras(
id_editora int primary key auto_increment,
nome_editora varchar(50) not null
);

create table Livros(
id_livro INT PRIMARY KEY AUTO_INCREMENT,
título_livro VARCHAR(45),
localizacao_livro VARCHAR(45),
data_publicacao_livro DATE,
num_paginas_livro INT,
isbn_livro INT,
fk_id_prateleira_livro INT,
fk_id_autor_livro int,
fk_id_tradutor_livro int,
fk_id_editora_livro int,
FOREIGN KEY (fk_id_prateleira_livro) REFERENCES Prateleiras(id_prateleira),
foreign key (fk_id_autor_livro) references Autores (id_autor),
foreign key (fk_id_tradutor_livro) references Tradutores (id_tradutor),
foreign key (fk_id_editora_livro) references Editoras (id_editora));

create table Alunos(
id_aluno int PRIMARY KEY NOT NULL auto_increment,
nome_aluno VARCHAR(100),
data_nasc_aluno DATE,
login_aluno varchar(15) not null,
senha_aluno varchar(30) not null,
cpf_aluno INT,
num_matricula_aluno INT
);

create table Bibliotecarios(
id_bibliotecario int PRIMARY KEY NOT NULL auto_increment,
nome_bibliotecario VARCHAR(100),
login_bibliotecario varchar(15) not null,
senha_bibliotecario varchar(30) not null,
cpf_bibliotecario int not null
);

create table Emprestimos(
id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
data_emprestimo DATE,
status_emprestimo boolean not null,
fk_id_aluno_emprestimo int,
fk_id_bibliotecario_emprestimo int,
fk_id_livro_emprestimo INT,
FOREIGN KEY (fk_id_aluno_emprestimo) REFERENCES Alunos(id_aluno),
foreign key (fk_id_bibliotecario_emprestimo) references Bibliotecarios (id_bibliotecario),
FOREIGN KEY (fk_id_livro_emprestimo) REFERENCES Livros(id_livro)
); 