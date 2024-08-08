# Instalação Automatizada do Docker no Ubuntu

Este script Shell automatiza o processo de instalação do Docker no Ubuntu. Ele inclui etapas para atualizar o sistema, adicionar a chave GPG oficial do Docker, configurar o repositório, instalar o Docker, adicionar o usuário ao grupo `docker` e realizar um teste básico para verificar a instalação.
Mais informações em https://cyberpack.com.br/artigos/docker-engine-no-ubuntu/

## Informações do Script

- **Nome do Projeto:** Instalação Automatizada do Docker
- **Versão:** 1.0
- **Data de Criação:** 7 de agosto de 2024
- **Licença:** MIT License
- **Autor:** [Seu Nome]

### Funcionalidades

- Atualiza os pacotes do sistema.
- Adiciona a chave GPG do Docker.
- Configura o repositório Docker.
- Instala o Docker.
- Adiciona o usuário ao grupo `docker`.
- Realiza um teste básico para garantir que o Docker está funcionando corretamente.

### Como Usar

1. **Salve o Script**

   Salve o script fornecido em um arquivo chamado `install_docker.sh`.

2. **Dê Permissão de Execução**

   Torne o script executável com o comando:

   ```bash
   chmod +x install_docker.sh
