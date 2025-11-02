function gdi --wraps='git diff --no-index' --description 'alias gdi=git diff --no-index'
  git diff --no-index $argv
        
end
