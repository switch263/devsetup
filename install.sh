#!/bin/bash
# Max Forma #
# v0.1.0    #
# 7/17/2021 #

# little bit of silent, base-tool setup #
# curl					#
# vim					#
# git					#
echo 'Installing base tools'
sudo apt install -yqqq curl vim git

### Install BAT ###
echo 'Installing BAT https://github.com/sharkdp/bat'
# find and fetch the latest release
# little bit of jq and sed magic to extract the version number of the latest release
# https://fabianlee.org/2021/02/16/bash-determining-latest-github-release-tag-and-version/
LATEST=$(curl -sL https://api.github.com/repos/sharkdp/bat/releases/latest | jq -r ".tag_name" | sed 's/v//')
PACKAGE=bat_${LATEST}_amd64.deb
wget -q https://github.com/sharkdp/bat/releases/download/v$LATEST/$PACKAGE
sudo dpkg -i $PACKAGE
rm $PACKAGE
echo 'BAT is now in your $PATH'
echo 'Installing ZSH and OhMyZSH'
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# TODO commit .zshrc to github where it can be fetched

echo 'Installing ZSH autocomplete, ZSH syntax highlighting, ZSH auto-suggestions, direnv'
## Found a couple scripts to handle this https://github.com/DevInsideYou
curl -fLOs https://script.install.devinsideyou.com/zsh-autocomplete
curl -fLOs https://script.install.devinsideyou.com/zsh-syntax-highlighting
curl -fLOs https://script.install.devinsideyou.com/zsh-autosuggestions
wget -q https://script.install.devinsideyou.com/direnv
chmod +x zsh-autocomplete && ./zsh-autocomplete
chmod +x zsh-syntax-highlighting && ./zsh-syntax-highlighting
chmod +x zsh-autosuggestions && ./zsh-autosuggestions
chmod +x direnv && ./direnv

