#!/usr/bin/env sh

set -eu

if ! command -v java 2>&1 > /dev/null 
then
    echo -e "\033[31mjava is mandatory\033[0m"
    exit 1
fi

server_launch="java -Xms$MEMORY -Xmx$MEMORY -jar "$SERVER_JAR" --nogui"

socat EXEC:"$server_launch" TCP4-LISTEN:4204,fork
