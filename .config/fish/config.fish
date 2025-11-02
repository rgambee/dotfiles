if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr --add -- clipboard 'fish_clipboard_copy'
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.fish.inc' ]; . '/opt/homebrew/share/google-cloud-sdk/path.fish.inc'; end
