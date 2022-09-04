#!/bin/bash

getss() (
    DIR="${HOME}/Documents/screenshots"
    PNG=$(ls -Art ${DIR} | tail -n 1)
    OLD_FILE="${DIR}/${PNG}"
    NEW_FILE="${DIR}/${1}.png"
    cp "$OLD_FILE" "$NEW_FILE"
    echo "![$1](${NEW_FILE})"
    exit
)
