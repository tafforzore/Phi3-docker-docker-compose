FROM ubuntu:20.04

# Installation des outils nécessaires
RUN apt-get update && \
    apt-get install -y curl ca-certificates gnupg tar && \
    rm -rf /var/lib/apt/lists/*

# Copie du script d’installation local dans le conteneur
COPY install.sh /tmp/install.sh
RUN chmod +x /tmp/install.sh


# Exécution du script d’installation local
RUN /tmp/install.sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


# Création d’un utilisateur non-root
RUN useradd -m -s /bin/bash ollama
USER ollama
WORKDIR /home/ollama

# Copie du script de démarrage


# Expose le port API
EXPOSE 11434
ENTRYPOINT ["/entrypoint.sh"]