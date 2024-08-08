#!/bin/bash

# ------------------------------------------------------------------------------
# Nome do Projeto: Instalação Automatizada do Docker
# Versão: 1.0
# Data de Criação: 7 de agosto de 2024
# Licença: MIT License
# Autor: Douglas Silva
# Contato: contact@douglas-olis.com.br
# Site/Pagina: https://cyberpack.com.br/artigos/docker-engine-no-ubuntu/
# Descrição: Este script automatiza a instalação do Docker no Ubuntu,
#              configurando o repositório, instalando o Docker, e realizando
#              um teste básico. Inclui opções para atualizar o sistema e
#              configurar o repositório, bem como verificar a instalação.
# ------------------------------------------------------------------------------

# Função para exibir o menu de ajuda
show_help() {
    echo "Uso: $0 [opções]"
    echo
    echo "Opções:"
    echo "  --help          Exibe esta mensagem de ajuda e sai."
    echo "  --install       Instala o Docker e realiza um teste."
    echo "  --update        Atualiza o sistema e configura o repositório Docker."
    echo "  --test          Executa um teste para verificar a instalação do Docker."
    echo
    echo "Exemplo:"
    echo "  $0 --install"
}

# Função para atualizar o sistema e configurar o repositório Docker
update_system() {
    echo "Atualizando pacotes do sistema..."
    sudo apt-get update

    echo "Instalando pacotes necessários..."
    sudo apt-get install -y ca-certificates curl gnupg

    echo "Criando diretório para a chave GPG do Docker..."
    sudo install -m 0755 -d /etc/apt/keyrings

    echo "Baixando a chave GPG do Docker..."
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    echo "Adicionando o repositório Docker..."
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    echo "Atualizando a lista de pacotes novamente..."
    sudo apt-get update
}

# Função para instalar o Docker
install_docker() {
    echo "Instalando o Docker..."
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    echo "Criando o grupo docker e adicionando o usuário..."
    sudo groupadd docker
    sudo usermod -aG docker $USER

    echo "Aplicando as alterações do grupo..."
    newgrp docker
}

# Função para testar a instalação do Docker
test_docker() {
    echo "Executando um teste para verificar a instalação do Docker..."
    docker run hello-world
}

# Processando opções de linha de comando
case "$1" in
    --help)
        show_help
        ;;
    --install)
        update_system
        install_docker
        test_docker
        ;;
    --update)
        update_system
        ;;
    --test)
        test_docker
        ;;
    *)
        echo "Opção inválida. Use --help para mais informações."
        exit 1
        ;;
esac
