#!/bin/bash

server_ver_select() {
  echo "Server is $server_type"
}

server_type="${SERVER_TYPE:-Vanilla}"
server_ver_select