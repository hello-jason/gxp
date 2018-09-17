#!/bin/bash

###################
# INFO
###################
# Uncomment the following line for debugging
#set -x
# xbindkeys - config located in ~/.xbindkeysrc
# autostart - config located in ~/.config/autostart/gxp-kiosk.desktop
# pkill     - terminates running instances of Chromium

######################################
# SITE URLs
######################################
declare -a WEBSITES=(
"https://twentytwelvedemo.wordpress.com/"
"https://twentyfourteendemo.wordpress.com/"
"http://winterdemo.wpengine.com/"
"http://jakobian.wpengine.com/"
"http://summitsite01.wpengine.com/"
"http://summitsite02.wpengine.com/"
"http://summitsite03.wpengine.com/"
)

######################################
# FUNCTIONS
######################################

# return a random site from the array
######################################
function get_random_site () {
  randomSiteName=${WEBSITES[$RANDOM % ${#WEBSITES[@]} ]}
}

# call Chromium in kiosk mode for fullscreen, incognito
# to avoid 'restore pages' warnings and so forth
######################################
function launch_site () {
  chromium-browser --kiosk --incognito $randomSiteName
}

# terminate chromium completely before launching a new session
# overkill maybe, but it works well enough
######################################
function kill_chromium () {
  pkill chromium-browse
}


######################################
# EXECUTE
######################################
get_random_site
kill_chromium
launch_site

