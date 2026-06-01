function npx --wraps='npm --offline --no --prefix /Users/robert/tools/npm --package-lock-only ' --wraps='npm exec --offline --no --prefix /Users/robert/tools/npm --package-lock-only ' --wraps='npm exec --offline --no --prefix /Users/robert/tools/npm ' --description 'alias npx=npm exec --offline --no --prefix /Users/robert/tools/npm '
    npm exec --offline --no --prefix /Users/robert/tools/npm  $argv
end
