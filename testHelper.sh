#!/bin/bash

# wget
if [[ ! -f "helper.sh" ]];
then

  echo "helper.sh wird hier dann nachgeladen"
  wget https://github.com/partarum/composer.git/helper.sh

  [[ ! -f "helper.sh" ]] && echo "helper.sh konnte nicht geladen werden - bitte wende dich an den Support" || echo "helper.sh ist geladen"

else
    echo "helper.sh vorhanden"
fi

echo "$?"

if [[ ! -d "$DIR" ]];
then
  DIR="$PWD"
fi

. "$DIR/helper.sh"