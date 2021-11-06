#!/bin/bash

echo "$2" | grep -q "$1" && echo "$1 esta contido em $2."