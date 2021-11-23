#!/bin/bash

# usuarios.sh
#
# Mostra os logins e nomes de usuarios do sistema.
# Obs.: Lê dados do arquivo /etc/passwd
#
# Edney, Novembro de 2021
VERSAO=5
ORDENAR=0
INVERTER=0
MAIUSCULAS=0
MENSAGEM_USO="
Uso: $(basename "$0") [OPÇÕES]
    OPÇÕES:
        -h, --help      	Mostra esta tela de ajuda e sai
        -V, --version   	Mostra a versão do programa e sai
        -s, --sort		    Ordena a lista de usuarios alfabeticamente
        -r, --reverse       Inverte a ordem da lista
        -u, --uppercase     Coloca a lista em caixa alta
	       -d, --delimiter	Insere um separados nos campos
"

# Tratamento das opções de linha de comando
while [ -n $1 ]; do
    case $1 in
        -s | --sort)
            ORDENAR=1
            ;;
        -r | --reverse)
            INVERTER=1
            ;;
        -u | --uppercase)
            MAIUSCULAS=1
            ;;
    	-d | --delimiter)
            shift
            delim="$1"
            if [ -z "$1" ]; then
                echo "Faltou o argumento."
                exit 1
            fi
            ;;
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
    # Opção $1 já processada, a fila já deve andar
    shift
done

# Processamento
LISTA=$(cut -d : -f 1,5 /etc/passwd)
if [ "$ORDENAR" -eq 1 ]; then
    LISTA=$(echo "$LISTA" | sort)
elif [ "$INVERTER -eq 1" ]; then
    LISTA=$(echo "$LISTA" | tac)
elif [ "$MAIUSCULAS" -eq 1 ]; then
    LISTA=$(echo "$LISTA" | tr a-z A-Z)
fi

echo "$LISTA" | tr : \\t
