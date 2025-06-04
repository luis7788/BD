# BD

Projeto da uc de Base de Dados 2024/2025 da Universidade do Minho

## Objetivo

Pretende-se  que  cada  grupo  de  alunos  realize  um  trabalho  de  análise,  planeamento,  arquitetura  e implementação de um Sistema de Base de Dados relacional para um dado caso de estudo que deve ser idealizado no domínio da “Gestão de Alugueres de Carros e Comerciais de uma Empresa”.

O resto dos requerimentos podem ser vistos no [enunciado](BD-Enunciado.pdf).

## Criação da Base de Dados

Na pasta [Scripts](Scripts/) podem ser consultados os ficheiros de código SQL usados na criação da base de dados, assim como na criação de estruturas, roles, utilizadores e no povoamento da mesma.

No ficheiro [init_HoleInOne.sql](Scripts/init_HoleInOne.sql), está presente um script que ao ser executado cria diretamente a base de dados, tabelas e estruturas, para facilitar a criação da BD.

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

**Nota2**: O conteúdo dos ficheiros CSV e JSON deve respeitar as dependências da BD. 

### Fonte CSV

Na pasta [CSV](CSV/), é possível encontrar ficheiros **CSV**, assim como scripts e um programa *python* para realizar o povoamento da BD HoleInOne.

#### Execução - Com scripts

```console
$ init.sh
$ CSV.sh
```

#### Execução - Sem scripts

```console
$ CSV.py
```

### Fonte JSON

Funiona de forma semelhante à fonte CSV, como é possível ver mais a baixo:

#### Execução - Com scripts

```console
$ init.sh
$ JSON.sh
```

#### Execução - Sem scripts

```console
$ JSON.py
```

### Fonte de dados relacionais

É possível executar diretamente o seguinte [ficheiro](Scripts/script_povoamento.sql) sql.

### Programa de povoamento misto

Na pasta [Povoamento](Povoamento/) é possível encontrar um programa *python* que permite povoar a base de dados usando as 3 fontes anteriores.

#### Execução - Com scripts

```console
$ init.sh
$ povoamento.sh
```

#### Execução - Sem scripts

```console
$ povoamento.py
```

## Autores

* Duarte Escairo Brandão Reis Silva - [darteescar](https://github.com/darteescar)
* Luís António Peixoto Soares - [luis7788](https://github.com/luis7788)
* Tiago Silva Figueiredo - [tiagofigueiredo7](https://github.com/tiagofigueiredo7)
* João Pedro Rodrigues



