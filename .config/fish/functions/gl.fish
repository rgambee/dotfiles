function gl --wraps='git log --oneline --first-parent' --description 'alias gl=git log --oneline --first-parent'
  git log --oneline --first-parent $argv
        
end
