if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/usr/lib/python3/dist-packages:/opt/go/bin:/opt/gradle/gradle-7.5.1/bin:/opt/zerologon"

ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL10K_MODE="nerdfont-complete"

plugins=(git)

alias ls='/usr/bin/lsd'
alias cat='/usr/bin/batcat'
alias icat='/usr/bin/kitty +kitten icat'
alias ghidra='_JAVA_AWT_WM_NONREPARENTING=1 /usr/bin/ghidra'
alias burpsuite='wmname LG3D & /usr/bin/burpsuite'


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

source /home/rubbx/sudo.plugin.zsh
source /home/rubbx/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/rubbx/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /home/rubbx/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey "^[[F" end-of-line
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

function settarget() {
	ip_address=$1
	machine_name=$2
	echo "$ip_address $machine_name" > /home/rubbx/.config/polybar/forest/scripts/target.txt
}

# Functions
function mkt(){
	mkdir {nmap,content,exploits,scripts}
}

# Extract nmap information
function extractports(){
	ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
	echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
	echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
	echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
	echo $ports | tr -d '\n' | xclip -sel clip
	echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
	cat extractPorts.tmp; rm extractPorts.tmp
}

# Created by `pipx` on 2022-10-09 15:45:54
export PATH="$PATH:/home/$USER/.local/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
