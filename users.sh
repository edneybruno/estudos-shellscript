#!/bin/bash

cut -d ':' -f 1,5 /etc/passwd | tr : '\t'
