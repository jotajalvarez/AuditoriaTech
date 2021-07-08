#!/bin/bash
FILE="$1"
USR="$2"
OPTION="$3"

echo "-------- RESULTADO DE BUSQUEDA EMPIEZA ----------------"

if [ "$#" -eq 2 ] 
then
    awk '$6 == "'$USR'" { for (i=0; i<=2; i++) {getline; print }}' $FILE > $USR-$FILE.txt 
elif [ "$#" -eq 3 ] 
then
    
    awk '$6 == "'$USR'" { for (i=0; i<=2; i++) {getline; print }}' $FILE > temp.txt
    awk '/'"$OPTION"'/ { print a; print; printf "\n" } { a = $0 }' temp.txt > $USR-$FILE.txt

else 
    echo "Uso incorrecto: ./audit.sh ARCHIVO USUARIO OPTION_DOCUMENTO"
fi


echo "-------- RESULTADO DE BUSQUEDA FINALIZA ----------------"