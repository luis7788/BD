# BD (Português)

Projeto da uc de Base de Dados 2024/2025 da Universidade do Minho

## Objetivo

Pretende-se  que  cada  grupo  de  alunos  realize  um  trabalho  de  análise,  planeamento,  arquitetura  e implementação de um Sistema de Base de Dados relacional para um dado caso de estudo que deve ser idealizado no domínio da “Gestão de Alugueres de Carros e Comerciais de uma Empresa”.

O resto dos requerimentos podem ser vistos no [enunciado](BD-Enunciado.pdf).

É também possível consultar o [relatório](BD-Relatório.pdf) e os [slides](slides.pdf) usados na apresentação para uma melhor compreensão do projeto.

## Criação da Base de Dados

Na pasta [Scripts-SQL](Scripts-SQL/) podem ser consultados os ficheiros de código SQL usados na criação da base de dados, assim como na criação de estruturas, roles, utilizadores e no povoamento da mesma.

No ficheiro [init_HoleInOne.sql](Scripts-SQL/init_HoleInOne.sql), está presente um script que ao ser executado cria diretamente a base de dados, tabelas e estruturas, para facilitar a criação da BD.

## Sistema de Migração de Dados

Um dos requisitos para este projeto foi o desenvolvimento de um sistema de migração de dados, através da utilização de três fontes:

* Fonte **CSV**

* Fonte **JSON**

* Dados relacionais

Foram desenvolvidas quatro formas de povoar a BD, três delas usam unicamente uma das fontes acima referidas e a última usa todas as três fontes ao mesmo tempo.

### Dependências

Para utilizar o programa de migração de dados, é necessária a instalação da biblioteca *python* **mysql-connector**, que pode ser feita através deste comando:

```console
$ pip install mysql-connector-python
```

### Fonte CSV

Na pasta [CSV](CSV/), é possível encontrar ficheiros **CSV**, assim como um programa *python* para realizar o povoamento da BD HoleInOne.

#### Execução

```console
$ python CSV.py
```

### Fonte JSON

Na pasta [JSON](JSON/), é possível encontrar ficheiros **JSON**, assim como um programa *python* para realizar o povoamento da BD HoleInOne.

#### Execução

```console
$ python JSON.py
```

### Fonte de dados relacionais

É possível executar diretamente o seguinte [ficheiro](Scripts/script_povoamento.sql) sql.

### Programa de povoamento misto

Na pasta [Povoamento](Povoamento/) é possível encontrar um programa *python* que permite povoar a base de dados usando as 3 fontes anteriores simultaneamente.

#### Execução

```console
$ python povoamento.py
```

## Autores

* [darteescar](https://github.com/darteescar)
* [luis7788](https://github.com/luis7788)
* [tiagofigueiredo7](https://github.com/tiagofigueiredo7)
* [JoaoRodrigues04](https://github.com/JoaoRodrigues04)


# DB (English)

Database course project 2024/2025 – University of Minho

## Objective

Each student group is expected to carry out a project involving the analysis, planning, architecture, and implementation of a relational Database System for a given case study. The project should be developed within the domain of “Management of Car and Commercial Vehicle Rentals for a Company.”

The rest of the requirements can be found in the [project description](BD-Enunciado.pdf).

You can also consult the [report](BD-Relatório.pdf) and the [slides](slides.pdf) used in the presentation for a better understanding of the project.

## Database Creation

In the [Scripts-SQL](Scripts-SQL/) folder, you can find the SQL code files used for creating the database, as well as for creating structures, roles, users, and populating the database.

The file [init_HoleInOne.sql](Scripts-SQL/init_HoleInOne.sql) contains a script that, when executed, directly creates the database, tables, and structures to simplify the DB setup.

## Data Migration System

One of the requirements for this project was the development of a data migration system using three data sources:

* **CSV** source
* **JSON** source
* Relational data

Four methods were developed to populate the DB. Three use only one of the sources mentioned above, and the last one uses all three sources simultaneously.

### Dependencies

To use the data migration program, the *Python* library **mysql-connector** must be installed. You can do this with the following command:

```console
$ pip install mysql-connector-python
```

### CSV Source

In the [CSV](CSV/) folder, you will find **CSV** files as well as a Python program to populate the HoleInOne DB.

#### Execution

```console
$ python CSV.py
```

### JSON Source

In the [JSON](JSON/) folder, you will find **JSON** files as well as a Python program to populate the HoleInOne DB.

#### Execution

```console
$ python JSON.py
```

### Relational Data Source

You can directly execute the following SQL [file](Scripts/script_povoamento.sql).

### Mixed Data Population Program

In the [Povoamento](Povoamento/) folder, there is a Python program that allows populating the database using all three previous sources simultaneously.

#### Execution

```console
$ python povoamento.py
```

## Authors

* [darteescar](https://github.com/darteescar)
* [luis7788](https://github.com/luis7788)
* [tiagofigueiredo7](https://github.com/tiagofigueiredo7)
* [JoaoRodrigues04](https://github.com/JoaoRodrigues04)