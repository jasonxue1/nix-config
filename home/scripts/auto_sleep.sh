#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "Error: Please run as root"
  exit 1
fi

if [[ "$1" == "on" ]]; then
  pmset -b sleep 5 >/dev/null 2>&1
  pmset -b disablesleep 0 >/dev/null 2>&1
  echo "Auto sleep: on"
elif [[ "$1" == "off" ]]; then
  pmset -b sleep 0 >/dev/null 2>&1
  pmset -b disablesleep 1 >/dev/null 2>&1
  echo "Auto sleep: off"
else
  echo "Error: Only accepts 'on' or 'off'" >&2
  exit 1
fi
