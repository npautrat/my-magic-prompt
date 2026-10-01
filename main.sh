#!/bin/bash
source quit.sh
source help.sh
source removef.sh
source removedir.sh
source aboutuser.sh
source versionuser.sh
source ageuser.sh
source changedir.sh
source profil.sh
source password.sh
source pwdir.sh
source houruser.sh
source smtpemail.sh
source openvim.sh
source mkdirectory.sh
source touchfi.sh
source lsuser.sh
source login.sh

cmd() {
  local action=$1
  shift 

  case "${action}" in
    ls ) lsuser "$@";;
    help ) help "$@";;
    rm ) removef "$@";;
    rmd | rmdir ) removedir "$@";;
    about ) aboutuser "$@";;
    version | --v | vers ) versionuser "$@";;
    age ) ageuser "$@";;
    cd ) changedir "$@";;
    ls ) ls "$@";;
    profil ) profil "$@";;        
    passw | password ) password "$@";;
    pwd ) pwd "$@";;
    hour ) houruser "$@";;
    smtp ) smtpemail "$@";;
    open ) openvim "$@";;
    mkdir ) mkdirectory "$@";;
    touch ) touchfi "$@";;
    quit | exit ) quit;;
    * ) echo "Commande inconnue : ${action}";;
  esac
}

main() {
  # Authentification au lancement
  authenticate || return 1

  lineCount=1

  while [ 1 ]; do
    local pwd=$(pwd)
    date=$(date +%H:%M)
    echo -ne "[\033[31m${lineCount}\033[m] - ${date} - \033[33mNATHAN\033[m - [${pwd}] - "
    read string
    cmd $string

    lineCount=$(($lineCount+1))
  done
}

main