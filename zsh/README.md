# ZSH Configurations
## Installation Guide
Install zsh
    sudo apt-get install zsh -y
Install `curl` and `git`
    sudo apt-get install curl git -y
Install ohmyzsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
or
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
Install font Powerline
    sudo apt-get install fonts-powerline
and test:
    echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"
Open `.zshrc` and uncomment `export PATH=$HOME/bin:/usr/local/bin:$PATH` (usual in line 2). After that, change ZSH_THEME to 'agnoster'

## Plugins
### Auto Suggestion
Install
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
Add following command to end of `.zshrc` file
    source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
Bind accept suggestion key (Ctrl + Space)
    bindkey '^ ' autosuggest-accept

### Syntax Highlight
Install
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
Add following command to end of `.zshrc` file
    source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
