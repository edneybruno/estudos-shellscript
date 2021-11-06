#!/bin/bash

while test "$1"; do
    N=1
    echo "Parametro $N: $1"
    shift
    N=$((N+1))
done