#!/usr/bin/env bash

NAME="qsetup"
SCRIPT_NAME="setup"
IS_SHOWCASE_MODE=false
SHOWCASE_FLAG_LONG="^--showcase$"
SHOWCASE_FLAG_SHORT="^-s$"
LOGFILE_DIR="$HOME/Desktop/${NAME}_logfiles"
SUDO_LOGFILE="$LOGFILE_DIR/sudo.txt"
BREW_LOGFILE="$LOGFILE_DIR/brew.txt"
VSCODE_LOGFILE="$LOGFILE_DIR/vscode.txt"
FONT_LOGFILE="$LOGFILE_DIR/fonts.txt"
GIT_LOGFILE="$LOGFILE_DIR/git.txt"
VIM_LOGFILE="$LOGFILE_DIR/vim.txt"
FISH_LOGFILE="$LOGFILE_DIR/fish.txt"
CLEANUP_LOGFILE="$LOGFILE_DIR/cleanup.txt"

# Colourful output
BOLD='\033[1m'
RED='\033[31m'
GREEN='\033[32m'
# BLUE='\033[34m'
NC='\033[0m'
SUCCESS="${GREEN}✔${NC}"
FAIL="${RED}✖${NC}"
ERROR="${RED}Error${NC}"
# ARROW="${BLUE}===>${NC}"
DIVIDER="-------------------------------"

###########################################################################

errcho() { >&2 echo -e "$@"; }

# $1: message to be printed on the console while the action is running
# $2: action to be carried out
# $3: logfile to send output of action to (required if error-handling is needed)
try_action() {
    echo -n "$1..."

    # only redirect output of action if a logfile is supplied
    if [[ -z $3 ]]; then
        if [[ $IS_SHOWCASE_MODE == true ]]; then
            sleep 1s
        else
            $2
        fi
        echo -e "\r$1... Done! $SUCCESS"
    else
        if [[ $IS_SHOWCASE_MODE == true ]]; then
            sleep 1s
            echo -e "\r$1... Done! $SUCCESS"
        else
            if $2 >> "$3" 2>&1 ; then
                echo -e "\r$1... Done! $SUCCESS"
            else
                echo -e "\r$1... $FAIL"
                errcho "$ERROR something went wrong"
                errcho "Please check the generated \"$3\"."
                echo
            fi
        fi
    fi
}

###########################################################################

# Check if prerequisites for the script are satisfied
source helpers/intro.sh

# Carry out operations with sudo upfront to prevent further user interaction
source helpers/all_sudo.sh

# Setup Homebrew
source helpers/brew.sh

# Setup VSCode
source helpers/vscode.sh

# Install extra fonts
source helpers/fonts.sh

# Setup git and git-lfs
source helpers/git.sh

# Setup vim
source helpers/vim.sh

# Setup fish
source helpers/fish.sh

# Run general utility stuff
source helpers/util.sh

# Cleanup
cleanup_cmd() {
    brew update && brew upgrade
    brew cleanup && brew doctor
}
try_action "Cleaning up" cleanup_cmd "$CLEANUP_LOGFILE"

echo
echo "$NAME completed!"
echo "Please remember to do 3 more things:"
echo "1. Set fish as the default shell by running:"
echo
echo "    chsh -s /usr/local/bin/fish"
echo
echo "2. Import iTerm theme file in $HOME/Downloads."
echo "3. Restart for some changes to take into effect."
echo
