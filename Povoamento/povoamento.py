import json
import mysql.connector
import csv
import os
from mysql.connector import Error

def carregar_json(nome_ficheiro):
    with open(nome_ficheiro, 'r', encoding='utf-8') as jsonfile:
        return json.load(jsonfile)
    
#Função para inserir dados de um Json numa tabela
def inserir_dados_json(tabela, dados, conn):
    cursor = conn.cursor()
    
    if not dados:
        print(f"Nenhum dado para inserir na tabela {tabela}.")
        return
    
    # Preparar colunas e placeholders baseando-se nas keys do primeiro dict
    colunas = dados[0].keys()
    placeholders = ", ".join(["%s"] * len(colunas))
    colunas_str = ", ".join(colunas)

    sql = f"INSERT INTO {tabela} ({colunas_str}) VALUES ({placeholders})"

    try:
        for linha in dados:
            valores = tuple(linha[col] for col in colunas)
            cursor.execute(sql, valores)
        conn.commit()
        print(f"Dados inseridos com sucesso na tabela {tabela}")
    except Error as e:
        print(f"Erro ao inserir dados na tabela {tabela}: {e}")
        conn.rollback()
    finally:
        cursor.close()


#Função para inserir dados de um CSV numa tabela
def inserir_dados_csv(nome_tabela, caminho_csv, colunas, conn):
    try:
        #conn = mysql.connector.connect(**config)
        cursor = conn.cursor()

        with open(caminho_csv, newline='', encoding='utf-8') as csvfile:
            reader = csv.DictReader(csvfile)
            for row in reader:
                valores = [row[col] for col in colunas]
                placeholders = ', '.join(['%s'] * len(colunas))
                query = f"INSERT INTO {nome_tabela} ({', '.join(colunas)}) VALUES ({placeholders})"
                cursor.execute(query, valores)

        conn.commit()
        print(f"Dados inseridos com sucesso na tabela {nome_tabela}")
    except Exception as e:
        print(f"Erro ao inserir dados na tabela {nome_tabela}: {e}")
        conn.rollback()
    finally:
        try:
            if conn.is_connected():
                cursor.close()
        except:
            pass

# Função para inserir dados relacionais (Carro e Aluguer)
def inserir_dados_relacionais(conn):
    cursor = conn.cursor()
    try:
        # Inserir dados na tabela Carro
        cursor.execute("""
            INSERT INTO Carro (Nr_Carro, Stand, Ano, Nr_Lugares, Custo) VALUES 
            (1000, 'Vilamoura', 2017, 4, 25.0),
            (1001, 'Vilamoura', 2020, 4, 25.0),
            (1002, 'Vilamoura', 2016, 2, 15.0),
            (1003, 'Braga', 2013, 2, 15.0),
            (1004, 'Braga', 2015, 2, 15.0),
            (1005, 'Braga', 2021, 4, 25.0),
            (1006, 'Porto', 2017, 4, 25.0),
            (1007, 'Porto', 2013, 2, 15.0),
            (1008, 'Porto', 2016, 4, 25.0),
            (1009, 'Porto', 2009, 2, 15.0);
        """)

        # Inserir dados na tabela Aluguer
        cursor.execute("""
            INSERT INTO Aluguer (Nr_Aluguer, Data_Inicio, Data_Fim, ID_Cliente, ID_Funcionario, Nr_Carro) VALUES
            (69, '2009-08-18', '2009-08-20', 106, 2, 1000),
            (70, '2009-08-23', '2009-08-26', 108, 2, 1005),
            (71, '2009-08-27', '2009-09-01', 101, 4, 1007),
            (72, '2009-09-07', '2009-09-14', 104, 3, 1005),
            (73, '2009-09-13', '2009-09-15', 107, 4, 1000),
            (74, '2009-09-20', '2009-09-29', 105, 5, 1003),
            (75, '2009-09-25', '2009-10-02', 101, 2, 1004),
            (76, '2009-10-01', '2009-10-04', 109, 1, 1001),
            (77, '2009-10-09', '2009-10-16', 100, 6, 1000),
            (78, '2009-10-14', '2009-10-20', 102, 1, 1002),
            (79, '2009-10-25', '2009-11-20', 103, 2, 1007);
        """)

        conn.commit()
        print("Dados relacionais (Carro e Aluguer) inseridos com sucesso.")
    except Error as e:
        print(f"Erro ao inserir dados relacionais: {e}")
        conn.rollback()
    finally:
        cursor.close()


def main():

    # Configurações da ligação MySQL
    config = {
            'host': 'localhost',
            'user': 'root',
            'password': 'Senha882240!',
            'database': 'HoleInOne',
    }

    # Tabelas para inserir dados CSV
    tabelas_CSV = {
        "Cliente": {
            "csv": "Cliente.csv",
            "colunas": ["ID_Cliente", "Nome", "Data_Nascimento", "Email", "Rua", "Cidade"]
        },
        "Telefones": {
            "csv": "Telefones.csv",
            "colunas": ["Telefone", "ID_Cliente"]
        }
    }

    # Tabelas para inserir dados JSON
    tabelas_JSON = {
        "Funcao": "Funcao.json",
        "Funcionario": "Funcionario.json",
    }

    conn = mysql.connector.connect(**config)

    # Inserir dados CSV
    for tabela, dados in tabelas_CSV.items():
        if os.path.exists(dados["csv"]):
            inserir_dados_csv(tabela, dados["csv"], dados["colunas"], conn)
        else:
            print(f"Ficheiro {dados['csv']} não encontrado.")

    # Inserir dados JSON
    try:
        conn = mysql.connector.connect(**config)
        if conn.is_connected():

            for tabela, arquivo in tabelas_JSON.items():
                dados = carregar_json(arquivo)
                inserir_dados_json(tabela, dados, conn)
    except Error as e:
        print(f"Erro na ligação ao MySQL: {e}")
    finally:
        if conn.is_connected():
            # Inserir dados relacionais (Carro e Aluguer)
            inserir_dados_relacionais(conn)
            conn.close()




main()