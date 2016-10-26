#!/usr/bin/env bash

execute() {
  printf "\t: $1 \n"
  eval "$@" &>/dev/null 2>&1
  result=$?
  if (( $result == 0 )); then
    printf "\eM\e[32m [ OK ] \e[0m\n"
  else
    printf "\eM\e[31m [ NG ] \e[0m\n"
  fi
}
