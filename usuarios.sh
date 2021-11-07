#!/bin/bash

# usuarios.sh
#
# Mostra os logins e nomes de usuarios do sistema.
# Obs.: Lê dados do arquivo /etc/passwd
#
# Edney, Novembro de 2021

MENSAGEM_USO="
Uso: $0 [-h]
    -h      Mostra esta tela de ajuda e sai
"

# Tratamento das opções de linha de comando
if test "$1" = "-h"; then
    echo "$MENSAGEM_USO"
    exit 0
fi

# Processamento
cut -d : -f 1,5 /etc/passwd | tr : \\t
