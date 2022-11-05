#!/bin/bash

# wget
if [[ ! -f "../helper.sh" ]];
then

  echo "helper.sh wird hier dann nachgeladen"
  wget -c https://raw.githubusercontent.com/partarum/composer/main/helper.sh -O ../helper.sh

  [[ ! -f "../helper.sh" ]] && echo "helper.sh konnte nicht geladen werden - bitte wende dich an den Support" || echo "helper.sh ist geladen"

else
    echo "helper.sh vorhanden"
fi

echo "$?"

if [[ ! -d "$DIR" ]];
then
  DIR="$PWD"
fi

. "../helper.sh"