#!/bin/bash

FILE=$1
FILE_PATH="/var/www/multikirola"
ARTIFACT="${FILE_PATH}/${FILE}"

if [[ $# -ne 1 ]]; then
  echo "ERROR: Tienes que pasar un artefacto como parámetro!"
  ls ${FILE_PATH}
  exit 1
fi

if [[ -f ${ARTIFACT} ]]; then
  echo "Inciando Multikirola..."
  nohup java -Dgrails.env=prod -jar "${ARTIFACT}" &
else
  echo "ERROR: No existe el fichero en ${FILE_PATH}!"
  ls ${FILE_PATH}
fi
