# This file describes how to set up iTerm and it's Appearance

The config of my iTerm can be found in the following [config file](com.googlecode.iterm2.plist).

Make sure the 'Load preferences from a custom folder or URL' is enabled and linked to this folder:

![iTerm Appearance](resources/load_preferences.png)

---

(old look)
![iTerm Appearance](resources/iterm.png)

## .zshrc config file (under Applications/iTerm - this file not exist by default we should create it)

Open `zshrc` with `open ~/.zshrc` or if its already configured then `zshconfig`.

## colors can be found here: 
https://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-ps1-prompt

# add the following lines:
```
export autoload -U colors && colors
export PS1="%F{023}%K{000}%m%F{015}%K{000}:%F{081}%K{000}%~%F{043}%K{000}\$ "
```
