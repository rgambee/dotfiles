function gcf --wraps='git commit --fixup' --description 'alias gcf=git commit --fixup'
  git commit --fixup $argv
        
end
