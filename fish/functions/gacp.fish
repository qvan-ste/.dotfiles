function gacp
    if not set -q argv[1]
        echo "Please provide a commit message." >&2
        return 1
    end

    git add --all
    git commit -m $argv[1]
    git push
end