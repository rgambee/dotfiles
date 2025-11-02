function gfr --wraps='git fetch origin; and git rebase -i origin/main' --description 'alias gfr=git fetch origin; and git rebase -i origin/main'
  git fetch origin; and git rebase -i origin/main $argv
        
end
