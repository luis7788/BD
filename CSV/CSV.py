import mysql.connector
import csv
import os

# --- Configurações da conexão ---
config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'Senha882240!',
    'database': 'HoleInOne'
}

# --- Função para inserir dados de um CSV numa tabela ---
def inserir_dados_csv(nome_tabela, caminho_csv, colunas):
    try:
        conn = mysql.connector.connect(**config)
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
    finally:
        try:
            if conn.is_connected():
                cursor.close()
                conn.close()
        except:
            pass


# --- Tabelas e ficheiros CSV ---
tabelas = {
    "Cliente": {
        "csv": "Cliente.csv",
        "colunas": ["ID_Cliente", "Nome", "Data_Nascimento", "Email", "Rua", "Cidade"]
    },
    "Telefones": {
        "csv": "Telefones.csv",
        "colunas": ["Telefone", "ID_Cliente"]
    },
    "Carro": {
        "csv": "Carro.csv",
        "colunas": ["Nr_Carro", "Stand", "Ano", "Nr_Lugares", "Custo"]
    },
    "Funcao": {
        "csv": "Funcao.csv",
        "colunas": ["ID_Funcao", "Designacao"]
    },
    "Funcionario": {
        "csv": "Funcionario.csv",
        "colunas": ["ID_Funcionario", "Nome", "Telefone", "Email", "Local_Trabalho", "Rua", "Cidade", "Salario", "ID_Funcao"]
    },
    "Aluguer": {
        "csv": "Aluguer.csv",
        "colunas": ["Nr_Aluguer", "Data_Inicio", "Data_Fim", "ID_Cliente", "ID_Funcionario", "Nr_Carro"]
    }
}


# --- Inserir os dados ---
for tabela, dados in tabelas.items():
    if os.path.exists(dados["csv"]):
        inserir_dados_csv(tabela, dados["csv"], dados["colunas"])
    else:
        print(f"Ficheiro {dados['csv']} não encontrado.")
