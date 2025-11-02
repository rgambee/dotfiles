function gsu --wraps='git submodule sync --recursive; and git submodule update --init --recursive' --description 'alias gsu=git submodule sync --recursive; and git submodule update --init --recursive'
  git submodule sync --recursive; and git submodule update --init --recursive $argv
        
end
