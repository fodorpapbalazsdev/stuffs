# Homebrew,  Homebrew Bundle and everything around it

Install Homebrew:   
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

[Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle)

## homebrew-file

[Documentation](https://homebrew-file.readthedocs.io/en/latest/index.html)

Install: `brew install rcmdnk/file/brew-file`

Add the following lines to [.zshrc](/computer-setup/zshrc/.zshrc) file.

```
# Location of Brewfile
export HOMEBREW_BREWFILE=$HOME/Documents/personal/repositories/stuffs/computer-setup/brew/.brewfile

# Wrap brew command to for an automatic update of Brewfile when you execute such a brew install or brew uninstall.
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi
```

[Usage](https://homebrew-file.readthedocs.io/en/latest/getting_started.html#use-local-brewfile)

#### Mostly used commands:

`brew cleanup`

create Caskfile: `brew file casklist`

update .brewfile: `brew file update`

get a summary of Apps: `brew list`

### New computer setup:
When you get new Mac just do:
`brew file install`
(make sure the HOMEBREW_BREWFILE is set correctly and the file is there as mentioned above)
