#!/bin/bash

# usuarios.sh
#
# Mostra os logins e nomes de usuarios do sistema.
# Obs.: Lê dados do arquivo /etc/passwd
#
# Edney, Novembro de 2021
VERSAO=5
ORDENAR=0
LISTA=$(cut -d : -f 1,5 /etc/passwd)
MENSAGEM_USO="
Uso: $(basename "$0") [-h | -V]
    -h, --help      Mostra esta tela de ajuda e sai
    -V, --version   Mostra a versão do programa e sai
    -s, --sort      Ordena a lista de usuarios alfabeticamente
    --reverse       Inverte a ordem da lista
    --uppercase     Coloca a lista em caixa alta
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
    -s | --sort)
        ORDENAR=1
        ;;
    *)
        if test -n "$1"; then
            echo "Opção inválida: $1"
            exit 1
        fi
        ;;
esac

# Processamento
if [ "$ORDENAR" -eq 1 ]; then
    LISTA=$(echo "$LISTA" | sort)
fi

echo "$LISTA" | tr : \\t
