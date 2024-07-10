#!/bin/bash

# Exporta variavel com o nome e ip
export HOSTNAME=$(hostname)
export HOST_IP=$(hostname -I | cut -d' ' -f1)

# Inicia o Docker Compose
docker compose up -d
