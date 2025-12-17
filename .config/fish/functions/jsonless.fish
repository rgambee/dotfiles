function jsonless
    jq -C . $argv | moor
end
