# Gaming Experience Platform (GXP)

Codebase for the barcade to make it useful at the WP Engine Summit.

The goal here is to have the Raspberry Pi boot up into a browser window, in kiosk mode, to website (from a specified list of sites), and load an Asteroids game on top of that website. The person turning the cabinet on should not have to do anything

It will randomly load a webiste from an array of websites, which are the websites of visitors to the Summit. When that site loads, Asteroids will load on top of the web page, and the user can use the joystick and buttons to play asteroids on top of the website, destroying elements on the page.

## Bootup script
Raspbian looks for files named `*.desktop` inside `~/.config/autostart/`, and it will load those files during bootup.

This repo contains a file `gxp-startup.desktop`, which I symlinked to from within the autostart directory.

You should not need to edit `gxp-startup.desktop`. However, you may modify the shell script that it calls, `gxp-`

## OS-level keyboard shortcuts
Using `xbindkeys` for keyboard shortcuts. This lets the user press a button that triggers a shell script; in this case, that script loads another website from the list.

To edit keybindings, modify the config file:

```shell
vim ~/.xbindkeysrc
```

...then restart the program:

```shell
killall xbindkeys && xbindkeys
```

## Arcade button mappings
todo

## Autoload Asteroids
Using a Chromium extension called [Control Freak](https://chrome.google.com/webstore/detail/control-freak/jgnchehlaggacipokckdlbdemfeohdhc?hl=en) to load the Asteroids JavaScript on every page load.
