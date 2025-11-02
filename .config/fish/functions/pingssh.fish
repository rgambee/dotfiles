function pingssh
    set -l input $argv[1]
    set -e argv[1]

    # Check that the first argument is a hostname or IP address
    if string match -rq '^([a-zA-Z0-9]*@)?(([a-zA-Z0-9-]+\.[a-z]+)|([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+))$' $input
        # Extract the base hostname/IP using string replace
        set -l base (string replace -r '^[a-zA-Z0-9]*@' '' $input)
        
        if test -z "$base"
            echo "Invalid input: missing group"
            return 2
        end
        
        while not ping -c1 -W1 -q $base
            sleep 1
        end
        
        env TERM=xterm-256color /usr/bin/ssh $input $argv
    else
        echo "Invalid input: no match"
        return 1
    end
end
