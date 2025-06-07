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

### Dependências

Para utilizar o programa de migração de dados, é necessária a instalação da biblioteca *python* **mysql-connector**, que pode ser feita através deste comando:

```console
$ pip install mysql-connector-python
```

No caso de não ser possível instalar a biblioteca, é possível usar os scripts disponíveis nas pastas, começando com o script **init.sh** que vai criar um ambiente virtual python e instalar a biblioteca, e depois pelos scripts [CSV.sh](CSV/CSV.sh), [JSON.sh](JSON/JSON.sh) e [povoamento.sh](Povoamento/povoamento.sh).

**Nota**: Os scripts devem ser executados na mesma diretoria que os ficheiros de dados.

**Ex**: Ao executar init.sh e depois JSON.sh, os mesmos devem ser executados numa diretoria onde também estejam os ficheiros JSON da pasta **JSON** no repositório.

**Nota 2**: O conteúdo dos ficheiros CSV e JSON deve respeitar as dependências da BD. 

### Fonte CSV

Na pasta [CSV](CSV/), é possível encontrar ficheiros **CSV**, assim como scripts e um programa *python* para realizar o povoamento da BD HoleInOne.

#### Execução - Com scripts

```console
$ ./init.sh
$ ./CSV.sh
```

#### Execução - Sem scripts

```console
$ python CSV.py
```

### Fonte JSON

Funiona de forma semelhante à fonte CSV, como é possível ver mais a baixo:

#### Execução - Com scripts

```console
$ ./init.sh
$ ./JSON.sh
```

#### Execução - Sem scripts

```console
$ python JSON.py
```

### Fonte de dados relacionais

É possível executar diretamente o seguinte [ficheiro](Scripts/script_povoamento.sql) sql.

### Programa de povoamento misto

Na pasta [Povoamento](Povoamento/) é possível encontrar um programa *python* que permite povoar a base de dados usando as 3 fontes anteriores.

#### Execução - Com scripts

```console
$ ./init.sh
$ ./povoamento.sh
```

#### Execução - Sem scripts

```console
$ python povoamento.py
```

## Autores

* Duarte Escairo Brandão Reis Silva - [darteescar](https://github.com/darteescar)
* Luís António Peixoto Soares - [luis7788](https://github.com/luis7788)
* Tiago Silva Figueiredo - [tiagofigueiredo7](https://github.com/tiagofigueiredo7)
* João Pedro Rodrigues


# DB (English)

Database course project 2024/2025 – University of Minho

## Objective

Each student group is expected to carry out a project involving the analysis, planning, architecture, and implementation of a relational Database System for a given case study. The project should be developed within the domain of “Management of Car and Commercial Vehicle Rentals for a Company.”

The rest of the requirements can be found in the [project description](BD-Enunciado.pdf).

You can also check the [report](BD-Relatório.pdf) and the [slides](slides.pdf) used on the presentation for a better comprehension of the project.

## Database Creation

In the [Scripts-SQL](Scripts-SQL/) folder, you can find the SQL code files used for creating the database, as well as for creating structures, roles, users, and populating the database.

The file [init_HoleInOne.sql](Scripts-SQL/init_HoleInOne.sql) contains a script that, when executed, directly creates the database, tables, and structures to simplify the DB setup.

## Data Migration System

One of the requirements for this project was the development of a data migration system using three data sources:

* **CSV** source  
* **JSON** source  
* Relational data  

### Dependencies

To use the data migration program, the *Python* library **mysql-connector** must be installed. You can do this with the following command:

```console
$ pip install mysql-connector-python
```

If installing the library is not possible, you can use the provided scripts. Start with **init.sh**, which will create a Python virtual environment and install the required library, then run the scripts [CSV.sh](CSV/CSV.sh), [JSON.sh](JSON/JSON.sh), and [povoamento.sh](Povoamento/povoamento.sh).

**Note**: Scripts must be executed in the same directory as the data files.

**Example**: When running init.sh and then JSON.sh, both should be executed in a directory that also contains the JSON files from the **JSON** folder in the repository.

**Note 2**: The content of the CSV and JSON files must comply with the DB’s dependencies.

### CSV Source

In the [CSV](CSV/) folder, you will find **CSV** files, as well as scripts and a Python program to populate the HoleInOne DB.

#### Execution – With scripts

```console
$ ./init.sh
$ ./CSV.sh
```

#### Execution – Without scripts

```console
$ python CSV.py
```

### JSON Source

Works similarly to the CSV source, as shown below:

#### Execution – With scripts

```console
$ ./init.sh
$ ./JSON.sh
```

#### Execution – Without scripts

```console
$ python JSON.py
```

### Relational Data Source

You can directly execute the following SQL [file](Scripts/script_povoamento.sql).

### Mixed Data Population Program

In the [Povoamento](Povoamento/) folder, there is a Python program that allows populating the database using all three previous sources.

#### Execution – With scripts

```console
$ ./init.sh
$ ./povoamento.sh
```

#### Execution – Without scripts

```console
$ python povoamento.py
```

## Authors

* Duarte Escairo Brandão Reis Silva - [darteescar](https://github.com/darteescar)  
* Luís António Peixoto Soares - [luis7788](https://github.com/luis7788)  
* Tiago Silva Figueiredo - [tiagofigueiredo7](https://github.com/tiagofigueiredo7)  
* João Pedro Rodrigues



