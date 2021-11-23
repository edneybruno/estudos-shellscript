#!/bin/bash
# grita.sh
#
# Mostra uma palavra ($TXT) em maiúsculas e com exclamações
# Exemplo: foo -> !!!!!FOO!!!!!
TXT="gritaria"
TXT="     $TXT     "
TXT=$(echo "$TXT" | tr ' ' '!')
TXT=$(echo $TXT | tr a-z A-Z)
echo "$TXT"

#Adiciona 5 espaços ao redor
#Troca os espaços por exclamações
#Deixa o texto em maiúsculas
#Mostra a mensagem
