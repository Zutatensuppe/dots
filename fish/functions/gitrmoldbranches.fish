function gitrmoldbranches
    set -l branches (git branch --merged | grep -vE '^(\* |\s*(main|master)$)')
    if test -n "$branches"
        echo $branches | xargs git branch -d
    else
        echo "No merged branches to delete"
    end
end