#!/bin/bash

echo "A preparar ambiente Python para MySQL..."

# Passo 1: Criar ambiente virtual
if [ ! -d "venvPython" ]; then
    echo "A criar ambiente virtual venvPython..."
    python3 -m venv venvPython
else
    echo "Ambiente virtual venvPython já existe."
fi

# Passo 2: Ativar ambiente virtual
echo "A ativar ambiente virtual..."
source venvPython/bin/activate

: 
# Passo 3: Atualizar pip
echo "A atualizar o pip..."
pip install --upgrade pip

# Passo 4: Remover mysql-connector instalado via apt, se existir
if dpkg -l | grep -q python3-mysql.connector; then
    echo "A remover mysql-connector instalado via apt..."
    sudo apt remove -y python3-mysql.connector
else
    echo "mysql-connector via apt não instalado, não é feita a remoção."
fi

# Passo 5: Instalar mysql-connector-python via pip
echo "A instalar a biblioteca mysql-connector-python via pip..."
pip install mysql-connector-python

# Passo 6: Testar SSL no Python
echo "Teste -> ssl.wrap_socket no Python..."
python3 -c "import ssl; print(ssl.wrap_socket)" && echo "SSL está OK!" || echo "Erro no módulo SSL."

echo "Ambiente pronto! Para usar, ative o ambiente virtual com: source venvPython/bin/activate"

# Sair do ambiente virtual
deactivate

: '
rm -rf venvPython
'

