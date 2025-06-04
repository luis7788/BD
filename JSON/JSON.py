import json
import mysql.connector
from mysql.connector import Error

def carregar_json(nome_ficheiro):
    with open(nome_ficheiro, 'r', encoding='utf-8') as f:
        return json.load(f)

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
        print(f"Dados inseridos na tabela {tabela} com sucesso.")
    except Error as e:
        print(f"Erro ao inserir dados na tabela {tabela}: {e}")
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

    try:
        conn = mysql.connector.connect(**config)
        if conn.is_connected():
            print("Ligação ao MySQL estabelecida.")
            
            tabelas_arquivos = {
                "Cliente": "Cliente.json",
                "Telefones": "Telefones.json",
                "Carro": "Carro.json",
                "Funcao": "Funcao.json",
                "Funcionario": "Funcionario.json",
                "Aluguer": "Aluguer.json",
            }

            for tabela, arquivo in tabelas_arquivos.items():
                dados = carregar_json(arquivo)
                inserir_dados_json(tabela, dados, conn)
    except Error as e:
        print(f"Erro na ligação ao MySQL: {e}")
    finally:
        if conn.is_connected():
            conn.close()
            print("Ligação ao MySQL encerrada.")

if __name__ == "__main__":
    main()
