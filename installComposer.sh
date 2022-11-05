#!/bin/bash
# wget
if [[ ! -f "helper.sh" ]];
then

  echo "helper.sh wird hier dann nachgeladen"
  wget -c https://raw.githubusercontent.com/partarum/composer/main/helper.sh -O ../helper.sh

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

EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet
RESULT=$?
rm composer-setup.php

mv composer.phar /usr/local/bin/composer

exit $RESULT