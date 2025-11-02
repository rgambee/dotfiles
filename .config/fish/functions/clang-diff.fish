function clang-diff --wraps='git diff -U0 --relative --no-color  | clang-format-diff -p1 | colordiff' --wraps='git diff -U0 --relative --no-color' --description 'alias clang-diff=git diff -U0 --relative --no-color | clang-format-diff -p1 | colordiff'
    # sudo apt install colordiff
    git diff -U0 --relative --no-color $argv | clang-format-diff -p1 | colordiff
end
