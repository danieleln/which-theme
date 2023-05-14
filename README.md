# which-theme
Which-theme is a colorscheme switcher. It shows a list of available themes for you to select the one you prefer.
Each theme must have a configuration file to instruct which-theme on how to config/load/(un)set transparent background for that particular theme.

## Features to implement:
- floating window to select the theme
  - themes split into dark and light themes
  - when hovering a theme, apply it
  - switch to toggle transparent mode
- lazy loading: 
  - on startup, it loads only the config file for the default theme
  - config files of other themes are loaded when required

