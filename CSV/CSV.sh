# Apenas usar depois de ter o ambiente virtual criado e as dependências instaladas.

# Passo 1: Criar ambiente virtual
if [ ! -d "venvPython" ]; then
    python3 -m venv venvPython
else
    echo "Ambiente virtual venvPython já existe."
fi

# Passo 2: Ativar ambiente virtual
source venvPython/bin/activate

# Passo 3: Executar python
python CSV.py

# Sair do ambiente virtual
deactivate