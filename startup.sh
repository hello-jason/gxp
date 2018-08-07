#!/bin/bash

function launch_qjoypad () {
  qjoypad "GXP"
}

function launch_game () {
  /bin/bash /home/pi/gxp/cycle-website.sh
}

launch_qjoypad
launch_game

