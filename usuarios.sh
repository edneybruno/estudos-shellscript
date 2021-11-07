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
    -V      Mostra a versão do programa e sai
"

# Tratamento das opções de linha de comando
case $1 in
    -h)
        echo "$MENSAGEM_USO"
        exit 0
        ;;
    -V)
        echo "$0 Versão 3"
        exit 0
        ;;
    *)
        echo "Opção inválida: $1"
        exit 1
        ;;
esac

# Processamento
cut -d : -f 1,5 /etc/passwd | tr : \\t
