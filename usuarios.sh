#!/bin/bash

# usuarios.sh
#
# Mostra os logins e nomes de usuarios do sistema.
# Obs.: Lê dados do arquivo /etc/passwd
#
# Edney, Novembro de 2021
VERSAO=4
MENSAGEM_USO="
Uso: $(basename "$0") [-h | -V]
    -h, --help      Mostra esta tela de ajuda e sai
    -V, --version   Mostra a versão do programa e sai
"

# Tratamento das opções de linha de comando
case $1 in
    -h | --help)
        echo "$MENSAGEM_USO"
        exit 0
        ;;
    -V | --version)
        echo "$(basename "$0") Versão $VERSAO"
        exit 0
        ;;
    *)
        if test -n "$1"; then
            echo "Opção inválida: $1"
            exit 1
        fi
        ;;
esac

# Processamento
cut -d : -f 1,5 /etc/passwd | tr : \\t
