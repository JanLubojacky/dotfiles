# source merck proxy script
source $HOME/.config/fish/mrk-proxy.fish

oh-my-posh init fish --config ~/.config/oh-my-posh/zen-catppuccin.toml | source

# repaint oh-my-posh prompt on alt + <- and alt + -> directory history cycling
function rerender_on_dir_change --on-variable PWD
  omp_repaint_prompt
end

# prevent micromamba and venv from modifying the prompt
set -gx MAMBA_NO_PROMPT 1
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
set -gx MAMBA_EXE "/opt/homebrew/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "/opt/homebrew/Cellar/micromamba/2.1.0"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<

alias p "python"
alias n "nvim ."
alias lg "lazygit"
alias mpa "proxy-on"
alias mpd "proxy-off"
alias mm "micromamba"

# uv activate env shortcut
alias uva "source .venv/bin/activate.fish"

# shows a prev of files
alias prev "fzf -m --preview='ls -lth {} | awk '\''{ print \$5, \$8, \$7, \$6 }'\''; bat --color=always {}'" 
# displays file sizes
alias duch "du -ch * | sort -h"
