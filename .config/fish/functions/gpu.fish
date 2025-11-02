function gpu --wraps='git push --set-upstream' --description 'alias gpu=git push --set-upstream'
  git push --set-upstream $argv
        
end
