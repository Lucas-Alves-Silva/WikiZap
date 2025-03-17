# Usando Ubuntu 20.04 como base
FROM ubuntu:20.04

# Definir variáveis para evitar prompts interativos
ENV DEBIAN_FRONTEND=noninteractive

# Atualizar pacotes e instalar dependências
RUN apt update && apt upgrade -y && \
    apt install -y software-properties-common wget unzip fontconfig locales \
    gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 \
    libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 \
    libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 \
    libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 \
    libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 \
    libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 \
    lsb-release xdg-utils git zip unzip libgbm-dev && \
    apt update && apt install -y zip unzip

# Criar diretório para o Whaticket e copiar os arquivos
WORKDIR /root
COPY whaticket_install /root/whaticket_install

# Dar permissão de execução ao script de instalação
RUN chmod +x /root/whaticket_install/whaticketsaas

# Expor portas necessárias
EXPOSE 3000 8080 443 80

# Comando para rodar o Whaticket
CMD ["/root/whaticket_install/whaticketsaas"]
