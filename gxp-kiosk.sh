#!/bin/bash

# Uncomment the following line for debugging
set -x

###################
# SITE URLs
###################
declare -a WEBSITES=(
"torquemag.io"
"wpengine.com"
"wpengine-careers.com"
"google.com"
"hellojason.net"
"apple.com"
"microsoft.com"
)

###################
# FUNCTIONS
###################

# return a random site from the array
###################
function random_site () {
  # get a random site
  return ${WEBSITES[$RANDOM % ${#WEBSITES[@]} ]}
}

function load_site () {
  randomSite=$(random_site)
  echo "things and " random_site
#  chromium-browser --kiosk --incognito $randomSite
}

# sniff keyboard input
function listen_keyboard_input () {
  while true; do
    read -rsn1 input
    if [ "$input" = "m" ]; then
      echo "Initialize site load..."
      load_site
    fi
  done
}

###################
# EXECUTE
###################
listen_keyboard_input
