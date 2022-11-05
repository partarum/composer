#!/bin/bash

is_root_possible () { [[ "$(is_app sudo)" == 1 ]] || [[ "$(is_app su)" == 1 ]] && echo 1 || echo 0; }

is_user_root () { [[ "${EUID:-$(id -u)}" -eq 0 ]] && echo 1 || echo 0; }

is_all_same_user () { [ "$EUID" == "$UID" ] && [ "$(id -u)" == "$(id -u -r)" ] && echo 1 || echo 0; }

is_app () { [[ $(command -v "$1") ]] && echo 1 || echo 0; }

is_debian () {

  . /etc/os-release

  [[ "$ID" == "debian" ]] && echo 1 || echo 0;

}

is_keyhelp () { [[ -d "/etc/keyhelp" ]] && echo 1 || echo 0; }

is_plesk () { [[ -f "/etc/plesk-release" ]] && echo 1 || echo 0; }

is_apache () { [[ -d "/etc/apache2" ]] && echo 1 || echo 0; }

is_caddy () { [[ -d "/etc/caddy" ]] && echo 1 || echo 0; }

is_nginx () { [[ -d "/etc/nginx" ]] && echo 1 || echo 0; }

is_docker () { [[ -d "/etc/docker" ]] && echo 1 || echo 0;}

#log_session () {}

#import_file () {
#}

#check_user () {}