# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gera/.zshrc'

#typeset -U path PATH
#path=(~/.local/bin:~/bin:$PATH)
#export path

path+=('/home/gera/.cargo/bin')
path+=('/home/gera/.local/bin')
path+=('/home/gera/go/bin')
path+=('/home/gera/bin')
# path+=('~/bin')
export PATH

autoload -Uz compinit
compinit

# custom prompt and colors!
autoload -U colors && colors
PS1="[%{$fg[yellow]%}%n%{$reset_color%}@%{$fg[magenta]%}%m%{$reset_color%}] %{$fg[cyan]%}%(4~|.../%3~|%~) %{$reset_color%}❱ "

typeset -g -A key

# see man 5 terminfo
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Ctrl-Left]="${terminfo[kLFT5]}"
key[Ctrl-Right]="${terminfo[kRIT5]}"

# setting up keys
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"   ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}"  ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
[[ -n "${key[Ctrl-Left]}"  ]] && bindkey -- "${key[Ctrl-Left]}"  backward-word
[[ -n "${key[Ctrl-Right]}" ]] && bindkey -- "${key[Ctrl-Right]}"  forward-word

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Base16 Shell
# BASE16_SHELL_PATH="$HOME/.config/base16-shell"
# [ -n "$PS1" ] && [ -s "$BASE16_SHELL_PATH/profile_helper.sh" ] && source "$BASE16_SHELL_PATH/profile_helper.sh"

# sourcing syntax highlighting plugin
# should be the last line of file!!!
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
