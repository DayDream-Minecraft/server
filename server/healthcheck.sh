#!/usr/bin/env sh

curl -f localhost:25565

if [ $? -eq 52 ] # Expect curl to return "curl: (52) Empty reply from server"
then 
  exit 0
else 
  exit 1
fi
