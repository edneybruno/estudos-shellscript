#!/bin/bash

echo -n "Informe caminho completo de um arquivo/diretorio: "
read ARQUIVO

test -e "$ARQUIVO" || echo "O arquivo '$ARQUIVO' não foi encontrado."
test -f "$ARQUIVO" && echo "$ARQUIVO é um arquivo."
test -d "$ARQUIVO" && echo "$ARQUIVO é um diretorio."