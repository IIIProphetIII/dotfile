# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/home/toor/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
	 z
	 zsh-autosuggestions 
   zsh-syntax-highlighting
	 sudo
	 alias-finder
	 extract
	)


source $ZSH/oh-my-zsh.sh

# blur for tilix
#if [[ $(ps --no-header -p $PPID -o comm) =~ tilix ]]; then
#    for wid in $(xdotool search --pid $PPID); do
#        xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
#fi

# blur for cool-retro-term
#if [[ $(ps --no-header -p $PPID -o comm) =~ cool-retro-term ]]; then
#    for wid in $(xdotool search --pid $PPID); do
#        xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
#fi

# User configuration
#unset ALL_PROXY
#unset no_proxy
#export ALL_PROXY=socks5://127.0.0.1:1080
export http_proxy=socks5://127.0.0.1:1080
export https_proxy=socks5://127.0.0.1:1080
export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com,10.3.130.11"
export CURL_CA_BUNDLE=/home/toor/.cacert.pem

#export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
 alias zshconfig="nvim ~/.zshrc"
 alias ohmyzsh="nvim ~/.oh-my-zsh"

alias avd="nohup sh -c 'cd ~/Android/Sdk/emulator && ./emulator -avd Pixel_XL_API_R' >/dev/null 2>&1 &!"
alias pc="proxychains"
alias idea="/opt/idea-IU-193.5662.53/bin/idea.sh"
alias pycharm="/opt/pycharm-2019.3.1/bin/pycharm.sh"
alias xmind="nohup sh -c 'cd ~/Software/xmind-8-update9-linux/XMind_amd64/ && ./XMind' >/dev/null 2>&1 &!"
alias voff='sleep 1; xset dpms force off'
alias unproxy="unset https_proxy;unset http_proxy"
alias wire_scrcpy="nohup scrcpy >/dev/null 2>&1 &!"
alias vim=nvim
alias reloadpb="/home/toor/.config/polybar/launch.sh --docky"
alias setgap="bspc config window_gap"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Neofetch 4 Terms
term=$(ps -p $(ps -p $$ -o ppid=) -o args=);
case $term in
	*cool-retro-term*)
		neofetch --caca ~/Pictures/HackPic/Boop.png
		;;
	*alacritty*)
    ./Documents/MyScripts/scripts/pacman
		;;
	*vscode*)
		neofetch --ascii_distro DarkOs
		;;
	*edex-ui*)
		neofetch --caca ~/Pictures/HackPic/Boop.png
		;;
	*tilix*)
		fet.sh
		;;
	## Try and guess for any others
	*)
		neofetch
		;;
esac
export EDITOR=nvim
export GTK2_RC_FILES=/etc/gtk-2.0/gtkrc:/home/toor/.gtkrc-2.0:/home/toor/.config/gtkrc-2.0
export GTK_RC_FILES=/etc/gtk/gtkrc:/home/toor/.gtkrc:/home/toor/.config/gtkrc
