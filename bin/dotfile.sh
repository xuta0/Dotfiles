

BIN_NAME=$(basename "$0")
COMMAND_NAME=$1
SUB_COMMAND_NAME=$2

sub_help () {
  echo "Usage: $BIN_NAME <command>"
  echo
  echo "Commands:"
  echo "   upgrade          Pull the lastest commit from Github"
  echo "   clean            Clean up caches (brew, npm, gem, rvm)"
  echo "   list             Show installed packages (brew, gem, npm)"
  echo "   dock             Apply macOS Dock settings"
  echo "   edit             Open dotfiles in VSCode)"
  echo "   help             This help message"
  echo "   macos            Apply macOS system defaults"
  echo "   update           Update packages and pkg managers (OS, brew, npm, gem)"
}

sub_upgrade (){
  
  log "Updating Dotfiles"
  cd ${DOTFILES_DIR}
  if git pull --rebase --stat origin master 
  then 
    log "Dotfiles have been updated. Reload your terminal."
  else 
    log "There was an error updating. Try again later?"
  fi
}

sub_edit () {
    code ${DOTFILES_DIR}
}

sub_dock () { 

    log "Reloading Dock"
    
    . "${DOTFILES_DIR}/etc/macos/dock" && echo "Dock reloaded."
}


sub_macos () {

    log "Reloading macOS preference"

    . "${DOTFILES_DIR}/etc/macos/default"
    echo "Done. Some changes may require a logout/restart to take effect."
}

sub_update () {

  log "Updating Packages"

  sudo softwareupdate -i -a
  brew update
  brew upgrade
  npm install npm -g
  npm update -g
  gem update --system
  gem update
}

sub_clean () {

  brew cleanup
  brew cask cleanup
  npm cache clean --force
  gem cleanup
  rvm cleanup all
}

sub_list() {

  echo "HomeBrew:"
  brew list
  echo "------"
  echo "Gem:"
  gem list
}

init(){
    
    if which tput >/dev/null 2>&1; then
      ncolors=$(tput colors)
    fi

    if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
        
        RCol="$(tput sgr0)"
        Red="$(tput setaf 1)"
        Gre="$(tput setaf 2)"
        Yel="$(tput setaf 3)"
        Cyn="$(tput setaf 6)"
        On_Bla="$(tput setab 0)"
  else
        #colors
        RCol="";
        Red="";
        Gre="";
        Cyn="";
        Yel="";
        On_Bla="";
  fi
}

log() {
    echo "${Cyn}${On_Bla}==|DotFiles:${RCol} '$*' "
}

init 

case $COMMAND_NAME in 
  "" | "-h" | "--help")
    sub_help
    ;;
  *)
    shift
    sub_${COMMAND_NAME} $@
    if [ $? = 127 ]; then
      echo "'$COMMAND_NAME' is not a known command or has errors." >&2
      sub_help
      exit 1
    fi
    ;;
  esac