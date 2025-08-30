#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <app_name>"
  exit 1
fi

osascript <<EOF
tell application "System Events"
  set frontmost of the first process whose name contains "$1" to true
end tell
EOF
