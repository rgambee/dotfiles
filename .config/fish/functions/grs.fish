function grs --wraps='git restore --staged -p' --description 'alias grs=git restore --staged -p'
  git restore --staged -p $argv
        
end
