#!/bin/bash
# Indica ao sistema que o script deve ser executado usando o interpretador Bash.

# Atualiza a lista de pacotes disponíveis e instala as atualizações para todos os pacotes instalados, respondendo "sim" automaticamente a todas as perguntas.
sudo apt update -y && apt upgrade -y

# Instala o pacote 'unzip', uma ferramenta para descompactar arquivos '.zip', respondendo "sim" automaticamente a todas as perguntas.
sudo apt install unzip -y

# Baixa o binário do Docker Compose da URL especificada e o salva em '/usr/local/bin/docker-compose', seguindo redirecionamentos.
sudo wget -qO- https://get.docker.com/ | sh

# Baixa e executa o script de instalação do Docker, redirecionando a saída do 'wget' para o interpretador de comandos 'sh'.
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Torna o arquivo '/usr/local/bin/docker-compose' executável.
sudo chmod +x /usr/local/bin/docker-compose

# Cria uma nova rede Docker chamada 'monitoring'.
sudo docker network create monitoring


# Download do arquivo Prometheus e Grafana
# Baixa o arquivo 'main.zip' do repositório GitHub especificado.
wget -O /tmp/main.zip https://github.com/OpsXandao/prometheus_grafana/raw/main/prometheus_grafana-main.zip


cd /tmp

# Extração do arquivo zip
# Extrai o conteúdo do arquivo 'main.zip'.
unzip main.zip

# Muda o diretório atual para 'prometheus_grafana', que foi extraído do arquivo zip.
cd /tmp/prometheus_grafana-main

# Inicialização dos contêineres do Docker com Docker Compose
sudo docker-compose up -d
# Usa o Docker Compose para iniciar os contêineres definidos no arquivo 'docker-compose.yml' presente no diretório atual em segundo plano.
