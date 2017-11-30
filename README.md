## Dotfiles

Personal dotfile collection used on the MacOS Sierra and above


## Install

### Fresh and clean installation of MacOS:

```
sudo softwareupdate -i -a
xcode-select --install
```

- Install Dotfiles

```
sh -c "$(curl -fsSL https://raw.github.com/xta0/Dotfiles/master/install.sh)"
```

## Contains

### Packages

- Homebrew
    - Some useful macOS apps & dev tools
    - Programming language I use every day.
        
- ZSH
    - A forked [oh-my-zsh](https://github.com/xta0/oh-my-zsh) repo with customized themes in it 

### Dotfiles

- `.zshrc` contains themes,plugins and loads the `.profile` file.
- `.profile` loads a bunch of files: 
    - `alias`
    - `functions`
    - `exports` 
    - sets the `PATH` variable
  
## Custom Settings

- macOS
    - default : macOS preference
    - login: login items
    - dock: dock items
- VSCode
    - use [settings sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)
        - [gist file](https://gist.github.com/xta0/97203d8a0120dad31ee843aca06c36fa)
    - manually
        - file
- iTerm
    - color scheme
- Dev
    - chisel


## Dotfile Usage

```
> dotfile --help

Usage: dotfile.sh <command>

Commands:
   upgrade          Pull the lastest commit from Github
   clean            Clean up caches (brew, npm, gem, rvm)
   list             Show installed packages (brew, gem, npm)
   dock             Apply macOS Dock settings
   edit             Open dotfiles in VSCode)
   help             This help message
   macos            Apply macOS system defaults
   update           Update packages and pkg managers (OS, brew, npm, gem)
```

## Uninstall

```
sh -c "$(curl -fsSL https://raw.github.com/xta0/Dotfiles/master/uninstall.sh)"
```

## Resources

- [Some useful resource](https://github.com/webpro/dotfiles)
- Thanks for the [Dotfile Community](http://dotfiles.github.io/)

## Todo

- docker test environment
