#Initialization code that may require console input (password prompts, [y/n] confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k" plugins=( fzf-tab
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-vim-mode
  fd
  zsh-navigation-tools
  fzf
  tmux
  zsh-aliases-exa
  zsh-autopair
)

MODE_CURSOR_VIINS="#ffc0cb blinking bar"
MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ffc0cb"
MODE_CURSOR_VICMD="pink block"
MODE_CURSOR_SEARCH="#ffc0cb steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #ffc0cb"

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish



export PATH="$PATH:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH="$PATH:$ANDROID_HOME/emulator/"
export PATH="$PATH:$HOME/.cargo/bin/"
export PATH="$PATH:$HOME/Library/Python/2.7/bin"
export PATH="$PATH:$HOME/nvim-stable/nvim-osx64/bin/"

# export JAVA_HOME=$(/usr/libexec/java_home)
# export PATH=$PATH:$JAVA_HOME/bin

export PATH="$PATH":"$HOME/.pub-cache/bin"
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# export FZF_DEFAULT_COMMAND="fd ."
# export FZF_CTRL_T_COMMAND="$FZF_DEFULT_COMMAND"
# export FZF_ALT_C_COMMAND="fd -t d ."

export EDITOR='nvim'
export DOTFILE_DIR="$HOME/dotfiles"

export PATH="$PATH:$HOME/fvm/versions/stable/bin"
export PATH="$PATH:$HOME/fvm/versions/stable/bin/cache/dart-sdk/bin"

alias f='flutter'
alias fcl='flutter clean'
alias fpg='flutter pub get'
alias fr='flutter run'
alias frc='flutter run '
alias frm='flutter run'
alias fu='flutter upgrade'
alias fdo='flutter doctor'
alias fa='flutter analyze'
alias fbr='flutter pub get; flutter pub run build_runner build --delete-conflicting-outputs'

alias dr='dart run'

alias lg=lazygit

alias so=source

my_vim(){
	if (( $# == 0 )); then
    		$HOME/nvim-nightly/nvim-osx64/bin/nvim .
	else
		$HOME/nvim-nightly/nvim-osx64/bin/nvim $1
	fi
}
alias n=my_vim

my_vim_stable(){
	if (( $# == 0 )); then
    		$HOME/nvim-stable/nvim-osx64/bin/nvim .
	else
		$HOME/nvim-stable/nvim-osx64/bin/nvim $1
	fi
}
alias ns=my_vim_stable

my_helix(){
	if (( $# == 0 )); then
		$HOME/helix/hx .
	else
		$HOME/helix/hx $1
	fi
}
alias h=my_helix

enable-fzf-tab
export PATH="/usr/local/opt/llvm/bin:$PATH"
#eval "$(rbenv init -)"
# bindkey '^j' autosuggest-accept

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias gpa='git add .; git commit -m "$1"; git push;'

update_vim(){
  rm -rf $HOME/nvim-osx64
  wget -c https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz -O - | tar -xv - -C $HOME/nvim-nightly
}

update_vim_stable(){
  rm -rf $HOME/nvim-osx64
  wget -c https://github.com/neovim/neovim/releases/download/stable/nvim-macos.tar.gz -O - | tar -xv - -C $HOME/nvim-stable
}

#tmux
alias t=tmux
alias tss='sh ${DOTFILE_DIR}/tmux/tmux-sessionizer.sh'

export PATH="$DOTFILE_DIR/bin/:$PATH"
