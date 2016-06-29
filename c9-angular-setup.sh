#!/bin/bash
bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)
purple=$(tput setaf 171)
red=$(tput setaf 1)
green=$(tput setaf 76)
tan=$(tput setaf 3)
blue=$(tput setaf 38)
#ui_prompts
e_header() { printf "\n${bold}${purple}==========  %s  ==========${reset}\n" "$@" 
}
e_arrow() { printf "➜ $@\n"
}
e_success() { printf "${green}✔ %s${reset}\n" "$@"
}
e_error() { printf "${red}✖ %s${reset}\n" "$@"
}
e_warning() { printf "${tan}➜ %s${reset}\n" "$@"
}
e_underline() { printf "${underline}${bold}%s${reset}\n" "$@"
}
e_bold() { printf "${bold}%s${reset}\n" "$@"
}
e_note() { printf "${underline}${bold}${blue}Note:${reset}  ${blue}%s${reset}\n" "$@"
}

#logic
#https://github.com/stephenturner/oneliners
#https://natelandau.com/my-mac-osx-bash_profile/

function validate_url(){
  if [[ `wget -S --spider $1  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then echo "true"; fi
}


check_for_file_status(){
if [[ -n $(find $HOME/workspace/. -name "$1") ]]; then
	return 0
fi
	return 1
}

seek_confirmation() {
  printf "\n${blue}$@${tan}"
  read -p " (y/n) " -n 1
  printf "\n"
}

is_confirmed() {
if [[ "$REPLY" =~ ^[Yy]$ ]]; then
  return 0
fi
return 1
}

type_exists() {
if [ $(type -P $1) ]; then
  return 0
fi
return 1
}

# paths for linux brew / needed for watchman install
read -r -d '' BREW_PATHS << EOF
# global variables
#Custom Aliases For Angular-CLI
gist_url="https://gist.githubusercontent.com/geekwise/6931e6ba3ed61dd7a3b7eb1fa95eadcb/raw/2943eaac20f15ff41d7b87438398327e11fd8e89/c9io-angular-cli-install.sh"

c9_angular_cli_install="bash <(wget -qO- $gist_url)"
serve="ng serve --port 8080 --live-reload-port 8081 --host 0.0.0.0"
update="source ~/.bash_aliases"

#load NVM from bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

#---------------------------------
# Default C9.IO
alias ls='ls --color=auto -F'ntu/.nvm/versions/node/v4.4.5/share/man:/$
alias grep='grep --color=auto'pkgconfig:/lib/pkgconfig:
alias fgrep='fgrep --color=auto'ib:~/.c9/local/libsr/local/lib64/pkgco$
alias egrep='egrep --color=auto'r=$C9_USER --host=$IP"
alias ll='ls -alF'~/workspace/php.ini"uxbrew/issues/47
alias la='ls -A':/home/ubuntu/.nvm/versions/node/v4.4.5/bin:/usr/local$
export MANPATH=/man:/home/ubuntu/.nvm/versions/node/v4.4.5/share/man:/$
export PKG_CONFIG_PATH=/lib64/pkgconfig:/lib/pkgconfig:
export LD_LIBRARY_PATH=/lib64:/lib:~/.c9/local/libtu/.nvm/versions/nod

#---------------------------------
# Until LinuxBrew is fixed, the following is required.
# See: https://github.com/Homebrew/linuxbrew/issues/47
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/lib64/pkgconfig:/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib64/pkgconfig:/usr/share/pkgconfig:$PKG_CONFIG_PATH
#---------------------------------
## Setup linux brew
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export LINUXBREWHOME=$HOME/.linuxbrew
export PATH=$LINUXBREWHOME/bin:$PATH
export MANPATH=$LINUXBREWHOME/man:$MANPATH
export PKG_CONFIG_PATH=$LINUXBREWHOME/lib64/pkgconfig:$LINUXBREWHOME/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=$LINUXBREWHOME/lib64:$LINUXBREWHOME/lib:$LD_LIBRARY_PATH
EOF

#write to bash_aliases
echo "$BREW_PATHS" > ~/.bash_aliases
source ~/.bash_aliases
source ~/.bashrc
source ~/.profile

#-------------------------------------------------
#if check_for_file_status "index.html"; then
# if type_exists node; then
#     e_success "node installed"
# fi
# if type_exists nvm; then
#     e_success "nvm installed"
# else
#     e_error "nvm alias not setup"
#     e_note "adding to profile"
#     export NVM_DIR="$HOME/.nvm"
#     [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
#     nvm install stable
#     nvm alias default stable
#     touch .nvmrc
#     echo "stable" > .nvmrc
#     nvm use
#     e_note "created .nvmrc file to use latest version of node"
# fi



# seek_confirmation "install angular-cli?"
# if is_confirmed; then
#   e_success "angular-cli installed"
# else
#   e_error "skipping angular-cli"
# fi

#check if node is installed
# if type_exists 'node'; then
#   e_success "node already installed"
# else
# 	seek_confirmation "install node?"
# 	if is_confirmed; then
# 	  e_success "node installed"
# 	else
# 	  e_error "skipping node install"
# 	fi
# 	exit 1
# fi

sudo apt-get update && apt-get upgrade -y && apt-get autoremove && apt-get autoclean
sudo apt-get --assume-yes install "python2.7-dev"

# e_header "install python2.7-dev / needed for watchman install"
# read -p "(yes/no/skip)?" choice
# case "$choice" in 
#   y|Y|yes|YES ) e_note "installing python2.7-dev" \
#   && sudo rm -rf /var/cache/apt/archives/lock \
#   && sudo apt-get update \
# 	&& yes | sudo apt-get install "python2.7-dev" \
#   && e_success "complete / updates with apt-get installed";;
	
#   n|N|no|NO ) exit;;
#   s|S|skip|SKIP ) e_note "skipping python2.7-dev";;
#   * ) e_error "not a valid option - INPUT ERROR";;
# esac


e_header "install linux brew"
read -p "(yes/no/skip)?" choice
case "$choice" in 
  y|Y|yes|YES ) e_note "updating for linux brew" \
  && sudo rm -rf /var/cache/apt/archives/lock \
  && sudo apt-get update -y \
  && echo "$BREW_PATHS" > ~/.bash_aliases \
  && source ~/.bash_aliases \
  && source ~/.bashrc \
  && source ~/.profile \
	&& sudo apt-get install -y build-essential make cmake scons curl git \
	ruby autoconf automake autoconf-archive \
	gettext libtool flex bison \
	libbz2-dev libcurl4-openssl-dev \
	libexpat-dev libncurses-dev \
	&& git clone https://github.com/Homebrew/linuxbrew.git ~/.linuxbrew \
	&& echo "$BREW_PATHS" > ~/.bash_aliases \
  && e_success "complete / linux brew installed";;
  
  n|N|no|NO ) exit;;
  s|S|skip|SKIP ) e_note "skipping linux brew";;
  * ) e_error "not a valid option - INPUT ERROR";;
esac

e_header "install watchman for angular2"
read -p "(yes/no/skip)?" choice
case "$choice" in 
  y|Y|yes|YES ) e_note "installing watchman" \
  && echo "$BREW_PATHS" > ~/.bash_aliases \
  && source ~/.bash_aliases \
  && source ~/.bashrc \
  && source ~/.profile \
	&& brew install watchman \
  && e_success "complete / watchman installed";;
	
  n|N|no|NO ) exit;;
  s|S|skip|SKIP ) e_note "skipping watchman";;
  * ) e_error "not a valid option - INPUT ERROR";;
esac

e_header "install angular-cli"
read -p "(yes/no/skip)?" choice
case "$choice" in 
	y|Y|yes|YES ) e_note "installing angular-cli" \
  && source ~/.bash_aliases \
  && source ~/.bashrc \
  && source ~/.profile \
  && export NVM_DIR="$HOME/.nvm" \
  && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" \
  && nvm install stable \
  && nvm alias default stable \
  && touch .nvmrc \
  && echo "stable" > .nvmrc \
  && nvm use \
  && e_note "created .nvmrc file to use latest version of node" \
	&& source ~/.nvm/nvm.sh \
	&& npm set progress=false \
	&& yes | nvm install stable \
	&& yes | nvm alias default stable \
	&& yes | nvm use stable \
	&& yes | nvm use stable | npm install minimatch@3.0.2 --global \
	&& yes | nvm use stable | npm update  minimatch --global \
	&& yes | nvm use stable | npm install graceful-fs --global \
	&& yes | nvm use stable | npm install typings --global \
	&& yes | nvm use stable | npm install typescript@next --global \
	&& yes | nvm use stable | npm install angular-cli@latest --global \
  && e_success "complete / angular-cli installed";;
	
  n|N|no|NO ) exit;;
  s|S|skip|SKIP ) echo "skipping angular-cli";;
  * ) echo "not a valid option - INPUT ERROR";;
esac
npm install
npm update --global
echo "https://workspace-geekwise.c9users.io/"