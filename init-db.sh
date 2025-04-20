#!/bin/bash

# Script para importar la base de datos si existe un dump

if [ -f "db.sql" ]; then
  echo "Importando base de datos desde db.sql..."
  docker-compose up -d db
  sleep 10
  docker exec -i mysql_db mysql -u root -pramon wordpress < db.sql
  echo "Base de datos importada."
else
  echo "No se encontró db.sql, se usará una base vacía."
fi